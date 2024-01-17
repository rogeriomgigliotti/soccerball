using System;
using System.Web;

namespace WebSite.Classes
{
    public static class Navegacao
    {
        public static bool IsAdministrator
        {
            get
            {
                return ((HttpContext.Current.User.Identity.IsAuthenticated) &&
                        (DAO.Usuario.IsAdministrator(HttpContext.Current.User.Identity.Name)));
            }
        }

        public static bool IsAuthenticated
        {
            get { return (HttpContext.Current.User.Identity.IsAuthenticated); }
        }

        public static string UserName
        {
            get
            {
                if (HttpContext.Current.User.Identity.IsAuthenticated)
                    return HttpContext.Current.User.Identity.Name;
                else
                    return String.Empty;
            }
        }

        public static string UserFullName
        {
            get
            {
                if (HttpContext.Current.User.Identity.IsAuthenticated)
                    return DAO.Usuario.UserFullName(HttpContext.Current.User.Identity.Name);
                else
                    return String.Empty;
            }
        }

        public static bool AceitouRegulamento
        {
            get
            {
                return ((HttpContext.Current.User.Identity.IsAuthenticated) &&
                        (DAO.Usuario.AceitouRegulamento(HttpContext.Current.User.Identity.Name)));
            }
        }
    }
}