CREATE TABLE CAMPEONATO (
       CODIGOCAMPEONATO     numeric(10) NOT NULL,
       NOMECAMPEONATO       varchar(50) NULL,
       PONTUACAOVITORIA     numeric(10) NULL,
       PONTUACAOEMPATE      numeric(10) NULL,
       PONTUACAODERROTA     numeric(10) NULL,
       PONTUACAOACERTOEXATO numeric(10) NULL,
       PONTUACAOACERTOPARCIAL numeric(10) NULL
)
go


ALTER TABLE CAMPEONATO
       ADD CONSTRAINT CAMPEONATO_PK PRIMARY KEY (CODIGOCAMPEONATO)
go


CREATE TABLE CAMPEONATOCRITERIODESEMPATE (
       CODIGOCAMPEONATO     numeric(10) NOT NULL,
       CRITERIODESEMPATE    numeric(10) NOT NULL,
       PESOCRITERIODESEMPATE numeric(20,4) NULL
)
go

CREATE INDEX CCDESEMPATE_CAMPEONATO_FK ON CAMPEONATOCRITERIODESEMPATE
(
       CODIGOCAMPEONATO               ASC
)
go

CREATE INDEX CCDESEMPATE_CDESEMPATE_FK ON CAMPEONATOCRITERIODESEMPATE
(
       CRITERIODESEMPATE              ASC
)
go


ALTER TABLE CAMPEONATOCRITERIODESEMPATE
       ADD CONSTRAINT CAMPEONATOCRITERIODESEMPATE_PK PRIMARY KEY (
              CODIGOCAMPEONATO, CRITERIODESEMPATE)
go


CREATE TABLE CRITERIODESEMPATE (
       CRITERIODESEMPATE    numeric(10) NOT NULL,
       DESCRICAOCRITERIODESEMPATE varchar(50) NULL
)
go


ALTER TABLE CRITERIODESEMPATE
       ADD CONSTRAINT CRITERIODESEMPATE_PK PRIMARY KEY (
              CRITERIODESEMPATE)
go


CREATE TABLE ESTADIO (
       CODIGOESTADIO        numeric(10) NOT NULL,
       NOMEESTADIO          varchar(50) NULL
)
go


ALTER TABLE ESTADIO
       ADD CONSTRAINT ESTADIO_PK PRIMARY KEY (CODIGOESTADIO)
go


CREATE TABLE FASE (
       CODIGOCAMPEONATO     numeric(10) NOT NULL,
       CODIGOFASE           numeric(10) NOT NULL,
       DESCRICAOFASE        varchar(50) NULL,
       TIPOFASE             numeric(10) NULL,
       ORDEMFASE            numeric(10) NULL
)
go

CREATE INDEX FASE_CAMPEONATO_FK ON FASE
(
       CODIGOCAMPEONATO               ASC
)
go

CREATE INDEX FASE_TFASE_FK ON FASE
(
       TIPOFASE                       ASC
)
go


ALTER TABLE FASE
       ADD CONSTRAINT FASE_PK PRIMARY KEY (CODIGOCAMPEONATO, 
              CODIGOFASE)
go


CREATE TABLE GRUPO (
       CODIGOCAMPEONATO     numeric(10) NOT NULL,
       CODIGOGRUPO          numeric(10) NOT NULL,
       DESCRICAOGRUPO       varchar(50) NULL,
       ORDEMGRUPO           numeric(10) NULL
)
go

CREATE INDEX GRUPO_CAMPEONATO_FK ON GRUPO
(
       CODIGOCAMPEONATO               ASC
)
go


ALTER TABLE GRUPO
       ADD CONSTRAINT GRUPO_PK PRIMARY KEY (CODIGOCAMPEONATO, 
              CODIGOGRUPO)
go


CREATE TABLE GRUPOTIME (
       CODIGOCAMPEONATO     numeric(10) NOT NULL,
       CODIGOGRUPO          numeric(10) NOT NULL,
       CODIGOTIME           numeric(10) NOT NULL,
       CLASSIFICACAOTIME    numeric(10) NULL,
       ORDEMTIME            numeric(10) NULL
)
go

CREATE INDEX GTIME_GRUPO_FK ON GRUPOTIME
(
       CODIGOCAMPEONATO               ASC,
       CODIGOGRUPO                    ASC
)
go

CREATE INDEX GTIME_TIME_FK ON GRUPOTIME
(
       CODIGOTIME                     ASC
)
go


ALTER TABLE GRUPOTIME
       ADD CONSTRAINT GRUPOTIME_PK PRIMARY KEY (CODIGOCAMPEONATO, 
              CODIGOGRUPO, CODIGOTIME)
go


CREATE TABLE JOGO (
       CODIGOCAMPEONATO     numeric(10) NOT NULL,
       CODIGOJOGO           numeric(10) NOT NULL,
       CODIGOFASE           numeric(10) NULL,
       CODIGORODADA         numeric(10) NULL,
       CODIGOESTADIO        numeric(10) NULL,
       HORARIOJOGO          datetime NULL,
       CODIGOREGRA1         numeric(10) NULL,
       CODIGOTIME1          numeric(10) NULL,
       TOTALGOL1            numeric(10) NULL,
       CODIGOREGRA2         numeric(10) NULL,
       CODIGOTIME2          numeric(10) NULL,
       TOTALGOL2            numeric(10) NULL
)
go

CREATE INDEX JOGO_FASE_FK ON JOGO
(
       CODIGOCAMPEONATO               ASC,
       CODIGOFASE                     ASC
)
go

CREATE INDEX JOGO_TIME1_FK ON JOGO
(
       CODIGOTIME1                    ASC
)
go

CREATE INDEX JOGO_TIME2_FK ON JOGO
(
       CODIGOTIME2                    ASC
)
go

CREATE INDEX JOGO_REGRA1_FK ON JOGO
(
       CODIGOCAMPEONATO               ASC,
       CODIGOREGRA1                   ASC
)
go

CREATE INDEX JOGO_REGRA2_FK ON JOGO
(
       CODIGOCAMPEONATO               ASC,
       CODIGOREGRA2                   ASC
)
go

CREATE INDEX JOGO_ESTADIO_FK ON JOGO
(
       CODIGOESTADIO                  ASC
)
go

CREATE INDEX JOGO_RODADA_FK ON JOGO
(
       CODIGOCAMPEONATO               ASC,
       CODIGOFASE                     ASC,
       CODIGORODADA                   ASC
)
go


ALTER TABLE JOGO
       ADD CONSTRAINT JOGO_PK PRIMARY KEY (CODIGOCAMPEONATO, 
              CODIGOJOGO)
go


CREATE TABLE REGRA (
       CODIGOCAMPEONATO     numeric(10) NOT NULL,
       CODIGOREGRA          numeric(10) NOT NULL,
       DESCRICAOREGRA       varchar(50) NULL,
       TIPOREGRA            numeric(10) NULL,
       CODIGOGRUPO          numeric(10) NULL,
       CLASSIFICACAOTIME    numeric(10) NULL,
       CODIGOJOGO           numeric(10) NULL
)
go

CREATE INDEX REGRA_CAMPEONATO_FK ON REGRA
(
       CODIGOCAMPEONATO               ASC
)
go

CREATE INDEX REGRA_TREGRA_FK ON REGRA
(
       TIPOREGRA                      ASC
)
go

CREATE INDEX REGRA_GRUPO_FK ON REGRA
(
       CODIGOCAMPEONATO               ASC,
       CODIGOGRUPO                    ASC
)
go

CREATE INDEX REGRA_JOGO_FK ON REGRA
(
       CODIGOCAMPEONATO               ASC,
       CODIGOJOGO                     ASC
)
go


ALTER TABLE REGRA
       ADD CONSTRAINT REGRA_PK PRIMARY KEY (CODIGOCAMPEONATO, 
              CODIGOREGRA)
go


CREATE TABLE RODADA (
       CODIGOCAMPEONATO     numeric(10) NOT NULL,
       CODIGOFASE           numeric(10) NOT NULL,
       CODIGORODADA         numeric(10) NOT NULL,
       DESCRICAORODADA      varchar(50) NULL,
       ORDEMRODADA          numeric(10) NULL
)
go

CREATE INDEX RODADA_FASE_FK ON RODADA
(
       CODIGOCAMPEONATO               ASC,
       CODIGOFASE                     ASC
)
go


ALTER TABLE RODADA
       ADD CONSTRAINT RODADA_PK PRIMARY KEY (CODIGOCAMPEONATO, 
              CODIGOFASE, CODIGORODADA)
go


CREATE TABLE TIME (
       CODIGOTIME           numeric(10) NOT NULL,
       NOMETIME             varchar(50) NULL,
       BANDEIRATIME         image NULL,
       EXTENSAOBANDEIRATIME varchar(20) NULL
)
go


ALTER TABLE TIME
       ADD CONSTRAINT TIME_PK PRIMARY KEY (CODIGOTIME)
go


CREATE TABLE TIPOFASE (
       TIPOFASE             numeric(10) NOT NULL,
       DESCRICAOTIPOFASE    varchar(50) NULL
)
go


ALTER TABLE TIPOFASE
       ADD CONSTRAINT TIPOFASE_PK PRIMARY KEY (TIPOFASE)
go


CREATE TABLE TIPOREGRA (
       TIPOREGRA            numeric(10) NOT NULL,
       DESCRICAOTIPOREGRA   varchar(50) NULL
)
go


ALTER TABLE TIPOREGRA
       ADD CONSTRAINT TIPOREGRA_PK PRIMARY KEY (TIPOREGRA)
go


CREATE TABLE USUARIO (
       CODIGOUSUARIO        varchar(256) NOT NULL,
       NOMEUSUARIO          varchar(50) NULL,
       USUARIOADMINISTRADOR numeric(1) NULL
)
go


ALTER TABLE USUARIO
       ADD CONSTRAINT USUARIO_PK PRIMARY KEY (CODIGOUSUARIO)
go


CREATE TABLE USUARIOCAMPEONATO (
       CODIGOUSUARIO        varchar(256) NOT NULL,
       CODIGOCAMPEONATO     numeric(10) NOT NULL,
       USUARIOACEITOUREGULAMENTO numeric(1) NULL,
       USUARIOIMPRIMIUAPOSTA numeric(1) NULL
)
go

CREATE INDEX UCAMPEONATO_USUARIO_FK ON USUARIOCAMPEONATO
(
       CODIGOUSUARIO                  ASC
)
go

CREATE INDEX UCAMPEONATO_CAMPEONATO_FK ON USUARIOCAMPEONATO
(
       CODIGOCAMPEONATO               ASC
)
go


ALTER TABLE USUARIOCAMPEONATO
       ADD CONSTRAINT USUARIOCAMPEONATO_PK PRIMARY KEY (CODIGOUSUARIO, 
              CODIGOCAMPEONATO)
go


CREATE TABLE USUARIOGRUPOTIME (
       CODIGOUSUARIO        varchar(256) NOT NULL,
       CODIGOCAMPEONATO     numeric(10) NOT NULL,
       CODIGOGRUPO          numeric(10) NOT NULL,
       CODIGOTIME           numeric(10) NOT NULL,
       CLASSIFICACAOTIME    numeric(10) NULL
)
go

CREATE INDEX UGTIME_GTIME_FK ON USUARIOGRUPOTIME
(
       CODIGOCAMPEONATO               ASC,
       CODIGOGRUPO                    ASC,
       CODIGOTIME                     ASC
)
go

CREATE INDEX UGTIME_USUARIO_FK ON USUARIOGRUPOTIME
(
       CODIGOUSUARIO                  ASC
)
go


ALTER TABLE USUARIOGRUPOTIME
       ADD CONSTRAINT USUARIOGRUPOTIME_PK PRIMARY KEY (CODIGOUSUARIO, 
              CODIGOCAMPEONATO, CODIGOGRUPO, CODIGOTIME)
go


CREATE TABLE USUARIOJOGO (
       CODIGOUSUARIO        varchar(256) NOT NULL,
       CODIGOCAMPEONATO     numeric(10) NOT NULL,
       CODIGOJOGO           numeric(10) NOT NULL,
       CODIGOTIME1          numeric(10) NULL,
       TOTALGOL1            numeric(10) NULL,
       CODIGOTIME2          numeric(10) NULL,
       TOTALGOL2            numeric(10) NULL
)
go

CREATE INDEX UJOGO_JOGO_FK ON USUARIOJOGO
(
       CODIGOCAMPEONATO               ASC,
       CODIGOJOGO                     ASC
)
go

CREATE INDEX UJOGO_TIME1_FK ON USUARIOJOGO
(
       CODIGOTIME1                    ASC
)
go

CREATE INDEX UJOGO_TIME2_FK ON USUARIOJOGO
(
       CODIGOTIME2                    ASC
)
go

CREATE INDEX UJOGO_USUARIO_FK ON USUARIOJOGO
(
       CODIGOUSUARIO                  ASC
)
go


ALTER TABLE USUARIOJOGO
       ADD CONSTRAINT USUARIOJOGO_PK PRIMARY KEY (CODIGOUSUARIO, 
              CODIGOCAMPEONATO, CODIGOJOGO)
go


ALTER TABLE CAMPEONATOCRITERIODESEMPATE
       ADD CONSTRAINT CCDESEMPATE_CDESEMPATE_FK
              FOREIGN KEY (CRITERIODESEMPATE)
                             REFERENCES CRITERIODESEMPATE
go


ALTER TABLE CAMPEONATOCRITERIODESEMPATE
       ADD CONSTRAINT CCDESEMPATE_CAMPEONATO_FK
              FOREIGN KEY (CODIGOCAMPEONATO)
                             REFERENCES CAMPEONATO
go


ALTER TABLE FASE
       ADD CONSTRAINT FASE_TFASE_FK
              FOREIGN KEY (TIPOFASE)
                             REFERENCES TIPOFASE
go


ALTER TABLE FASE
       ADD CONSTRAINT FASE_CAMPEONATO_FK
              FOREIGN KEY (CODIGOCAMPEONATO)
                             REFERENCES CAMPEONATO
go


ALTER TABLE GRUPO
       ADD CONSTRAINT GRUPO_CAMPEONATO_FK
              FOREIGN KEY (CODIGOCAMPEONATO)
                             REFERENCES CAMPEONATO
go


ALTER TABLE GRUPOTIME
       ADD CONSTRAINT GTIME_TIME_FK
              FOREIGN KEY (CODIGOTIME)
                             REFERENCES TIME
go


ALTER TABLE GRUPOTIME
       ADD CONSTRAINT GTIME_GRUPO_FK
              FOREIGN KEY (CODIGOCAMPEONATO, CODIGOGRUPO)
                             REFERENCES GRUPO
go


ALTER TABLE JOGO
       ADD CONSTRAINT JOGO_RODADA_FK
              FOREIGN KEY (CODIGOCAMPEONATO, CODIGOFASE, CODIGORODADA)
                             REFERENCES RODADA
go


ALTER TABLE JOGO
       ADD CONSTRAINT JOGO_ESTADIO_FK
              FOREIGN KEY (CODIGOESTADIO)
                             REFERENCES ESTADIO
go


ALTER TABLE JOGO
       ADD CONSTRAINT JOGO_REGRA2_FK
              FOREIGN KEY (CODIGOCAMPEONATO, CODIGOREGRA2)
                             REFERENCES REGRA
go


ALTER TABLE JOGO
       ADD CONSTRAINT JOGO_REGRA1_FK
              FOREIGN KEY (CODIGOCAMPEONATO, CODIGOREGRA1)
                             REFERENCES REGRA
go


ALTER TABLE JOGO
       ADD CONSTRAINT JOGO_TIME2_FK
              FOREIGN KEY (CODIGOTIME2)
                             REFERENCES TIME
go


ALTER TABLE JOGO
       ADD CONSTRAINT JOGO_TIME1_FK
              FOREIGN KEY (CODIGOTIME1)
                             REFERENCES TIME
go


ALTER TABLE JOGO
       ADD CONSTRAINT JOGO_FASE_FK
              FOREIGN KEY (CODIGOCAMPEONATO, CODIGOFASE)
                             REFERENCES FASE
go


ALTER TABLE REGRA
       ADD CONSTRAINT REGRA_JOGO_FK
              FOREIGN KEY (CODIGOCAMPEONATO, CODIGOJOGO)
                             REFERENCES JOGO
go


ALTER TABLE REGRA
       ADD CONSTRAINT REGRA_GRUPO_FK
              FOREIGN KEY (CODIGOCAMPEONATO, CODIGOGRUPO)
                             REFERENCES GRUPO
go


ALTER TABLE REGRA
       ADD CONSTRAINT REGRA_TREGRA_FK
              FOREIGN KEY (TIPOREGRA)
                             REFERENCES TIPOREGRA
go


ALTER TABLE REGRA
       ADD CONSTRAINT REGRA_CAMPEONATO_FK
              FOREIGN KEY (CODIGOCAMPEONATO)
                             REFERENCES CAMPEONATO
go


ALTER TABLE RODADA
       ADD CONSTRAINT RODADA_FASE_FK
              FOREIGN KEY (CODIGOCAMPEONATO, CODIGOFASE)
                             REFERENCES FASE
go


ALTER TABLE USUARIOCAMPEONATO
       ADD CONSTRAINT UCAMPEONATO_CAMPEONATO_FK
              FOREIGN KEY (CODIGOCAMPEONATO)
                             REFERENCES CAMPEONATO
go


ALTER TABLE USUARIOCAMPEONATO
       ADD CONSTRAINT UCAMPEONATO_USUARIO_FK
              FOREIGN KEY (CODIGOUSUARIO)
                             REFERENCES USUARIO
go


ALTER TABLE USUARIOGRUPOTIME
       ADD CONSTRAINT UGTIME_USUARIO_FK
              FOREIGN KEY (CODIGOUSUARIO)
                             REFERENCES USUARIO
go


ALTER TABLE USUARIOGRUPOTIME
       ADD CONSTRAINT UGTIME_GTIME_FK
              FOREIGN KEY (CODIGOCAMPEONATO, CODIGOGRUPO, CODIGOTIME)
                             REFERENCES GRUPOTIME
go


ALTER TABLE USUARIOJOGO
       ADD CONSTRAINT UJOGO_USUARIO_FK
              FOREIGN KEY (CODIGOUSUARIO)
                             REFERENCES USUARIO
go


ALTER TABLE USUARIOJOGO
       ADD CONSTRAINT UJOGO_TIME2_FK
              FOREIGN KEY (CODIGOTIME2)
                             REFERENCES TIME
go


ALTER TABLE USUARIOJOGO
       ADD CONSTRAINT UJOGO_TIME1_FK
              FOREIGN KEY (CODIGOTIME1)
                             REFERENCES TIME
go


ALTER TABLE USUARIOJOGO
       ADD CONSTRAINT UJOGO_JOGO_FK
              FOREIGN KEY (CODIGOCAMPEONATO, CODIGOJOGO)
                             REFERENCES JOGO
go


-- CRITERIODESEMPATE
INSERT INTO CRITERIODESEMPATE (CRITERIODESEMPATE, DESCRICAOCRITERIODESEMPATE) VALUES (1, 'Saldo de gols');
INSERT INTO CRITERIODESEMPATE (CRITERIODESEMPATE, DESCRICAOCRITERIODESEMPATE) VALUES (2, 'Gols marcados');
INSERT INTO CRITERIODESEMPATE (CRITERIODESEMPATE, DESCRICAOCRITERIODESEMPATE) VALUES (3, 'Confronto direto');


-- TIPOFASE
INSERT INTO TIPOFASE (TIPOFASE, DESCRICAOTIPOFASE) VALUES (1, 'Fase de grupos');
INSERT INTO TIPOFASE (TIPOFASE, DESCRICAOTIPOFASE) VALUES (2, 'Mata-mata');


-- TIPOREGRA
INSERT INTO TIPOREGRA (TIPOREGRA, DESCRICAOTIPOREGRA) VALUES (1, 'Posição no grupo');
INSERT INTO TIPOREGRA (TIPOREGRA, DESCRICAOTIPOREGRA) VALUES (2, 'Vencedor do jogo');
INSERT INTO TIPOREGRA (TIPOREGRA, DESCRICAOTIPOREGRA) VALUES (3, 'Perdedor do jogo');


-- spSysAtualizarClassificacao
IF (EXISTS (SELECT 1 FROM sys.objects WHERE name = 'spSysAtualizarClassificacao'))
DROP PROCEDURE [dbo].[spSysAtualizarClassificacao]
GO
CREATE PROCEDURE [dbo].[spSysAtualizarClassificacao]
(
   @CodigoCampeonato NUMERIC(10),
   @CodigoGrupo      NUMERIC(10),
   @CodigoFase       NUMERIC(10)
)
AS
BEGIN
   DECLARE @CodigoTime NUMERIC(10)
   
   DECLARE @ClassificacaoTime NUMERIC(10)
   SET @ClassificacaoTime = 1
   
   DECLARE cClass CURSOR FOR
    SELECT C.CODIGOTIME
      FROM (SELECT C.CODIGOTIME,
                   C.PG,
                   SUM(CASE WHEN CCD.CRITERIODESEMPATE = 1 THEN (C.GP - C.GC) * CCD.PESOCRITERIODESEMPATE
                            WHEN CCD.CRITERIODESEMPATE = 2 THEN C.GP * CCD.PESOCRITERIODESEMPATE
                       END) AS DESEMPATE,
                   C.ORDEMTIME
              FROM (SELECT GT.CODIGOTIME,
                           SUM(CASE WHEN J.CODIGOTIME1 = GT.CODIGOTIME THEN CASE WHEN (J.TOTALGOL1 IS NULL) OR (J.TOTALGOL2 IS NULL) THEN 0
                                                                                 WHEN J.TOTALGOL1 > J.TOTALGOL2 THEN C.PONTUACAOVITORIA
                                                                                 WHEN J.TOTALGOL1 < J.TOTALGOL2 THEN C.PONTUACAODERROTA
                                                                                 ELSE C.PONTUACAOEMPATE
                                                                            END
                                    ELSE CASE WHEN (J.TOTALGOL1 IS NULL) OR (J.TOTALGOL2 IS NULL) THEN 0
                                              WHEN J.TOTALGOL2 > J.TOTALGOL1 THEN C.PONTUACAOVITORIA
                                              WHEN J.TOTALGOL2 < J.TOTALGOL1 THEN C.PONTUACAODERROTA
                                              ELSE C.PONTUACAOEMPATE
                                         END
                               END) AS PG,
                           SUM(CASE WHEN J.CODIGOTIME1 = GT.CODIGOTIME THEN COALESCE(J.TOTALGOL1, 0)
                                    ELSE COALESCE(J.TOTALGOL2, 0)
                               END) AS GP,
                           SUM(CASE WHEN J.CODIGOTIME1 = GT.CODIGOTIME THEN COALESCE(J.TOTALGOL2, 0)
                                    ELSE COALESCE(J.TOTALGOL1, 0)
                               END) AS GC,
                           GT.ORDEMTIME
                      FROM CAMPEONATO C INNER JOIN
                           GRUPOTIME GT ON (GT.CODIGOCAMPEONATO = C.CODIGOCAMPEONATO) INNER JOIN
                           GRUPO G ON (G.CODIGOCAMPEONATO = GT.CODIGOCAMPEONATO AND
                                       G.CODIGOGRUPO = GT.CODIGOGRUPO) INNER JOIN
                           JOGO J ON (J.CODIGOCAMPEONATO = GT.CODIGOCAMPEONATO AND
                                      ((J.CODIGOTIME1 = GT.CODIGOTIME) OR (J.CODIGOTIME2 = GT.CODIGOTIME)))
                     WHERE C.CODIGOCAMPEONATO = @CodigoCampeonato
                       AND GT.CODIGOGRUPO = @CodigoGrupo
                       AND J.CODIGOFASE = @CodigoFase
                     GROUP BY GT.CODIGOTIME,
                           GT.ORDEMTIME) C LEFT OUTER JOIN
                   CAMPEONATOCRITERIODESEMPATE CCD ON (CCD.CODIGOCAMPEONATO = @CodigoCampeonato)
             GROUP BY C.CODIGOTIME,
                   C.PG,
                   C.GP,
                   C.GC,
                   C.ORDEMTIME) C
     ORDER BY C.PG DESC,
           C.DESEMPATE DESC,
           C.ORDEMTIME
   
   OPEN cClass
   FETCH NEXT FROM cClass INTO @CodigoTime
   
   WHILE (@@FETCH_STATUS = 0)
    BEGIN
      UPDATE GRUPOTIME SET
             CLASSIFICACAOTIME = @ClassificacaoTime
       WHERE CODIGOCAMPEONATO = @CodigoCampeonato
         AND CODIGOGRUPO = @CodigoGrupo
         AND CODIGOTIME = @CodigoTime
      
      FETCH NEXT FROM cClass INTO @CodigoTime
      
      SET @ClassificacaoTime = @ClassificacaoTime + 1
    END
   
   CLOSE cClass
   DEALLOCATE cClass
   
   UPDATE JOGO SET
          CODIGOTIME1 = (SELECT GT.CODIGOTIME
                           FROM GRUPOTIME GT
                          WHERE GT.CODIGOCAMPEONATO = R.CODIGOCAMPEONATO
                            AND GT.CODIGOGRUPO = R.CODIGOGRUPO
                            AND GT.CLASSIFICACAOTIME = R.CLASSIFICACAOTIME
                            AND NOT EXISTS (SELECT 1
                                              FROM JOGO J INNER JOIN
                                                   GRUPOTIME GT ON (GT.CODIGOCAMPEONATO = J.CODIGOCAMPEONATO AND
                                                                    GT.CODIGOGRUPO = @CodigoGrupo AND
                                                                    GT.CODIGOTIME IN (J.CODIGOTIME1, J.CODIGOTIME2))
                                             WHERE J.CODIGOCAMPEONATO = @CodigoCampeonato
                                               AND J.CODIGOFASE = @CodigoFase
                                               AND ((J.TOTALGOL1 IS NULL) OR (J.TOTALGOL2 IS NULL))))
     FROM REGRA R
    WHERE JOGO.CODIGOCAMPEONATO = @CodigoCampeonato
      AND R.CODIGOCAMPEONATO = JOGO.CODIGOCAMPEONATO
      AND R.CODIGOREGRA = JOGO.CODIGOREGRA1
      AND R.TIPOREGRA = 1
      AND R.CODIGOGRUPO = @CodigoGrupo
   
   UPDATE JOGO SET
          CODIGOTIME2 = (SELECT GT.CODIGOTIME
                           FROM GRUPOTIME GT
                          WHERE GT.CODIGOCAMPEONATO = R.CODIGOCAMPEONATO
                            AND GT.CODIGOGRUPO = R.CODIGOGRUPO
                            AND GT.CLASSIFICACAOTIME = R.CLASSIFICACAOTIME
                            AND NOT EXISTS (SELECT 1
                                              FROM JOGO J INNER JOIN
                                                   GRUPOTIME GT ON (GT.CODIGOCAMPEONATO = J.CODIGOCAMPEONATO AND
                                                                    GT.CODIGOGRUPO = @CodigoGrupo AND
                                                                    GT.CODIGOTIME IN (J.CODIGOTIME1, J.CODIGOTIME2))
                                             WHERE J.CODIGOCAMPEONATO = @CodigoCampeonato
                                               AND J.CODIGOFASE = @CodigoFase
                                               AND ((J.TOTALGOL1 IS NULL) OR (J.TOTALGOL2 IS NULL))))
     FROM REGRA R
    WHERE JOGO.CODIGOCAMPEONATO = @CodigoCampeonato
      AND R.CODIGOCAMPEONATO = JOGO.CODIGOCAMPEONATO
      AND R.CODIGOREGRA = JOGO.CODIGOREGRA2
      AND R.TIPOREGRA = 1
      AND R.CODIGOGRUPO = @CodigoGrupo
END
GO


-- spSysAtualizarMataMata
IF (EXISTS (SELECT 1 FROM sys.objects WHERE name = 'spSysAtualizarMataMata'))
DROP PROCEDURE [dbo].[spSysAtualizarMataMata]
GO
CREATE PROCEDURE [dbo].[spSysAtualizarMataMata]
(
   @CodigoCampeonato NUMERIC(10),
   @CodigoJogo       NUMERIC(10)
)
AS
BEGIN
   UPDATE JOGO SET
          CODIGOTIME1 = CASE WHEN RJ.TOTALGOL1 > RJ.TOTALGOL2 THEN RJ.CODIGOTIME1
                             WHEN RJ.TOTALGOL2 > RJ.TOTALGOL1 THEN RJ.CODIGOTIME2
                             ELSE NULL
                        END
     FROM (SELECT R.CODIGOCAMPEONATO,
                  R.CODIGOREGRA,
                  J.CODIGOTIME1,
                  J.TOTALGOL1,
                  J.TOTALGOL2,
                  J.CODIGOTIME2
             FROM REGRA R,
                  JOGO J
            WHERE R.TIPOREGRA = 2
              AND R.CODIGOJOGO = @CodigoJogo
              AND J.CODIGOCAMPEONATO = R.CODIGOCAMPEONATO
              AND J.CODIGOJOGO = R.CODIGOJOGO) RJ
    WHERE JOGO.CODIGOCAMPEONATO = @CodigoCampeonato
      AND RJ.CODIGOCAMPEONATO = JOGO.CODIGOCAMPEONATO
      AND RJ.CODIGOREGRA = JOGO.CODIGOREGRA1
   
   UPDATE JOGO SET
          CODIGOTIME1 = CASE WHEN RJ.TOTALGOL1 < RJ.TOTALGOL2 THEN RJ.CODIGOTIME1
                             WHEN RJ.TOTALGOL2 < RJ.TOTALGOL1 THEN RJ.CODIGOTIME2
                             ELSE NULL
                        END
     FROM (SELECT R.CODIGOCAMPEONATO,
                  R.CODIGOREGRA,
                  J.CODIGOTIME1,
                  J.TOTALGOL1,
                  J.TOTALGOL2,
                  J.CODIGOTIME2
             FROM REGRA R,
                  JOGO J
            WHERE R.TIPOREGRA = 3
              AND R.CODIGOJOGO = @CodigoJogo
              AND J.CODIGOCAMPEONATO = R.CODIGOCAMPEONATO
              AND J.CODIGOJOGO = R.CODIGOJOGO) RJ
    WHERE JOGO.CODIGOCAMPEONATO = @CodigoCampeonato
      AND RJ.CODIGOCAMPEONATO = JOGO.CODIGOCAMPEONATO
      AND RJ.CODIGOREGRA = JOGO.CODIGOREGRA1
   
   UPDATE JOGO SET
          CODIGOTIME2 = CASE WHEN RJ.TOTALGOL1 > RJ.TOTALGOL2 THEN RJ.CODIGOTIME1
                             WHEN RJ.TOTALGOL2 > RJ.TOTALGOL1 THEN RJ.CODIGOTIME2
                             ELSE NULL
                        END
     FROM (SELECT R.CODIGOCAMPEONATO,
                  R.CODIGOREGRA,
                  J.CODIGOTIME1,
                  J.TOTALGOL1,
                  J.TOTALGOL2,
                  J.CODIGOTIME2
             FROM REGRA R,
                  JOGO J
            WHERE R.TIPOREGRA = 2
              AND R.CODIGOJOGO = @CodigoJogo
              AND J.CODIGOCAMPEONATO = R.CODIGOCAMPEONATO
              AND J.CODIGOJOGO = R.CODIGOJOGO) RJ
    WHERE JOGO.CODIGOCAMPEONATO = @CodigoCampeonato
      AND RJ.CODIGOCAMPEONATO = JOGO.CODIGOCAMPEONATO
      AND RJ.CODIGOREGRA = JOGO.CODIGOREGRA2
   
   UPDATE JOGO SET
          CODIGOTIME2 = CASE WHEN RJ.TOTALGOL1 < RJ.TOTALGOL2 THEN RJ.CODIGOTIME1
                             WHEN RJ.TOTALGOL2 < RJ.TOTALGOL1 THEN RJ.CODIGOTIME2
                             ELSE NULL
                        END
     FROM (SELECT R.CODIGOCAMPEONATO,
                  R.CODIGOREGRA,
                  J.CODIGOTIME1,
                  J.TOTALGOL1,
                  J.TOTALGOL2,
                  J.CODIGOTIME2
             FROM REGRA R,
                  JOGO J
            WHERE R.TIPOREGRA = 3
              AND R.CODIGOJOGO = @CodigoJogo
              AND J.CODIGOCAMPEONATO = R.CODIGOCAMPEONATO
              AND J.CODIGOJOGO = R.CODIGOJOGO) RJ
    WHERE JOGO.CODIGOCAMPEONATO = @CodigoCampeonato
      AND RJ.CODIGOCAMPEONATO = JOGO.CODIGOCAMPEONATO
      AND RJ.CODIGOREGRA = JOGO.CODIGOREGRA2
END
GO


-- spSysAtualizarClassificacaoU
IF (EXISTS (SELECT 1 FROM sys.objects WHERE name = 'spSysAtualizarClassificacaoU'))
DROP PROCEDURE [dbo].[spSysAtualizarClassificacaoU]
GO
CREATE PROCEDURE [dbo].[spSysAtualizarClassificacaoU]
(
   @CodigoUsuario    VARCHAR(256),
   @CodigoCampeonato NUMERIC(10),
   @CodigoGrupo      NUMERIC(10),
   @CodigoFase       NUMERIC(10)
)
AS
BEGIN
   DECLARE @CodigoTime NUMERIC(10)
   
   DECLARE @ClassificacaoTime NUMERIC(10)
   SET @ClassificacaoTime = 1
   
   DECLARE cClass CURSOR FOR
    SELECT C.CODIGOTIME
      FROM (SELECT C.CODIGOTIME,
                   C.PG,
                   SUM(CASE WHEN CCD.CRITERIODESEMPATE = 1 THEN (C.GP - C.GC) * CCD.PESOCRITERIODESEMPATE
                            WHEN CCD.CRITERIODESEMPATE = 2 THEN C.GP * CCD.PESOCRITERIODESEMPATE
                       END) AS DESEMPATE,
                   C.ORDEMTIME
              FROM (SELECT UGT.CODIGOTIME,
                           SUM(CASE WHEN UJ.CODIGOTIME1 = UGT.CODIGOTIME THEN CASE WHEN (UJ.TOTALGOL1 IS NULL) OR (UJ.TOTALGOL2 IS NULL) THEN 0
                                                                                   WHEN UJ.TOTALGOL1 > UJ.TOTALGOL2 THEN C.PONTUACAOVITORIA
                                                                                   WHEN UJ.TOTALGOL1 < UJ.TOTALGOL2 THEN C.PONTUACAODERROTA
                                                                                   ELSE C.PONTUACAOEMPATE
                                                                              END
                                    ELSE CASE WHEN (UJ.TOTALGOL1 IS NULL) OR (UJ.TOTALGOL2 IS NULL) THEN 0
                                              WHEN UJ.TOTALGOL2 > UJ.TOTALGOL1 THEN C.PONTUACAOVITORIA
                                              WHEN UJ.TOTALGOL2 < UJ.TOTALGOL1 THEN C.PONTUACAODERROTA
                                              ELSE C.PONTUACAOEMPATE
                                         END
                               END) AS PG,
                           SUM(CASE WHEN UJ.CODIGOTIME1 = UGT.CODIGOTIME THEN COALESCE(UJ.TOTALGOL1, 0)
                                    ELSE COALESCE(UJ.TOTALGOL2, 0)
                               END) AS GP,
                           SUM(CASE WHEN UJ.CODIGOTIME1 = UGT.CODIGOTIME THEN COALESCE(UJ.TOTALGOL2, 0)
                                    ELSE COALESCE(UJ.TOTALGOL1, 0)
                               END) AS GC,
                           GT.ORDEMTIME
                      FROM CAMPEONATO C INNER JOIN
                           USUARIOGRUPOTIME UGT ON (UGT.CODIGOUSUARIO = @CodigoUsuario AND
                                                    UGT.CODIGOCAMPEONATO = C.CODIGOCAMPEONATO) INNER JOIN
                           GRUPOTIME GT ON (GT.CODIGOCAMPEONATO = UGT.CODIGOCAMPEONATO AND
                                            GT.CODIGOGRUPO = UGT.CODIGOGRUPO AND
                                            GT.CODIGOTIME = UGT.CODIGOTIME) INNER JOIN
                           GRUPO G ON (G.CODIGOCAMPEONATO = UGT.CODIGOCAMPEONATO AND
                                       G.CODIGOGRUPO = UGT.CODIGOGRUPO) INNER JOIN
                           USUARIOJOGO UJ ON (UJ.CODIGOCAMPEONATO = UGT.CODIGOCAMPEONATO AND
                                              ((UJ.CODIGOTIME1 = UGT.CODIGOTIME) OR (UJ.CODIGOTIME2 = UGT.CODIGOTIME))) INNER JOIN
                           JOGO J ON (J.CODIGOCAMPEONATO = UJ.CODIGOCAMPEONATO AND
                                      J.CODIGOJOGO = UJ.CODIGOJOGO)
                     WHERE C.CODIGOCAMPEONATO = @CodigoCampeonato
                       AND UGT.CODIGOGRUPO = @CodigoGrupo
                       AND J.CODIGOFASE = @CodigoFase
                     GROUP BY UGT.CODIGOTIME,
                           GT.ORDEMTIME) C LEFT OUTER JOIN
                   CAMPEONATOCRITERIODESEMPATE CCD ON (CCD.CODIGOCAMPEONATO = @CodigoCampeonato)
             GROUP BY C.CODIGOTIME,
                   C.PG,
                   C.GP,
                   C.GC,
                   C.ORDEMTIME) C
     ORDER BY C.PG DESC,
           C.DESEMPATE DESC,
           C.ORDEMTIME
   
   OPEN cClass
   FETCH NEXT FROM cClass INTO @CodigoTime
   
   WHILE (@@FETCH_STATUS = 0)
    BEGIN
      UPDATE USUARIOGRUPOTIME SET
             CLASSIFICACAOTIME = @ClassificacaoTime
       WHERE CODIGOUSUARIO = @CodigoUsuario
         AND CODIGOCAMPEONATO = @CodigoCampeonato
         AND CODIGOGRUPO = @CodigoGrupo
         AND CODIGOTIME = @CodigoTime
      
      FETCH NEXT FROM cClass INTO @CodigoTime
      
      SET @ClassificacaoTime = @ClassificacaoTime + 1
    END
   
   CLOSE cClass
   DEALLOCATE cClass
   
   UPDATE USUARIOJOGO SET
          CODIGOTIME1 = (SELECT UGT.CODIGOTIME
                           FROM USUARIOGRUPOTIME UGT
                          WHERE UGT.CODIGOUSUARIO = @CodigoUsuario
                            AND UGT.CODIGOCAMPEONATO = R.CODIGOCAMPEONATO
                            AND UGT.CODIGOGRUPO = R.CODIGOGRUPO
                            AND UGT.CLASSIFICACAOTIME = R.CLASSIFICACAOTIME
                            AND NOT EXISTS (SELECT 1
                                              FROM USUARIOJOGO UJ INNER JOIN
                                                   JOGO J ON (J.CODIGOCAMPEONATO = UJ.CODIGOCAMPEONATO AND
                                                              J.CODIGOJOGO = UJ.CODIGOJOGO) INNER JOIN
                                                   GRUPOTIME GT ON (GT.CODIGOCAMPEONATO = UJ.CODIGOCAMPEONATO AND
                                                                    GT.CODIGOGRUPO = @CodigoGrupo AND
                                                                    GT.CODIGOTIME IN (UJ.CODIGOTIME1, UJ.CODIGOTIME2))
                                             WHERE UJ.CODIGOUSUARIO = @CodigoUsuario
                                               AND UJ.CODIGOCAMPEONATO = @CodigoCampeonato
                                               AND J.CODIGOFASE = @CodigoFase
                                               AND ((UJ.TOTALGOL1 IS NULL) OR (UJ.TOTALGOL2 IS NULL))))
     FROM (SELECT J.CODIGOCAMPEONATO,
                  J.CODIGOJOGO,
                  R.CODIGOGRUPO,
                  R.CLASSIFICACAOTIME
             FROM JOGO J INNER JOIN
                  REGRA R ON (R.CODIGOCAMPEONATO = J.CODIGOCAMPEONATO AND
                              R.CODIGOREGRA = J.CODIGOREGRA1)
            WHERE J.CODIGOCAMPEONATO = @CodigoCampeonato
              AND R.TIPOREGRA = 1
              AND R.CODIGOGRUPO = @CodigoGrupo
              AND R.CODIGOREGRA = J.CODIGOREGRA1) R
    WHERE USUARIOJOGO.CODIGOCAMPEONATO = @CodigoCampeonato
      AND R.CODIGOCAMPEONATO = USUARIOJOGO.CODIGOCAMPEONATO
      AND R.CODIGOJOGO = USUARIOJOGO.CODIGOJOGO
   
   UPDATE USUARIOJOGO SET
          CODIGOTIME2 = (SELECT UGT.CODIGOTIME
                           FROM USUARIOGRUPOTIME UGT
                          WHERE UGT.CODIGOUSUARIO = @CodigoUsuario
                            AND UGT.CODIGOCAMPEONATO = R.CODIGOCAMPEONATO
                            AND UGT.CODIGOGRUPO = R.CODIGOGRUPO
                            AND UGT.CLASSIFICACAOTIME = R.CLASSIFICACAOTIME
                            AND NOT EXISTS (SELECT 1
                                              FROM USUARIOJOGO UJ INNER JOIN
                                                   JOGO J ON (J.CODIGOCAMPEONATO = UJ.CODIGOCAMPEONATO AND
                                                              J.CODIGOJOGO = UJ.CODIGOJOGO) INNER JOIN
                                                   GRUPOTIME GT ON (GT.CODIGOCAMPEONATO = UJ.CODIGOCAMPEONATO AND
                                                                    GT.CODIGOGRUPO = @CodigoGrupo AND
                                                                    GT.CODIGOTIME IN (UJ.CODIGOTIME1, UJ.CODIGOTIME2))
                                             WHERE UJ.CODIGOUSUARIO = @CodigoUsuario
                                               AND UJ.CODIGOCAMPEONATO = @CodigoCampeonato
                                               AND J.CODIGOFASE = @CodigoFase
                                               AND ((UJ.TOTALGOL1 IS NULL) OR (UJ.TOTALGOL2 IS NULL))))
     FROM (SELECT J.CODIGOCAMPEONATO,
                  J.CODIGOJOGO,
                  R.CODIGOGRUPO,
                  R.CLASSIFICACAOTIME
             FROM JOGO J INNER JOIN
                  REGRA R ON (R.CODIGOCAMPEONATO = J.CODIGOCAMPEONATO AND
                              R.CODIGOREGRA = J.CODIGOREGRA2)
            WHERE J.CODIGOCAMPEONATO = @CodigoCampeonato
              AND R.TIPOREGRA = 1
              AND R.CODIGOGRUPO = @CodigoGrupo
              AND R.CODIGOREGRA = J.CODIGOREGRA2) R
    WHERE USUARIOJOGO.CODIGOCAMPEONATO = @CodigoCampeonato
      AND R.CODIGOCAMPEONATO = USUARIOJOGO.CODIGOCAMPEONATO
      AND R.CODIGOJOGO = USUARIOJOGO.CODIGOJOGO
END
GO


-- spSysAtualizarMataMataU
IF (EXISTS (SELECT 1 FROM sys.objects WHERE name = 'spSysAtualizarMataMataU'))
DROP PROCEDURE [dbo].[spSysAtualizarMataMataU]
GO
CREATE PROCEDURE [dbo].[spSysAtualizarMataMataU]
(
   @CodigoUsuario    VARCHAR(256),
   @CodigoCampeonato NUMERIC(10),
   @CodigoJogo       NUMERIC(10)
)
AS
BEGIN
   UPDATE USUARIOJOGO SET
          CODIGOTIME1 = CASE WHEN RJ.TOTALGOL1 > RJ.TOTALGOL2 THEN RJ.CODIGOTIME1
                             WHEN RJ.TOTALGOL2 > RJ.TOTALGOL1 THEN RJ.CODIGOTIME2
                             ELSE NULL
                        END
     FROM (SELECT J.CODIGOCAMPEONATO,
                  J.CODIGOJOGO,
                  UJ.CODIGOTIME1,
                  UJ.TOTALGOL1,
                  UJ.TOTALGOL2,
                  UJ.CODIGOTIME2
             FROM JOGO J,
                  REGRA R,
                  USUARIOJOGO UJ
            WHERE R.CODIGOCAMPEONATO = J.CODIGOCAMPEONATO
              AND R.CODIGOREGRA = J.CODIGOREGRA1
              AND R.TIPOREGRA = 2
              AND R.CODIGOJOGO = @CodigoJogo
              AND UJ.CODIGOUSUARIO = @CodigoUsuario
              AND UJ.CODIGOCAMPEONATO = R.CODIGOCAMPEONATO
              AND UJ.CODIGOJOGO = R.CODIGOJOGO) RJ
    WHERE USUARIOJOGO.CODIGOUSUARIO = @CodigoUsuario
      AND USUARIOJOGO.CODIGOCAMPEONATO = @CodigoCampeonato
      AND RJ.CODIGOCAMPEONATO = USUARIOJOGO.CODIGOCAMPEONATO
      AND RJ.CODIGOJOGO = USUARIOJOGO.CODIGOJOGO
   
   UPDATE USUARIOJOGO SET
          CODIGOTIME1 = CASE WHEN RJ.TOTALGOL1 < RJ.TOTALGOL2 THEN RJ.CODIGOTIME1
                             WHEN RJ.TOTALGOL2 < RJ.TOTALGOL1 THEN RJ.CODIGOTIME2
                             ELSE NULL
                        END
     FROM (SELECT J.CODIGOCAMPEONATO,
                  J.CODIGOJOGO,
                  UJ.CODIGOTIME1,
                  UJ.TOTALGOL1,
                  UJ.TOTALGOL2,
                  UJ.CODIGOTIME2
             FROM JOGO J,
                  REGRA R,
                  USUARIOJOGO UJ
            WHERE R.CODIGOCAMPEONATO = J.CODIGOCAMPEONATO
              AND R.CODIGOREGRA = J.CODIGOREGRA1
              AND R.TIPOREGRA = 3
              AND R.CODIGOJOGO = @CodigoJogo
              AND UJ.CODIGOUSUARIO = @CodigoUsuario
              AND UJ.CODIGOCAMPEONATO = R.CODIGOCAMPEONATO
              AND UJ.CODIGOJOGO = R.CODIGOJOGO) RJ
    WHERE USUARIOJOGO.CODIGOUSUARIO = @CodigoUsuario
      AND USUARIOJOGO.CODIGOCAMPEONATO = @CodigoCampeonato
      AND RJ.CODIGOCAMPEONATO = USUARIOJOGO.CODIGOCAMPEONATO
      AND RJ.CODIGOJOGO = USUARIOJOGO.CODIGOJOGO
   
   UPDATE USUARIOJOGO SET
          CODIGOTIME2 = CASE WHEN RJ.TOTALGOL1 > RJ.TOTALGOL2 THEN RJ.CODIGOTIME1
                             WHEN RJ.TOTALGOL2 > RJ.TOTALGOL1 THEN RJ.CODIGOTIME2
                             ELSE NULL
                        END
     FROM (SELECT J.CODIGOCAMPEONATO,
                  J.CODIGOJOGO,
                  UJ.CODIGOTIME1,
                  UJ.TOTALGOL1,
                  UJ.TOTALGOL2,
                  UJ.CODIGOTIME2
             FROM JOGO J,
                  REGRA R,
                  USUARIOJOGO UJ
            WHERE R.CODIGOCAMPEONATO = J.CODIGOCAMPEONATO
              AND R.CODIGOREGRA = J.CODIGOREGRA2
              AND R.TIPOREGRA = 2
              AND R.CODIGOJOGO = @CodigoJogo
              AND UJ.CODIGOUSUARIO = @CodigoUsuario
              AND UJ.CODIGOCAMPEONATO = R.CODIGOCAMPEONATO
              AND UJ.CODIGOJOGO = R.CODIGOJOGO) RJ
    WHERE USUARIOJOGO.CODIGOUSUARIO = @CodigoUsuario
      AND USUARIOJOGO.CODIGOCAMPEONATO = @CodigoCampeonato
      AND RJ.CODIGOCAMPEONATO = USUARIOJOGO.CODIGOCAMPEONATO
      AND RJ.CODIGOJOGO = USUARIOJOGO.CODIGOJOGO
   
   UPDATE USUARIOJOGO SET
          CODIGOTIME2 = CASE WHEN RJ.TOTALGOL1 < RJ.TOTALGOL2 THEN RJ.CODIGOTIME1
                             WHEN RJ.TOTALGOL2 < RJ.TOTALGOL1 THEN RJ.CODIGOTIME2
                             ELSE NULL
                        END
     FROM (SELECT J.CODIGOCAMPEONATO,
                  J.CODIGOJOGO,
                  UJ.CODIGOTIME1,
                  UJ.TOTALGOL1,
                  UJ.TOTALGOL2,
                  UJ.CODIGOTIME2
             FROM JOGO J,
                  REGRA R,
                  USUARIOJOGO UJ
            WHERE R.CODIGOCAMPEONATO = J.CODIGOCAMPEONATO
              AND R.CODIGOREGRA = J.CODIGOREGRA2
              AND R.TIPOREGRA = 3
              AND R.CODIGOJOGO = @CodigoJogo
              AND UJ.CODIGOUSUARIO = @CodigoUsuario
              AND UJ.CODIGOCAMPEONATO = R.CODIGOCAMPEONATO
              AND UJ.CODIGOJOGO = R.CODIGOJOGO) RJ
    WHERE USUARIOJOGO.CODIGOUSUARIO = @CodigoUsuario
      AND USUARIOJOGO.CODIGOCAMPEONATO = @CodigoCampeonato
      AND RJ.CODIGOCAMPEONATO = USUARIOJOGO.CODIGOCAMPEONATO
      AND RJ.CODIGOJOGO = USUARIOJOGO.CODIGOJOGO
END
GO


-- spSysAtualizarClassificacaoU
IF (EXISTS (SELECT 1 FROM sys.objects WHERE name = 'spSysAtualizarClassificacaoU'))
DROP PROCEDURE [dbo].[spSysAtualizarClassificacaoU]
GO
CREATE PROCEDURE [dbo].[spSysAtualizarClassificacaoU]
(
   @CodigoUsuario    VARCHAR(256),
   @CodigoCampeonato NUMERIC(10),
   @CodigoGrupo      NUMERIC(10),
   @CodigoFase       NUMERIC(10)
)
AS
BEGIN
   DECLARE @CodigoTime NUMERIC(10)
   
   DECLARE @ClassificacaoTime NUMERIC(10)
   SET @ClassificacaoTime = 1
   
   DECLARE cClass CURSOR FOR
    SELECT C.CODIGOTIME
      FROM (SELECT C.CODIGOTIME,
                   C.PG,
                   SUM(CASE WHEN CCD.CRITERIODESEMPATE = 1 THEN (C.GP - C.GC) * CCD.PESOCRITERIODESEMPATE
                            WHEN CCD.CRITERIODESEMPATE = 2 THEN C.GP * CCD.PESOCRITERIODESEMPATE
                       END) AS DESEMPATE,
                   C.ORDEMTIME
              FROM (SELECT UGT.CODIGOTIME,
                           SUM(CASE WHEN UJ.CODIGOTIME1 = UGT.CODIGOTIME THEN CASE WHEN (UJ.TOTALGOL1 IS NULL) OR (UJ.TOTALGOL2 IS NULL) THEN 0
                                                                                   WHEN UJ.TOTALGOL1 > UJ.TOTALGOL2 THEN C.PONTUACAOVITORIA
                                                                                   WHEN UJ.TOTALGOL1 < UJ.TOTALGOL2 THEN C.PONTUACAODERROTA
                                                                                   ELSE C.PONTUACAOEMPATE
                                                                              END
                                    ELSE CASE WHEN (UJ.TOTALGOL1 IS NULL) OR (UJ.TOTALGOL2 IS NULL) THEN 0
                                              WHEN UJ.TOTALGOL2 > UJ.TOTALGOL1 THEN C.PONTUACAOVITORIA
                                              WHEN UJ.TOTALGOL2 < UJ.TOTALGOL1 THEN C.PONTUACAODERROTA
                                              ELSE C.PONTUACAOEMPATE
                                         END
                               END) AS PG,
                           SUM(CASE WHEN UJ.CODIGOTIME1 = UGT.CODIGOTIME THEN COALESCE(UJ.TOTALGOL1, 0)
                                    ELSE COALESCE(UJ.TOTALGOL2, 0)
                               END) AS GP,
                           SUM(CASE WHEN UJ.CODIGOTIME1 = UGT.CODIGOTIME THEN COALESCE(UJ.TOTALGOL2, 0)
                                    ELSE COALESCE(UJ.TOTALGOL1, 0)
                               END) AS GC,
                           GT.ORDEMTIME
                      FROM CAMPEONATO C INNER JOIN
                           USUARIOGRUPOTIME UGT ON (UGT.CODIGOUSUARIO = @CodigoUsuario AND
                                                    UGT.CODIGOCAMPEONATO = C.CODIGOCAMPEONATO) INNER JOIN
                           GRUPOTIME GT ON (GT.CODIGOCAMPEONATO = UGT.CODIGOCAMPEONATO AND
                                            GT.CODIGOGRUPO = UGT.CODIGOGRUPO AND
                                            GT.CODIGOTIME = UGT.CODIGOTIME) INNER JOIN
                           GRUPO G ON (G.CODIGOCAMPEONATO = UGT.CODIGOCAMPEONATO AND
                                       G.CODIGOGRUPO = UGT.CODIGOGRUPO) INNER JOIN
                           USUARIOJOGO UJ ON (UJ.CODIGOUSUARIO = UGT.CODIGOUSUARIO AND
                                              UJ.CODIGOCAMPEONATO = UGT.CODIGOCAMPEONATO AND
                                              ((UJ.CODIGOTIME1 = UGT.CODIGOTIME) OR (UJ.CODIGOTIME2 = UGT.CODIGOTIME))) INNER JOIN
                           JOGO J ON (J.CODIGOCAMPEONATO = UJ.CODIGOCAMPEONATO AND
                                      J.CODIGOJOGO = UJ.CODIGOJOGO)
                     WHERE C.CODIGOCAMPEONATO = @CodigoCampeonato
                       AND UGT.CODIGOGRUPO = @CodigoGrupo
                       AND J.CODIGOFASE = @CodigoFase
                     GROUP BY UGT.CODIGOTIME,
                           GT.ORDEMTIME) C LEFT OUTER JOIN
                   CAMPEONATOCRITERIODESEMPATE CCD ON (CCD.CODIGOCAMPEONATO = @CodigoCampeonato)
             GROUP BY C.CODIGOTIME,
                   C.PG,
                   C.GP,
                   C.GC,
                   C.ORDEMTIME) C
     ORDER BY C.PG DESC,
           C.DESEMPATE DESC,
           C.ORDEMTIME
   
   OPEN cClass
   FETCH NEXT FROM cClass INTO @CodigoTime
   
   WHILE (@@FETCH_STATUS = 0)
    BEGIN
      UPDATE USUARIOGRUPOTIME SET
             CLASSIFICACAOTIME = @ClassificacaoTime
       WHERE CODIGOUSUARIO = @CodigoUsuario
         AND CODIGOCAMPEONATO = @CodigoCampeonato
         AND CODIGOGRUPO = @CodigoGrupo
         AND CODIGOTIME = @CodigoTime
      
      FETCH NEXT FROM cClass INTO @CodigoTime
      
      SET @ClassificacaoTime = @ClassificacaoTime + 1
    END
   
   CLOSE cClass
   DEALLOCATE cClass
   
   UPDATE USUARIOJOGO SET
          CODIGOTIME1 = (SELECT UGT.CODIGOTIME
                           FROM USUARIOGRUPOTIME UGT
                          WHERE UGT.CODIGOUSUARIO = @CodigoUsuario
                            AND UGT.CODIGOCAMPEONATO = R.CODIGOCAMPEONATO
                            AND UGT.CODIGOGRUPO = R.CODIGOGRUPO
                            AND UGT.CLASSIFICACAOTIME = R.CLASSIFICACAOTIME
                            AND NOT EXISTS (SELECT 1
                                              FROM USUARIOJOGO UJ INNER JOIN
                                                   JOGO J ON (J.CODIGOCAMPEONATO = UJ.CODIGOCAMPEONATO AND
                                                              J.CODIGOJOGO = UJ.CODIGOJOGO) INNER JOIN
                                                   GRUPOTIME GT ON (GT.CODIGOCAMPEONATO = UJ.CODIGOCAMPEONATO AND
                                                                    GT.CODIGOGRUPO = @CodigoGrupo AND
                                                                    GT.CODIGOTIME IN (UJ.CODIGOTIME1, UJ.CODIGOTIME2))
                                             WHERE UJ.CODIGOUSUARIO = @CodigoUsuario
                                               AND UJ.CODIGOCAMPEONATO = @CodigoCampeonato
                                               AND J.CODIGOFASE = @CodigoFase
                                               AND ((UJ.TOTALGOL1 IS NULL) OR (UJ.TOTALGOL2 IS NULL))))
     FROM (SELECT J.CODIGOCAMPEONATO,
                  J.CODIGOJOGO,
                  R.CODIGOGRUPO,
                  R.CLASSIFICACAOTIME
             FROM JOGO J INNER JOIN
                  REGRA R ON (R.CODIGOCAMPEONATO = J.CODIGOCAMPEONATO AND
                              R.CODIGOREGRA = J.CODIGOREGRA1)
            WHERE J.CODIGOCAMPEONATO = @CodigoCampeonato
              AND R.TIPOREGRA = 1
              AND R.CODIGOGRUPO = @CodigoGrupo
              AND R.CODIGOREGRA = J.CODIGOREGRA1) R
    WHERE USUARIOJOGO.CODIGOUSUARIO = @CodigoUsuario
      AND USUARIOJOGO.CODIGOCAMPEONATO = @CodigoCampeonato
      AND R.CODIGOCAMPEONATO = USUARIOJOGO.CODIGOCAMPEONATO
      AND R.CODIGOJOGO = USUARIOJOGO.CODIGOJOGO
   
   UPDATE USUARIOJOGO SET
          CODIGOTIME2 = (SELECT UGT.CODIGOTIME
                           FROM USUARIOGRUPOTIME UGT
                          WHERE UGT.CODIGOUSUARIO = @CodigoUsuario
                            AND UGT.CODIGOCAMPEONATO = R.CODIGOCAMPEONATO
                            AND UGT.CODIGOGRUPO = R.CODIGOGRUPO
                            AND UGT.CLASSIFICACAOTIME = R.CLASSIFICACAOTIME
                            AND NOT EXISTS (SELECT 1
                                              FROM USUARIOJOGO UJ INNER JOIN
                                                   JOGO J ON (J.CODIGOCAMPEONATO = UJ.CODIGOCAMPEONATO AND
                                                              J.CODIGOJOGO = UJ.CODIGOJOGO) INNER JOIN
                                                   GRUPOTIME GT ON (GT.CODIGOCAMPEONATO = UJ.CODIGOCAMPEONATO AND
                                                                    GT.CODIGOGRUPO = @CodigoGrupo AND
                                                                    GT.CODIGOTIME IN (UJ.CODIGOTIME1, UJ.CODIGOTIME2))
                                             WHERE UJ.CODIGOUSUARIO = @CodigoUsuario
                                               AND UJ.CODIGOCAMPEONATO = @CodigoCampeonato
                                               AND J.CODIGOFASE = @CodigoFase
                                               AND ((UJ.TOTALGOL1 IS NULL) OR (UJ.TOTALGOL2 IS NULL))))
     FROM (SELECT J.CODIGOCAMPEONATO,
                  J.CODIGOJOGO,
                  R.CODIGOGRUPO,
                  R.CLASSIFICACAOTIME
             FROM JOGO J INNER JOIN
                  REGRA R ON (R.CODIGOCAMPEONATO = J.CODIGOCAMPEONATO AND
                              R.CODIGOREGRA = J.CODIGOREGRA2)
            WHERE J.CODIGOCAMPEONATO = @CodigoCampeonato
              AND R.TIPOREGRA = 1
              AND R.CODIGOGRUPO = @CodigoGrupo
              AND R.CODIGOREGRA = J.CODIGOREGRA2) R
    WHERE USUARIOJOGO.CODIGOUSUARIO = @CodigoUsuario
      AND USUARIOJOGO.CODIGOCAMPEONATO = @CodigoCampeonato
      AND R.CODIGOCAMPEONATO = USUARIOJOGO.CODIGOCAMPEONATO
      AND R.CODIGOJOGO = USUARIOJOGO.CODIGOJOGO
END
GO


-- spSysAtualizarMataMata
IF (EXISTS (SELECT 1 FROM sys.objects WHERE name = 'spSysAtualizarMataMata'))
DROP PROCEDURE [dbo].[spSysAtualizarMataMata]
GO
CREATE PROCEDURE [dbo].[spSysAtualizarMataMata]
(
   @CodigoCampeonato NUMERIC(10)
)
AS
BEGIN
   DECLARE @Total NUMERIC(10)
   SET @Total = 0
   
   UPDATE JOGO SET
          JOGO.CODIGOTIME1 = CASE WHEN RJ.TOTALGOL1 > RJ.TOTALGOL2 THEN RJ.CODIGOTIME1
                                  WHEN RJ.TOTALGOL2 > RJ.TOTALGOL1 THEN RJ.CODIGOTIME2
                                  ELSE NULL
                             END
     FROM (SELECT R.CODIGOCAMPEONATO,
                  R.CODIGOREGRA,
                  J.CODIGOTIME1,
                  J.TOTALGOL1,
                  J.TOTALGOL2,
                  J.CODIGOTIME2
             FROM REGRA R,
                  JOGO J
            WHERE R.TIPOREGRA = 2
              AND J.CODIGOCAMPEONATO = R.CODIGOCAMPEONATO
              AND J.CODIGOJOGO = R.CODIGOJOGO) RJ
    WHERE JOGO.CODIGOCAMPEONATO = @CodigoCampeonato
      AND RJ.CODIGOCAMPEONATO = JOGO.CODIGOCAMPEONATO
      AND RJ.CODIGOREGRA = JOGO.CODIGOREGRA1
      AND COALESCE(JOGO.CODIGOTIME1, -1) != COALESCE(CASE WHEN RJ.TOTALGOL1 > RJ.TOTALGOL2 THEN RJ.CODIGOTIME1
                                                          WHEN RJ.TOTALGOL2 > RJ.TOTALGOL1 THEN RJ.CODIGOTIME2
                                                          ELSE NULL
                                                     END, -1)
   
   SET @Total = @Total + @@ROWCOUNT
   
   UPDATE JOGO SET
          JOGO.CODIGOTIME1 = CASE WHEN RJ.TOTALGOL1 < RJ.TOTALGOL2 THEN RJ.CODIGOTIME1
                                  WHEN RJ.TOTALGOL2 < RJ.TOTALGOL1 THEN RJ.CODIGOTIME2
                                  ELSE NULL
                             END
     FROM (SELECT R.CODIGOCAMPEONATO,
                  R.CODIGOREGRA,
                  J.CODIGOTIME1,
                  J.TOTALGOL1,
                  J.TOTALGOL2,
                  J.CODIGOTIME2
             FROM REGRA R,
                  JOGO J
            WHERE R.TIPOREGRA = 3
              AND J.CODIGOCAMPEONATO = R.CODIGOCAMPEONATO
              AND J.CODIGOJOGO = R.CODIGOJOGO) RJ
    WHERE JOGO.CODIGOCAMPEONATO = @CodigoCampeonato
      AND RJ.CODIGOCAMPEONATO = JOGO.CODIGOCAMPEONATO
      AND RJ.CODIGOREGRA = JOGO.CODIGOREGRA1
      AND COALESCE(JOGO.CODIGOTIME1, -1) != COALESCE(CASE WHEN RJ.TOTALGOL1 < RJ.TOTALGOL2 THEN RJ.CODIGOTIME1
                                                          WHEN RJ.TOTALGOL2 < RJ.TOTALGOL1 THEN RJ.CODIGOTIME2
                                                          ELSE NULL
                                                     END, -1)
   
   SET @Total = @Total + @@ROWCOUNT
   
   UPDATE JOGO SET
          JOGO.CODIGOTIME2 = CASE WHEN RJ.TOTALGOL1 > RJ.TOTALGOL2 THEN RJ.CODIGOTIME1
                                  WHEN RJ.TOTALGOL2 > RJ.TOTALGOL1 THEN RJ.CODIGOTIME2
                                  ELSE NULL
                             END
     FROM (SELECT R.CODIGOCAMPEONATO,
                  R.CODIGOREGRA,
                  J.CODIGOTIME1,
                  J.TOTALGOL1,
                  J.TOTALGOL2,
                  J.CODIGOTIME2
             FROM REGRA R,
                  JOGO J
            WHERE R.TIPOREGRA = 2
              AND J.CODIGOCAMPEONATO = R.CODIGOCAMPEONATO
              AND J.CODIGOJOGO = R.CODIGOJOGO) RJ
    WHERE JOGO.CODIGOCAMPEONATO = @CodigoCampeonato
      AND RJ.CODIGOCAMPEONATO = JOGO.CODIGOCAMPEONATO
      AND RJ.CODIGOREGRA = JOGO.CODIGOREGRA2
      AND COALESCE(JOGO.CODIGOTIME2, -1) != COALESCE(CASE WHEN RJ.TOTALGOL1 > RJ.TOTALGOL2 THEN RJ.CODIGOTIME1
                                                          WHEN RJ.TOTALGOL2 > RJ.TOTALGOL1 THEN RJ.CODIGOTIME2
                                                          ELSE NULL
                                                     END, -1)
   
   SET @Total = @Total + @@ROWCOUNT
   
   UPDATE JOGO SET
          JOGO.CODIGOTIME2 = CASE WHEN RJ.TOTALGOL1 < RJ.TOTALGOL2 THEN RJ.CODIGOTIME1
                                  WHEN RJ.TOTALGOL2 < RJ.TOTALGOL1 THEN RJ.CODIGOTIME2
                                  ELSE NULL
                             END
     FROM (SELECT R.CODIGOCAMPEONATO,
                  R.CODIGOREGRA,
                  J.CODIGOTIME1,
                  J.TOTALGOL1,
                  J.TOTALGOL2,
                  J.CODIGOTIME2
             FROM REGRA R,
                  JOGO J
            WHERE R.TIPOREGRA = 3
              AND J.CODIGOCAMPEONATO = R.CODIGOCAMPEONATO
              AND J.CODIGOJOGO = R.CODIGOJOGO) RJ
    WHERE JOGO.CODIGOCAMPEONATO = @CodigoCampeonato
      AND RJ.CODIGOCAMPEONATO = JOGO.CODIGOCAMPEONATO
      AND RJ.CODIGOREGRA = JOGO.CODIGOREGRA2
      AND COALESCE(JOGO.CODIGOTIME2, -1) != COALESCE(CASE WHEN RJ.TOTALGOL1 < RJ.TOTALGOL2 THEN RJ.CODIGOTIME1
                                                          WHEN RJ.TOTALGOL2 < RJ.TOTALGOL1 THEN RJ.CODIGOTIME2
                                                          ELSE NULL
                                                     END, -1)
   
   SET @Total = @Total + @@ROWCOUNT
   
   IF (@Total > 0)
    BEGIN
      EXECUTE [dbo].[spSysAtualizarMataMata]
              @CodigoCampeonato = @CodigoCampeonato
    END
END
GO


-- spSysAtualizarMataMataU
IF (EXISTS (SELECT 1 FROM sys.objects WHERE name = 'spSysAtualizarMataMataU'))
DROP PROCEDURE [dbo].[spSysAtualizarMataMataU]
GO
CREATE PROCEDURE [dbo].[spSysAtualizarMataMataU]
(
   @CodigoUsuario    VARCHAR(256),
   @CodigoCampeonato NUMERIC(10)
)
AS
BEGIN
   DECLARE @Total NUMERIC(10)
   SET @Total = 0
   
   UPDATE USUARIOJOGO SET
          USUARIOJOGO.CODIGOTIME1 = CASE WHEN RJ.TOTALGOL1 > RJ.TOTALGOL2 THEN RJ.CODIGOTIME1
                                         WHEN RJ.TOTALGOL2 > RJ.TOTALGOL1 THEN RJ.CODIGOTIME2
                                         ELSE NULL
                                    END
     FROM (SELECT J.CODIGOCAMPEONATO,
                  J.CODIGOJOGO,
                  UJ.CODIGOTIME1,
                  UJ.TOTALGOL1,
                  UJ.TOTALGOL2,
                  UJ.CODIGOTIME2
             FROM REGRA R,
                  JOGO J,
                  USUARIOJOGO UJ
            WHERE R.TIPOREGRA = 2
              AND J.CODIGOCAMPEONATO = R.CODIGOCAMPEONATO
              AND J.CODIGOREGRA1 = R.CODIGOREGRA
              AND UJ.CODIGOUSUARIO = @CodigoUsuario
              AND UJ.CODIGOCAMPEONATO = R.CODIGOCAMPEONATO
              AND UJ.CODIGOJOGO = R.CODIGOJOGO) RJ
    WHERE USUARIOJOGO.CODIGOUSUARIO = @CodigoUsuario
      AND USUARIOJOGO.CODIGOCAMPEONATO = @CodigoCampeonato
      AND RJ.CODIGOCAMPEONATO = USUARIOJOGO.CODIGOCAMPEONATO
      AND RJ.CODIGOJOGO = USUARIOJOGO.CODIGOJOGO
      AND COALESCE(USUARIOJOGO.CODIGOTIME1, -1) != COALESCE(CASE WHEN RJ.TOTALGOL1 > RJ.TOTALGOL2 THEN RJ.CODIGOTIME1
                                                                 WHEN RJ.TOTALGOL2 > RJ.TOTALGOL1 THEN RJ.CODIGOTIME2
                                                                 ELSE NULL
                                                            END, -1)
   
   SET @Total = @Total + @@ROWCOUNT
   
   UPDATE USUARIOJOGO SET
          USUARIOJOGO.CODIGOTIME1 = CASE WHEN RJ.TOTALGOL1 < RJ.TOTALGOL2 THEN RJ.CODIGOTIME1
                                         WHEN RJ.TOTALGOL2 < RJ.TOTALGOL1 THEN RJ.CODIGOTIME2
                                         ELSE NULL
                                    END
     FROM (SELECT J.CODIGOCAMPEONATO,
                  J.CODIGOJOGO,
                  UJ.CODIGOTIME1,
                  UJ.TOTALGOL1,
                  UJ.TOTALGOL2,
                  UJ.CODIGOTIME2
             FROM REGRA R,
                  JOGO J,
                  USUARIOJOGO UJ
            WHERE R.TIPOREGRA = 3
              AND J.CODIGOCAMPEONATO = R.CODIGOCAMPEONATO
              AND J.CODIGOREGRA1 = R.CODIGOREGRA
              AND UJ.CODIGOUSUARIO = @CodigoUsuario
              AND UJ.CODIGOCAMPEONATO = R.CODIGOCAMPEONATO
              AND UJ.CODIGOJOGO = R.CODIGOJOGO) RJ
    WHERE USUARIOJOGO.CODIGOUSUARIO = @CodigoUsuario
      AND USUARIOJOGO.CODIGOCAMPEONATO = @CodigoCampeonato
      AND RJ.CODIGOCAMPEONATO = USUARIOJOGO.CODIGOCAMPEONATO
      AND RJ.CODIGOJOGO = USUARIOJOGO.CODIGOJOGO
      AND COALESCE(USUARIOJOGO.CODIGOTIME1, -1) != COALESCE(CASE WHEN RJ.TOTALGOL1 < RJ.TOTALGOL2 THEN RJ.CODIGOTIME1
                                                                 WHEN RJ.TOTALGOL2 < RJ.TOTALGOL1 THEN RJ.CODIGOTIME2
                                                                 ELSE NULL
                                                            END, -1)
   
   SET @Total = @Total + @@ROWCOUNT
   
   UPDATE USUARIOJOGO SET
          USUARIOJOGO.CODIGOTIME2 = CASE WHEN RJ.TOTALGOL1 > RJ.TOTALGOL2 THEN RJ.CODIGOTIME1
                                         WHEN RJ.TOTALGOL2 > RJ.TOTALGOL1 THEN RJ.CODIGOTIME2
                                         ELSE NULL
                                    END
     FROM (SELECT J.CODIGOCAMPEONATO,
                  J.CODIGOJOGO,
                  UJ.CODIGOTIME1,
                  UJ.TOTALGOL1,
                  UJ.TOTALGOL2,
                  UJ.CODIGOTIME2
             FROM REGRA R,
                  JOGO J,
                  USUARIOJOGO UJ
            WHERE R.TIPOREGRA = 2
              AND J.CODIGOCAMPEONATO = R.CODIGOCAMPEONATO
              AND J.CODIGOREGRA2 = R.CODIGOREGRA
              AND UJ.CODIGOUSUARIO = @CodigoUsuario
              AND UJ.CODIGOCAMPEONATO = R.CODIGOCAMPEONATO
              AND UJ.CODIGOJOGO = R.CODIGOJOGO) RJ
    WHERE USUARIOJOGO.CODIGOUSUARIO = @CodigoUsuario
      AND USUARIOJOGO.CODIGOCAMPEONATO = @CodigoCampeonato
      AND RJ.CODIGOCAMPEONATO = USUARIOJOGO.CODIGOCAMPEONATO
      AND RJ.CODIGOJOGO = USUARIOJOGO.CODIGOJOGO
      AND COALESCE(USUARIOJOGO.CODIGOTIME2, -1) != COALESCE(CASE WHEN RJ.TOTALGOL1 > RJ.TOTALGOL2 THEN RJ.CODIGOTIME1
                                                                 WHEN RJ.TOTALGOL2 > RJ.TOTALGOL1 THEN RJ.CODIGOTIME2
                                                                 ELSE NULL
                                                            END, -1)
   
   SET @Total = @Total + @@ROWCOUNT
   
   UPDATE USUARIOJOGO SET
          USUARIOJOGO.CODIGOTIME2 = CASE WHEN RJ.TOTALGOL1 < RJ.TOTALGOL2 THEN RJ.CODIGOTIME1
                                         WHEN RJ.TOTALGOL2 < RJ.TOTALGOL1 THEN RJ.CODIGOTIME2
                                         ELSE NULL
                                    END
     FROM (SELECT J.CODIGOCAMPEONATO,
                  J.CODIGOJOGO,
                  UJ.CODIGOTIME1,
                  UJ.TOTALGOL1,
                  UJ.TOTALGOL2,
                  UJ.CODIGOTIME2
             FROM REGRA R,
                  JOGO J,
                  USUARIOJOGO UJ
            WHERE R.TIPOREGRA = 3
              AND J.CODIGOCAMPEONATO = R.CODIGOCAMPEONATO
              AND J.CODIGOREGRA2 = R.CODIGOREGRA
              AND UJ.CODIGOUSUARIO = @CodigoUsuario
              AND UJ.CODIGOCAMPEONATO = R.CODIGOCAMPEONATO
              AND UJ.CODIGOJOGO = R.CODIGOJOGO) RJ
    WHERE USUARIOJOGO.CODIGOUSUARIO = @CodigoUsuario
      AND USUARIOJOGO.CODIGOCAMPEONATO = @CodigoCampeonato
      AND RJ.CODIGOCAMPEONATO = USUARIOJOGO.CODIGOCAMPEONATO
      AND RJ.CODIGOJOGO = USUARIOJOGO.CODIGOJOGO
      AND COALESCE(USUARIOJOGO.CODIGOTIME2, -1) != COALESCE(CASE WHEN RJ.TOTALGOL1 < RJ.TOTALGOL2 THEN RJ.CODIGOTIME1
                                                                 WHEN RJ.TOTALGOL2 < RJ.TOTALGOL1 THEN RJ.CODIGOTIME2
                                                                 ELSE NULL
                                                            END, -1)
   
   SET @Total = @Total + @@ROWCOUNT
   
   IF (@Total > 0)
    BEGIN
      EXECUTE [dbo].[spSysAtualizarMataMataU]
              @CodigoUsuario = @CodigoUsuario,
              @CodigoCampeonato = @CodigoCampeonato
    END
END
GO


-- spSysAtualizarClassificacao
IF (EXISTS (SELECT 1 FROM sys.objects WHERE name = 'spSysAtualizarClassificacao'))
DROP PROCEDURE [dbo].[spSysAtualizarClassificacao]
GO
CREATE PROCEDURE [dbo].[spSysAtualizarClassificacao]
(
   @CodigoCampeonato NUMERIC(10),
   @CodigoGrupo      NUMERIC(10),
   @CodigoFase       NUMERIC(10)
)
AS
BEGIN
   DECLARE @CodigoTime NUMERIC(10)
   
   DECLARE @ClassificacaoTime NUMERIC(10)
   SET @ClassificacaoTime = 1
   
   DECLARE cClass CURSOR FOR
    SELECT C.CODIGOTIME
      FROM (SELECT C.CODIGOTIME,
                   C.PG,
                   SUM(CASE WHEN CCD.CRITERIODESEMPATE = 1 THEN (C.GP - C.GC) * CCD.PESOCRITERIODESEMPATE
                            WHEN CCD.CRITERIODESEMPATE = 2 THEN C.GP * CCD.PESOCRITERIODESEMPATE
                       END) AS DESEMPATE,
                   C.ORDEMTIME
              FROM (SELECT GT.CODIGOTIME,
                           SUM(CASE WHEN J.CODIGOTIME1 = GT.CODIGOTIME THEN CASE WHEN (J.TOTALGOL1 IS NULL) OR (J.TOTALGOL2 IS NULL) THEN 0
                                                                                 WHEN J.TOTALGOL1 > J.TOTALGOL2 THEN C.PONTUACAOVITORIA
                                                                                 WHEN J.TOTALGOL1 < J.TOTALGOL2 THEN C.PONTUACAODERROTA
                                                                                 ELSE C.PONTUACAOEMPATE
                                                                            END
                                    ELSE CASE WHEN (J.TOTALGOL1 IS NULL) OR (J.TOTALGOL2 IS NULL) THEN 0
                                              WHEN J.TOTALGOL2 > J.TOTALGOL1 THEN C.PONTUACAOVITORIA
                                              WHEN J.TOTALGOL2 < J.TOTALGOL1 THEN C.PONTUACAODERROTA
                                              ELSE C.PONTUACAOEMPATE
                                         END
                               END) AS PG,
                           SUM(CASE WHEN J.CODIGOTIME1 = GT.CODIGOTIME THEN COALESCE(J.TOTALGOL1, 0)
                                    ELSE COALESCE(J.TOTALGOL2, 0)
                               END) AS GP,
                           SUM(CASE WHEN J.CODIGOTIME1 = GT.CODIGOTIME THEN COALESCE(J.TOTALGOL2, 0)
                                    ELSE COALESCE(J.TOTALGOL1, 0)
                               END) AS GC,
                           GT.ORDEMTIME
                      FROM CAMPEONATO C INNER JOIN
                           GRUPOTIME GT ON (GT.CODIGOCAMPEONATO = C.CODIGOCAMPEONATO) INNER JOIN
                           GRUPO G ON (G.CODIGOCAMPEONATO = GT.CODIGOCAMPEONATO AND
                                       G.CODIGOGRUPO = GT.CODIGOGRUPO) INNER JOIN
                           JOGO J ON (J.CODIGOCAMPEONATO = GT.CODIGOCAMPEONATO AND
                                      ((J.CODIGOTIME1 = GT.CODIGOTIME) OR (J.CODIGOTIME2 = GT.CODIGOTIME)))
                     WHERE C.CODIGOCAMPEONATO = @CodigoCampeonato
                       AND GT.CODIGOGRUPO = @CodigoGrupo
                       AND J.CODIGOFASE = @CodigoFase
                     GROUP BY GT.CODIGOTIME,
                           GT.ORDEMTIME) C LEFT OUTER JOIN
                   CAMPEONATOCRITERIODESEMPATE CCD ON (CCD.CODIGOCAMPEONATO = @CodigoCampeonato)
             GROUP BY C.CODIGOTIME,
                   C.PG,
                   C.GP,
                   C.GC,
                   C.ORDEMTIME) C
     ORDER BY C.PG DESC,
           C.DESEMPATE DESC,
           C.ORDEMTIME
   
   OPEN cClass
   FETCH NEXT FROM cClass INTO @CodigoTime
   
   WHILE (@@FETCH_STATUS = 0)
    BEGIN
      UPDATE GRUPOTIME SET
             CLASSIFICACAOTIME = @ClassificacaoTime
       WHERE CODIGOCAMPEONATO = @CodigoCampeonato
         AND CODIGOGRUPO = @CodigoGrupo
         AND CODIGOTIME = @CodigoTime
      
      FETCH NEXT FROM cClass INTO @CodigoTime
      
      SET @ClassificacaoTime = @ClassificacaoTime + 1
    END
   
   CLOSE cClass
   DEALLOCATE cClass
   
   UPDATE JOGO SET
          CODIGOTIME1 = (SELECT GT.CODIGOTIME
                           FROM GRUPOTIME GT
                          WHERE GT.CODIGOCAMPEONATO = R.CODIGOCAMPEONATO
                            AND GT.CODIGOGRUPO = R.CODIGOGRUPO
                            AND GT.CLASSIFICACAOTIME = R.CLASSIFICACAOTIME
                            AND NOT EXISTS (SELECT 1
                                              FROM JOGO J INNER JOIN
                                                   GRUPOTIME GT ON (GT.CODIGOCAMPEONATO = J.CODIGOCAMPEONATO AND
                                                                    GT.CODIGOGRUPO = @CodigoGrupo AND
                                                                    GT.CODIGOTIME IN (J.CODIGOTIME1, J.CODIGOTIME2))
                                             WHERE J.CODIGOCAMPEONATO = @CodigoCampeonato
                                               AND J.CODIGOFASE = @CodigoFase
                                               AND ((J.TOTALGOL1 IS NULL) OR (J.TOTALGOL2 IS NULL))))
     FROM REGRA R
    WHERE JOGO.CODIGOCAMPEONATO = @CodigoCampeonato
      AND R.CODIGOCAMPEONATO = JOGO.CODIGOCAMPEONATO
      AND R.CODIGOREGRA = JOGO.CODIGOREGRA1
      AND R.TIPOREGRA = 1
      AND R.CODIGOGRUPO = @CodigoGrupo
   
   UPDATE JOGO SET
          CODIGOTIME2 = (SELECT GT.CODIGOTIME
                           FROM GRUPOTIME GT
                          WHERE GT.CODIGOCAMPEONATO = R.CODIGOCAMPEONATO
                            AND GT.CODIGOGRUPO = R.CODIGOGRUPO
                            AND GT.CLASSIFICACAOTIME = R.CLASSIFICACAOTIME
                            AND NOT EXISTS (SELECT 1
                                              FROM JOGO J INNER JOIN
                                                   GRUPOTIME GT ON (GT.CODIGOCAMPEONATO = J.CODIGOCAMPEONATO AND
                                                                    GT.CODIGOGRUPO = @CodigoGrupo AND
                                                                    GT.CODIGOTIME IN (J.CODIGOTIME1, J.CODIGOTIME2))
                                             WHERE J.CODIGOCAMPEONATO = @CodigoCampeonato
                                               AND J.CODIGOFASE = @CodigoFase
                                               AND ((J.TOTALGOL1 IS NULL) OR (J.TOTALGOL2 IS NULL))))
     FROM REGRA R
    WHERE JOGO.CODIGOCAMPEONATO = @CodigoCampeonato
      AND R.CODIGOCAMPEONATO = JOGO.CODIGOCAMPEONATO
      AND R.CODIGOREGRA = JOGO.CODIGOREGRA2
      AND R.TIPOREGRA = 1
      AND R.CODIGOGRUPO = @CodigoGrupo
   
   EXECUTE [dbo].[spSysAtualizarMataMata]
           @CodigoCampeonato = @CodigoCampeonato
END
GO


-- spSysAtualizarClassificacaoU
IF (EXISTS (SELECT 1 FROM sys.objects WHERE name = 'spSysAtualizarClassificacaoU'))
DROP PROCEDURE [dbo].[spSysAtualizarClassificacaoU]
GO
CREATE PROCEDURE [dbo].[spSysAtualizarClassificacaoU]
(
   @CodigoUsuario    VARCHAR(256),
   @CodigoCampeonato NUMERIC(10),
   @CodigoGrupo      NUMERIC(10),
   @CodigoFase       NUMERIC(10)
)
AS
BEGIN
   DECLARE @CodigoTime NUMERIC(10)
   
   DECLARE @ClassificacaoTime NUMERIC(10)
   SET @ClassificacaoTime = 1
   
   DECLARE cClass CURSOR FOR
    SELECT C.CODIGOTIME
      FROM (SELECT C.CODIGOTIME,
                   C.PG,
                   SUM(CASE WHEN CCD.CRITERIODESEMPATE = 1 THEN (C.GP - C.GC) * CCD.PESOCRITERIODESEMPATE
                            WHEN CCD.CRITERIODESEMPATE = 2 THEN C.GP * CCD.PESOCRITERIODESEMPATE
                       END) AS DESEMPATE,
                   C.ORDEMTIME
              FROM (SELECT UGT.CODIGOTIME,
                           SUM(CASE WHEN UJ.CODIGOTIME1 = UGT.CODIGOTIME THEN CASE WHEN (UJ.TOTALGOL1 IS NULL) OR (UJ.TOTALGOL2 IS NULL) THEN 0
                                                                                   WHEN UJ.TOTALGOL1 > UJ.TOTALGOL2 THEN C.PONTUACAOVITORIA
                                                                                   WHEN UJ.TOTALGOL1 < UJ.TOTALGOL2 THEN C.PONTUACAODERROTA
                                                                                   ELSE C.PONTUACAOEMPATE
                                                                              END
                                    ELSE CASE WHEN (UJ.TOTALGOL1 IS NULL) OR (UJ.TOTALGOL2 IS NULL) THEN 0
                                              WHEN UJ.TOTALGOL2 > UJ.TOTALGOL1 THEN C.PONTUACAOVITORIA
                                              WHEN UJ.TOTALGOL2 < UJ.TOTALGOL1 THEN C.PONTUACAODERROTA
                                              ELSE C.PONTUACAOEMPATE
                                         END
                               END) AS PG,
                           SUM(CASE WHEN UJ.CODIGOTIME1 = UGT.CODIGOTIME THEN COALESCE(UJ.TOTALGOL1, 0)
                                    ELSE COALESCE(UJ.TOTALGOL2, 0)
                               END) AS GP,
                           SUM(CASE WHEN UJ.CODIGOTIME1 = UGT.CODIGOTIME THEN COALESCE(UJ.TOTALGOL2, 0)
                                    ELSE COALESCE(UJ.TOTALGOL1, 0)
                               END) AS GC,
                           GT.ORDEMTIME
                      FROM CAMPEONATO C INNER JOIN
                           USUARIOGRUPOTIME UGT ON (UGT.CODIGOUSUARIO = @CodigoUsuario AND
                                                    UGT.CODIGOCAMPEONATO = C.CODIGOCAMPEONATO) INNER JOIN
                           GRUPOTIME GT ON (GT.CODIGOCAMPEONATO = UGT.CODIGOCAMPEONATO AND
                                            GT.CODIGOGRUPO = UGT.CODIGOGRUPO AND
                                            GT.CODIGOTIME = UGT.CODIGOTIME) INNER JOIN
                           GRUPO G ON (G.CODIGOCAMPEONATO = UGT.CODIGOCAMPEONATO AND
                                       G.CODIGOGRUPO = UGT.CODIGOGRUPO) INNER JOIN
                           USUARIOJOGO UJ ON (UJ.CODIGOUSUARIO = UGT.CODIGOUSUARIO AND
                                              UJ.CODIGOCAMPEONATO = UGT.CODIGOCAMPEONATO AND
                                              ((UJ.CODIGOTIME1 = UGT.CODIGOTIME) OR (UJ.CODIGOTIME2 = UGT.CODIGOTIME))) INNER JOIN
                           JOGO J ON (J.CODIGOCAMPEONATO = UJ.CODIGOCAMPEONATO AND
                                      J.CODIGOJOGO = UJ.CODIGOJOGO)
                     WHERE C.CODIGOCAMPEONATO = @CodigoCampeonato
                       AND UGT.CODIGOGRUPO = @CodigoGrupo
                       AND J.CODIGOFASE = @CodigoFase
                     GROUP BY UGT.CODIGOTIME,
                           GT.ORDEMTIME) C LEFT OUTER JOIN
                   CAMPEONATOCRITERIODESEMPATE CCD ON (CCD.CODIGOCAMPEONATO = @CodigoCampeonato)
             GROUP BY C.CODIGOTIME,
                   C.PG,
                   C.GP,
                   C.GC,
                   C.ORDEMTIME) C
     ORDER BY C.PG DESC,
           C.DESEMPATE DESC,
           C.ORDEMTIME
   
   OPEN cClass
   FETCH NEXT FROM cClass INTO @CodigoTime
   
   WHILE (@@FETCH_STATUS = 0)
    BEGIN
      UPDATE USUARIOGRUPOTIME SET
             CLASSIFICACAOTIME = @ClassificacaoTime
       WHERE CODIGOUSUARIO = @CodigoUsuario
         AND CODIGOCAMPEONATO = @CodigoCampeonato
         AND CODIGOGRUPO = @CodigoGrupo
         AND CODIGOTIME = @CodigoTime
      
      FETCH NEXT FROM cClass INTO @CodigoTime
      
      SET @ClassificacaoTime = @ClassificacaoTime + 1
    END
   
   CLOSE cClass
   DEALLOCATE cClass
   
   UPDATE USUARIOJOGO SET
          CODIGOTIME1 = (SELECT UGT.CODIGOTIME
                           FROM USUARIOGRUPOTIME UGT
                          WHERE UGT.CODIGOUSUARIO = @CodigoUsuario
                            AND UGT.CODIGOCAMPEONATO = R.CODIGOCAMPEONATO
                            AND UGT.CODIGOGRUPO = R.CODIGOGRUPO
                            AND UGT.CLASSIFICACAOTIME = R.CLASSIFICACAOTIME
                            AND NOT EXISTS (SELECT 1
                                              FROM USUARIOJOGO UJ INNER JOIN
                                                   JOGO J ON (J.CODIGOCAMPEONATO = UJ.CODIGOCAMPEONATO AND
                                                              J.CODIGOJOGO = UJ.CODIGOJOGO) INNER JOIN
                                                   GRUPOTIME GT ON (GT.CODIGOCAMPEONATO = UJ.CODIGOCAMPEONATO AND
                                                                    GT.CODIGOGRUPO = @CodigoGrupo AND
                                                                    GT.CODIGOTIME IN (UJ.CODIGOTIME1, UJ.CODIGOTIME2))
                                             WHERE UJ.CODIGOUSUARIO = @CodigoUsuario
                                               AND UJ.CODIGOCAMPEONATO = @CodigoCampeonato
                                               AND J.CODIGOFASE = @CodigoFase
                                               AND ((UJ.TOTALGOL1 IS NULL) OR (UJ.TOTALGOL2 IS NULL))))
     FROM (SELECT J.CODIGOCAMPEONATO,
                  J.CODIGOJOGO,
                  R.CODIGOGRUPO,
                  R.CLASSIFICACAOTIME
             FROM JOGO J INNER JOIN
                  REGRA R ON (R.CODIGOCAMPEONATO = J.CODIGOCAMPEONATO AND
                              R.CODIGOREGRA = J.CODIGOREGRA1)
            WHERE J.CODIGOCAMPEONATO = @CodigoCampeonato
              AND R.TIPOREGRA = 1
              AND R.CODIGOGRUPO = @CodigoGrupo
              AND R.CODIGOREGRA = J.CODIGOREGRA1) R
    WHERE USUARIOJOGO.CODIGOUSUARIO = @CodigoUsuario
      AND USUARIOJOGO.CODIGOCAMPEONATO = @CodigoCampeonato
      AND R.CODIGOCAMPEONATO = USUARIOJOGO.CODIGOCAMPEONATO
      AND R.CODIGOJOGO = USUARIOJOGO.CODIGOJOGO
   
   UPDATE USUARIOJOGO SET
          CODIGOTIME2 = (SELECT UGT.CODIGOTIME
                           FROM USUARIOGRUPOTIME UGT
                          WHERE UGT.CODIGOUSUARIO = @CodigoUsuario
                            AND UGT.CODIGOCAMPEONATO = R.CODIGOCAMPEONATO
                            AND UGT.CODIGOGRUPO = R.CODIGOGRUPO
                            AND UGT.CLASSIFICACAOTIME = R.CLASSIFICACAOTIME
                            AND NOT EXISTS (SELECT 1
                                              FROM USUARIOJOGO UJ INNER JOIN
                                                   JOGO J ON (J.CODIGOCAMPEONATO = UJ.CODIGOCAMPEONATO AND
                                                              J.CODIGOJOGO = UJ.CODIGOJOGO) INNER JOIN
                                                   GRUPOTIME GT ON (GT.CODIGOCAMPEONATO = UJ.CODIGOCAMPEONATO AND
                                                                    GT.CODIGOGRUPO = @CodigoGrupo AND
                                                                    GT.CODIGOTIME IN (UJ.CODIGOTIME1, UJ.CODIGOTIME2))
                                             WHERE UJ.CODIGOUSUARIO = @CodigoUsuario
                                               AND UJ.CODIGOCAMPEONATO = @CodigoCampeonato
                                               AND J.CODIGOFASE = @CodigoFase
                                               AND ((UJ.TOTALGOL1 IS NULL) OR (UJ.TOTALGOL2 IS NULL))))
     FROM (SELECT J.CODIGOCAMPEONATO,
                  J.CODIGOJOGO,
                  R.CODIGOGRUPO,
                  R.CLASSIFICACAOTIME
             FROM JOGO J INNER JOIN
                  REGRA R ON (R.CODIGOCAMPEONATO = J.CODIGOCAMPEONATO AND
                              R.CODIGOREGRA = J.CODIGOREGRA2)
            WHERE J.CODIGOCAMPEONATO = @CodigoCampeonato
              AND R.TIPOREGRA = 1
              AND R.CODIGOGRUPO = @CodigoGrupo
              AND R.CODIGOREGRA = J.CODIGOREGRA2) R
    WHERE USUARIOJOGO.CODIGOUSUARIO = @CodigoUsuario
      AND USUARIOJOGO.CODIGOCAMPEONATO = @CodigoCampeonato
      AND R.CODIGOCAMPEONATO = USUARIOJOGO.CODIGOCAMPEONATO
      AND R.CODIGOJOGO = USUARIOJOGO.CODIGOJOGO
   
   EXECUTE [dbo].[spSysAtualizarMataMataU]
           @CodigoUsuario = @CodigoUsuario,
           @CodigoCampeonato = @CodigoCampeonato
END
GO


-- TIME
ALTER TABLE TIME DROP COLUMN BANDEIRATIME
GO


ALTER TABLE TIME DROP COLUMN EXTENSAOBANDEIRATIME
GO


-- USUARIOCAMPEONATO
ALTER TABLE USUARIOCAMPEONATO ADD
      USUARIOPAGOUAPOSTA NUMERIC(1) NULL
GO


UPDATE USUARIOCAMPEONATO SET
       USUARIOPAGOUAPOSTA = 0
 WHERE USUARIOPAGOUAPOSTA IS NULL
GO


-- spExcUsuario
IF (EXISTS (SELECT 1 FROM sys.objects WHERE name = 'spExcUsuario'))
DROP PROCEDURE [dbo].[spExcUsuario]
GO
CREATE PROCEDURE [dbo].[spExcUsuario]
(
   @CodigoUsuario VARCHAR(256)
)
AS
BEGIN
   DELETE FROM aspnet_Membership
    WHERE EXISTS (SELECT 1
                    FROM aspnet_Users
                   WHERE aspnet_Users.UserName = @CodigoUsuario
                     AND aspnet_Users.UserId = aspnet_Membership.UserId)
   
   DELETE FROM dbo.aspnet_UsersInRoles
    WHERE EXISTS (SELECT 1
                    FROM aspnet_Users
                   WHERE aspnet_Users.UserName = @CodigoUsuario
                     AND aspnet_Users.UserId = dbo.aspnet_UsersInRoles.UserId)
   
   DELETE FROM aspnet_Users
    WHERE aspnet_Users.UserName = @CodigoUsuario
   
   DELETE FROM USUARIOJOGO
    WHERE CODIGOUSUARIO = @CodigoUsuario
   
   DELETE FROM USUARIOGRUPOTIME
    WHERE CODIGOUSUARIO = @CodigoUsuario
   
   DELETE FROM USUARIOCAMPEONATO
    WHERE CODIGOUSUARIO = @CodigoUsuario
   
   DELETE FROM USUARIO
    WHERE CODIGOUSUARIO = @CodigoUsuario
END
GO


-- CAMPEONATO
ALTER TABLE CAMPEONATO ADD
      VALORAPOSTA    NUMERIC(10) NULL,
      PREMIOPOSICAO1 NUMERIC(10) NULL,
      PREMIOPOSICAO2 NUMERIC(10) NULL,
      PREMIOPOSICAO3 NUMERIC(10) NULL
GO


-- spConRancking
IF (EXISTS (SELECT 1 FROM sys.objects WHERE name = 'spConRancking'))
DROP PROCEDURE [dbo].[spConRancking]
GO
CREATE PROCEDURE [dbo].[spConRancking]
(
   @CodigoCampeonato NUMERIC(10)
)
AS
BEGIN
   DECLARE @Arrecadacao NUMERIC(16,4)
   SET @Arrecadacao = 0
   
   SELECT @Arrecadacao = (SELECT COUNT(1)
                            FROM USUARIOCAMPEONATO UC
                           WHERE UC.CODIGOCAMPEONATO = C.CODIGOCAMPEONATO
                             AND UC.USUARIOPAGOUAPOSTA = 1) * C.VALORAPOSTA
     FROM CAMPEONATO C
    WHERE C.CODIGOCAMPEONATO = @CodigoCampeonato
   
   SELECT U.POSICAO,
          U.NOMEUSUARIO,
          U.PONTUACAO,
          U.PERCENTUAL,
          ROUND(@Arrecadacao * (U.PERCENTUAL / 100), 2) AS VALOR
     FROM (SELECT P.POSICAO,
                  U.NOMEUSUARIO,
                  U.PONTUACAO,
                  CASE WHEN (P.POSICAO = 1) AND (T.TOTALPOSICAO1 = 1) THEN C.PREMIOPOSICAO1
                       WHEN (P.POSICAO = 1) AND (T.TOTALPOSICAO1 = 2) THEN (C.PREMIOPOSICAO1 + C.PREMIOPOSICAO2) / 2
                       WHEN (P.POSICAO = 1) AND (T.TOTALPOSICAO1 > 2) THEN (C.PREMIOPOSICAO1 + C.PREMIOPOSICAO2 + C.PREMIOPOSICAO3) / CAST(T.TOTALPOSICAO1 AS FLOAT)
                       WHEN (P.POSICAO = 2) AND (T.TOTALPOSICAO2 = 1) THEN CASE WHEN (T.TOTALPOSICAO1 = 1) THEN C.PREMIOPOSICAO2
                                                                                WHEN (T.TOTALPOSICAO1 = 2) THEN C.PREMIOPOSICAO3
                                                                                ELSE 0
                                                                           END
                       WHEN (P.POSICAO = 2) AND (T.TOTALPOSICAO2 > 1) THEN CASE WHEN (T.TOTALPOSICAO1 = 1) THEN (C.PREMIOPOSICAO2 + C.PREMIOPOSICAO3) / CAST(T.TOTALPOSICAO2 AS FLOAT)
                                                                                WHEN (T.TOTALPOSICAO1 = 2) THEN C.PREMIOPOSICAO3 / CAST(T.TOTALPOSICAO2 AS FLOAT)
                                                                                ELSE 0
                                                                           END
                       WHEN (P.POSICAO = 3) AND (T.TOTALPOSICAO3 = 1) THEN CASE WHEN ((T.TOTALPOSICAO1 + T.TOTALPOSICAO2) = 2) THEN C.PREMIOPOSICAO3
                                                                                ELSE 0
                                                                           END
                       WHEN (P.POSICAO = 3) AND (T.TOTALPOSICAO3 > 1) THEN CASE WHEN ((T.TOTALPOSICAO1 + T.TOTALPOSICAO2) = 2) THEN C.PREMIOPOSICAO3 / CAST(T.TOTALPOSICAO3 AS FLOAT)
                                                                                ELSE 0
                                                                           END
                       ELSE 0
                  END AS PERCENTUAL
             FROM CAMPEONATO C,
                  (SELECT U.NOMEUSUARIO,
                          SUM(CASE WHEN (UJ.CODIGOTIME1 = J.CODIGOTIME1) AND
                                        (UJ.CODIGOTIME2 = J.CODIGOTIME2) AND
                                        (UJ.TOTALGOL1 = J.TOTALGOL1) AND
                                        (UJ.TOTALGOL2 = J.TOTALGOL2) THEN C.PONTUACAOACERTOEXATO
                                   WHEN (UJ.CODIGOTIME1 = J.CODIGOTIME1) AND
                                        (UJ.CODIGOTIME2 = J.CODIGOTIME2) AND
                                        (((UJ.TOTALGOL1 > UJ.TOTALGOL2) AND
                                          (J.TOTALGOL1 > J.TOTALGOL2)) OR
                                         ((UJ.TOTALGOL1 < UJ.TOTALGOL2) AND
                                          (J.TOTALGOL1 < J.TOTALGOL2)) OR
                                         ((UJ.TOTALGOL1 = UJ.TOTALGOL2) AND
                                          (J.TOTALGOL1 = J.TOTALGOL2))) THEN C.PONTUACAOACERTOPARCIAL
                                   ELSE 0
                              END) AS PONTUACAO
                     FROM CAMPEONATO C INNER JOIN
                          USUARIOJOGO UJ ON (UJ.CODIGOCAMPEONATO = C.CODIGOCAMPEONATO) INNER JOIN
                          USUARIOCAMPEONATO UC ON (UC.CODIGOCAMPEONATO = UJ.CODIGOCAMPEONATO AND
                                                   UC.CODIGOUSUARIO = UJ.CODIGOUSUARIO) INNER JOIN
                          USUARIO U ON (U.CODIGOUSUARIO = UJ.CODIGOUSUARIO) INNER JOIN
                          JOGO J ON (J.CODIGOCAMPEONATO = UJ.CODIGOCAMPEONATO AND
                                     J.CODIGOJOGO = UJ.CODIGOJOGO)
                    WHERE C.CODIGOCAMPEONATO = @CodigoCampeonato
                      AND UC.USUARIOPAGOUAPOSTA = 1
                    GROUP BY U.NOMEUSUARIO) U,
                  (SELECT ROW_NUMBER() OVER(ORDER BY(9999999999 - U.PONTUACAO)) AS POSICAO,
                          U.PONTUACAO,
                          U.TOTAL
                     FROM (SELECT U.PONTUACAO,
                                  COUNT(1) AS TOTAL
                             FROM (SELECT U.NOMEUSUARIO,
                                          SUM(CASE WHEN (UJ.CODIGOTIME1 = J.CODIGOTIME1) AND
                                                        (UJ.CODIGOTIME2 = J.CODIGOTIME2) AND
                                                        (UJ.TOTALGOL1 = J.TOTALGOL1) AND
                                                        (UJ.TOTALGOL2 = J.TOTALGOL2) THEN C.PONTUACAOACERTOEXATO
                                                   WHEN (UJ.CODIGOTIME1 = J.CODIGOTIME1) AND
                                                        (UJ.CODIGOTIME2 = J.CODIGOTIME2) AND
                                                        (((UJ.TOTALGOL1 > UJ.TOTALGOL2) AND
                                                          (J.TOTALGOL1 > J.TOTALGOL2)) OR
                                                         ((UJ.TOTALGOL1 < UJ.TOTALGOL2) AND
                                                          (J.TOTALGOL1 < J.TOTALGOL2)) OR
                                                         ((UJ.TOTALGOL1 = UJ.TOTALGOL2) AND
                                                          (J.TOTALGOL1 = J.TOTALGOL2))) THEN C.PONTUACAOACERTOPARCIAL
                                                   ELSE 0
                                              END) AS PONTUACAO
                                     FROM CAMPEONATO C INNER JOIN
                                          USUARIOJOGO UJ ON (UJ.CODIGOCAMPEONATO = C.CODIGOCAMPEONATO) INNER JOIN
                                          USUARIOCAMPEONATO UC ON (UC.CODIGOCAMPEONATO = UJ.CODIGOCAMPEONATO AND
                                                                   UC.CODIGOUSUARIO = UJ.CODIGOUSUARIO) INNER JOIN
                                          USUARIO U ON (U.CODIGOUSUARIO = UJ.CODIGOUSUARIO) INNER JOIN
                                          JOGO J ON (J.CODIGOCAMPEONATO = UJ.CODIGOCAMPEONATO AND
                                                     J.CODIGOJOGO = UJ.CODIGOJOGO)
                                    WHERE C.CODIGOCAMPEONATO = @CodigoCampeonato
                                      AND UC.USUARIOPAGOUAPOSTA = 1
                                    GROUP BY U.NOMEUSUARIO) U
                            GROUP BY U.PONTUACAO) U) P,
                  (SELECT SUM(CASE WHEN T.POSICAO = 1 THEN T.TOTAL
                                   ELSE 0
                              END) AS TOTALPOSICAO1,
                          SUM(CASE WHEN T.POSICAO = 2 THEN T.TOTAL
                                   ELSE 0
                              END) AS TOTALPOSICAO2,
                          SUM(CASE WHEN T.POSICAO = 3 THEN T.TOTAL
                                   ELSE 0
                              END) AS TOTALPOSICAO3
                     FROM (SELECT ROW_NUMBER() OVER(ORDER BY(9999999999 - U.PONTUACAO)) AS POSICAO,
                                  U.PONTUACAO,
                                  U.TOTAL
                             FROM (SELECT U.PONTUACAO,
                                          COUNT(1) AS TOTAL
                                     FROM (SELECT U.NOMEUSUARIO,
                                                  SUM(CASE WHEN (UJ.CODIGOTIME1 = J.CODIGOTIME1) AND
                                                                (UJ.CODIGOTIME2 = J.CODIGOTIME2) AND
                                                                (UJ.TOTALGOL1 = J.TOTALGOL1) AND
                                                                (UJ.TOTALGOL2 = J.TOTALGOL2) THEN C.PONTUACAOACERTOEXATO
                                                           WHEN (UJ.CODIGOTIME1 = J.CODIGOTIME1) AND
                                                                (UJ.CODIGOTIME2 = J.CODIGOTIME2) AND
                                                                (((UJ.TOTALGOL1 > UJ.TOTALGOL2) AND
                                                                  (J.TOTALGOL1 > J.TOTALGOL2)) OR
                                                                 ((UJ.TOTALGOL1 < UJ.TOTALGOL2) AND
                                                                  (J.TOTALGOL1 < J.TOTALGOL2)) OR
                                                                 ((UJ.TOTALGOL1 = UJ.TOTALGOL2) AND
                                                                  (J.TOTALGOL1 = J.TOTALGOL2))) THEN C.PONTUACAOACERTOPARCIAL
                                                           ELSE 0
                                                      END) AS PONTUACAO
                                             FROM CAMPEONATO C INNER JOIN
                                                  USUARIOJOGO UJ ON (UJ.CODIGOCAMPEONATO = C.CODIGOCAMPEONATO) INNER JOIN
                                                  USUARIOCAMPEONATO UC ON (UC.CODIGOCAMPEONATO = UJ.CODIGOCAMPEONATO AND
                                                                           UC.CODIGOUSUARIO = UJ.CODIGOUSUARIO) INNER JOIN
                                                  USUARIO U ON (U.CODIGOUSUARIO = UJ.CODIGOUSUARIO) INNER JOIN
                                                  JOGO J ON (J.CODIGOCAMPEONATO = UJ.CODIGOCAMPEONATO AND
                                                             J.CODIGOJOGO = UJ.CODIGOJOGO)
                                            WHERE C.CODIGOCAMPEONATO = @CodigoCampeonato
                                              AND UC.USUARIOPAGOUAPOSTA = 1
                                            GROUP BY U.NOMEUSUARIO) U
                                    GROUP BY U.PONTUACAO) U) T
                    WHERE T.POSICAO BETWEEN 1 AND 3) T
            WHERE C.CODIGOCAMPEONATO = @CodigoCampeonato
              AND P.PONTUACAO = U.PONTUACAO) U
    ORDER BY U.POSICAO,
          U.NOMEUSUARIO
END
GO


-- spConRancking
IF (EXISTS (SELECT 1 FROM sys.objects WHERE name = 'spConRancking'))
DROP PROCEDURE [dbo].[spConRancking]
GO
CREATE PROCEDURE [dbo].[spConRancking]
(
   @CodigoCampeonato NUMERIC(10)
)
AS
BEGIN
   DECLARE @Arrecadacao NUMERIC(16,4)
   SET @Arrecadacao = 0
   
   SELECT @Arrecadacao = (SELECT COUNT(1)
                            FROM USUARIOCAMPEONATO UC
                           WHERE UC.CODIGOCAMPEONATO = C.CODIGOCAMPEONATO
                             AND UC.USUARIOPAGOUAPOSTA = 1) * C.VALORAPOSTA
     FROM CAMPEONATO C
    WHERE C.CODIGOCAMPEONATO = @CodigoCampeonato
   
   SELECT U.POSICAO,
          U.CODIGOUSUARIO,
          U.NOMEUSUARIO,
          U.PONTUACAO,
          U.PERCENTUAL,
          ROUND(@Arrecadacao * (U.PERCENTUAL / 100), 2) AS VALOR
     FROM (SELECT P.POSICAO,
                  U.CODIGOUSUARIO,
                  U.NOMEUSUARIO,
                  U.PONTUACAO,
                  CASE WHEN (P.POSICAO = 1) AND (T.TOTALPOSICAO1 = 1) THEN C.PREMIOPOSICAO1
                       WHEN (P.POSICAO = 1) AND (T.TOTALPOSICAO1 = 2) THEN (C.PREMIOPOSICAO1 + C.PREMIOPOSICAO2) / 2
                       WHEN (P.POSICAO = 1) AND (T.TOTALPOSICAO1 > 2) THEN (C.PREMIOPOSICAO1 + C.PREMIOPOSICAO2 + C.PREMIOPOSICAO3) / CAST(T.TOTALPOSICAO1 AS FLOAT)
                       WHEN (P.POSICAO = 2) AND (T.TOTALPOSICAO2 = 1) THEN CASE WHEN (T.TOTALPOSICAO1 = 1) THEN C.PREMIOPOSICAO2
                                                                                WHEN (T.TOTALPOSICAO1 = 2) THEN C.PREMIOPOSICAO3
                                                                                ELSE 0
                                                                           END
                       WHEN (P.POSICAO = 2) AND (T.TOTALPOSICAO2 > 1) THEN CASE WHEN (T.TOTALPOSICAO1 = 1) THEN (C.PREMIOPOSICAO2 + C.PREMIOPOSICAO3) / CAST(T.TOTALPOSICAO2 AS FLOAT)
                                                                                WHEN (T.TOTALPOSICAO1 = 2) THEN C.PREMIOPOSICAO3 / CAST(T.TOTALPOSICAO2 AS FLOAT)
                                                                                ELSE 0
                                                                           END
                       WHEN (P.POSICAO = 3) AND (T.TOTALPOSICAO3 = 1) THEN CASE WHEN ((T.TOTALPOSICAO1 + T.TOTALPOSICAO2) = 2) THEN C.PREMIOPOSICAO3
                                                                                ELSE 0
                                                                           END
                       WHEN (P.POSICAO = 3) AND (T.TOTALPOSICAO3 > 1) THEN CASE WHEN ((T.TOTALPOSICAO1 + T.TOTALPOSICAO2) = 2) THEN C.PREMIOPOSICAO3 / CAST(T.TOTALPOSICAO3 AS FLOAT)
                                                                                ELSE 0
                                                                           END
                       ELSE 0
                  END AS PERCENTUAL
             FROM CAMPEONATO C,
                  (SELECT UJ.CODIGOUSUARIO,
                          U.NOMEUSUARIO,
                          SUM(CASE WHEN (UJ.CODIGOTIME1 = J.CODIGOTIME1) AND
                                        (UJ.CODIGOTIME2 = J.CODIGOTIME2) AND
                                        (UJ.TOTALGOL1 = J.TOTALGOL1) AND
                                        (UJ.TOTALGOL2 = J.TOTALGOL2) THEN C.PONTUACAOACERTOEXATO
                                   WHEN (UJ.CODIGOTIME1 = J.CODIGOTIME1) AND
                                        (UJ.CODIGOTIME2 = J.CODIGOTIME2) AND
                                        (((UJ.TOTALGOL1 > UJ.TOTALGOL2) AND
                                          (J.TOTALGOL1 > J.TOTALGOL2)) OR
                                         ((UJ.TOTALGOL1 < UJ.TOTALGOL2) AND
                                          (J.TOTALGOL1 < J.TOTALGOL2)) OR
                                         ((UJ.TOTALGOL1 = UJ.TOTALGOL2) AND
                                          (J.TOTALGOL1 = J.TOTALGOL2))) THEN C.PONTUACAOACERTOPARCIAL
                                   ELSE 0
                              END) AS PONTUACAO
                     FROM CAMPEONATO C INNER JOIN
                          USUARIOJOGO UJ ON (UJ.CODIGOCAMPEONATO = C.CODIGOCAMPEONATO) INNER JOIN
                          USUARIOCAMPEONATO UC ON (UC.CODIGOCAMPEONATO = UJ.CODIGOCAMPEONATO AND
                                                   UC.CODIGOUSUARIO = UJ.CODIGOUSUARIO) INNER JOIN
                          USUARIO U ON (U.CODIGOUSUARIO = UJ.CODIGOUSUARIO) INNER JOIN
                          JOGO J ON (J.CODIGOCAMPEONATO = UJ.CODIGOCAMPEONATO AND
                                     J.CODIGOJOGO = UJ.CODIGOJOGO)
                    WHERE C.CODIGOCAMPEONATO = @CodigoCampeonato
                      AND UC.USUARIOPAGOUAPOSTA = 1
                    GROUP BY UJ.CODIGOUSUARIO,
                          U.NOMEUSUARIO) U,
                  (SELECT ROW_NUMBER() OVER(ORDER BY(9999999999 - U.PONTUACAO)) AS POSICAO,
                          U.PONTUACAO,
                          U.TOTAL
                     FROM (SELECT U.PONTUACAO,
                                  COUNT(1) AS TOTAL
                             FROM (SELECT U.NOMEUSUARIO,
                                          SUM(CASE WHEN (UJ.CODIGOTIME1 = J.CODIGOTIME1) AND
                                                        (UJ.CODIGOTIME2 = J.CODIGOTIME2) AND
                                                        (UJ.TOTALGOL1 = J.TOTALGOL1) AND
                                                        (UJ.TOTALGOL2 = J.TOTALGOL2) THEN C.PONTUACAOACERTOEXATO
                                                   WHEN (UJ.CODIGOTIME1 = J.CODIGOTIME1) AND
                                                        (UJ.CODIGOTIME2 = J.CODIGOTIME2) AND
                                                        (((UJ.TOTALGOL1 > UJ.TOTALGOL2) AND
                                                          (J.TOTALGOL1 > J.TOTALGOL2)) OR
                                                         ((UJ.TOTALGOL1 < UJ.TOTALGOL2) AND
                                                          (J.TOTALGOL1 < J.TOTALGOL2)) OR
                                                         ((UJ.TOTALGOL1 = UJ.TOTALGOL2) AND
                                                          (J.TOTALGOL1 = J.TOTALGOL2))) THEN C.PONTUACAOACERTOPARCIAL
                                                   ELSE 0
                                              END) AS PONTUACAO
                                     FROM CAMPEONATO C INNER JOIN
                                          USUARIOJOGO UJ ON (UJ.CODIGOCAMPEONATO = C.CODIGOCAMPEONATO) INNER JOIN
                                          USUARIOCAMPEONATO UC ON (UC.CODIGOCAMPEONATO = UJ.CODIGOCAMPEONATO AND
                                                                   UC.CODIGOUSUARIO = UJ.CODIGOUSUARIO) INNER JOIN
                                          USUARIO U ON (U.CODIGOUSUARIO = UJ.CODIGOUSUARIO) INNER JOIN
                                          JOGO J ON (J.CODIGOCAMPEONATO = UJ.CODIGOCAMPEONATO AND
                                                     J.CODIGOJOGO = UJ.CODIGOJOGO)
                                    WHERE C.CODIGOCAMPEONATO = @CodigoCampeonato
                                      AND UC.USUARIOPAGOUAPOSTA = 1
                                    GROUP BY U.NOMEUSUARIO) U
                            GROUP BY U.PONTUACAO) U) P,
                  (SELECT SUM(CASE WHEN T.POSICAO = 1 THEN T.TOTAL
                                   ELSE 0
                              END) AS TOTALPOSICAO1,
                          SUM(CASE WHEN T.POSICAO = 2 THEN T.TOTAL
                                   ELSE 0
                              END) AS TOTALPOSICAO2,
                          SUM(CASE WHEN T.POSICAO = 3 THEN T.TOTAL
                                   ELSE 0
                              END) AS TOTALPOSICAO3
                     FROM (SELECT ROW_NUMBER() OVER(ORDER BY(9999999999 - U.PONTUACAO)) AS POSICAO,
                                  U.PONTUACAO,
                                  U.TOTAL
                             FROM (SELECT U.PONTUACAO,
                                          COUNT(1) AS TOTAL
                                     FROM (SELECT U.NOMEUSUARIO,
                                                  SUM(CASE WHEN (UJ.CODIGOTIME1 = J.CODIGOTIME1) AND
                                                                (UJ.CODIGOTIME2 = J.CODIGOTIME2) AND
                                                                (UJ.TOTALGOL1 = J.TOTALGOL1) AND
                                                                (UJ.TOTALGOL2 = J.TOTALGOL2) THEN C.PONTUACAOACERTOEXATO
                                                           WHEN (UJ.CODIGOTIME1 = J.CODIGOTIME1) AND
                                                                (UJ.CODIGOTIME2 = J.CODIGOTIME2) AND
                                                                (((UJ.TOTALGOL1 > UJ.TOTALGOL2) AND
                                                                  (J.TOTALGOL1 > J.TOTALGOL2)) OR
                                                                 ((UJ.TOTALGOL1 < UJ.TOTALGOL2) AND
                                                                  (J.TOTALGOL1 < J.TOTALGOL2)) OR
                                                                 ((UJ.TOTALGOL1 = UJ.TOTALGOL2) AND
                                                                  (J.TOTALGOL1 = J.TOTALGOL2))) THEN C.PONTUACAOACERTOPARCIAL
                                                           ELSE 0
                                                      END) AS PONTUACAO
                                             FROM CAMPEONATO C INNER JOIN
                                                  USUARIOJOGO UJ ON (UJ.CODIGOCAMPEONATO = C.CODIGOCAMPEONATO) INNER JOIN
                                                  USUARIOCAMPEONATO UC ON (UC.CODIGOCAMPEONATO = UJ.CODIGOCAMPEONATO AND
                                                                           UC.CODIGOUSUARIO = UJ.CODIGOUSUARIO) INNER JOIN
                                                  USUARIO U ON (U.CODIGOUSUARIO = UJ.CODIGOUSUARIO) INNER JOIN
                                                  JOGO J ON (J.CODIGOCAMPEONATO = UJ.CODIGOCAMPEONATO AND
                                                             J.CODIGOJOGO = UJ.CODIGOJOGO)
                                            WHERE C.CODIGOCAMPEONATO = @CodigoCampeonato
                                              AND UC.USUARIOPAGOUAPOSTA = 1
                                            GROUP BY U.NOMEUSUARIO) U
                                    GROUP BY U.PONTUACAO) U) T
                    WHERE T.POSICAO BETWEEN 1 AND 3) T
            WHERE C.CODIGOCAMPEONATO = @CodigoCampeonato
              AND P.PONTUACAO = U.PONTUACAO) U
    ORDER BY U.POSICAO,
          U.NOMEUSUARIO
END
GO


-- spConRancking
IF (EXISTS (SELECT 1 FROM sys.objects WHERE name = 'spConRancking'))
DROP PROCEDURE [dbo].[spConRancking]
GO


-- spConRanking
IF (EXISTS (SELECT 1 FROM sys.objects WHERE name = 'spConRanking'))
DROP PROCEDURE [dbo].[spConRanking]
GO
CREATE PROCEDURE [dbo].[spConRanking]
(
   @CodigoCampeonato NUMERIC(10)
)
AS
BEGIN
   DECLARE @Arrecadacao NUMERIC(16,4)
   SET @Arrecadacao = 0
   
   SELECT @Arrecadacao = (SELECT COUNT(1)
                            FROM USUARIOCAMPEONATO UC
                           WHERE UC.CODIGOCAMPEONATO = C.CODIGOCAMPEONATO
                             AND UC.USUARIOPAGOUAPOSTA = 1) * C.VALORAPOSTA
     FROM CAMPEONATO C
    WHERE C.CODIGOCAMPEONATO = @CodigoCampeonato
   
   SELECT U.POSICAO,
          U.CODIGOUSUARIO,
          U.NOMEUSUARIO,
          U.PONTUACAO,
          U.PERCENTUAL,
          ROUND(@Arrecadacao * (U.PERCENTUAL / 100), 2) AS VALOR
     FROM (SELECT P.POSICAO,
                  U.CODIGOUSUARIO,
                  U.NOMEUSUARIO,
                  U.PONTUACAO,
                  CASE WHEN (P.POSICAO = 1) AND (T.TOTALPOSICAO1 = 1) THEN C.PREMIOPOSICAO1
                       WHEN (P.POSICAO = 1) AND (T.TOTALPOSICAO1 = 2) THEN (C.PREMIOPOSICAO1 + C.PREMIOPOSICAO2) / 2
                       WHEN (P.POSICAO = 1) AND (T.TOTALPOSICAO1 > 2) THEN (C.PREMIOPOSICAO1 + C.PREMIOPOSICAO2 + C.PREMIOPOSICAO3) / CAST(T.TOTALPOSICAO1 AS FLOAT)
                       WHEN (P.POSICAO = 2) AND (T.TOTALPOSICAO2 = 1) THEN CASE WHEN (T.TOTALPOSICAO1 = 1) THEN C.PREMIOPOSICAO2
                                                                                WHEN (T.TOTALPOSICAO1 = 2) THEN C.PREMIOPOSICAO3
                                                                                ELSE 0
                                                                           END
                       WHEN (P.POSICAO = 2) AND (T.TOTALPOSICAO2 > 1) THEN CASE WHEN (T.TOTALPOSICAO1 = 1) THEN (C.PREMIOPOSICAO2 + C.PREMIOPOSICAO3) / CAST(T.TOTALPOSICAO2 AS FLOAT)
                                                                                WHEN (T.TOTALPOSICAO1 = 2) THEN C.PREMIOPOSICAO3 / CAST(T.TOTALPOSICAO2 AS FLOAT)
                                                                                ELSE 0
                                                                           END
                       WHEN (P.POSICAO = 3) AND (T.TOTALPOSICAO3 = 1) THEN CASE WHEN ((T.TOTALPOSICAO1 + T.TOTALPOSICAO2) = 2) THEN C.PREMIOPOSICAO3
                                                                                ELSE 0
                                                                           END
                       WHEN (P.POSICAO = 3) AND (T.TOTALPOSICAO3 > 1) THEN CASE WHEN ((T.TOTALPOSICAO1 + T.TOTALPOSICAO2) = 2) THEN C.PREMIOPOSICAO3 / CAST(T.TOTALPOSICAO3 AS FLOAT)
                                                                                ELSE 0
                                                                           END
                       ELSE 0
                  END AS PERCENTUAL
             FROM CAMPEONATO C,
                  (SELECT UJ.CODIGOUSUARIO,
                          U.NOMEUSUARIO,
                          SUM(CASE WHEN (UJ.CODIGOTIME1 = J.CODIGOTIME1) AND
                                        (UJ.CODIGOTIME2 = J.CODIGOTIME2) AND
                                        (UJ.TOTALGOL1 = J.TOTALGOL1) AND
                                        (UJ.TOTALGOL2 = J.TOTALGOL2) THEN C.PONTUACAOACERTOEXATO
                                   WHEN (UJ.CODIGOTIME1 = J.CODIGOTIME1) AND
                                        (UJ.CODIGOTIME2 = J.CODIGOTIME2) AND
                                        (((UJ.TOTALGOL1 > UJ.TOTALGOL2) AND
                                          (J.TOTALGOL1 > J.TOTALGOL2)) OR
                                         ((UJ.TOTALGOL1 < UJ.TOTALGOL2) AND
                                          (J.TOTALGOL1 < J.TOTALGOL2)) OR
                                         ((UJ.TOTALGOL1 = UJ.TOTALGOL2) AND
                                          (J.TOTALGOL1 = J.TOTALGOL2))) THEN C.PONTUACAOACERTOPARCIAL
                                   ELSE 0
                              END) AS PONTUACAO
                     FROM CAMPEONATO C INNER JOIN
                          USUARIOJOGO UJ ON (UJ.CODIGOCAMPEONATO = C.CODIGOCAMPEONATO) INNER JOIN
                          USUARIOCAMPEONATO UC ON (UC.CODIGOCAMPEONATO = UJ.CODIGOCAMPEONATO AND
                                                   UC.CODIGOUSUARIO = UJ.CODIGOUSUARIO) INNER JOIN
                          USUARIO U ON (U.CODIGOUSUARIO = UJ.CODIGOUSUARIO) INNER JOIN
                          JOGO J ON (J.CODIGOCAMPEONATO = UJ.CODIGOCAMPEONATO AND
                                     J.CODIGOJOGO = UJ.CODIGOJOGO)
                    WHERE C.CODIGOCAMPEONATO = @CodigoCampeonato
                      AND UC.USUARIOPAGOUAPOSTA = 1
                    GROUP BY UJ.CODIGOUSUARIO,
                          U.NOMEUSUARIO) U,
                  (SELECT ROW_NUMBER() OVER(ORDER BY(9999999999 - U.PONTUACAO)) AS POSICAO,
                          U.PONTUACAO,
                          U.TOTAL
                     FROM (SELECT U.PONTUACAO,
                                  COUNT(1) AS TOTAL
                             FROM (SELECT U.NOMEUSUARIO,
                                          SUM(CASE WHEN (UJ.CODIGOTIME1 = J.CODIGOTIME1) AND
                                                        (UJ.CODIGOTIME2 = J.CODIGOTIME2) AND
                                                        (UJ.TOTALGOL1 = J.TOTALGOL1) AND
                                                        (UJ.TOTALGOL2 = J.TOTALGOL2) THEN C.PONTUACAOACERTOEXATO
                                                   WHEN (UJ.CODIGOTIME1 = J.CODIGOTIME1) AND
                                                        (UJ.CODIGOTIME2 = J.CODIGOTIME2) AND
                                                        (((UJ.TOTALGOL1 > UJ.TOTALGOL2) AND
                                                          (J.TOTALGOL1 > J.TOTALGOL2)) OR
                                                         ((UJ.TOTALGOL1 < UJ.TOTALGOL2) AND
                                                          (J.TOTALGOL1 < J.TOTALGOL2)) OR
                                                         ((UJ.TOTALGOL1 = UJ.TOTALGOL2) AND
                                                          (J.TOTALGOL1 = J.TOTALGOL2))) THEN C.PONTUACAOACERTOPARCIAL
                                                   ELSE 0
                                              END) AS PONTUACAO
                                     FROM CAMPEONATO C INNER JOIN
                                          USUARIOJOGO UJ ON (UJ.CODIGOCAMPEONATO = C.CODIGOCAMPEONATO) INNER JOIN
                                          USUARIOCAMPEONATO UC ON (UC.CODIGOCAMPEONATO = UJ.CODIGOCAMPEONATO AND
                                                                   UC.CODIGOUSUARIO = UJ.CODIGOUSUARIO) INNER JOIN
                                          USUARIO U ON (U.CODIGOUSUARIO = UJ.CODIGOUSUARIO) INNER JOIN
                                          JOGO J ON (J.CODIGOCAMPEONATO = UJ.CODIGOCAMPEONATO AND
                                                     J.CODIGOJOGO = UJ.CODIGOJOGO)
                                    WHERE C.CODIGOCAMPEONATO = @CodigoCampeonato
                                      AND UC.USUARIOPAGOUAPOSTA = 1
                                    GROUP BY U.NOMEUSUARIO) U
                            GROUP BY U.PONTUACAO) U) P,
                  (SELECT SUM(CASE WHEN T.POSICAO = 1 THEN T.TOTAL
                                   ELSE 0
                              END) AS TOTALPOSICAO1,
                          SUM(CASE WHEN T.POSICAO = 2 THEN T.TOTAL
                                   ELSE 0
                              END) AS TOTALPOSICAO2,
                          SUM(CASE WHEN T.POSICAO = 3 THEN T.TOTAL
                                   ELSE 0
                              END) AS TOTALPOSICAO3
                     FROM (SELECT ROW_NUMBER() OVER(ORDER BY(9999999999 - U.PONTUACAO)) AS POSICAO,
                                  U.PONTUACAO,
                                  U.TOTAL
                             FROM (SELECT U.PONTUACAO,
                                          COUNT(1) AS TOTAL
                                     FROM (SELECT U.NOMEUSUARIO,
                                                  SUM(CASE WHEN (UJ.CODIGOTIME1 = J.CODIGOTIME1) AND
                                                                (UJ.CODIGOTIME2 = J.CODIGOTIME2) AND
                                                                (UJ.TOTALGOL1 = J.TOTALGOL1) AND
                                                                (UJ.TOTALGOL2 = J.TOTALGOL2) THEN C.PONTUACAOACERTOEXATO
                                                           WHEN (UJ.CODIGOTIME1 = J.CODIGOTIME1) AND
                                                                (UJ.CODIGOTIME2 = J.CODIGOTIME2) AND
                                                                (((UJ.TOTALGOL1 > UJ.TOTALGOL2) AND
                                                                  (J.TOTALGOL1 > J.TOTALGOL2)) OR
                                                                 ((UJ.TOTALGOL1 < UJ.TOTALGOL2) AND
                                                                  (J.TOTALGOL1 < J.TOTALGOL2)) OR
                                                                 ((UJ.TOTALGOL1 = UJ.TOTALGOL2) AND
                                                                  (J.TOTALGOL1 = J.TOTALGOL2))) THEN C.PONTUACAOACERTOPARCIAL
                                                           ELSE 0
                                                      END) AS PONTUACAO
                                             FROM CAMPEONATO C INNER JOIN
                                                  USUARIOJOGO UJ ON (UJ.CODIGOCAMPEONATO = C.CODIGOCAMPEONATO) INNER JOIN
                                                  USUARIOCAMPEONATO UC ON (UC.CODIGOCAMPEONATO = UJ.CODIGOCAMPEONATO AND
                                                                           UC.CODIGOUSUARIO = UJ.CODIGOUSUARIO) INNER JOIN
                                                  USUARIO U ON (U.CODIGOUSUARIO = UJ.CODIGOUSUARIO) INNER JOIN
                                                  JOGO J ON (J.CODIGOCAMPEONATO = UJ.CODIGOCAMPEONATO AND
                                                             J.CODIGOJOGO = UJ.CODIGOJOGO)
                                            WHERE C.CODIGOCAMPEONATO = @CodigoCampeonato
                                              AND UC.USUARIOPAGOUAPOSTA = 1
                                            GROUP BY U.NOMEUSUARIO) U
                                    GROUP BY U.PONTUACAO) U) T
                    WHERE T.POSICAO BETWEEN 1 AND 3) T
            WHERE C.CODIGOCAMPEONATO = @CodigoCampeonato
              AND P.PONTUACAO = U.PONTUACAO) U
    ORDER BY U.POSICAO,
          U.NOMEUSUARIO
END
GO


-- spConClassificacao
IF (EXISTS (SELECT 1 FROM sys.objects WHERE name = 'spConClassificacao'))
DROP PROCEDURE [dbo].[spConClassificacao]
GO
CREATE PROCEDURE [dbo].[spConClassificacao]
(
   @CodigoCampeonato NUMERIC(10),
   @CodigoFase       NUMERIC(10)
)
AS
BEGIN
   SELECT C.CLASSIFICACAO,
          C.DESCRICAO,
          COALESCE(CAST(C.PG AS VARCHAR(10)), 'PG') AS PG,
          COALESCE(CAST(C.J AS VARCHAR(10)), 'J') AS J,
          COALESCE(CAST(C.V AS VARCHAR(10)), 'V') AS V,
          COALESCE(CAST(C.E AS VARCHAR(10)), 'E') AS E,
          COALESCE(CAST(C.GP AS VARCHAR(10)), 'GP') AS GP,
          COALESCE(CAST(C.GC AS VARCHAR(10)), 'GC') AS GC,
          COALESCE(CAST(C.GP - C.GC AS VARCHAR(10)), 'SG') AS SG,
          C.CODIGOTIME
     FROM (SELECT DESCRICAOGRUPO AS CLASSIFICACAO,
                  NULL AS DESCRICAO,
                  NULL AS PG,
                  NULL AS J,
                  NULL AS V,
                  NULL AS E,
                  NULL AS GP,
                  NULL AS GC,
                  NULL AS CODIGOTIME,
                  RIGHT('0000000000' + CAST(ORDEMGRUPO AS VARCHAR(10)), 10) + '00000000000000000000' AS ORDEM
             FROM GRUPO
            UNION ALL
           SELECT CAST(GT.CLASSIFICACAOTIME AS VARCHAR(10)) + 'º' AS CLASSIFICACAO,
                  T.NOMETIME AS DESCRICAO,
                  SUM(CASE WHEN J.CODIGOTIME1 = GT.CODIGOTIME THEN CASE WHEN (J.TOTALGOL1 IS NULL) OR (J.TOTALGOL2 IS NULL) THEN 0
                                                                        WHEN J.TOTALGOL1 > J.TOTALGOL2 THEN C.PONTUACAOVITORIA
                                                                        WHEN J.TOTALGOL1 < J.TOTALGOL2 THEN C.PONTUACAODERROTA
                                                                        ELSE C.PONTUACAOEMPATE
                                                                   END
                           ELSE CASE WHEN (J.TOTALGOL1 IS NULL) OR (J.TOTALGOL2 IS NULL) THEN 0
                                     WHEN J.TOTALGOL2 > J.TOTALGOL1 THEN C.PONTUACAOVITORIA
                                     WHEN J.TOTALGOL2 < J.TOTALGOL1 THEN C.PONTUACAODERROTA
                                     ELSE C.PONTUACAOEMPATE
                                END
                      END) AS PG,
                  SUM(CASE WHEN (J.TOTALGOL1 IS NULL) OR (J.TOTALGOL2 IS NULL) THEN 0
                           ELSE 1
                      END) AS J,
                  SUM(CASE WHEN J.CODIGOTIME1 = GT.CODIGOTIME THEN CASE WHEN J.TOTALGOL1 > J.TOTALGOL2 THEN 1
                                                                        ELSE 0
                                                                   END
                           ELSE CASE WHEN J.TOTALGOL2 > J.TOTALGOL1 THEN 1
                                     ELSE 0
                                END
                      END) AS V,
                  SUM(CASE WHEN J.TOTALGOL1 = J.TOTALGOL2 THEN 1
                           ELSE 0
                      END) AS E,
                  SUM(CASE WHEN J.CODIGOTIME1 = GT.CODIGOTIME THEN COALESCE(J.TOTALGOL1, 0)
                           ELSE COALESCE(J.TOTALGOL2, 0)
                      END) AS GP,
                  SUM(CASE WHEN J.CODIGOTIME1 = GT.CODIGOTIME THEN COALESCE(J.TOTALGOL2, 0)
                           ELSE COALESCE(J.TOTALGOL1, 0)
                      END) AS GC,
                  GT.CODIGOTIME,
                  RIGHT('0000000000' + CAST(G.ORDEMGRUPO AS VARCHAR(10)), 10) + RIGHT('0000000000' + CAST(GT.CLASSIFICACAOTIME AS VARCHAR(10)), 10) + RIGHT('0000000000' + CAST(GT.ORDEMTIME AS VARCHAR(10)), 10) AS ORDEM
             FROM CAMPEONATO C INNER JOIN
                  GRUPOTIME GT ON (GT.CODIGOCAMPEONATO = C.CODIGOCAMPEONATO) INNER JOIN
                  GRUPO G ON (G.CODIGOCAMPEONATO = GT.CODIGOCAMPEONATO AND
                              G.CODIGOGRUPO = GT.CODIGOGRUPO) INNER JOIN
                  TIME T ON (T.CODIGOTIME = GT.CODIGOTIME) INNER JOIN
                  JOGO J ON (J.CODIGOCAMPEONATO = GT.CODIGOCAMPEONATO AND
                             ((J.CODIGOTIME1 = GT.CODIGOTIME) OR (J.CODIGOTIME2 = GT.CODIGOTIME)))
            WHERE C.CODIGOCAMPEONATO = @CodigoCampeonato
              AND J.CODIGOFASE = @CodigoFase
            GROUP BY G.DESCRICAOGRUPO,
                  T.NOMETIME,
                  GT.CODIGOTIME,
                  G.ORDEMGRUPO,
                  GT.CLASSIFICACAOTIME,
                  GT.ORDEMTIME) C
    ORDER BY C.ORDEM
END
GO


-- spConClassificacaoU
IF (EXISTS (SELECT 1 FROM sys.objects WHERE name = 'spConClassificacaoU'))
DROP PROCEDURE [dbo].[spConClassificacaoU]
GO
CREATE PROCEDURE [dbo].[spConClassificacaoU]
(
   @CodigoUsuario    VARCHAR(256),
   @CodigoCampeonato NUMERIC(10),
   @CodigoFase       NUMERIC(10)
)
AS
BEGIN
   INSERT INTO USUARIOJOGO (
          CODIGOUSUARIO,
          CODIGOCAMPEONATO,
          CODIGOJOGO,
          CODIGOTIME1,
          CODIGOTIME2
   )
   SELECT @CodigoUsuario AS CODIGOUSUARIO,
          J.CODIGOCAMPEONATO,
          J.CODIGOJOGO,
          CASE WHEN J.CODIGOREGRA1 IS NULL THEN J.CODIGOTIME1
               ELSE NULL
          END AS CODIGOTIME1,
          CASE WHEN J.CODIGOREGRA2 IS NULL THEN J.CODIGOTIME2
               ELSE NULL
          END AS CODIGOTIME2
     FROM JOGO J
    WHERE J.CODIGOCAMPEONATO = 1
      AND NOT EXISTS (SELECT 1
                        FROM USUARIOJOGO UJ
                       WHERE UJ.CODIGOUSUARIO = @CodigoUsuario
                         AND UJ.CODIGOCAMPEONATO = J.CODIGOCAMPEONATO
                         AND UJ.CODIGOJOGO = J.CODIGOJOGO)
      AND EXISTS (SELECT 1
                    FROM USUARIO U
                   WHERE U.CODIGOUSUARIO = @CodigoUsuario)

   INSERT INTO USUARIOGRUPOTIME (
          CODIGOUSUARIO,
          CODIGOCAMPEONATO,
          CODIGOGRUPO,
          CODIGOTIME,
          CLASSIFICACAOTIME
   )
   SELECT @CodigoUsuario AS CODIGOUSUARIO,
          GT.CODIGOCAMPEONATO,
          GT.CODIGOGRUPO,
          GT.CODIGOTIME,
          GT.ORDEMTIME AS CLASSIFICACAOTIME
     FROM GRUPOTIME GT
    WHERE GT.CODIGOCAMPEONATO = 1
      AND NOT EXISTS (SELECT 1
                        FROM USUARIOGRUPOTIME UGT
                       WHERE UGT.CODIGOUSUARIO = @CodigoUsuario
                         AND UGT.CODIGOCAMPEONATO = GT.CODIGOCAMPEONATO
                         AND UGT.CODIGOGRUPO = GT.CODIGOGRUPO
                         AND UGT.CODIGOTIME = GT.CODIGOTIME)
      AND EXISTS (SELECT 1
                    FROM USUARIO U
                   WHERE U.CODIGOUSUARIO = @CodigoUsuario)

   SELECT C.CLASSIFICACAO,
          C.DESCRICAO,
          COALESCE(CAST(C.PG AS VARCHAR(10)), 'PG') AS PG,
          COALESCE(CAST(C.J AS VARCHAR(10)), 'J') AS J,
          COALESCE(CAST(C.V AS VARCHAR(10)), 'V') AS V,
          COALESCE(CAST(C.E AS VARCHAR(10)), 'E') AS E,
          COALESCE(CAST(C.GP AS VARCHAR(10)), 'GP') AS GP,
          COALESCE(CAST(C.GC AS VARCHAR(10)), 'GC') AS GC,
          COALESCE(CAST(C.GP - C.GC AS VARCHAR(10)), 'SG') AS SG,
          C.CODIGOTIME
     FROM (SELECT DESCRICAOGRUPO AS CLASSIFICACAO,
                  NULL AS DESCRICAO,
                  NULL AS PG,
                  NULL AS J,
                  NULL AS V,
                  NULL AS E,
                  NULL AS GP,
                  NULL AS GC,
                  NULL AS CODIGOTIME,
                  RIGHT('0000000000' + CAST(ORDEMGRUPO AS VARCHAR(10)), 10) + '00000000000000000000' AS ORDEM
             FROM GRUPO
            UNION ALL
           SELECT CAST(UGT.CLASSIFICACAOTIME AS VARCHAR(10)) + 'º' AS CLASSIFICACAO,
                  T.NOMETIME AS DESCRICAO,
                  SUM(CASE WHEN UJ.CODIGOTIME1 = UGT.CODIGOTIME THEN CASE WHEN (UJ.TOTALGOL1 IS NULL) OR (UJ.TOTALGOL2 IS NULL) THEN 0
                                                                          WHEN UJ.TOTALGOL1 > UJ.TOTALGOL2 THEN C.PONTUACAOVITORIA
                                                                          WHEN UJ.TOTALGOL1 < UJ.TOTALGOL2 THEN C.PONTUACAODERROTA
                                                                          ELSE C.PONTUACAOEMPATE
                                                                     END
                           ELSE CASE WHEN (UJ.TOTALGOL1 IS NULL) OR (UJ.TOTALGOL2 IS NULL) THEN 0
                                     WHEN UJ.TOTALGOL2 > UJ.TOTALGOL1 THEN C.PONTUACAOVITORIA
                                     WHEN UJ.TOTALGOL2 < UJ.TOTALGOL1 THEN C.PONTUACAODERROTA
                                     ELSE C.PONTUACAOEMPATE
                                END
                      END) AS PG,
                  SUM(CASE WHEN (UJ.TOTALGOL1 IS NULL) OR (UJ.TOTALGOL2 IS NULL) THEN 0
                           ELSE 1
                      END) AS J,
                  SUM(CASE WHEN UJ.CODIGOTIME1 = UGT.CODIGOTIME THEN CASE WHEN UJ.TOTALGOL1 > UJ.TOTALGOL2 THEN 1
                                                                          ELSE 0
                                                                     END
                           ELSE CASE WHEN UJ.TOTALGOL2 > UJ.TOTALGOL1 THEN 1
                                     ELSE 0
                                END
                      END) AS V,
                  SUM(CASE WHEN UJ.TOTALGOL1 = UJ.TOTALGOL2 THEN 1
                           ELSE 0
                      END) AS E,
                  SUM(CASE WHEN UJ.CODIGOTIME1 = UGT.CODIGOTIME THEN COALESCE(UJ.TOTALGOL1, 0)
                           ELSE COALESCE(UJ.TOTALGOL2, 0)
                      END) AS GP,
                  SUM(CASE WHEN UJ.CODIGOTIME1 = UGT.CODIGOTIME THEN COALESCE(UJ.TOTALGOL2, 0)
                           ELSE COALESCE(UJ.TOTALGOL1, 0)
                      END) AS GC,
                  UGT.CODIGOTIME,
                  RIGHT('0000000000' + CAST(G.ORDEMGRUPO AS VARCHAR(10)), 10) + RIGHT('0000000000' + CAST(UGT.CLASSIFICACAOTIME AS VARCHAR(10)), 10) + RIGHT('0000000000' + CAST(GT.ORDEMTIME AS VARCHAR(10)), 10) AS ORDEM
             FROM CAMPEONATO C INNER JOIN
                  USUARIOGRUPOTIME UGT ON (UGT.CODIGOUSUARIO = @CodigoUsuario AND
                                           UGT.CODIGOCAMPEONATO = C.CODIGOCAMPEONATO) INNER JOIN
                  GRUPOTIME GT ON (GT.CODIGOCAMPEONATO = UGT.CODIGOCAMPEONATO AND
                                   GT.CODIGOGRUPO = UGT.CODIGOGRUPO AND
                                   GT.CODIGOTIME = UGT.CODIGOTIME) INNER JOIN
                  GRUPO G ON (G.CODIGOCAMPEONATO = UGT.CODIGOCAMPEONATO AND
                              G.CODIGOGRUPO = UGT.CODIGOGRUPO) INNER JOIN
                  TIME T ON (T.CODIGOTIME = UGT.CODIGOTIME) INNER JOIN
                  USUARIOJOGO UJ ON (UJ.CODIGOUSUARIO = UGT.CODIGOUSUARIO AND
                                     UJ.CODIGOCAMPEONATO = UGT.CODIGOCAMPEONATO AND
                                     ((UJ.CODIGOTIME1 = UGT.CODIGOTIME) OR (UJ.CODIGOTIME2 = UGT.CODIGOTIME))) INNER JOIN
                  JOGO J ON (J.CODIGOCAMPEONATO = UJ.CODIGOCAMPEONATO AND
                             J.CODIGOJOGO = UJ.CODIGOJOGO)
            WHERE C.CODIGOCAMPEONATO = @CodigoCampeonato
              AND J.CODIGOFASE = @CodigoFase
            GROUP BY G.DESCRICAOGRUPO,
                  T.NOMETIME,
                  UGT.CODIGOTIME,
                  G.ORDEMGRUPO,
                  UGT.CLASSIFICACAOTIME,
                  GT.ORDEMTIME) C
    ORDER BY C.ORDEM
END
GO


-- spConJogo
IF (EXISTS (SELECT 1 FROM sys.objects WHERE name = 'spConJogo'))
DROP PROCEDURE [dbo].[spConJogo]
GO
CREATE PROCEDURE [dbo].[spConJogo]
(
   @CodigoCampeonato NUMERIC(10),
   @CodigoFase       NUMERIC(10),
   @CodigoRodada     NUMERIC(10)
)
AS
BEGIN
   SELECT (SELECT DISTINCT
                  GT.CODIGOGRUPO
             FROM FASE F,
                  GRUPOTIME GT
            WHERE F.CODIGOCAMPEONATO = J.CODIGOCAMPEONATO
              AND F.CODIGOFASE = J.CODIGOFASE
              AND F.TIPOFASE = 1
              AND GT.CODIGOCAMPEONATO = J.CODIGOCAMPEONATO
              AND GT.CODIGOTIME IN (J.CODIGOTIME1, J.CODIGOTIME2)) AS CODIGOGRUPO,
          J.CODIGOJOGO,
          SUBSTRING(CONVERT(VARCHAR(10), J.HORARIOJOGO, 103), 1, 5) + ' ' + SUBSTRING(CONVERT(VARCHAR(8), J.HORARIOJOGO, 108), 1, 5) AS HORARIO,
          COALESCE(T1.NOMETIME, R1.DESCRICAOREGRA) AS NOMETIME1,
          J.TOTALGOL1,
          J.TOTALGOL2,
          COALESCE(T2.NOMETIME, R2.DESCRICAOREGRA) AS NOMETIME2,
          J.CODIGOTIME1,
          J.CODIGOTIME2
     FROM JOGO J LEFT OUTER JOIN
          REGRA R1 ON (R1.CODIGOREGRA = J.CODIGOREGRA1) LEFT OUTER JOIN
          TIME T1 ON (T1.CODIGOTIME = J.CODIGOTIME1) LEFT OUTER JOIN
          REGRA R2 ON (R2.CODIGOREGRA = J.CODIGOREGRA2) LEFT OUTER JOIN
          TIME T2 ON (T2.CODIGOTIME = J.CODIGOTIME2)
    WHERE J.CODIGOCAMPEONATO = @CodigoCampeonato
      AND J.CODIGOFASE = @CodigoFase
      AND COALESCE(J.CODIGORODADA, -1) = COALESCE(@CodigoRodada, COALESCE(J.CODIGORODADA, -1))
    ORDER BY J.CODIGOJOGO
END
GO


-- spConJogoU
IF (EXISTS (SELECT 1 FROM sys.objects WHERE name = 'spConJogoU'))
DROP PROCEDURE [dbo].[spConJogoU]
GO
CREATE PROCEDURE [dbo].[spConJogoU]
(
   @CodigoUsuario    VARCHAR(256),
   @CodigoCampeonato NUMERIC(10),
   @CodigoFase       NUMERIC(10),
   @CodigoRodada     NUMERIC(10)
)
AS
BEGIN
   SELECT (SELECT DISTINCT
                  UGT.CODIGOGRUPO
             FROM FASE F,
                  USUARIOGRUPOTIME UGT
            WHERE F.CODIGOCAMPEONATO = J.CODIGOCAMPEONATO
              AND F.CODIGOFASE = J.CODIGOFASE
              AND F.TIPOFASE = 1
              AND UGT.CODIGOUSUARIO = UJ.CODIGOUSUARIO
              AND UGT.CODIGOCAMPEONATO = UJ.CODIGOCAMPEONATO
              AND UGT.CODIGOTIME IN (UJ.CODIGOTIME1, UJ.CODIGOTIME2)) AS CODIGOGRUPO,
          UJ.CODIGOJOGO,
          SUBSTRING(CONVERT(VARCHAR(10), J.HORARIOJOGO, 103), 1, 5) + ' ' + SUBSTRING(CONVERT(VARCHAR(8), J.HORARIOJOGO, 108), 1, 5) AS HORARIO,
          COALESCE(T1.NOMETIME, R1.DESCRICAOREGRA) AS NOMETIME1,
          UJ.TOTALGOL1,
          UJ.TOTALGOL2,
          COALESCE(T2.NOMETIME, R2.DESCRICAOREGRA) AS NOMETIME2,
          UJ.CODIGOTIME1,
          UJ.CODIGOTIME2,
          CASE WHEN ((J.TOTALGOL1 IS NULL) OR (J.TOTALGOL2 IS NULL)) THEN NULL
               ELSE CASE WHEN (UJ.CODIGOTIME1 = J.CODIGOTIME1) AND
                              (UJ.CODIGOTIME2 = J.CODIGOTIME2) AND
                              (UJ.TOTALGOL1 = J.TOTALGOL1) AND
                              (UJ.TOTALGOL2 = J.TOTALGOL2) THEN 'total'
                         WHEN (UJ.CODIGOTIME1 = J.CODIGOTIME1) AND
                              (UJ.CODIGOTIME2 = J.CODIGOTIME2) AND
                              (((UJ.TOTALGOL1 > UJ.TOTALGOL2) AND
                                (J.TOTALGOL1 > J.TOTALGOL2)) OR
                               ((UJ.TOTALGOL1 < UJ.TOTALGOL2) AND
                                (J.TOTALGOL1 < J.TOTALGOL2)) OR
                               ((UJ.TOTALGOL1 = UJ.TOTALGOL2) AND
                                (J.TOTALGOL1 = J.TOTALGOL2))) THEN 'partial'
                         ELSE 'never'
                    END
          END AS PONTUACAO,
          CASE WHEN ((J.TOTALGOL1 IS NULL) OR (J.TOTALGOL2 IS NULL)) THEN NULL
               ELSE CASE WHEN (UJ.CODIGOTIME1 = J.CODIGOTIME1) AND
                              (UJ.CODIGOTIME2 = J.CODIGOTIME2) AND
                              (UJ.TOTALGOL1 = J.TOTALGOL1) AND
                              (UJ.TOTALGOL2 = J.TOTALGOL2) THEN 'Pontuação total: ' + CAST(C.PONTUACAOACERTOEXATO AS VARCHAR(10)) + ' ponto(s)'
                         WHEN (UJ.CODIGOTIME1 = J.CODIGOTIME1) AND
                              (UJ.CODIGOTIME2 = J.CODIGOTIME2) AND
                              (((UJ.TOTALGOL1 > UJ.TOTALGOL2) AND
                                (J.TOTALGOL1 > J.TOTALGOL2)) OR
                               ((UJ.TOTALGOL1 < UJ.TOTALGOL2) AND
                                (J.TOTALGOL1 < J.TOTALGOL2)) OR
                               ((UJ.TOTALGOL1 = UJ.TOTALGOL2) AND
                                (J.TOTALGOL1 = J.TOTALGOL2))) THEN 'Pontuação partial: ' + CAST(C.PONTUACAOACERTOPARCIAL AS VARCHAR(10)) + ' ponto(s)' + CHAR(13) + CHAR(10) + 'Resultado do jogo: ' + T11.NOMETIME + ' ' + CAST(J.TOTALGOL1 AS VARCHAR(10)) + ' X ' + CAST(J.TOTALGOL2 AS VARCHAR(10)) + ' ' + T22.NOMETIME
                         ELSE 'Nenhum ponto conquistado' + CHAR(13) + CHAR(10) + 'Resultado do jogo: ' + T11.NOMETIME + ' ' + CAST(J.TOTALGOL1 AS VARCHAR(10)) + ' X ' + CAST(J.TOTALGOL2 AS VARCHAR(10)) + ' ' + T22.NOMETIME
                    END
          END AS TOOLTIP
     FROM CAMPEONATO C INNER JOIN
          USUARIOJOGO UJ ON (UJ.CODIGOCAMPEONATO = C.CODIGOCAMPEONATO) INNER JOIN
          JOGO J ON (J.CODIGOCAMPEONATO = UJ.CODIGOCAMPEONATO AND
                     J.CODIGOJOGO = UJ.CODIGOJOGO) LEFT OUTER JOIN
          REGRA R1 ON (R1.CODIGOREGRA = J.CODIGOREGRA1) LEFT OUTER JOIN
          TIME T1 ON (T1.CODIGOTIME = UJ.CODIGOTIME1) LEFT OUTER JOIN
          REGRA R2 ON (R2.CODIGOREGRA = J.CODIGOREGRA2) LEFT OUTER JOIN
          TIME T2 ON (T2.CODIGOTIME = UJ.CODIGOTIME2) LEFT OUTER JOIN
          TIME T11 ON (T11.CODIGOTIME = J.CODIGOTIME1) LEFT OUTER JOIN
          TIME T22 ON (T22.CODIGOTIME = J.CODIGOTIME2)
    WHERE C.CODIGOCAMPEONATO = @CodigoCampeonato
      AND UJ.CODIGOUSUARIO = @CodigoUsuario
      AND J.CODIGOFASE = @CodigoFase
      AND COALESCE(J.CODIGORODADA, -1) = COALESCE(@CodigoRodada, COALESCE(J.CODIGORODADA, -1))
    ORDER BY UJ.CODIGOJOGO
END
GO


-- spConCampeonatoU
IF (EXISTS (SELECT 1 FROM sys.objects WHERE name = 'spConCampeonatoU'))
DROP PROCEDURE [dbo].[spConCampeonatoU]
GO
CREATE PROCEDURE [dbo].[spConCampeonatoU]
(
   @CodigoCampeonato NUMERIC(10)
)
AS
BEGIN
   SELECT U.CODIGOUSUARIO,
          U.NOMEUSUARIO,
          (SELECT COUNT(1)
             FROM USUARIOJOGO UJ
            WHERE UJ.CODIGOUSUARIO = UC.CODIGOUSUARIO
              AND UJ.CODIGOCAMPEONATO = UJ.CODIGOCAMPEONATO
              AND ((UJ.TOTALGOL1 IS NULL) OR (UJ.TOTALGOL2 IS NULL))) AS TOTALJOGOPENDENTE,
          CAST(UC.USUARIOACEITOUREGULAMENTO AS BIT) AS USUARIOACEITOUREGULAMENTO,
          CAST(UC.USUARIOIMPRIMIUAPOSTA AS BIT) AS USUARIOIMPRIMIUAPOSTA,
          CAST(UC.USUARIOPAGOUAPOSTA AS BIT) AS USUARIOPAGOUAPOSTA
     FROM USUARIOCAMPEONATO UC INNER JOIN
          USUARIO U ON (U.CODIGOUSUARIO = UC.CODIGOUSUARIO)
    WHERE UC.CODIGOCAMPEONATO = @CodigoCampeonato
    ORDER BY U.NOMEUSUARIO
END
GO


-- vwUSUARIOPONTUACAO
IF (EXISTS (SELECT 1 FROM sys.objects WHERE name = 'vwUSUARIOPONTUACAO'))
DROP VIEW [dbo].[vwUSUARIOPONTUACAO]
GO
CREATE VIEW [dbo].[vwUSUARIOPONTUACAO]
AS
SELECT C.CODIGOCAMPEONATO,
       UJ.CODIGOUSUARIO,
       U.NOMEUSUARIO,
       SUM(CASE WHEN (UJ.CODIGOTIME1 = J.CODIGOTIME1) AND
                     (UJ.CODIGOTIME2 = J.CODIGOTIME2) AND
                     (UJ.TOTALGOL1 = J.TOTALGOL1) AND
                     (UJ.TOTALGOL2 = J.TOTALGOL2) THEN C.PONTUACAOACERTOEXATO
                WHEN (UJ.CODIGOTIME1 = J.CODIGOTIME1) AND
                     (UJ.CODIGOTIME2 = J.CODIGOTIME2) AND
                     (((UJ.TOTALGOL1 > UJ.TOTALGOL2) AND
                       (J.TOTALGOL1 > J.TOTALGOL2)) OR
                      ((UJ.TOTALGOL1 < UJ.TOTALGOL2) AND
                       (J.TOTALGOL1 < J.TOTALGOL2)) OR
                      ((UJ.TOTALGOL1 = UJ.TOTALGOL2) AND
                       (J.TOTALGOL1 = J.TOTALGOL2))) THEN C.PONTUACAOACERTOPARCIAL
                ELSE 0
           END) AS PONTUACAOATUAL,
       SUM(CASE WHEN J.HORARIOJOGO >= CONVERT(DATETIME, RIGHT('00' + CAST(DATEPART(DAY, GETDATE()) AS VARCHAR(2)), 2) + '/' + RIGHT('00' + CAST(DATEPART(MONTH, GETDATE()) AS VARCHAR(2)), 2) + '/' + RIGHT('0000' + CAST(DATEPART(YEAR, GETDATE()) AS VARCHAR(4)), 4) + ' 00:00:00', 103) THEN 0
                ELSE CASE WHEN (UJ.CODIGOTIME1 = J.CODIGOTIME1) AND
                               (UJ.CODIGOTIME2 = J.CODIGOTIME2) AND
                               (UJ.TOTALGOL1 = J.TOTALGOL1) AND
                               (UJ.TOTALGOL2 = J.TOTALGOL2) THEN C.PONTUACAOACERTOEXATO
                          WHEN (UJ.CODIGOTIME1 = J.CODIGOTIME1) AND
                               (UJ.CODIGOTIME2 = J.CODIGOTIME2) AND
                               (((UJ.TOTALGOL1 > UJ.TOTALGOL2) AND
                                 (J.TOTALGOL1 > J.TOTALGOL2)) OR
                                ((UJ.TOTALGOL1 < UJ.TOTALGOL2) AND
                                 (J.TOTALGOL1 < J.TOTALGOL2)) OR
                                ((UJ.TOTALGOL1 = UJ.TOTALGOL2) AND
                                 (J.TOTALGOL1 = J.TOTALGOL2))) THEN C.PONTUACAOACERTOPARCIAL
                          ELSE 0
                     END
           END) AS PONTUACAOANTERIOR
  FROM CAMPEONATO C INNER JOIN
       USUARIOJOGO UJ ON (UJ.CODIGOCAMPEONATO = C.CODIGOCAMPEONATO) INNER JOIN
       USUARIOCAMPEONATO UC ON (UC.CODIGOCAMPEONATO = UJ.CODIGOCAMPEONATO AND
                                UC.CODIGOUSUARIO = UJ.CODIGOUSUARIO) INNER JOIN
       USUARIO U ON (U.CODIGOUSUARIO = UJ.CODIGOUSUARIO) INNER JOIN
       JOGO J ON (J.CODIGOCAMPEONATO = UJ.CODIGOCAMPEONATO AND
                  J.CODIGOJOGO = UJ.CODIGOJOGO)
 WHERE UC.USUARIOPAGOUAPOSTA = 1
 GROUP BY C.CODIGOCAMPEONATO,
       UJ.CODIGOUSUARIO,
       U.NOMEUSUARIO
GO


-- vwPOSICAOATUAL
IF (EXISTS (SELECT 1 FROM sys.objects WHERE name = 'vwPOSICAOATUAL'))
DROP VIEW [dbo].[vwPOSICAOATUAL]
GO
CREATE VIEW [dbo].[vwPOSICAOATUAL]
AS
SELECT U.CODIGOCAMPEONATO,
       ROW_NUMBER() OVER(ORDER BY(9999999999 - U.PONTUACAO)) AS POSICAO,
       U.PONTUACAO,
       U.TOTAL
  FROM (SELECT U.CODIGOCAMPEONATO,
               U.PONTUACAO,
               COUNT(1) AS TOTAL
          FROM (SELECT C.CODIGOCAMPEONATO,
                       U.NOMEUSUARIO,
                       SUM(CASE WHEN (UJ.CODIGOTIME1 = J.CODIGOTIME1) AND
                                     (UJ.CODIGOTIME2 = J.CODIGOTIME2) AND
                                     (UJ.TOTALGOL1 = J.TOTALGOL1) AND
                                     (UJ.TOTALGOL2 = J.TOTALGOL2) THEN C.PONTUACAOACERTOEXATO
                                WHEN (UJ.CODIGOTIME1 = J.CODIGOTIME1) AND
                                     (UJ.CODIGOTIME2 = J.CODIGOTIME2) AND
                                     (((UJ.TOTALGOL1 > UJ.TOTALGOL2) AND
                                       (J.TOTALGOL1 > J.TOTALGOL2)) OR
                                      ((UJ.TOTALGOL1 < UJ.TOTALGOL2) AND
                                       (J.TOTALGOL1 < J.TOTALGOL2)) OR
                                      ((UJ.TOTALGOL1 = UJ.TOTALGOL2) AND
                                       (J.TOTALGOL1 = J.TOTALGOL2))) THEN C.PONTUACAOACERTOPARCIAL
                                ELSE 0
                           END) AS PONTUACAO
                  FROM CAMPEONATO C INNER JOIN
                       USUARIOJOGO UJ ON (UJ.CODIGOCAMPEONATO = C.CODIGOCAMPEONATO) INNER JOIN
                       USUARIOCAMPEONATO UC ON (UC.CODIGOCAMPEONATO = UJ.CODIGOCAMPEONATO AND
                                                UC.CODIGOUSUARIO = UJ.CODIGOUSUARIO) INNER JOIN
                       USUARIO U ON (U.CODIGOUSUARIO = UJ.CODIGOUSUARIO) INNER JOIN
                       JOGO J ON (J.CODIGOCAMPEONATO = UJ.CODIGOCAMPEONATO AND
                                  J.CODIGOJOGO = UJ.CODIGOJOGO)
                 WHERE UC.USUARIOPAGOUAPOSTA = 1
                 GROUP BY C.CODIGOCAMPEONATO,
                       U.NOMEUSUARIO) U
         GROUP BY U.CODIGOCAMPEONATO,
               U.PONTUACAO) U
GO


-- vwPOSICAOANTERIOR
IF (EXISTS (SELECT 1 FROM sys.objects WHERE name = 'vwPOSICAOANTERIOR'))
DROP VIEW [dbo].[vwPOSICAOANTERIOR]
GO
CREATE VIEW [dbo].[vwPOSICAOANTERIOR]
AS
SELECT U.CODIGOCAMPEONATO,
       ROW_NUMBER() OVER(ORDER BY(9999999999 - U.PONTUACAO)) AS POSICAO,
       U.PONTUACAO,
       U.TOTAL
  FROM (SELECT U.CODIGOCAMPEONATO,
               U.PONTUACAO,
               COUNT(1) AS TOTAL
          FROM (SELECT C.CODIGOCAMPEONATO,
                       U.NOMEUSUARIO,
                       SUM(CASE WHEN J.HORARIOJOGO >= CONVERT(DATETIME, RIGHT('00' + CAST(DATEPART(DAY, GETDATE()) AS VARCHAR(2)), 2) + '/' + RIGHT('00' + CAST(DATEPART(MONTH, GETDATE()) AS VARCHAR(2)), 2) + '/' + RIGHT('0000' + CAST(DATEPART(YEAR, GETDATE()) AS VARCHAR(4)), 4) + ' 00:00:00', 103) THEN 0
                                ELSE CASE WHEN (UJ.CODIGOTIME1 = J.CODIGOTIME1) AND
                                               (UJ.CODIGOTIME2 = J.CODIGOTIME2) AND
                                               (UJ.TOTALGOL1 = J.TOTALGOL1) AND
                                               (UJ.TOTALGOL2 = J.TOTALGOL2) THEN C.PONTUACAOACERTOEXATO
                                          WHEN (UJ.CODIGOTIME1 = J.CODIGOTIME1) AND
                                               (UJ.CODIGOTIME2 = J.CODIGOTIME2) AND
                                               (((UJ.TOTALGOL1 > UJ.TOTALGOL2) AND
                                                 (J.TOTALGOL1 > J.TOTALGOL2)) OR
                                                ((UJ.TOTALGOL1 < UJ.TOTALGOL2) AND
                                                 (J.TOTALGOL1 < J.TOTALGOL2)) OR
                                                ((UJ.TOTALGOL1 = UJ.TOTALGOL2) AND
                                                 (J.TOTALGOL1 = J.TOTALGOL2))) THEN C.PONTUACAOACERTOPARCIAL
                                          ELSE 0
                                     END
                           END) AS PONTUACAO
                  FROM CAMPEONATO C INNER JOIN
                       USUARIOJOGO UJ ON (UJ.CODIGOCAMPEONATO = C.CODIGOCAMPEONATO) INNER JOIN
                       USUARIOCAMPEONATO UC ON (UC.CODIGOCAMPEONATO = UJ.CODIGOCAMPEONATO AND
                                                UC.CODIGOUSUARIO = UJ.CODIGOUSUARIO) INNER JOIN
                       USUARIO U ON (U.CODIGOUSUARIO = UJ.CODIGOUSUARIO) INNER JOIN
                       JOGO J ON (J.CODIGOCAMPEONATO = UJ.CODIGOCAMPEONATO AND
                                  J.CODIGOJOGO = UJ.CODIGOJOGO)
                 WHERE UC.USUARIOPAGOUAPOSTA = 1
                 GROUP BY C.CODIGOCAMPEONATO,
                       U.NOMEUSUARIO) U
         GROUP BY U.CODIGOCAMPEONATO,
               U.PONTUACAO) U
GO


-- vwPONTUACAOTOTAL
IF (EXISTS (SELECT 1 FROM sys.objects WHERE name = 'vwPONTUACAOTOTAL'))
DROP VIEW [dbo].[vwPONTUACAOTOTAL]
GO
CREATE VIEW [dbo].[vwPONTUACAOTOTAL]
AS
SELECT T.CODIGOCAMPEONATO,
       SUM(CASE WHEN T.POSICAO = 1 THEN T.TOTAL
                ELSE 0
           END) AS TOTALPOSICAO1,
       SUM(CASE WHEN T.POSICAO = 2 THEN T.TOTAL
                ELSE 0
           END) AS TOTALPOSICAO2,
       SUM(CASE WHEN T.POSICAO = 3 THEN T.TOTAL
                ELSE 0
           END) AS TOTALPOSICAO3
  FROM (SELECT U.CODIGOCAMPEONATO,
               ROW_NUMBER() OVER(ORDER BY(9999999999 - U.PONTUACAO)) AS POSICAO,
               U.PONTUACAO,
               U.TOTAL
          FROM (SELECT U.CODIGOCAMPEONATO,
                       U.PONTUACAO,
                       COUNT(1) AS TOTAL
                  FROM (SELECT C.CODIGOCAMPEONATO,
                               U.NOMEUSUARIO,
                               SUM(CASE WHEN (UJ.CODIGOTIME1 = J.CODIGOTIME1) AND
                                             (UJ.CODIGOTIME2 = J.CODIGOTIME2) AND
                                             (UJ.TOTALGOL1 = J.TOTALGOL1) AND
                                             (UJ.TOTALGOL2 = J.TOTALGOL2) THEN C.PONTUACAOACERTOEXATO
                                        WHEN (UJ.CODIGOTIME1 = J.CODIGOTIME1) AND
                                             (UJ.CODIGOTIME2 = J.CODIGOTIME2) AND
                                             (((UJ.TOTALGOL1 > UJ.TOTALGOL2) AND
                                               (J.TOTALGOL1 > J.TOTALGOL2)) OR
                                              ((UJ.TOTALGOL1 < UJ.TOTALGOL2) AND
                                               (J.TOTALGOL1 < J.TOTALGOL2)) OR
                                              ((UJ.TOTALGOL1 = UJ.TOTALGOL2) AND
                                               (J.TOTALGOL1 = J.TOTALGOL2))) THEN C.PONTUACAOACERTOPARCIAL
                                        ELSE 0
                                   END) AS PONTUACAO
                          FROM CAMPEONATO C INNER JOIN
                               USUARIOJOGO UJ ON (UJ.CODIGOCAMPEONATO = C.CODIGOCAMPEONATO) INNER JOIN
                               USUARIOCAMPEONATO UC ON (UC.CODIGOCAMPEONATO = UJ.CODIGOCAMPEONATO AND
                                                        UC.CODIGOUSUARIO = UJ.CODIGOUSUARIO) INNER JOIN
                               USUARIO U ON (U.CODIGOUSUARIO = UJ.CODIGOUSUARIO) INNER JOIN
                               JOGO J ON (J.CODIGOCAMPEONATO = UJ.CODIGOCAMPEONATO AND
                                          J.CODIGOJOGO = UJ.CODIGOJOGO)
                         WHERE UC.USUARIOPAGOUAPOSTA = 1
                         GROUP BY C.CODIGOCAMPEONATO,
                               U.NOMEUSUARIO) U
                 GROUP BY U.CODIGOCAMPEONATO,
                       U.PONTUACAO) U) T
 WHERE T.POSICAO BETWEEN 1 AND 3
 GROUP BY T.CODIGOCAMPEONATO
GO


-- spConRanking
IF (EXISTS (SELECT 1 FROM sys.objects WHERE name = 'spConRanking'))
DROP PROCEDURE [dbo].[spConRanking]
GO
CREATE PROCEDURE [dbo].[spConRanking]
(
   @CodigoCampeonato NUMERIC(10)
)
AS
BEGIN
   DECLARE @Arrecadacao NUMERIC(16,4)
   SET @Arrecadacao = 0
   
   SELECT @Arrecadacao = (SELECT COUNT(1)
                            FROM USUARIOCAMPEONATO UC
                           WHERE UC.CODIGOCAMPEONATO = C.CODIGOCAMPEONATO
                             AND UC.USUARIOPAGOUAPOSTA = 1) * C.VALORAPOSTA
     FROM CAMPEONATO C
    WHERE C.CODIGOCAMPEONATO = @CodigoCampeonato
   
   SELECT U.POSICAOATUAL AS POSICAO,
          U.CODIGOUSUARIO,
          U.NOMEUSUARIO,
          U.PONTUACAO,
          U.PERCENTUAL,
          ROUND(@Arrecadacao * (U.PERCENTUAL / 100), 2) AS VALOR,
          U.POSICAOANTERIOR - U.POSICAOATUAL AS STATUS
     FROM (SELECT P.POSICAO AS POSICAOATUAL,
                  A.POSICAO AS POSICAOANTERIOR,
                  U.CODIGOUSUARIO,
                  U.NOMEUSUARIO,
                  U.PONTUACAOATUAL AS PONTUACAO,
                  CASE WHEN (P.POSICAO = 1) AND (T.TOTALPOSICAO1 = 1) THEN C.PREMIOPOSICAO1
                       WHEN (P.POSICAO = 1) AND (T.TOTALPOSICAO1 = 2) THEN (C.PREMIOPOSICAO1 + C.PREMIOPOSICAO2) / 2
                       WHEN (P.POSICAO = 1) AND (T.TOTALPOSICAO1 > 2) THEN (C.PREMIOPOSICAO1 + C.PREMIOPOSICAO2 + C.PREMIOPOSICAO3) / CAST(T.TOTALPOSICAO1 AS FLOAT)
                       WHEN (P.POSICAO = 2) AND (T.TOTALPOSICAO2 = 1) THEN CASE WHEN (T.TOTALPOSICAO1 = 1) THEN C.PREMIOPOSICAO2
                                                                                WHEN (T.TOTALPOSICAO1 = 2) THEN C.PREMIOPOSICAO3
                                                                                ELSE 0
                                                                           END
                       WHEN (P.POSICAO = 2) AND (T.TOTALPOSICAO2 > 1) THEN CASE WHEN (T.TOTALPOSICAO1 = 1) THEN (C.PREMIOPOSICAO2 + C.PREMIOPOSICAO3) / CAST(T.TOTALPOSICAO2 AS FLOAT)
                                                                                WHEN (T.TOTALPOSICAO1 = 2) THEN C.PREMIOPOSICAO3 / CAST(T.TOTALPOSICAO2 AS FLOAT)
                                                                                ELSE 0
                                                                           END
                       WHEN (P.POSICAO = 3) AND (T.TOTALPOSICAO3 = 1) THEN CASE WHEN ((T.TOTALPOSICAO1 + T.TOTALPOSICAO2) = 2) THEN C.PREMIOPOSICAO3
                                                                                ELSE 0
                                                                           END
                       WHEN (P.POSICAO = 3) AND (T.TOTALPOSICAO3 > 1) THEN CASE WHEN ((T.TOTALPOSICAO1 + T.TOTALPOSICAO2) = 2) THEN C.PREMIOPOSICAO3 / CAST(T.TOTALPOSICAO3 AS FLOAT)
                                                                                ELSE 0
                                                                           END
                       ELSE 0
                  END AS PERCENTUAL
             FROM CAMPEONATO C,
                  vwUSUARIOPONTUACAO U,
                  vwPOSICAOATUAL P,
                  vwPOSICAOANTERIOR A,
                  vwPONTUACAOTOTAL T
            WHERE C.CODIGOCAMPEONATO = @CodigoCampeonato
              AND U.CODIGOCAMPEONATO = C.CODIGOCAMPEONATO
              AND P.CODIGOCAMPEONATO = U.CODIGOCAMPEONATO
              AND P.PONTUACAO = U.PONTUACAOATUAL
              AND A.CODIGOCAMPEONATO = U.CODIGOCAMPEONATO
              AND A.PONTUACAO = U.PONTUACAOANTERIOR
              AND T.CODIGOCAMPEONATO = C.CODIGOCAMPEONATO) U
    ORDER BY U.POSICAOATUAL,
          U.NOMEUSUARIO
END
GO


-- TIPOREGRA
INSERT INTO TIPOREGRA (TIPOREGRA, DESCRICAOTIPOREGRA) VALUES (4, 'Melhor da posição nos grupos');


-- REGRA
ALTER TABLE REGRA ADD
      CLASSIFICACAOGRUPO NUMERIC(10) NULL
GO


-- spConClassificacao
IF (EXISTS (SELECT 1 FROM sys.objects WHERE name = 'spConClassificacao'))
DROP PROCEDURE [dbo].[spConClassificacao]
GO
CREATE PROCEDURE [dbo].[spConClassificacao]
(
   @CodigoCampeonato NUMERIC(10),
   @CodigoFase       NUMERIC(10)
)
AS
BEGIN
   SELECT C.CLASSIFICACAO,
          C.DESCRICAO,
          COALESCE(CAST(C.PG AS VARCHAR(10)), 'PG') AS PG,
          COALESCE(CAST(C.J AS VARCHAR(10)), 'J') AS J,
          COALESCE(CAST(C.V AS VARCHAR(10)), 'V') AS V,
          COALESCE(CAST(C.E AS VARCHAR(10)), 'E') AS E,
          COALESCE(CAST(C.GP AS VARCHAR(10)), 'GP') AS GP,
          COALESCE(CAST(C.GC AS VARCHAR(10)), 'GC') AS GC,
          COALESCE(CAST(C.GP - C.GC AS VARCHAR(10)), 'SG') AS SG,
          C.CODIGOTIME
     FROM (SELECT DESCRICAOGRUPO AS CLASSIFICACAO,
                  NULL AS DESCRICAO,
                  NULL AS PG,
                  NULL AS J,
                  NULL AS V,
                  NULL AS E,
                  NULL AS GP,
                  NULL AS GC,
                  NULL AS CODIGOTIME,
                  RIGHT('0000000000' + CAST(ORDEMGRUPO AS VARCHAR(10)), 10) + '00000000000000000000' AS ORDEM
             FROM GRUPO
            WHERE CODIGOCAMPEONATO = @CodigoCampeonato
            UNION ALL
           SELECT CAST(GT.CLASSIFICACAOTIME AS VARCHAR(10)) + 'º' AS CLASSIFICACAO,
                  T.NOMETIME AS DESCRICAO,
                  SUM(CASE WHEN J.CODIGOTIME1 = GT.CODIGOTIME THEN CASE WHEN (J.TOTALGOL1 IS NULL) OR (J.TOTALGOL2 IS NULL) THEN 0
                                                                        WHEN J.TOTALGOL1 > J.TOTALGOL2 THEN C.PONTUACAOVITORIA
                                                                        WHEN J.TOTALGOL1 < J.TOTALGOL2 THEN C.PONTUACAODERROTA
                                                                        ELSE C.PONTUACAOEMPATE
                                                                   END
                           ELSE CASE WHEN (J.TOTALGOL1 IS NULL) OR (J.TOTALGOL2 IS NULL) THEN 0
                                     WHEN J.TOTALGOL2 > J.TOTALGOL1 THEN C.PONTUACAOVITORIA
                                     WHEN J.TOTALGOL2 < J.TOTALGOL1 THEN C.PONTUACAODERROTA
                                     ELSE C.PONTUACAOEMPATE
                                END
                      END) AS PG,
                  SUM(CASE WHEN (J.TOTALGOL1 IS NULL) OR (J.TOTALGOL2 IS NULL) THEN 0
                           ELSE 1
                      END) AS J,
                  SUM(CASE WHEN J.CODIGOTIME1 = GT.CODIGOTIME THEN CASE WHEN J.TOTALGOL1 > J.TOTALGOL2 THEN 1
                                                                        ELSE 0
                                                                   END
                           ELSE CASE WHEN J.TOTALGOL2 > J.TOTALGOL1 THEN 1
                                     ELSE 0
                                END
                      END) AS V,
                  SUM(CASE WHEN J.TOTALGOL1 = J.TOTALGOL2 THEN 1
                           ELSE 0
                      END) AS E,
                  SUM(CASE WHEN J.CODIGOTIME1 = GT.CODIGOTIME THEN COALESCE(J.TOTALGOL1, 0)
                           ELSE COALESCE(J.TOTALGOL2, 0)
                      END) AS GP,
                  SUM(CASE WHEN J.CODIGOTIME1 = GT.CODIGOTIME THEN COALESCE(J.TOTALGOL2, 0)
                           ELSE COALESCE(J.TOTALGOL1, 0)
                      END) AS GC,
                  GT.CODIGOTIME,
                  RIGHT('0000000000' + CAST(G.ORDEMGRUPO AS VARCHAR(10)), 10) + RIGHT('0000000000' + CAST(GT.CLASSIFICACAOTIME AS VARCHAR(10)), 10) + RIGHT('0000000000' + CAST(GT.ORDEMTIME AS VARCHAR(10)), 10) AS ORDEM
             FROM CAMPEONATO C INNER JOIN
                  GRUPOTIME GT ON (GT.CODIGOCAMPEONATO = C.CODIGOCAMPEONATO) INNER JOIN
                  GRUPO G ON (G.CODIGOCAMPEONATO = GT.CODIGOCAMPEONATO AND
                              G.CODIGOGRUPO = GT.CODIGOGRUPO) INNER JOIN
                  TIME T ON (T.CODIGOTIME = GT.CODIGOTIME) INNER JOIN
                  JOGO J ON (J.CODIGOCAMPEONATO = GT.CODIGOCAMPEONATO AND
                             ((J.CODIGOTIME1 = GT.CODIGOTIME) OR (J.CODIGOTIME2 = GT.CODIGOTIME)))
            WHERE C.CODIGOCAMPEONATO = @CodigoCampeonato
              AND J.CODIGOFASE = @CodigoFase
            GROUP BY G.DESCRICAOGRUPO,
                  T.NOMETIME,
                  GT.CODIGOTIME,
                  G.ORDEMGRUPO,
                  GT.CLASSIFICACAOTIME,
                  GT.ORDEMTIME) C
    ORDER BY C.ORDEM
END
GO


-- spConClassificacaoU
IF (EXISTS (SELECT 1 FROM sys.objects WHERE name = 'spConClassificacaoU'))
DROP PROCEDURE [dbo].[spConClassificacaoU]
GO
CREATE PROCEDURE [dbo].[spConClassificacaoU]
(
   @CodigoUsuario    VARCHAR(256),
   @CodigoCampeonato NUMERIC(10),
   @CodigoFase       NUMERIC(10)
)
AS
BEGIN
   INSERT INTO USUARIOJOGO (
          CODIGOUSUARIO,
          CODIGOCAMPEONATO,
          CODIGOJOGO,
          CODIGOTIME1,
          CODIGOTIME2
   )
   SELECT @CodigoUsuario AS CODIGOUSUARIO,
          J.CODIGOCAMPEONATO,
          J.CODIGOJOGO,
          CASE WHEN J.CODIGOREGRA1 IS NULL THEN J.CODIGOTIME1
               ELSE NULL
          END AS CODIGOTIME1,
          CASE WHEN J.CODIGOREGRA2 IS NULL THEN J.CODIGOTIME2
               ELSE NULL
          END AS CODIGOTIME2
     FROM JOGO J
    WHERE J.CODIGOCAMPEONATO = @CodigoCampeonato
      AND NOT EXISTS (SELECT 1
                        FROM USUARIOJOGO UJ
                       WHERE UJ.CODIGOUSUARIO = @CodigoUsuario
                         AND UJ.CODIGOCAMPEONATO = J.CODIGOCAMPEONATO
                         AND UJ.CODIGOJOGO = J.CODIGOJOGO)
      AND EXISTS (SELECT 1
                    FROM USUARIO U
                   WHERE U.CODIGOUSUARIO = @CodigoUsuario)

   INSERT INTO USUARIOGRUPOTIME (
          CODIGOUSUARIO,
          CODIGOCAMPEONATO,
          CODIGOGRUPO,
          CODIGOTIME,
          CLASSIFICACAOTIME
   )
   SELECT @CodigoUsuario AS CODIGOUSUARIO,
          GT.CODIGOCAMPEONATO,
          GT.CODIGOGRUPO,
          GT.CODIGOTIME,
          GT.ORDEMTIME AS CLASSIFICACAOTIME
     FROM GRUPOTIME GT
    WHERE GT.CODIGOCAMPEONATO = @CodigoCampeonato
      AND NOT EXISTS (SELECT 1
                        FROM USUARIOGRUPOTIME UGT
                       WHERE UGT.CODIGOUSUARIO = @CodigoUsuario
                         AND UGT.CODIGOCAMPEONATO = GT.CODIGOCAMPEONATO
                         AND UGT.CODIGOGRUPO = GT.CODIGOGRUPO
                         AND UGT.CODIGOTIME = GT.CODIGOTIME)
      AND EXISTS (SELECT 1
                    FROM USUARIO U
                   WHERE U.CODIGOUSUARIO = @CodigoUsuario)

   SELECT C.CLASSIFICACAO,
          C.DESCRICAO,
          COALESCE(CAST(C.PG AS VARCHAR(10)), 'PG') AS PG,
          COALESCE(CAST(C.J AS VARCHAR(10)), 'J') AS J,
          COALESCE(CAST(C.V AS VARCHAR(10)), 'V') AS V,
          COALESCE(CAST(C.E AS VARCHAR(10)), 'E') AS E,
          COALESCE(CAST(C.GP AS VARCHAR(10)), 'GP') AS GP,
          COALESCE(CAST(C.GC AS VARCHAR(10)), 'GC') AS GC,
          COALESCE(CAST(C.GP - C.GC AS VARCHAR(10)), 'SG') AS SG,
          C.CODIGOTIME
     FROM (SELECT DESCRICAOGRUPO AS CLASSIFICACAO,
                  NULL AS DESCRICAO,
                  NULL AS PG,
                  NULL AS J,
                  NULL AS V,
                  NULL AS E,
                  NULL AS GP,
                  NULL AS GC,
                  NULL AS CODIGOTIME,
                  RIGHT('0000000000' + CAST(ORDEMGRUPO AS VARCHAR(10)), 10) + '00000000000000000000' AS ORDEM
             FROM GRUPO
            WHERE CODIGOCAMPEONATO = @CodigoCampeonato
            UNION ALL
           SELECT CAST(UGT.CLASSIFICACAOTIME AS VARCHAR(10)) + 'º' AS CLASSIFICACAO,
                  T.NOMETIME AS DESCRICAO,
                  SUM(CASE WHEN UJ.CODIGOTIME1 = UGT.CODIGOTIME THEN CASE WHEN (UJ.TOTALGOL1 IS NULL) OR (UJ.TOTALGOL2 IS NULL) THEN 0
                                                                          WHEN UJ.TOTALGOL1 > UJ.TOTALGOL2 THEN C.PONTUACAOVITORIA
                                                                          WHEN UJ.TOTALGOL1 < UJ.TOTALGOL2 THEN C.PONTUACAODERROTA
                                                                          ELSE C.PONTUACAOEMPATE
                                                                     END
                           ELSE CASE WHEN (UJ.TOTALGOL1 IS NULL) OR (UJ.TOTALGOL2 IS NULL) THEN 0
                                     WHEN UJ.TOTALGOL2 > UJ.TOTALGOL1 THEN C.PONTUACAOVITORIA
                                     WHEN UJ.TOTALGOL2 < UJ.TOTALGOL1 THEN C.PONTUACAODERROTA
                                     ELSE C.PONTUACAOEMPATE
                                END
                      END) AS PG,
                  SUM(CASE WHEN (UJ.TOTALGOL1 IS NULL) OR (UJ.TOTALGOL2 IS NULL) THEN 0
                           ELSE 1
                      END) AS J,
                  SUM(CASE WHEN UJ.CODIGOTIME1 = UGT.CODIGOTIME THEN CASE WHEN UJ.TOTALGOL1 > UJ.TOTALGOL2 THEN 1
                                                                          ELSE 0
                                                                     END
                           ELSE CASE WHEN UJ.TOTALGOL2 > UJ.TOTALGOL1 THEN 1
                                     ELSE 0
                                END
                      END) AS V,
                  SUM(CASE WHEN UJ.TOTALGOL1 = UJ.TOTALGOL2 THEN 1
                           ELSE 0
                      END) AS E,
                  SUM(CASE WHEN UJ.CODIGOTIME1 = UGT.CODIGOTIME THEN COALESCE(UJ.TOTALGOL1, 0)
                           ELSE COALESCE(UJ.TOTALGOL2, 0)
                      END) AS GP,
                  SUM(CASE WHEN UJ.CODIGOTIME1 = UGT.CODIGOTIME THEN COALESCE(UJ.TOTALGOL2, 0)
                           ELSE COALESCE(UJ.TOTALGOL1, 0)
                      END) AS GC,
                  UGT.CODIGOTIME,
                  RIGHT('0000000000' + CAST(G.ORDEMGRUPO AS VARCHAR(10)), 10) + RIGHT('0000000000' + CAST(UGT.CLASSIFICACAOTIME AS VARCHAR(10)), 10) + RIGHT('0000000000' + CAST(GT.ORDEMTIME AS VARCHAR(10)), 10) AS ORDEM
             FROM CAMPEONATO C INNER JOIN
                  USUARIOGRUPOTIME UGT ON (UGT.CODIGOUSUARIO = @CodigoUsuario AND
                                           UGT.CODIGOCAMPEONATO = C.CODIGOCAMPEONATO) INNER JOIN
                  GRUPOTIME GT ON (GT.CODIGOCAMPEONATO = UGT.CODIGOCAMPEONATO AND
                                   GT.CODIGOGRUPO = UGT.CODIGOGRUPO AND
                                   GT.CODIGOTIME = UGT.CODIGOTIME) INNER JOIN
                  GRUPO G ON (G.CODIGOCAMPEONATO = UGT.CODIGOCAMPEONATO AND
                              G.CODIGOGRUPO = UGT.CODIGOGRUPO) INNER JOIN
                  TIME T ON (T.CODIGOTIME = UGT.CODIGOTIME) INNER JOIN
                  USUARIOJOGO UJ ON (UJ.CODIGOUSUARIO = UGT.CODIGOUSUARIO AND
                                     UJ.CODIGOCAMPEONATO = UGT.CODIGOCAMPEONATO AND
                                     ((UJ.CODIGOTIME1 = UGT.CODIGOTIME) OR (UJ.CODIGOTIME2 = UGT.CODIGOTIME))) INNER JOIN
                  JOGO J ON (J.CODIGOCAMPEONATO = UJ.CODIGOCAMPEONATO AND
                             J.CODIGOJOGO = UJ.CODIGOJOGO)
            WHERE C.CODIGOCAMPEONATO = @CodigoCampeonato
              AND J.CODIGOFASE = @CodigoFase
            GROUP BY G.DESCRICAOGRUPO,
                  T.NOMETIME,
                  UGT.CODIGOTIME,
                  G.ORDEMGRUPO,
                  UGT.CLASSIFICACAOTIME,
                  GT.ORDEMTIME) C
    ORDER BY C.ORDEM
END
GO


-- spConJogo
IF (EXISTS (SELECT 1 FROM sys.objects WHERE name = 'spConJogo'))
DROP PROCEDURE [dbo].[spConJogo]
GO
CREATE PROCEDURE [dbo].[spConJogo]
(
   @CodigoCampeonato NUMERIC(10),
   @CodigoFase       NUMERIC(10),
   @CodigoRodada     NUMERIC(10)
)
AS
BEGIN
   SELECT (SELECT DISTINCT
                  GT.CODIGOGRUPO
             FROM FASE F,
                  GRUPOTIME GT
            WHERE F.CODIGOCAMPEONATO = J.CODIGOCAMPEONATO
              AND F.CODIGOFASE = J.CODIGOFASE
              AND F.TIPOFASE = 1
              AND GT.CODIGOCAMPEONATO = J.CODIGOCAMPEONATO
              AND GT.CODIGOTIME IN (J.CODIGOTIME1, J.CODIGOTIME2)) AS CODIGOGRUPO,
          J.CODIGOJOGO,
          SUBSTRING(CONVERT(VARCHAR(10), J.HORARIOJOGO, 103), 1, 5) + ' ' + SUBSTRING(CONVERT(VARCHAR(8), J.HORARIOJOGO, 108), 1, 5) AS HORARIO,
          COALESCE(T1.NOMETIME, R1.DESCRICAOREGRA) AS NOMETIME1,
          J.TOTALGOL1,
          J.TOTALGOL2,
          COALESCE(T2.NOMETIME, R2.DESCRICAOREGRA) AS NOMETIME2,
          J.CODIGOTIME1,
          J.CODIGOTIME2
     FROM JOGO J LEFT JOIN
          REGRA R1 ON (R1.CODIGOCAMPEONATO = J.CODIGOCAMPEONATO AND
                       R1.CODIGOREGRA = J.CODIGOREGRA1) LEFT JOIN
          TIME T1 ON (T1.CODIGOTIME = J.CODIGOTIME1) LEFT JOIN
          REGRA R2 ON (R2.CODIGOCAMPEONATO = J.CODIGOCAMPEONATO AND
                       R2.CODIGOREGRA = J.CODIGOREGRA2) LEFT JOIN
          TIME T2 ON (T2.CODIGOTIME = J.CODIGOTIME2)
    WHERE J.CODIGOCAMPEONATO = @CodigoCampeonato
      AND J.CODIGOFASE = @CodigoFase
      AND COALESCE(J.CODIGORODADA, -1) = COALESCE(@CodigoRodada, COALESCE(J.CODIGORODADA, -1))
    ORDER BY J.CODIGOJOGO
END
GO


-- spConJogoU
IF (EXISTS (SELECT 1 FROM sys.objects WHERE name = 'spConJogoU'))
DROP PROCEDURE [dbo].[spConJogoU]
GO
CREATE PROCEDURE [dbo].[spConJogoU]
(
   @CodigoUsuario    VARCHAR(256),
   @CodigoCampeonato NUMERIC(10),
   @CodigoFase       NUMERIC(10),
   @CodigoRodada     NUMERIC(10)
)
AS
BEGIN
   SELECT (SELECT DISTINCT
                  UGT.CODIGOGRUPO
             FROM FASE F,
                  USUARIOGRUPOTIME UGT
            WHERE F.CODIGOCAMPEONATO = J.CODIGOCAMPEONATO
              AND F.CODIGOFASE = J.CODIGOFASE
              AND F.TIPOFASE = 1
              AND UGT.CODIGOUSUARIO = UJ.CODIGOUSUARIO
              AND UGT.CODIGOCAMPEONATO = UJ.CODIGOCAMPEONATO
              AND UGT.CODIGOTIME IN (UJ.CODIGOTIME1, UJ.CODIGOTIME2)) AS CODIGOGRUPO,
          UJ.CODIGOJOGO,
          SUBSTRING(CONVERT(VARCHAR(10), J.HORARIOJOGO, 103), 1, 5) + ' ' + SUBSTRING(CONVERT(VARCHAR(8), J.HORARIOJOGO, 108), 1, 5) AS HORARIO,
          COALESCE(T1.NOMETIME, R1.DESCRICAOREGRA) AS NOMETIME1,
          UJ.TOTALGOL1,
          UJ.TOTALGOL2,
          COALESCE(T2.NOMETIME, R2.DESCRICAOREGRA) AS NOMETIME2,
          UJ.CODIGOTIME1,
          UJ.CODIGOTIME2,
          CASE WHEN ((J.TOTALGOL1 IS NULL) OR (J.TOTALGOL2 IS NULL)) THEN NULL
               ELSE CASE WHEN (UJ.CODIGOTIME1 = J.CODIGOTIME1) AND
                              (UJ.CODIGOTIME2 = J.CODIGOTIME2) AND
                              (UJ.TOTALGOL1 = J.TOTALGOL1) AND
                              (UJ.TOTALGOL2 = J.TOTALGOL2) THEN 'total'
                         WHEN (UJ.CODIGOTIME1 = J.CODIGOTIME1) AND
                              (UJ.CODIGOTIME2 = J.CODIGOTIME2) AND
                              (((UJ.TOTALGOL1 > UJ.TOTALGOL2) AND
                                (J.TOTALGOL1 > J.TOTALGOL2)) OR
                               ((UJ.TOTALGOL1 < UJ.TOTALGOL2) AND
                                (J.TOTALGOL1 < J.TOTALGOL2)) OR
                               ((UJ.TOTALGOL1 = UJ.TOTALGOL2) AND
                                (J.TOTALGOL1 = J.TOTALGOL2))) THEN 'partial'
                         ELSE 'never'
                    END
          END AS PONTUACAO,
          CASE WHEN ((J.TOTALGOL1 IS NULL) OR (J.TOTALGOL2 IS NULL)) THEN NULL
               ELSE CASE WHEN (UJ.CODIGOTIME1 = J.CODIGOTIME1) AND
                              (UJ.CODIGOTIME2 = J.CODIGOTIME2) AND
                              (UJ.TOTALGOL1 = J.TOTALGOL1) AND
                              (UJ.TOTALGOL2 = J.TOTALGOL2) THEN 'Pontuação total: ' + CAST(C.PONTUACAOACERTOEXATO AS VARCHAR(10)) + ' ponto(s)'
                         WHEN (UJ.CODIGOTIME1 = J.CODIGOTIME1) AND
                              (UJ.CODIGOTIME2 = J.CODIGOTIME2) AND
                              (((UJ.TOTALGOL1 > UJ.TOTALGOL2) AND
                                (J.TOTALGOL1 > J.TOTALGOL2)) OR
                               ((UJ.TOTALGOL1 < UJ.TOTALGOL2) AND
                                (J.TOTALGOL1 < J.TOTALGOL2)) OR
                               ((UJ.TOTALGOL1 = UJ.TOTALGOL2) AND
                                (J.TOTALGOL1 = J.TOTALGOL2))) THEN 'Pontuação partial: ' + CAST(C.PONTUACAOACERTOPARCIAL AS VARCHAR(10)) + ' ponto(s)' + CHAR(13) + CHAR(10) + 'Resultado do jogo: ' + T11.NOMETIME + ' ' + CAST(J.TOTALGOL1 AS VARCHAR(10)) + ' X ' + CAST(J.TOTALGOL2 AS VARCHAR(10)) + ' ' + T22.NOMETIME
                         ELSE 'Nenhum ponto conquistado' + CHAR(13) + CHAR(10) + 'Resultado do jogo: ' + T11.NOMETIME + ' ' + CAST(J.TOTALGOL1 AS VARCHAR(10)) + ' X ' + CAST(J.TOTALGOL2 AS VARCHAR(10)) + ' ' + T22.NOMETIME
                    END
          END AS TOOLTIP
     FROM CAMPEONATO C INNER JOIN
          USUARIOJOGO UJ ON (UJ.CODIGOCAMPEONATO = C.CODIGOCAMPEONATO) INNER JOIN
          JOGO J ON (J.CODIGOCAMPEONATO = UJ.CODIGOCAMPEONATO AND
                     J.CODIGOJOGO = UJ.CODIGOJOGO) LEFT JOIN
          REGRA R1 ON (R1.CODIGOCAMPEONATO = J.CODIGOCAMPEONATO AND
                       R1.CODIGOREGRA = J.CODIGOREGRA1) LEFT JOIN
          TIME T1 ON (T1.CODIGOTIME = UJ.CODIGOTIME1) LEFT JOIN
          REGRA R2 ON (R2.CODIGOCAMPEONATO = J.CODIGOCAMPEONATO AND
                       R2.CODIGOREGRA = J.CODIGOREGRA2) LEFT JOIN
          TIME T2 ON (T2.CODIGOTIME = UJ.CODIGOTIME2) LEFT JOIN
          TIME T11 ON (T11.CODIGOTIME = J.CODIGOTIME1) LEFT JOIN
          TIME T22 ON (T22.CODIGOTIME = J.CODIGOTIME2)
    WHERE C.CODIGOCAMPEONATO = @CodigoCampeonato
      AND UJ.CODIGOUSUARIO = @CodigoUsuario
      AND J.CODIGOFASE = @CodigoFase
      AND COALESCE(J.CODIGORODADA, -1) = COALESCE(@CodigoRodada, COALESCE(J.CODIGORODADA, -1))
    ORDER BY UJ.CODIGOJOGO
END
GO


-- spConCampeonatoU
IF (EXISTS (SELECT 1 FROM sys.objects WHERE name = 'spConCampeonatoU'))
DROP PROCEDURE [dbo].[spConCampeonatoU]
GO
CREATE PROCEDURE [dbo].[spConCampeonatoU]
(
   @CodigoCampeonato NUMERIC(10)
)
AS
BEGIN
   SELECT U.CODIGOUSUARIO,
          U.NOMEUSUARIO,
          (SELECT COUNT(1)
             FROM USUARIOJOGO UJ
            WHERE UJ.CODIGOUSUARIO = UC.CODIGOUSUARIO
              AND UJ.CODIGOCAMPEONATO = UC.CODIGOCAMPEONATO
              AND ((UJ.TOTALGOL1 IS NULL) OR (UJ.TOTALGOL2 IS NULL))) AS TOTALJOGOPENDENTE,
          CAST(UC.USUARIOACEITOUREGULAMENTO AS BIT) AS USUARIOACEITOUREGULAMENTO,
          CAST(UC.USUARIOIMPRIMIUAPOSTA AS BIT) AS USUARIOIMPRIMIUAPOSTA,
          CAST(UC.USUARIOPAGOUAPOSTA AS BIT) AS USUARIOPAGOUAPOSTA
     FROM USUARIOCAMPEONATO UC INNER JOIN
          USUARIO U ON (U.CODIGOUSUARIO = UC.CODIGOUSUARIO)
    WHERE UC.CODIGOCAMPEONATO = @CodigoCampeonato
    ORDER BY U.NOMEUSUARIO
END
GO


-- spSysAtualizarClassificacao
IF (EXISTS (SELECT 1 FROM sys.objects WHERE name = 'spSysAtualizarClassificacao'))
DROP PROCEDURE [dbo].[spSysAtualizarClassificacao]
GO
CREATE PROCEDURE [dbo].[spSysAtualizarClassificacao]
(
   @CodigoCampeonato NUMERIC(10),
   @CodigoGrupo      NUMERIC(10),
   @CodigoFase       NUMERIC(10)
)
AS
BEGIN
   DECLARE @CodigoTime NUMERIC(10)
   
   DECLARE @ClassificacaoTime NUMERIC(10)
   SET @ClassificacaoTime = 1
   
   DECLARE cClass CURSOR FOR
    SELECT C.CODIGOTIME
      FROM (SELECT C.CODIGOTIME,
                   C.PG,
                   SUM(CASE WHEN CCD.CRITERIODESEMPATE = 1 THEN (C.GP - C.GC) * CCD.PESOCRITERIODESEMPATE
                            WHEN CCD.CRITERIODESEMPATE = 2 THEN C.GP * CCD.PESOCRITERIODESEMPATE
                       END) AS DESEMPATE,
                   C.ORDEMTIME
              FROM (SELECT GT.CODIGOTIME,
                           SUM(CASE WHEN J.CODIGOTIME1 = GT.CODIGOTIME THEN CASE WHEN (J.TOTALGOL1 IS NULL) OR (J.TOTALGOL2 IS NULL) THEN 0
                                                                                 WHEN J.TOTALGOL1 > J.TOTALGOL2 THEN C.PONTUACAOVITORIA
                                                                                 WHEN J.TOTALGOL1 < J.TOTALGOL2 THEN C.PONTUACAODERROTA
                                                                                 ELSE C.PONTUACAOEMPATE
                                                                            END
                                    ELSE CASE WHEN (J.TOTALGOL1 IS NULL) OR (J.TOTALGOL2 IS NULL) THEN 0
                                              WHEN J.TOTALGOL2 > J.TOTALGOL1 THEN C.PONTUACAOVITORIA
                                              WHEN J.TOTALGOL2 < J.TOTALGOL1 THEN C.PONTUACAODERROTA
                                              ELSE C.PONTUACAOEMPATE
                                         END
                               END) AS PG,
                           SUM(CASE WHEN J.CODIGOTIME1 = GT.CODIGOTIME THEN COALESCE(J.TOTALGOL1, 0)
                                    ELSE COALESCE(J.TOTALGOL2, 0)
                               END) AS GP,
                           SUM(CASE WHEN J.CODIGOTIME1 = GT.CODIGOTIME THEN COALESCE(J.TOTALGOL2, 0)
                                    ELSE COALESCE(J.TOTALGOL1, 0)
                               END) AS GC,
                           GT.ORDEMTIME
                      FROM CAMPEONATO C INNER JOIN
                           GRUPOTIME GT ON (GT.CODIGOCAMPEONATO = C.CODIGOCAMPEONATO) INNER JOIN
                           GRUPO G ON (G.CODIGOCAMPEONATO = GT.CODIGOCAMPEONATO AND
                                       G.CODIGOGRUPO = GT.CODIGOGRUPO) INNER JOIN
                           JOGO J ON (J.CODIGOCAMPEONATO = GT.CODIGOCAMPEONATO AND
                                      ((J.CODIGOTIME1 = GT.CODIGOTIME) OR (J.CODIGOTIME2 = GT.CODIGOTIME)))
                     WHERE C.CODIGOCAMPEONATO = @CodigoCampeonato
                       AND GT.CODIGOGRUPO = @CodigoGrupo
                       AND J.CODIGOFASE = @CodigoFase
                     GROUP BY GT.CODIGOTIME,
                           GT.ORDEMTIME) C LEFT OUTER JOIN
                   CAMPEONATOCRITERIODESEMPATE CCD ON (CCD.CODIGOCAMPEONATO = @CodigoCampeonato)
             GROUP BY C.CODIGOTIME,
                   C.PG,
                   C.GP,
                   C.GC,
                   C.ORDEMTIME) C
     ORDER BY C.PG DESC,
           C.DESEMPATE DESC,
           C.ORDEMTIME
   
   OPEN cClass
   FETCH NEXT FROM cClass INTO @CodigoTime
   
   WHILE (@@FETCH_STATUS = 0)
    BEGIN
      UPDATE GRUPOTIME SET
             CLASSIFICACAOTIME = @ClassificacaoTime
       WHERE CODIGOCAMPEONATO = @CodigoCampeonato
         AND CODIGOGRUPO = @CodigoGrupo
         AND CODIGOTIME = @CodigoTime
      
      FETCH NEXT FROM cClass INTO @CodigoTime
      
      SET @ClassificacaoTime = @ClassificacaoTime + 1
    END
   
   CLOSE cClass
   DEALLOCATE cClass
   
   UPDATE JOGO SET
          CODIGOTIME1 = (SELECT GT.CODIGOTIME
                           FROM GRUPOTIME GT
                          WHERE GT.CODIGOCAMPEONATO = R.CODIGOCAMPEONATO
                            AND GT.CODIGOGRUPO = R.CODIGOGRUPO
                            AND GT.CLASSIFICACAOTIME = R.CLASSIFICACAOTIME
                            AND NOT EXISTS (SELECT 1
                                              FROM JOGO J INNER JOIN
                                                   GRUPOTIME GT ON (GT.CODIGOCAMPEONATO = J.CODIGOCAMPEONATO AND
                                                                    GT.CODIGOGRUPO = @CodigoGrupo AND
                                                                    GT.CODIGOTIME IN (J.CODIGOTIME1, J.CODIGOTIME2))
                                             WHERE J.CODIGOCAMPEONATO = @CodigoCampeonato
                                               AND J.CODIGOFASE = @CodigoFase
                                               AND ((J.TOTALGOL1 IS NULL) OR (J.TOTALGOL2 IS NULL))))
     FROM REGRA R
    WHERE JOGO.CODIGOCAMPEONATO = @CodigoCampeonato
      AND R.CODIGOCAMPEONATO = JOGO.CODIGOCAMPEONATO
      AND R.CODIGOREGRA = JOGO.CODIGOREGRA1
      AND R.TIPOREGRA = 1
      AND R.CODIGOGRUPO = @CodigoGrupo
   
   UPDATE JOGO SET
          CODIGOTIME2 = (SELECT GT.CODIGOTIME
                           FROM GRUPOTIME GT
                          WHERE GT.CODIGOCAMPEONATO = R.CODIGOCAMPEONATO
                            AND GT.CODIGOGRUPO = R.CODIGOGRUPO
                            AND GT.CLASSIFICACAOTIME = R.CLASSIFICACAOTIME
                            AND NOT EXISTS (SELECT 1
                                              FROM JOGO J INNER JOIN
                                                   GRUPOTIME GT ON (GT.CODIGOCAMPEONATO = J.CODIGOCAMPEONATO AND
                                                                    GT.CODIGOGRUPO = @CodigoGrupo AND
                                                                    GT.CODIGOTIME IN (J.CODIGOTIME1, J.CODIGOTIME2))
                                             WHERE J.CODIGOCAMPEONATO = @CodigoCampeonato
                                               AND J.CODIGOFASE = @CodigoFase
                                               AND ((J.TOTALGOL1 IS NULL) OR (J.TOTALGOL2 IS NULL))))
     FROM REGRA R
    WHERE JOGO.CODIGOCAMPEONATO = @CodigoCampeonato
      AND R.CODIGOCAMPEONATO = JOGO.CODIGOCAMPEONATO
      AND R.CODIGOREGRA = JOGO.CODIGOREGRA2
      AND R.TIPOREGRA = 1
      AND R.CODIGOGRUPO = @CodigoGrupo
   
   EXECUTE [dbo].[spSysAtualizarMataMata]
           @CodigoCampeonato = @CodigoCampeonato
END
GO


-- spSysAtualizarClassificacaoU
IF (EXISTS (SELECT 1 FROM sys.objects WHERE name = 'spSysAtualizarClassificacaoU'))
DROP PROCEDURE [dbo].[spSysAtualizarClassificacaoU]
GO
CREATE PROCEDURE [dbo].[spSysAtualizarClassificacaoU]
(
   @CodigoUsuario    VARCHAR(256),
   @CodigoCampeonato NUMERIC(10),
   @CodigoGrupo      NUMERIC(10),
   @CodigoFase       NUMERIC(10)
)
AS
BEGIN
   DECLARE @CodigoTime NUMERIC(10)
   
   DECLARE @ClassificacaoTime NUMERIC(10)
   SET @ClassificacaoTime = 1
   
   DECLARE cClass CURSOR FOR
    SELECT C.CODIGOTIME
      FROM (SELECT C.CODIGOTIME,
                   C.PG,
                   SUM(CASE WHEN CCD.CRITERIODESEMPATE = 1 THEN (C.GP - C.GC) * CCD.PESOCRITERIODESEMPATE
                            WHEN CCD.CRITERIODESEMPATE = 2 THEN C.GP * CCD.PESOCRITERIODESEMPATE
                       END) AS DESEMPATE,
                   C.ORDEMTIME
              FROM (SELECT UGT.CODIGOTIME,
                           SUM(CASE WHEN UJ.CODIGOTIME1 = UGT.CODIGOTIME THEN CASE WHEN (UJ.TOTALGOL1 IS NULL) OR (UJ.TOTALGOL2 IS NULL) THEN 0
                                                                                   WHEN UJ.TOTALGOL1 > UJ.TOTALGOL2 THEN C.PONTUACAOVITORIA
                                                                                   WHEN UJ.TOTALGOL1 < UJ.TOTALGOL2 THEN C.PONTUACAODERROTA
                                                                                   ELSE C.PONTUACAOEMPATE
                                                                              END
                                    ELSE CASE WHEN (UJ.TOTALGOL1 IS NULL) OR (UJ.TOTALGOL2 IS NULL) THEN 0
                                              WHEN UJ.TOTALGOL2 > UJ.TOTALGOL1 THEN C.PONTUACAOVITORIA
                                              WHEN UJ.TOTALGOL2 < UJ.TOTALGOL1 THEN C.PONTUACAODERROTA
                                              ELSE C.PONTUACAOEMPATE
                                         END
                               END) AS PG,
                           SUM(CASE WHEN UJ.CODIGOTIME1 = UGT.CODIGOTIME THEN COALESCE(UJ.TOTALGOL1, 0)
                                    ELSE COALESCE(UJ.TOTALGOL2, 0)
                               END) AS GP,
                           SUM(CASE WHEN UJ.CODIGOTIME1 = UGT.CODIGOTIME THEN COALESCE(UJ.TOTALGOL2, 0)
                                    ELSE COALESCE(UJ.TOTALGOL1, 0)
                               END) AS GC,
                           GT.ORDEMTIME
                      FROM CAMPEONATO C INNER JOIN
                           USUARIOGRUPOTIME UGT ON (UGT.CODIGOUSUARIO = @CodigoUsuario AND
                                                    UGT.CODIGOCAMPEONATO = C.CODIGOCAMPEONATO) INNER JOIN
                           GRUPOTIME GT ON (GT.CODIGOCAMPEONATO = UGT.CODIGOCAMPEONATO AND
                                            GT.CODIGOGRUPO = UGT.CODIGOGRUPO AND
                                            GT.CODIGOTIME = UGT.CODIGOTIME) INNER JOIN
                           GRUPO G ON (G.CODIGOCAMPEONATO = UGT.CODIGOCAMPEONATO AND
                                       G.CODIGOGRUPO = UGT.CODIGOGRUPO) INNER JOIN
                           USUARIOJOGO UJ ON (UJ.CODIGOUSUARIO = UGT.CODIGOUSUARIO AND
                                              UJ.CODIGOCAMPEONATO = UGT.CODIGOCAMPEONATO AND
                                              ((UJ.CODIGOTIME1 = UGT.CODIGOTIME) OR (UJ.CODIGOTIME2 = UGT.CODIGOTIME))) INNER JOIN
                           JOGO J ON (J.CODIGOCAMPEONATO = UJ.CODIGOCAMPEONATO AND
                                      J.CODIGOJOGO = UJ.CODIGOJOGO)
                     WHERE C.CODIGOCAMPEONATO = @CodigoCampeonato
                       AND UGT.CODIGOGRUPO = @CodigoGrupo
                       AND J.CODIGOFASE = @CodigoFase
                     GROUP BY UGT.CODIGOTIME,
                           GT.ORDEMTIME) C LEFT OUTER JOIN
                   CAMPEONATOCRITERIODESEMPATE CCD ON (CCD.CODIGOCAMPEONATO = @CodigoCampeonato)
             GROUP BY C.CODIGOTIME,
                   C.PG,
                   C.GP,
                   C.GC,
                   C.ORDEMTIME) C
     ORDER BY C.PG DESC,
           C.DESEMPATE DESC,
           C.ORDEMTIME
   
   OPEN cClass
   FETCH NEXT FROM cClass INTO @CodigoTime
   
   WHILE (@@FETCH_STATUS = 0)
    BEGIN
      UPDATE USUARIOGRUPOTIME SET
             CLASSIFICACAOTIME = @ClassificacaoTime
       WHERE CODIGOUSUARIO = @CodigoUsuario
         AND CODIGOCAMPEONATO = @CodigoCampeonato
         AND CODIGOGRUPO = @CodigoGrupo
         AND CODIGOTIME = @CodigoTime
      
      FETCH NEXT FROM cClass INTO @CodigoTime
      
      SET @ClassificacaoTime = @ClassificacaoTime + 1
    END
   
   CLOSE cClass
   DEALLOCATE cClass
   
   UPDATE USUARIOJOGO SET
          CODIGOTIME1 = (SELECT UGT.CODIGOTIME
                           FROM USUARIOGRUPOTIME UGT
                          WHERE UGT.CODIGOUSUARIO = @CodigoUsuario
                            AND UGT.CODIGOCAMPEONATO = R.CODIGOCAMPEONATO
                            AND UGT.CODIGOGRUPO = R.CODIGOGRUPO
                            AND UGT.CLASSIFICACAOTIME = R.CLASSIFICACAOTIME
                            AND NOT EXISTS (SELECT 1
                                              FROM USUARIOJOGO UJ INNER JOIN
                                                   JOGO J ON (J.CODIGOCAMPEONATO = UJ.CODIGOCAMPEONATO AND
                                                              J.CODIGOJOGO = UJ.CODIGOJOGO) INNER JOIN
                                                   GRUPOTIME GT ON (GT.CODIGOCAMPEONATO = UJ.CODIGOCAMPEONATO AND
                                                                    GT.CODIGOGRUPO = @CodigoGrupo AND
                                                                    GT.CODIGOTIME IN (UJ.CODIGOTIME1, UJ.CODIGOTIME2))
                                             WHERE UJ.CODIGOUSUARIO = @CodigoUsuario
                                               AND UJ.CODIGOCAMPEONATO = @CodigoCampeonato
                                               AND J.CODIGOFASE = @CodigoFase
                                               AND ((UJ.TOTALGOL1 IS NULL) OR (UJ.TOTALGOL2 IS NULL))))
     FROM (SELECT J.CODIGOCAMPEONATO,
                  J.CODIGOJOGO,
                  R.CODIGOGRUPO,
                  R.CLASSIFICACAOTIME
             FROM JOGO J INNER JOIN
                  REGRA R ON (R.CODIGOCAMPEONATO = J.CODIGOCAMPEONATO AND
                              R.CODIGOREGRA = J.CODIGOREGRA1)
            WHERE J.CODIGOCAMPEONATO = @CodigoCampeonato
              AND R.TIPOREGRA = 1
              AND R.CODIGOGRUPO = @CodigoGrupo
              AND R.CODIGOREGRA = J.CODIGOREGRA1) R
    WHERE USUARIOJOGO.CODIGOUSUARIO = @CodigoUsuario
      AND USUARIOJOGO.CODIGOCAMPEONATO = @CodigoCampeonato
      AND R.CODIGOCAMPEONATO = USUARIOJOGO.CODIGOCAMPEONATO
      AND R.CODIGOJOGO = USUARIOJOGO.CODIGOJOGO
   
   UPDATE USUARIOJOGO SET
          CODIGOTIME2 = (SELECT UGT.CODIGOTIME
                           FROM USUARIOGRUPOTIME UGT
                          WHERE UGT.CODIGOUSUARIO = @CodigoUsuario
                            AND UGT.CODIGOCAMPEONATO = R.CODIGOCAMPEONATO
                            AND UGT.CODIGOGRUPO = R.CODIGOGRUPO
                            AND UGT.CLASSIFICACAOTIME = R.CLASSIFICACAOTIME
                            AND NOT EXISTS (SELECT 1
                                              FROM USUARIOJOGO UJ INNER JOIN
                                                   JOGO J ON (J.CODIGOCAMPEONATO = UJ.CODIGOCAMPEONATO AND
                                                              J.CODIGOJOGO = UJ.CODIGOJOGO) INNER JOIN
                                                   GRUPOTIME GT ON (GT.CODIGOCAMPEONATO = UJ.CODIGOCAMPEONATO AND
                                                                    GT.CODIGOGRUPO = @CodigoGrupo AND
                                                                    GT.CODIGOTIME IN (UJ.CODIGOTIME1, UJ.CODIGOTIME2))
                                             WHERE UJ.CODIGOUSUARIO = @CodigoUsuario
                                               AND UJ.CODIGOCAMPEONATO = @CodigoCampeonato
                                               AND J.CODIGOFASE = @CodigoFase
                                               AND ((UJ.TOTALGOL1 IS NULL) OR (UJ.TOTALGOL2 IS NULL))))
     FROM (SELECT J.CODIGOCAMPEONATO,
                  J.CODIGOJOGO,
                  R.CODIGOGRUPO,
                  R.CLASSIFICACAOTIME
             FROM JOGO J INNER JOIN
                  REGRA R ON (R.CODIGOCAMPEONATO = J.CODIGOCAMPEONATO AND
                              R.CODIGOREGRA = J.CODIGOREGRA2)
            WHERE J.CODIGOCAMPEONATO = @CodigoCampeonato
              AND R.TIPOREGRA = 1
              AND R.CODIGOGRUPO = @CodigoGrupo
              AND R.CODIGOREGRA = J.CODIGOREGRA2) R
    WHERE USUARIOJOGO.CODIGOUSUARIO = @CodigoUsuario
      AND USUARIOJOGO.CODIGOCAMPEONATO = @CodigoCampeonato
      AND R.CODIGOCAMPEONATO = USUARIOJOGO.CODIGOCAMPEONATO
      AND R.CODIGOJOGO = USUARIOJOGO.CODIGOJOGO
   
   EXECUTE [dbo].[spSysAtualizarMataMataU]
           @CodigoUsuario = @CodigoUsuario,
           @CodigoCampeonato = @CodigoCampeonato
END
GO