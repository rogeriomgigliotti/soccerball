using System;
using System.Data;
using System.Data.SqlClient;
using System.Text;

namespace DAO
{
    public static class Update
    {
        public static void IncluirUsuario(string CodigoUsuario, string NomeUsuario)
        {
            using (SqlConnection cnn = Conexao.Conectar())
            {
                StringBuilder sql = new StringBuilder();
                sql.Append("INSERT INTO USUARIO (");
                sql.Append("       CODIGOUSUARIO,");
                sql.Append("       NOMEUSUARIO,");
                sql.Append("       USUARIOADMINISTRADOR");
                sql.Append(") VALUES (");
                sql.Append("       '" + CodigoUsuario + "',");
                sql.Append("       '" + NomeUsuario + "',");
                sql.Append("       0");
                sql.Append(")");

                SqlCommand cmd = new SqlCommand(sql.ToString(), cnn);
                cmd.ExecuteNonQuery();

                cnn.Close();
            }
        }

        public static void ResultadoJogo(decimal CodigoJogo, decimal TotalGol1, decimal TotalGol2)
        {
            using (SqlConnection cnn = Conexao.Conectar())
            {
                StringBuilder sql = new StringBuilder();
                sql.Append("UPDATE JOGO SET");
                sql.Append("       TOTALGOL1 = " + (TotalGol1 > -1 ? TotalGol1.ToString() : "NULL") + ",");
                sql.Append("       TOTALGOL2 = " + (TotalGol2 > -1 ? TotalGol2.ToString() : "NULL"));
                sql.Append(" WHERE CODIGOCAMPEONATO = " + Consts.CodigoCampeonato);
                sql.Append("   AND CODIGOJOGO = " + CodigoJogo);

                SqlCommand cmd = new SqlCommand(sql.ToString(), cnn);
                cmd.ExecuteNonQuery();

                cnn.Close();
            }
        }

        public static void AtualizarClassificacao(decimal CodigoGrupo, decimal CodigoFase)
        {
            using (SqlConnection cnn = Conexao.Conectar())
            {
                StringBuilder sql = new StringBuilder();
                sql.Append("EXECUTE [dbo].[spSysAtualizarClassificacao]");
                sql.Append("        @CodigoCampeonato = " + Consts.CodigoCampeonato + ",");
                sql.Append("        @CodigoGrupo = " + CodigoGrupo + ",");
                sql.Append("        @CodigoFase = " + CodigoFase);

                SqlCommand cmd = new SqlCommand(sql.ToString(), cnn);
                cmd.ExecuteNonQuery();

                cnn.Close();
            }
        }

        public static void AtualizarMataMata()
        {
            using (SqlConnection cnn = Conexao.Conectar())
            {
                StringBuilder sql = new StringBuilder();
                sql.Append("EXECUTE [dbo].[spSysAtualizarMataMata]");
                sql.Append("        @CodigoCampeonato = " + Consts.CodigoCampeonato);

                SqlCommand cmd = new SqlCommand(sql.ToString(), cnn);
                cmd.ExecuteNonQuery();

                cnn.Close();
            }
        }

        public static void ResultadoJogoU(string CodigoUsuario, decimal CodigoJogo, decimal TotalGol1, decimal TotalGol2)
        {
            using (SqlConnection cnn = Conexao.Conectar())
            {
                StringBuilder sql = new StringBuilder();
                sql.Append("UPDATE USUARIOJOGO SET");
                sql.Append("       TOTALGOL1 = " + (TotalGol1 > -1 ? TotalGol1.ToString() : "NULL") + ",");
                sql.Append("       TOTALGOL2 = " + (TotalGol2 > -1 ? TotalGol2.ToString() : "NULL"));
                sql.Append(" WHERE CODIGOUSUARIO = '" + CodigoUsuario + "'");
                sql.Append("   AND CODIGOCAMPEONATO = " + Consts.CodigoCampeonato);
                sql.Append("   AND CODIGOJOGO = " + CodigoJogo);

                SqlCommand cmd = new SqlCommand(sql.ToString(), cnn);
                cmd.ExecuteNonQuery();

                cnn.Close();
            }
        }

        public static void AtualizarClassificacaoU(string CodigoUsuario, decimal CodigoGrupo, decimal CodigoFase)
        {
            using (SqlConnection cnn = Conexao.Conectar())
            {
                StringBuilder sql = new StringBuilder();
                sql.Append("EXECUTE [dbo].[spSysAtualizarClassificacaoU]");
                sql.Append("        @CodigoUsuario = '" + CodigoUsuario + "',");
                sql.Append("        @CodigoCampeonato = " + Consts.CodigoCampeonato + ",");
                sql.Append("        @CodigoGrupo = " + CodigoGrupo + ",");
                sql.Append("        @CodigoFase = " + CodigoFase);

                SqlCommand cmd = new SqlCommand(sql.ToString(), cnn);
                cmd.ExecuteNonQuery();

                cnn.Close();
            }
        }

        public static void AtualizarMataMataU(string CodigoUsuario)
        {
            using (SqlConnection cnn = Conexao.Conectar())
            {
                StringBuilder sql = new StringBuilder();
                sql.Append("EXECUTE [dbo].[spSysAtualizarMataMataU]");
                sql.Append("        @CodigoUsuario = '" + CodigoUsuario + "',");
                sql.Append("        @CodigoCampeonato = " + Consts.CodigoCampeonato);

                SqlCommand cmd = new SqlCommand(sql.ToString(), cnn);
                cmd.ExecuteNonQuery();

                cnn.Close();
            }
        }
    }
}