using System;
using System.Collections.Generic;
using System.Drawing.Printing;
using System.Linq;
using System.Web;

namespace StudyEnglish.Models
{
    public class Answer
    {
        private int number;
        private string answer;

        public Answer(int number, string answer)
        {
            this.Number = number;
            this.DA = answer;
        }

        public int Number { get => number; set => number = value; }
        public string DA { get => answer; set => answer = value; }
    }
}