SELECT E.NOMEUSUARIO,
       E.DESCRICAOFASE,
       E.CODIGOTIME1_1,
       E.CODIGOTIME1_2,
       E.CODIGOTIME2_1,
       E.CODIGOTIME2_2
  FROM (SELECT U.NOMEUSUARIO,
               F.DESCRICAOFASE,
               UJ.CODIGOTIME1 AS CODIGOTIME1_1,
               CASE WHEN R1.TIPOREGRA = 1 THEN (SELECT UGT.CODIGOTIME
                                                  FROM USUARIOGRUPOTIME UGT
                                                 WHERE UGT.CODIGOUSUARIO = UJ.CODIGOUSUARIO
                                                   AND UGT.CODIGOCAMPEONATO = UJ.CODIGOCAMPEONATO
                                                   AND UGT.CODIGOGRUPO = R1.CODIGOGRUPO
                                                   AND UGT.CLASSIFICACAOTIME = R1.CLASSIFICACAOTIME
                                                   AND NOT EXISTS (SELECT 1
                                                                     FROM USUARIOJOGO UJ INNER JOIN
                                                                          JOGO J ON (J.CODIGOCAMPEONATO = UJ.CODIGOCAMPEONATO AND
                                                                                     J.CODIGOJOGO = UJ.CODIGOJOGO) INNER JOIN
                                                                          GRUPOTIME GT ON (GT.CODIGOCAMPEONATO = UJ.CODIGOCAMPEONATO AND
                                                                                           GT.CODIGOGRUPO = UGT.CODIGOGRUPO AND
                                                                                           GT.CODIGOTIME IN (UJ.CODIGOTIME1, UJ.CODIGOTIME2))
                                                                    WHERE UJ.CODIGOUSUARIO = UGT.CODIGOUSUARIO
                                                                      AND UJ.CODIGOCAMPEONATO = UGT.CODIGOCAMPEONATO
                                                                      AND J.CODIGOFASE = 1
                                                                      AND ((UJ.TOTALGOL1 IS NULL) OR (UJ.TOTALGOL2 IS NULL))))
                    WHEN R1.TIPOREGRA = 2 THEN (SELECT CASE WHEN UJ2.TOTALGOL1 > UJ2.TOTALGOL2 THEN UJ2.CODIGOTIME1
                                                            WHEN UJ2.TOTALGOL2 > UJ2.TOTALGOL1 THEN UJ2.CODIGOTIME2
                                                            ELSE NULL
                                                       END
                                                  FROM USUARIOJOGO UJ2
                                                 WHERE UJ2.CODIGOUSUARIO = UJ.CODIGOUSUARIO
                                                   AND UJ2.CODIGOCAMPEONATO = R1.CODIGOCAMPEONATO
                                                   AND UJ2.CODIGOJOGO = R1.CODIGOJOGO)
                    WHEN R1.TIPOREGRA = 3 THEN (SELECT CASE WHEN UJ2.TOTALGOL1 < UJ2.TOTALGOL2 THEN UJ2.CODIGOTIME1
                                                            WHEN UJ2.TOTALGOL2 < UJ2.TOTALGOL1 THEN UJ2.CODIGOTIME2
                                                            ELSE NULL
                                                       END
                                                  FROM USUARIOJOGO UJ2
                                                 WHERE UJ2.CODIGOUSUARIO = UJ.CODIGOUSUARIO
                                                   AND UJ2.CODIGOCAMPEONATO = R1.CODIGOCAMPEONATO
                                                   AND UJ2.CODIGOJOGO = R1.CODIGOJOGO)
               END AS CODIGOTIME1_2,
               UJ.CODIGOTIME2 AS CODIGOTIME2_1,
               CASE WHEN R2.TIPOREGRA = 1 THEN (SELECT UGT.CODIGOTIME
                                                  FROM USUARIOGRUPOTIME UGT
                                                 WHERE UGT.CODIGOUSUARIO = UJ.CODIGOUSUARIO
                                                   AND UGT.CODIGOCAMPEONATO = UJ.CODIGOCAMPEONATO
                                                   AND UGT.CODIGOGRUPO = R2.CODIGOGRUPO
                                                   AND UGT.CLASSIFICACAOTIME = R2.CLASSIFICACAOTIME
                                                   AND NOT EXISTS (SELECT 1
                                                                     FROM USUARIOJOGO UJ INNER JOIN
                                                                          JOGO J ON (J.CODIGOCAMPEONATO = UJ.CODIGOCAMPEONATO AND
                                                                                     J.CODIGOJOGO = UJ.CODIGOJOGO) INNER JOIN
                                                                          GRUPOTIME GT ON (GT.CODIGOCAMPEONATO = UJ.CODIGOCAMPEONATO AND
                                                                                           GT.CODIGOGRUPO = UGT.CODIGOGRUPO AND
                                                                                           GT.CODIGOTIME IN (UJ.CODIGOTIME1, UJ.CODIGOTIME2))
                                                                    WHERE UJ.CODIGOUSUARIO = UGT.CODIGOUSUARIO
                                                                      AND UJ.CODIGOCAMPEONATO = UGT.CODIGOCAMPEONATO
                                                                      AND J.CODIGOFASE = 1
                                                                      AND ((UJ.TOTALGOL1 IS NULL) OR (UJ.TOTALGOL2 IS NULL))))
                    WHEN R2.TIPOREGRA = 2 THEN (SELECT CASE WHEN UJ2.TOTALGOL1 > UJ2.TOTALGOL2 THEN UJ2.CODIGOTIME1
                                                            WHEN UJ2.TOTALGOL2 > UJ2.TOTALGOL1 THEN UJ2.CODIGOTIME2
                                                            ELSE NULL
                                                       END
                                                  FROM USUARIOJOGO UJ2
                                                 WHERE UJ2.CODIGOUSUARIO = UJ.CODIGOUSUARIO
                                                   AND UJ2.CODIGOCAMPEONATO = R2.CODIGOCAMPEONATO
                                                   AND UJ2.CODIGOJOGO = R2.CODIGOJOGO)
                    WHEN R2.TIPOREGRA = 3 THEN (SELECT CASE WHEN UJ2.TOTALGOL1 < UJ2.TOTALGOL2 THEN UJ2.CODIGOTIME1
                                                            WHEN UJ2.TOTALGOL2 < UJ2.TOTALGOL1 THEN UJ2.CODIGOTIME2
                                                            ELSE NULL
                                                       END
                                                  FROM USUARIOJOGO UJ2
                                                 WHERE UJ2.CODIGOUSUARIO = UJ.CODIGOUSUARIO
                                                   AND UJ2.CODIGOCAMPEONATO = R2.CODIGOCAMPEONATO
                                                   AND UJ2.CODIGOJOGO = R2.CODIGOJOGO)
               END AS CODIGOTIME2_2
          FROM USUARIOJOGO UJ INNER JOIN
               USUARIO U ON (U.CODIGOUSUARIO = UJ.CODIGOUSUARIO) INNER JOIN
               JOGO J ON (J.CODIGOCAMPEONATO = UJ.CODIGOCAMPEONATO AND
                          J.CODIGOJOGO = UJ.CODIGOJOGO) INNER JOIN
               FASE F ON (F.CODIGOCAMPEONATO = J.CODIGOCAMPEONATO AND
                          F.CODIGOFASE = J.CODIGOFASE) LEFT OUTER JOIN
               REGRA R1 ON (R1.CODIGOCAMPEONATO = J.CODIGOCAMPEONATO AND
                            R1.CODIGOREGRA = J.CODIGOREGRA1) LEFT OUTER JOIN
               REGRA R2 ON (R2.CODIGOCAMPEONATO = J.CODIGOCAMPEONATO AND
                            R2.CODIGOREGRA = J.CODIGOREGRA2)
         WHERE J.CODIGOREGRA1 IS NOT NULL
            OR J.CODIGOREGRA2 IS NOT NULL) E
 WHERE COALESCE(E.CODIGOTIME1_1, -1) != COALESCE(E.CODIGOTIME1_2, -1)
    OR COALESCE(E.CODIGOTIME2_1, -1) != COALESCE(E.CODIGOTIME2_2, -1)