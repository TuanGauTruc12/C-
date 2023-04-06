using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace StudyEnglish
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
                name: "DanhMuc",
                url: "DanhMuc/{danhMuc}",
                defaults: new { controller = "DanhMuc", action = "Index" }
            );

            routes.MapRoute(
               name: "POST_DATA",
               url: "Account/Register/",
               defaults: new { controller = "Account", action = "Register" }
           );

            routes.MapRoute(
          name: "Register",
          url: "Video/Answer/",
          defaults: new { controller = "Video", action = "Answer" }
      );

            routes.MapRoute(
                name: "Video",
                url: "Video/{maVideo}",
                defaults: new { controller = "Video", action = "Index" }
            );


            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional }
            );
        }
    }
}