CREATE TABLE TbUsuario(
	id INT NOT NULL AUTO_INCREMENT,
    usuario VARCHAR(100),
    senha VARCHAR(100),
    PRIMARY KEY (id)
);

CREATE TABLE TbEditora(
	id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100),
    PRIMARY KEY (id)
);

CREATE TABLE TbAutor(
	id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100),
    PRIMARY KEY (id)
);

CREATE TABLE TbLivro(
	id INT NOT NULL AUTO_INCREMENT,
    idEditora INT NOT NULL,
    idAutor INT NOT NULL,
    título VARCHAR(100),
    sinopse VARCHAR(1000),
    paginas INT,
    ano INT,
    PRIMARY KEY (id),
    FOREIGN KEY(idEditora) REFERENCES TbEditora(id),
    FOREIGN KEY(idAutor) REFERENCES TbAutor(id)
);

CREATE TABLE TbLendo(
	id INT NOT NULL AUTO_INCREMENT,
    idLivro INT NOT NULL,
    idUsuario INT NOT NULL,
    paginaAtual INT,
    paginasTotal INT,
    PRIMARY KEY (id),
    FOREIGN KEY(idUsuario) REFERENCES TbUsuario(id),
    FOREIGN KEY(idLivro) REFERENCES TbLivro(id)
);

CREATE TABLE TbQueroLer(
	id INT NOT NULL AUTO_INCREMENT,
    idLivro INT NOT NULL,
    idUsuario INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY(idUsuario) REFERENCES TbUsuario(id),
    FOREIGN KEY(idLivro) REFERENCES TbLivro(id)
);

CREATE TABLE TbLidos(
	id INT NOT NULL AUTO_INCREMENT,
    idLivro INT NOT NULL,
    idUsuario INT NOT NULL,
    nota NUMERIC(2,1), 
    dataConclusao DATE,
    PRIMARY KEY (id),
    FOREIGN KEY(idUsuario) REFERENCES TbUsuario(id),
    FOREIGN KEY(idLivro) REFERENCES TbLivro(id)
);

CREATE TABLE TbPareiDeLer(
	id INT NOT NULL AUTO_INCREMENT,
    idLivro INT NOT NULL,
    idUsuario INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY(idUsuario) REFERENCES TbUsuario(id),
    FOREIGN KEY(idLivro) REFERENCES TbLivro(id)
);
    