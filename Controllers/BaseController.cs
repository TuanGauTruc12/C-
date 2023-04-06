using StudyEnglish.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace StudyEnglish.Controllers
{
    public class BaseController: Controller
    {
        protected StudyEnglishContext studyEnglishDB = new StudyEnglishContext();
        protected List<ThuocTinh> thuocTinhs;
        protected List<DanhMuc> danhMucs;
        protected List<Video> videos;
        public BaseController()
        {
            thuocTinhs = studyEnglishDB.ThuocTinh.ToList();
            danhMucs = studyEnglishDB.DanhMuc.ToList();
            videos = studyEnglishDB.Video.ToList();

            ViewData["thuocTinhs"] = thuocTinhs;
            ViewData["danhMucs"] = danhMucs;
            ViewData["videos"] = videos;

        }

    }
}