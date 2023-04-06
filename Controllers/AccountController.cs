using StudyEnglish.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;

namespace StudyEnglish.Controllers
{
    public class AccountController : Controller
    {
        // GET: Account
        StudyEnglishContext context = new StudyEnglishContext();
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public string Answer(Account form)
        {
            try
            {

            Nguoidung user = new Nguoidung();
            user.email = form.EmailRegister;
            user.tendangnhap = form.Name;
            user.matkhau = form.PasswordRegister;
            user.dienthoai = form.PhoneNumber;
            context.Nguoidung.Add(user);
            context.SaveChanges();
            return "{success: true, messsage: \"tạo tài khoản thành công\"}";
            }catch(Exception ex)
            {
                return "{success: false, messsage: \"tạo tài khoản thất bại\"}";
            }
        }
    }
}