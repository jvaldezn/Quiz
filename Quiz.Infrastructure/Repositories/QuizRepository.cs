using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Protocols;
using Quiz.Domain.Entities;
using Quiz.Infrastructure.Interfaces;

namespace Quiz.Infrastructure.Repositories
{
    public class QuizRepository : IQuizRepository
    {
        private readonly string _connectionString;
        public QuizRepository(IConfiguration configuration)
        {
            _connectionString = configuration.GetConnectionString("QuizCnx")!;
        }
        public async Task<IEnumerable<Question>> GetAllAsync()
        {
            List<Question> questions = new List<Question>();

            using (SqlConnection conn = new SqlConnection(_connectionString))
            {
                await conn.OpenAsync();

                using (SqlCommand cmd = new SqlCommand("SELECT question_id, question_desc, question_picture, answer_id, answer_desc FROM vQuestionAnswer", conn))
                {
                    using (SqlDataReader reader = await cmd.ExecuteReaderAsync())
                    {
                        while (await reader.ReadAsync())
                        {
                            int questionId = reader.GetInt32(0);
                            var question = questions.Find(q => q.QuestionId == questionId);

                            if (question == null)
                            {
                                question = new Question
                                {
                                    QuestionId = questionId,
                                    QuestionText = reader.GetString(1),
                                    QuestionPicture = await reader.IsDBNullAsync(2) ? null : reader.GetString(2),
                                    Answers = new List<Answer>()
                                };
                                questions.Add(question);
                            }

                            question.Answers!.Add(new Answer
                            {
                                AnswerId = reader.GetInt32(3),
                                AnswerText = reader.GetString(4)
                            });
                        }
                    }
                }
            }
            return questions;
        }
        public async Task<int> AddAsync(List<QuestionAnswer> answers)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                await connection.OpenAsync();
                using (var transaction = connection.BeginTransaction())
                {
                    try
                    {
                        var quizCode = Guid.NewGuid().ToString().Substring(0, 8);
                        var quizDate = DateTime.Now;
                        var quizId = 0;

                        using (var cmd = new SqlCommand("INSERT INTO quiz (quiz_code, quiz_date) OUTPUT INSERTED.quiz_id VALUES (@quizCode, @quizDate)", connection, transaction))
                        {
                            cmd.Parameters.AddWithValue("@quizCode", quizCode);
                            cmd.Parameters.AddWithValue("@quizDate", quizDate);
                            object? result = await cmd.ExecuteScalarAsync();
                            quizId = result != null ? (int)result : throw new InvalidOperationException("Quiz ID no puede ser nulo.");
                        }

                        foreach (var answer in answers)
                        {
                            using (var cmd = new SqlCommand("INSERT INTO quiz_answer (quiz_id, question_id, answer_id) VALUES (@quizId, @questionId, @answerId)", connection, transaction))
                            {
                                cmd.Parameters.AddWithValue("@quizId", quizId);
                                cmd.Parameters.AddWithValue("@questionId", answer.QuestionId);
                                cmd.Parameters.AddWithValue("@answerId", answer.AnswerId);
                                await cmd.ExecuteNonQueryAsync();
                            }
                        }

                        using (var cmd = new SqlCommand("upCalculateMatchingCandidates", connection, transaction))
                        {
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.Parameters.AddWithValue("@pquiz_id", quizId);
                            await cmd.ExecuteNonQueryAsync();
                        }

                        await transaction.CommitAsync();
                        return quizId;
                    }
                    catch (Exception)
                    {
                        await transaction.RollbackAsync();
                        throw;
                    }
                }
            }
        }

        public async Task<Candidate?> FindAsync(int id)
        {
            Candidate? candidate = null;

            using (var connection = new SqlConnection(_connectionString))
            {
                await connection.OpenAsync();

                using (var cmd = new SqlCommand("SELECT candidate1_id, candidate1_percent FROM quiz WHERE quiz_id = @quizId", connection))
                {
                    cmd.Parameters.AddWithValue("@quizId", id);
                    using (var reader = await cmd.ExecuteReaderAsync())
                    {
                        if (await reader.ReadAsync())
                        {
                            var candidateId = reader.GetInt32(0);
                            var candidatePercent = reader.GetInt16(1);

                            await reader.CloseAsync();

                            using (var nameCmd = new SqlCommand("SELECT candidate_name, candidate_picture FROM candidate WHERE candidate_id = @candidateId", connection))
                            {
                                nameCmd.Parameters.AddWithValue("@candidateId", candidateId);
                                using (var nameReader = await nameCmd.ExecuteReaderAsync())
                                {
                                    if (await nameReader.ReadAsync())
                                    {
                                        var candidateName = nameReader.GetString(0);
                                        var imageName = nameReader.IsDBNull(1) ? null : nameReader.GetString(1);

                                        candidate = new Candidate
                                        {
                                            CandidateId = candidateId,
                                            CandidateName = candidateName,
                                            CandidatePercent = candidatePercent,
                                            ImageName = imageName
                                        };
                                    }
                                }
                            }
                        }
                    }
                }
            }
            return candidate;
        }
    }
}
