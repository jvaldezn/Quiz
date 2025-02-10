using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Quiz.Domain.Entities;

namespace Quiz.Infrastructure.Interfaces
{
    public interface IQuizRepository
    {
        Task<IEnumerable<Question>> GetAllAsync();
        Task<int> AddAsync(List<QuestionAnswer> answers);
        Task<Candidate?> FindAsync(int id);
    }
}
