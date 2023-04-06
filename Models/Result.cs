using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace StudyEnglish.Models
{
    public class Result
    {
        public Result(int answerNumber, string failValue, bool message) 
        { 
            this.AnswerNumber = answerNumber;
            this.FailValue = failValue;
            this.Message = message;
        }

        private bool message;
        private int answerNumber;
        private string failValue;

        public string FailValue { get => failValue; set => failValue = value; }
        public bool Message { get => message; set => message = value; }
        public int AnswerNumber { get => answerNumber; set => answerNumber = value; }
    }
}