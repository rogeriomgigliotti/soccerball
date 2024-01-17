using System;
using System.Data;
using System.Data.SqlClient;
using System.Text;

namespace DAO
{
    public static class Usuario
    {
        public static bool IsAdministrator(string CodigoUsuario)
        {
            using (SqlConnection cnn = Conexao.Conectar())
            {
                StringBuilder sql = new StringBuilder();
                sql.Append("SELECT USUARIOADMINISTRADOR");
                sql.Append("  FROM USUARIO");
                sql.Append(" WHERE CODIGOUSUARIO = '" + CodigoUsuario + "'");

                SqlCommand cmd = new SqlCommand(sql.ToString(), cnn);
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                    return (Convert.ToDecimal(reader["USUARIOADMINISTRADOR"]) == 1);

                return false;
            }
        }

        public static string UserFullName(string CodigoUsuario)
        {
            using (SqlConnection cnn = Conexao.Conectar())
            {
                StringBuilder sql = new StringBuilder();
                sql.Append("SELECT NOMEUSUARIO");
                sql.Append("  FROM USUARIO");
                sql.Append(" WHERE CODIGOUSUARIO = '" + CodigoUsuario + "'");

                SqlCommand cmd = new SqlCommand(sql.ToString(), cnn);
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                    return reader["NOMEUSUARIO"].ToString();

                return String.Empty;
            }
        }

        public static bool AceitouRegulamento(string CodigoUsuario)
        {
            using (SqlConnection cnn = Conexao.Conectar())
            {
                StringBuilder sql = new StringBuilder();
                sql.Append("SELECT USUARIOACEITOUREGULAMENTO");
                sql.Append("  FROM USUARIOCAMPEONATO");
                sql.Append(" WHERE CODIGOUSUARIO = '" + CodigoUsuario + "'");
                sql.Append("   AND CODIGOCAMPEONATO = " + Consts.CodigoCampeonato);

                SqlCommand cmd = new SqlCommand(sql.ToString(), cnn);
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                    return (Convert.ToDecimal(reader["USUARIOACEITOUREGULAMENTO"]) == 1);

                return false;
            }
        }

        public static void AceitarRegulamento(string CodigoUsuario)
        {
            using (SqlConnection cnn = Conexao.Conectar())
            {
                StringBuilder sql = new StringBuilder();
                sql.Append("UPDATE USUARIOCAMPEONATO SET");
                sql.Append("       USUARIOACEITOUREGULAMENTO = 1");
                sql.Append(" WHERE CODIGOUSUARIO = '" + CodigoUsuario + "'");
                sql.Append("   AND CODIGOCAMPEONATO = " + Consts.CodigoCampeonato);

                SqlCommand cmd = new SqlCommand(sql.ToString(), cnn);
                if (cmd.ExecuteNonQuery() == 0)
                {
                    sql = new StringBuilder();
                    sql.Append("INSERT INTO USUARIOCAMPEONATO (");
                    sql.Append("       CODIGOUSUARIO,");
                    sql.Append("       CODIGOCAMPEONATO,");
                    sql.Append("       USUARIOACEITOUREGULAMENTO,");
                    sql.Append("       USUARIOIMPRIMIUAPOSTA,");
                    sql.Append("       USUARIOPAGOUAPOSTA");
                    sql.Append(") VALUES (");
                    sql.Append("       '" + CodigoUsuario + "',");
                    sql.Append("       " + Consts.CodigoCampeonato + ",");
                    sql.Append("       1,");
                    sql.Append("       0,");
                    sql.Append("       0");
                    sql.Append(")");

                    cmd = new SqlCommand(sql.ToString(), cnn);
                    cmd.ExecuteNonQuery();
                }
            }
        }

        public static bool ImprimiuAposta(string CodigoUsuario)
        {
            using (SqlConnection cnn = Conexao.Conectar())
            {
                StringBuilder sql = new StringBuilder();
                sql.Append("SELECT USUARIOIMPRIMIUAPOSTA");
                sql.Append("  FROM USUARIOCAMPEONATO");
                sql.Append(" WHERE CODIGOUSUARIO = '" + CodigoUsuario + "'");
                sql.Append("   AND CODIGOCAMPEONATO = " + Consts.CodigoCampeonato);

                SqlCommand cmd = new SqlCommand(sql.ToString(), cnn);
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                    return (Convert.ToDecimal(reader["USUARIOIMPRIMIUAPOSTA"]) == 1);

                return false;
            }
        }

        public static void ImprimirAposta(string CodigoUsuario)
        {
            using (SqlConnection cnn = Conexao.Conectar())
            {
                StringBuilder sql = new StringBuilder();
                sql.Append("UPDATE USUARIOCAMPEONATO SET");
                sql.Append("       USUARIOIMPRIMIUAPOSTA = 1");
                sql.Append(" WHERE CODIGOUSUARIO = '" + CodigoUsuario + "'");
                sql.Append("   AND CODIGOCAMPEONATO = " + Consts.CodigoCampeonato);

                SqlCommand cmd = new SqlCommand(sql.ToString(), cnn);
                cmd.ExecuteNonQuery();
            }
        }

        public static bool PagouAposta(string CodigoUsuario)
        {
            using (SqlConnection cnn = Conexao.Conectar())
            {
                StringBuilder sql = new StringBuilder();
                sql.Append("SELECT USUARIOPAGOUAPOSTA");
                sql.Append("  FROM USUARIOCAMPEONATO");
                sql.Append(" WHERE CODIGOUSUARIO = '" + CodigoUsuario + "'");
                sql.Append("   AND CODIGOCAMPEONATO = " + Consts.CodigoCampeonato);

                SqlCommand cmd = new SqlCommand(sql.ToString(), cnn);
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                    return (Convert.ToDecimal(reader["USUARIOPAGOUAPOSTA"]) == 1);

                return false;
            }
        }

        public static void PagarAposta(string CodigoUsuario, bool Pagou)
        {
            using (SqlConnection cnn = Conexao.Conectar())
            {
                StringBuilder sql = new StringBuilder();
                sql.Append("UPDATE USUARIOCAMPEONATO SET");
                sql.Append("       USUARIOPAGOUAPOSTA = " + (Pagou ? "1" : "0"));
                sql.Append(" WHERE CODIGOUSUARIO = '" + CodigoUsuario + "'");
                sql.Append("   AND CODIGOCAMPEONATO = " + Consts.CodigoCampeonato);

                SqlCommand cmd = new SqlCommand(sql.ToString(), cnn);
                cmd.ExecuteNonQuery();
            }
        }

        public static bool AlterarBolao(string CodigoUsuario)
        {
            using (SqlConnection cnn = Conexao.Conectar())
            {
                StringBuilder sql = new StringBuilder();
                sql.Append("SELECT SUM(C.CONTADOR) AS CONTADOR");
                sql.Append("  FROM (SELECT COUNT(1) AS CONTADOR");
                sql.Append("          FROM JOGO");
                sql.Append("         WHERE CODIGOCAMPEONATO = " + Consts.CodigoCampeonato);
                sql.Append("           AND HORARIOJOGO <= GETDATE()");
                sql.Append("         UNION ALL");
                sql.Append("        SELECT USUARIOIMPRIMIUAPOSTA AS CONTADOR");
                sql.Append("          FROM USUARIOCAMPEONATO");
                sql.Append("         WHERE CODIGOUSUARIO = '" + CodigoUsuario + "'");
                sql.Append("           AND CODIGOCAMPEONATO = " + Consts.CodigoCampeonato + ") C");

                SqlCommand cmd = new SqlCommand(sql.ToString(), cnn);
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                    return (Convert.ToDecimal(reader["CONTADOR"]) == 0);

                return false;
            }
        }

        public static void AlterarUsuario(string CodigoUsuario, string NomeUsuario)
        {
            using (SqlConnection cnn = Conexao.Conectar())
            {
                StringBuilder sql = new StringBuilder();
                sql.Append("UPDATE USUARIO SET");
                sql.Append("       NOMEUSUARIO = '" + NomeUsuario + "'");
                sql.Append(" WHERE CODIGOUSUARIO = '" + CodigoUsuario + "'");

                SqlCommand cmd = new SqlCommand(sql.ToString(), cnn);
                cmd.ExecuteNonQuery();
            }
        }

        public static void ExcluirUsuario(string CodigoUsuario)
        {
            using (SqlConnection cnn = Conexao.Conectar())
            {
                StringBuilder sql = new StringBuilder();
                sql.Append("EXECUTE [dbo].[spExcUsuario]");
                sql.Append("        @CodigoUsuario = '" + CodigoUsuario + "'");

                SqlCommand cmd = new SqlCommand(sql.ToString(), cnn);
                cmd.ExecuteNonQuery();
            }
        }

        public static bool BolaoCompleto(string CodigoUsuario)
        {
            using (SqlConnection cnn = Conexao.Conectar())
            {
                StringBuilder sql = new StringBuilder();
                sql.Append("SELECT COUNT(1) AS TOTAL,");
                sql.Append("       SUM(CASE WHEN (TOTALGOL1 IS NULL) OR (TOTALGOL2 IS NULL) THEN 1 ELSE 0 END) AS PENDENTE");
                sql.Append("  FROM USUARIOJOGO");
                sql.Append(" WHERE CODIGOUSUARIO = '" + CodigoUsuario + "'");
                sql.Append("   AND CODIGOCAMPEONATO = " + Consts.CodigoCampeonato);

                SqlCommand cmd = new SqlCommand(sql.ToString(), cnn);
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                    return ((Convert.ToDecimal(reader["TOTAL"]) > 0) && (Convert.ToDecimal(reader["PENDENTE"]) == 0));

                return false;
            }
        }

        public static DataTable ImpressaoBolao(string CodigoUsuario)
        {
            using (SqlConnection cnn = Conexao.Conectar())
            {
                StringBuilder sql = new StringBuilder();
                sql.Append("SELECT I.DESCRICAO,");
                sql.Append("       I.TIPO");
                sql.Append("  FROM (SELECT F.DESCRICAOFASE AS DESCRICAO,");
                sql.Append("               RIGHT('0000000000' + CAST(F.ORDEMFASE AS VARCHAR(10)), 10) + '0000000000' + '00000000000000' AS ORDEM,");
                sql.Append("               1 AS TIPO");
                sql.Append("          FROM FASE F");
                sql.Append("         WHERE F.CODIGOCAMPEONATO = " + Consts.CodigoCampeonato);
                sql.Append("         UNION ALL");
                sql.Append("        SELECT R.DESCRICAORODADA AS DESCRICAO,");
                sql.Append("               RIGHT('0000000000' + CAST(F.ORDEMFASE AS VARCHAR(10)), 10) + RIGHT('0000000000' + CAST(R.ORDEMRODADA AS VARCHAR(10)), 10) + '00000000000000' AS ORDEM,");
                sql.Append("               2 AS TIPO");
                sql.Append("          FROM FASE F INNER JOIN");
                sql.Append("               RODADA R ON (R.CODIGOCAMPEONATO = F.CODIGOCAMPEONATO AND");
                sql.Append("                            R.CODIGOFASE = F.CODIGOFASE)");
                sql.Append("         WHERE F.CODIGOCAMPEONATO = " + Consts.CodigoCampeonato);
                sql.Append("         UNION ALL");
                sql.Append("        SELECT T1.NOMETIME + ' ' + CAST(UJ.TOTALGOL1 AS VARCHAR(10)) + ' X ' + CAST(UJ.TOTALGOL2 AS VARCHAR(10)) + ' ' + T2.NOMETIME AS DESCRICAO,");
                sql.Append("               RIGHT('0000000000' + CAST(F.ORDEMFASE AS VARCHAR(10)), 10) + RIGHT('0000000000' + CAST(ISNULL(R.ORDEMRODADA, 0) AS VARCHAR(10)), 10) + SUBSTRING(CONVERT(VARCHAR(10), J.HORARIOJOGO, 103), 7, 4) + SUBSTRING(CONVERT(VARCHAR(10), J.HORARIOJOGO, 103), 4, 2) + SUBSTRING(CONVERT(VARCHAR(10), J.HORARIOJOGO, 103), 1, 2) + REPLACE(CONVERT(VARCHAR(8), J.HORARIOJOGO, 108), ':', '') AS ORDEM,");
                sql.Append("               3 AS TIPO");
                sql.Append("          FROM USUARIOJOGO UJ INNER JOIN");
                sql.Append("               JOGO J ON (J.CODIGOCAMPEONATO = UJ.CODIGOCAMPEONATO AND");
                sql.Append("                          J.CODIGOJOGO = UJ.CODIGOJOGO) INNER JOIN");
                sql.Append("               FASE F ON (F.CODIGOCAMPEONATO = J.CODIGOCAMPEONATO AND");
                sql.Append("                          F.CODIGOFASE = J.CODIGOFASE) LEFT OUTER JOIN");
                sql.Append("               RODADA R ON (R.CODIGOCAMPEONATO = J.CODIGOCAMPEONATO AND");
                sql.Append("                            R.CODIGOFASE = J.CODIGOFASE AND");
                sql.Append("                            R.CODIGORODADA = J.CODIGORODADA) INNER JOIN");
                sql.Append("               TIME T1 ON (T1.CODIGOTIME = UJ.CODIGOTIME1) INNER JOIN");
                sql.Append("               TIME T2 ON (T2.CODIGOTIME = UJ.CODIGOTIME2)");
                sql.Append("         WHERE UJ.CODIGOUSUARIO = '" + CodigoUsuario + "'");
                sql.Append("           AND UJ.CODIGOCAMPEONATO = " + Consts.CodigoCampeonato + ") I");
                sql.Append(" ORDER BY I.ORDEM");

                SqlCommand cmd = new SqlCommand(sql.ToString(), cnn);
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable table = new DataTable();
                adapter.Fill(table);

                return table;
            }
        }
    }
}