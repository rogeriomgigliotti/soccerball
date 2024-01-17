using System;
using System.Data;
using System.Data.SqlClient;
using System.Text;

namespace DAO
{
    public static class Consulta
    {
        public static DataTable Fases()
        {
            using (SqlConnection cnn = Conexao.Conectar())
            {
                StringBuilder sql = new StringBuilder();
                sql.Append("SELECT CODIGOFASE,");
                sql.Append("       DESCRICAOFASE,");
                sql.Append("       TIPOFASE");
                sql.Append("  FROM FASE");
                sql.Append(" WHERE CODIGOCAMPEONATO = " + Consts.CodigoCampeonato);
                sql.Append(" ORDER BY ORDEMFASE");

                SqlCommand cmd = new SqlCommand(sql.ToString(), cnn);
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable table = new DataTable();
                adapter.Fill(table);

                cnn.Close();

                return table;
            }
        }

        public static DataTable Rodadas(decimal CodigoFase)
        {
            using (SqlConnection cnn = Conexao.Conectar())
            {
                StringBuilder sql = new StringBuilder();
                sql.Append("SELECT CODIGORODADA,");
                sql.Append("       DESCRICAORODADA");
                sql.Append("  FROM RODADA");
                sql.Append(" WHERE CODIGOCAMPEONATO = " + Consts.CodigoCampeonato);
                sql.Append("   AND CODIGOFASE = " + CodigoFase);
                sql.Append(" ORDER BY ORDEMRODADA");

                SqlCommand cmd = new SqlCommand(sql.ToString(), cnn);
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable table = new DataTable();
                adapter.Fill(table);

                cnn.Close();

                return table;
            }
        }

        public static DataTable Classificacao(decimal CodigoFase)
        {
            using (SqlConnection cnn = Conexao.Conectar())
            {
                StringBuilder sql = new StringBuilder();
                sql.Append("EXECUTE [dbo].[spConClassificacao]");
                sql.Append("        @CodigoCampeonato = " + Consts.CodigoCampeonato + ",");
                sql.Append("        @CodigoFase = " + CodigoFase);

                SqlCommand cmd = new SqlCommand(sql.ToString(), cnn);
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable table = new DataTable();
                adapter.Fill(table);

                cnn.Close();

                return table;
            }
        }

        public static DataTable Jogos(decimal CodigoFase, decimal CodigoRodada)
        {
            using (SqlConnection cnn = Conexao.Conectar())
            {
                StringBuilder sql = new StringBuilder();
                sql.Append("EXECUTE [dbo].[spConJogo]");
                sql.Append("        @CodigoCampeonato = " + Consts.CodigoCampeonato + ",");
                sql.Append("        @CodigoFase = " + CodigoFase + ",");
                sql.Append("        @CodigoRodada = " + (CodigoRodada > 0 ? CodigoRodada.ToString() : "NULL"));

                SqlCommand cmd = new SqlCommand(sql.ToString(), cnn);
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable table = new DataTable();
                adapter.Fill(table);

                cnn.Close();

                return table;
            }
        }

        public static DataTable ClassificacaoU(string CodigoUsuario, decimal CodigoFase)
        {
            using (SqlConnection cnn = Conexao.Conectar())
            {
                StringBuilder sql = new StringBuilder();
                sql.Append("EXECUTE [dbo].[spConClassificacaoU]");
                sql.Append("        @CodigoUsuario = '" + CodigoUsuario + "',");
                sql.Append("        @CodigoCampeonato = " + Consts.CodigoCampeonato + ",");
                sql.Append("        @CodigoFase = " + CodigoFase);

                SqlCommand cmd = new SqlCommand(sql.ToString(), cnn);
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable table = new DataTable();
                adapter.Fill(table);

                cnn.Close();

                return table;
            }
        }

        public static DataTable JogosU(string CodigoUsuario, decimal CodigoFase, decimal CodigoRodada)
        {
            using (SqlConnection cnn = Conexao.Conectar())
            {
                StringBuilder sql = new StringBuilder();
                sql.Append("EXECUTE [dbo].[spConJogoU]");
                sql.Append("        @CodigoUsuario = '" + CodigoUsuario + "',");
                sql.Append("        @CodigoCampeonato = " + Consts.CodigoCampeonato + ",");
                sql.Append("        @CodigoFase = " + CodigoFase + ",");
                sql.Append("        @CodigoRodada = " + (CodigoRodada > 0 ? CodigoRodada.ToString() : "NULL"));

                SqlCommand cmd = new SqlCommand(sql.ToString(), cnn);
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable table = new DataTable();
                adapter.Fill(table);

                cnn.Close();

                return table;
            }
        }

        public static DataTable CampeonatoU()
        {
            using (SqlConnection cnn = Conexao.Conectar())
            {
                StringBuilder sql = new StringBuilder();
                sql.Append("EXECUTE [dbo].[spConCampeonatoU]");
                sql.Append("        @CodigoCampeonato = " + Consts.CodigoCampeonato);

                SqlCommand cmd = new SqlCommand(sql.ToString(), cnn);
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable table = new DataTable();
                adapter.Fill(table);

                cnn.Close();

                return table;
            }
        }

        public static bool CampeonatoIniciou()
        {
            using (SqlConnection cnn = Conexao.Conectar())
            {
                StringBuilder sql = new StringBuilder();
                sql.Append("SELECT MIN(HORARIOJOGO) AS HORARIOPRIMEIROJOGO");
                sql.Append("  FROM JOGO");
                sql.Append(" WHERE CODIGOCAMPEONATO = " + Consts.CodigoCampeonato);

                SqlCommand cmd = new SqlCommand(sql.ToString(), cnn);
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable table = new DataTable();
                adapter.Fill(table);

                cnn.Close();

                return (Convert.ToDateTime(table.Rows[0]["HORARIOPRIMEIROJOGO"]) < DateTime.Now);
            }
        }

        public static DataTable Ranking()
        {
            using (SqlConnection cnn = Conexao.Conectar())
            {
                StringBuilder sql = new StringBuilder();
                sql.Append("EXECUTE [dbo].[spConRanking]");
                sql.Append("        @CodigoCampeonato = " + Consts.CodigoCampeonato);

                SqlCommand cmd = new SqlCommand(sql.ToString(), cnn);
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable table = new DataTable();
                adapter.Fill(table);

                cnn.Close();

                return table;
            }
        }
    }
}