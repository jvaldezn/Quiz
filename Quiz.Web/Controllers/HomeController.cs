using System.Data.SqlClient;
using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using Quiz.Web.Models;
using Quiz.Web.ViewModel;
using Microsoft.Data.SqlClient;
using System.Data;
using Quiz.Infrastructure.Repositories;
using Quiz.Infrastructure.Interfaces;
using Quiz.Domain.Entities;
using AutoMapper;

namespace Quiz.Web.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly IQuizRepository _quizRepository;
        private readonly IMapper _mapper;

        public HomeController(ILogger<HomeController> logger, IQuizRepository quizRepository, IMapper mapper)
        {
            _logger = logger;
            _quizRepository = quizRepository;
            _mapper = mapper;
        }

        public async Task<IActionResult> Index()
        {
            var questions = await _quizRepository.GetAllAsync();
            var questionViews = _mapper.Map<List<QuestionViewModel>>(questions);
            return View(questionViews);
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }

        public async Task<IActionResult> SubmitQuiz(List<QuestionAnswerViewModel> answers)
        {
            var submitedAnswers = _mapper.Map<List<QuestionAnswer>>(answers);
            var submit = await _quizRepository.AddAsync(submitedAnswers);
            if (submit > 0) {
                return RedirectToAction("QuizResult", new { id = submit });
            } else
            {
                TempData["ErrorMessage"] = "Se produjo un error.";
                return RedirectToAction("Index");
            }
        }

        public async Task<IActionResult> QuizResult(int id)
        {
            var candidate = await _quizRepository.FindAsync(id);
            var candidateView = _mapper.Map<CandidateViewModel>(candidate);
            return View(candidateView);
        }
    }
}
