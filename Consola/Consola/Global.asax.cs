using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;

namespace Consola
{
    public class MvcApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
#pragma warning disable CS0436 // El tipo entra en conflicto con un tipo importado
            SqlServerTypes.Utilities.LoadNativeAssemblies(Server.MapPath("~/bin"));
#pragma warning restore CS0436 // El tipo entra en conflicto con un tipo importado

            AreaRegistration.RegisterAllAreas();
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
        }
    }
}
