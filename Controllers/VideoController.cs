using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using StudyEnglish.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;
using System.Web.WebSockets;
using WebGrease.Css.Extensions;

namespace StudyEnglish.Controllers
{
    public class VideoController : BaseController {
        StudyEnglishContext context = new StudyEnglishContext();
        // GET: Video
        public ActionResult Index(int maVideo)
        {
            var video = context.Video.Where(v => v.maVideo == maVideo).FirstOrDefault();
            ViewData["baiTaps"] = context.BaiTap.Where(bt => bt.maVideo == maVideo).ToList();
            ViewData["video"] = video;
            return View();
        }

        public ActionResult Answer()
        {
            return View();
        }

        [HttpPost]
        public string Answer(string[] data, int questionNumber)
        {
            List<Result> answers = new List<Result>();
            var array = data;
            BaiTap baiTap = context.BaiTap.Where(bt => bt.maBt == questionNumber).FirstOrDefault();
            string[] dapAn = baiTap.DA.Split(new Char[] { '.' });
            List<string> list = new List<string>();

            for (var da = 0; da < dapAn.Length; da++)
            {
                dapAn[da] = dapAn[da].Trim(new char[] { '\n' }).Trim();
                if (da % 2 != 0)
                {
                    list.Add(dapAn[da]);
                }
            }

            for (int i = 0; i < list.Count; i++)
            {
                string an = list[i];
                if (an.Equals(data[i]))
                {
                    answers.Add(new Result(questionNumber, an, true));
                }
                else
                {
                    answers.Add(new Result(questionNumber, an, false));
                }

            }
            ViewData["result"] = answers;
            ViewData["baiTap"] = baiTap;
            var json = new JavaScriptSerializer().Serialize(answers);

            return json;
        }
    }
}