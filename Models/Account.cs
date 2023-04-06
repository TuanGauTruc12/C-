using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace StudyEnglish.Models
{
    public class Account
    {//            name: name, emailRegister: emailRegister, passwordRegister: passwordRegister, phoneNumber: phoneNumber

        private string name;
        private string emailRegister;
        private string passwordRegister;
        private string phoneNumber;

        public Account(string name, string emailRegister, string passwordRegister, string phoneNumber) 
        {
            this.name = name;
            this.emailRegister = emailRegister; 
            this.passwordRegister = passwordRegister;
            this.phoneNumber = phoneNumber;
        }

        public string Name { get => name; set => name = value; }
        public string EmailRegister { get => emailRegister; set => emailRegister = value; }
        public string PasswordRegister { get => passwordRegister; set => passwordRegister = value; }
        public string PhoneNumber { get => phoneNumber; set => phoneNumber = value; }
    }
}