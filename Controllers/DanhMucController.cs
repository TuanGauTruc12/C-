using StudyEnglish.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace StudyEnglish.Controllers
{
    public class DanhMucController : BaseController
    {
        // GET: DanhMuc
        StudyEnglishContext studyEnglish = new StudyEnglishContext();
        public ActionResult Index(string danhMuc)
        {
            string link = "/DanhMuc/" + danhMuc;
            string title = studyEnglishDB.DanhMuc.Where(dm => dm.linkDanhMuc == link).FirstOrDefault().tenDanhMuc;
            var videoToCategory = studyEnglish.Video.Where(dm => dm.DanhMuc.linkDanhMuc == link).ToList();
            ViewData["title"] = title;
            ViewData["videoToCategory"] = videoToCategory;
            return View();
        }
    }
}