DROP DATABASE escola;

CREATE SCHEMA IF NOT EXISTS escola;
USE escola;


CREATE TABLE IF NOT EXISTS turma (
  idTurma INT NOT NULL AUTO_INCREMENT,
  anoTurma VARCHAR(45) NULL,
  PRIMARY KEY (idTurma))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS nota (
  idNota INT NOT NULL AUTO_INCREMENT,
  mediaNota FLOAT NULL,
  aprovadoNota VARCHAR(45) NULL,
  PRIMARY KEY (idNota))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS aluno (
  idAluno INT NOT NULL AUTO_INCREMENT,
  idadeAluno INT NULL,
  nomeAluno VARCHAR(45) NULL,
  turma_idTurma INT NOT NULL,
  nota_idNota INT NOT NULL,
  PRIMARY KEY (idAluno),
  CONSTRAINT fk_aluno_turma
    FOREIGN KEY (turma_idTurma)
    REFERENCES escola.turma (idTurma)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_aluno_nota1
    FOREIGN KEY (nota_idNota)
    REFERENCES escola.nota (idNota)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS professor (
  idProfessor INT NOT NULL AUTO_INCREMENT,
  idadeProfessor INT NULL,
  salarioProfessor FLOAT NULL,
  nomeProfessor VARCHAR(45) NULL,
  PRIMARY KEY (idProfessor))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS lessiona (
  professor_idProfessor INT NOT NULL,
  turma_idTurma INT NOT NULL,
  materiaProfessorTurma VARCHAR(45) NULL,
  PRIMARY KEY (professor_idProfessor, turma_idTurma),
  CONSTRAINT fk_professor_has_turma_professor1
    FOREIGN KEY (professor_idProfessor)
    REFERENCES escola.professor (idProfessor)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_professor_has_turma_turma1
    FOREIGN KEY (turma_idTurma)
    REFERENCES escola.turma (idTurma)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO turma () VALUES (default, 'Terceiro');
INSERT INTO turma () VALUES (default, 'Segundo');
INSERT INTO turma () VALUES (default, 'Primeiro');

INSERT INTO nota () VALUES (default, 67.5, 'Sim');
INSERT INTO nota () VALUES (default, 77.5, 'Sim');
INSERT INTO nota () VALUES (default, 9.5, 'Nao');
INSERT INTO nota () VALUES (default, 59.9, 'Nao');
INSERT INTO nota () VALUES (default, 88.8, 'Sim');
INSERT INTO nota () VALUES (default, 28.2, 'Nao');
INSERT INTO nota () VALUES (default, 100, 'Sim');

INSERT INTO aluno () VALUES (default, 17, 'Joao', 1, 1);
INSERT INTO aluno () VALUES (default, 18, 'Marcos', 1, 2);
INSERT INTO aluno () VALUES (default, 15, 'Maria', 2, 3);
INSERT INTO aluno () VALUES (default, 16, 'Jorge', 2, 4);
INSERT INTO aluno () VALUES (default, 15, 'Carimbo', 3, 5);
INSERT INTO aluno () VALUES (default, 17, 'Fotocopia', 3, 6);
INSERT INTO aluno () VALUES (default, 17, 'Natasha', 3, 7);


INSERT INTO professor () VALUES (default, 44, 1500, 'Jonathan');
INSERT INTO professor () VALUES (default, 35, 1200, 'Oracio');
INSERT INTO professor () VALUES (default, 71, 7800, 'Ronivaldo');
INSERT INTO professor () VALUES (default, 20, 500, 'Fabinho');

INSERT INTO lessiona () VALUES (1, 1, 'Matematica');
INSERT INTO lessiona () VALUES (1, 2, 'Matematica');
INSERT INTO lessiona () VALUES (1, 3, 'Matematica');
INSERT INTO lessiona () VALUES (2, 1, 'Portugues');
INSERT INTO lessiona () VALUES (2, 2, 'Portugues');
INSERT INTO lessiona () VALUES (2, 3, 'Portugues');
INSERT INTO lessiona () VALUES (3, 2, 'Historia');
INSERT INTO lessiona () VALUES (4, 3, 'Mimica');

UPDATE nota SET mediaNota = 99.8 WHERE idNota = 7;

DELETE FROM aluno WHERE idAluno = 3;

SELECT mediaNota, nomeAluno FROM nota, aluno WHERE idNota = nota_idNota;

SELECT anoTurma, nomeAluno FROM turma, aluno WHERE idTurma = turma_idTurma;

SELECT materiaProfessorTurma, nomeProfessor, anoTurma FROM lessiona, professor, turma WHERE idProfessor = professor_idProfessor AND idTurma = turma_idTurma;