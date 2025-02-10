using AutoMapper;
using Quiz.Domain.Entities;
using Quiz.Web.ViewModel;

namespace Quiz.Web
{
    public class AutoMapperProfile : Profile
    {
        public AutoMapperProfile()
        {
            CreateMap<Answer,  AnswerViewModel>();

            CreateMap<Question, QuestionViewModel>()
                .ForMember(dest => dest.QuestionId, opt => opt.MapFrom(src => src.QuestionId))
                .ForMember(dest => dest.QuestionText, opt => opt.MapFrom(src => src.QuestionText))
                .ForMember(dest => dest.QuestionPicture, opt => opt.MapFrom(src => src.QuestionPicture))
                .ForMember(dest => dest.Answers, opt => opt.MapFrom(src => src.Answers));

            CreateMap<Candidate, CandidateViewModel>()
                .ForMember(dest => dest.CandidateId, opt => opt.MapFrom(src => src.CandidateId))
                .ForMember(dest => dest.CandidateName, opt => opt.MapFrom(src => src.CandidateName))
                .ForMember(dest => dest.CandidatePercent, opt => opt.MapFrom(src => src.CandidatePercent))
                .ForMember(dest => dest.ImageName, opt => opt.MapFrom(src => src.ImageName));

            CreateMap<QuestionAnswerViewModel, QuestionAnswer>();
        }
    }
}
