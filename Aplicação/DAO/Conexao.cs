using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace DAO
{
    public static class Conexao
    {
        public static SqlConnection Conectar()
        {
            SqlConnection result = new SqlConnection(ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString);
            result.Open();

            return result;
        }
    }
}