using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Quiz.Domain.Entities
{
    public class Candidate
    {
        public int CandidateId { get; set; }
        public string? CandidateName { get; set; }
        public int CandidatePercent { get; set; }
        public string? ImageName { get; set; }
    }
}
