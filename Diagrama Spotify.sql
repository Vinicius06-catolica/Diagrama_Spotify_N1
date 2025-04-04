CREATE TABLE `Artista` (
	`ID` INTEGER,
	`Nome` VARCHAR(255),
	`Seguidores` INTEGER,
	`Popularidade` INTEGER,
	`Imagem` BLOB,
	PRIMARY KEY(`ID`)
);


CREATE TABLE `Genero` (
	`ID` INTEGER,
	`Nome` VARCHAR(255),
	PRIMARY KEY(`ID`)
);


CREATE TABLE `Album` (
	`ID` INTEGER,
	`Nome` VARCHAR(255),
	`Data` DATE,
	`ImagemCapa` BLOB,
	PRIMARY KEY(`ID`)
);


CREATE TABLE `ArtistaAlbum` (
	`ArtistaID` INTEGER,
	`AlbumID` INTEGER,
	PRIMARY KEY(`ArtistaID`, `AlbumID`)
);


CREATE TABLE `Musica` (
	`ID` INTEGER,
	`Nome` VARCHAR(255),
	`Duracao` INTEGER,
	`Explicito` BOOLEAN,
	`Volume` INTEGER,
	`Popularidade` INTEGER,
	`Dancabilidade` INTEGER,
	`Energia` INTEGER,
	`Valencia` INTEGER,
	PRIMARY KEY(`ID`)
);


CREATE TABLE `MusicaGenero` (
	`MusicaID` INTEGER,
	`GeneroID` INTEGER,
	PRIMARY KEY(`MusicaID`, `GeneroID`)
);


CREATE TABLE `Ranking` (
	`ID` INTEGER,
	`Tipo` VARCHAR(255),
	`LocalidadeID` INTEGER,
	PRIMARY KEY(`ID`)
);


CREATE TABLE `MusicaRanking` (
	`RankingID` INTEGER,
	`MusicaID` INTEGER,
	`Posicao` INTEGER,
	`Data` DATE,
	PRIMARY KEY(`RankingID`, `MusicaID`)
);


CREATE TABLE `ArtistaMusica` (
	`ArtistaID` INTEGER,
	`MusicaID` INTEGER,
	PRIMARY KEY(`ArtistaID`, `MusicaID`)
);


CREATE TABLE `Playlist` (
	`ID` INTEGER,
	`Nome` VARCHAR(255),
	`Descricao` TEXT,
	`UsuarioID` INTEGER,
	`DataCriacao` DATE,
	`Publica` BOOLEAN,
	PRIMARY KEY(`ID`)
);


CREATE TABLE `PlaylistMusica` (
	`PlaylistID` INTEGER,
	`MusicaID` INTEGER,
	`Ordem` INTEGER,
	`DataAdicao` DATETIME,
	PRIMARY KEY(`PlaylistID`, `MusicaID`)
);


CREATE TABLE `Localidade` (
	`ID` INTEGER,
	`Cidade` VARCHAR(255),
	`Estado` VARCHAR(255),
	`Regiao` VARCHAR(255),
	PRIMARY KEY(`ID`)
);


CREATE TABLE `MusicaAlbum` (
	`MusicaID` INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
	`AlbumID` INTEGER NOT NULL,
	`Faixa` VARCHAR(255),
	PRIMARY KEY(`MusicaID`, `AlbumID`)
);


CREATE TABLE `GeneroArtista` (
	`GeneroID` INTEGER NOT NULL,
	`ArtistaID` INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
	PRIMARY KEY(`GeneroID`, `ArtistaID`)
);


CREATE TABLE `TipoAssinatura` (
	`ID` INTEGER,
	`Nome` VARCHAR(255) NOT NULL,
	`Descricao` VARCHAR(255),
	`Preco` FLOAT NOT NULL,
	`Beneficios` VARCHAR(255),
	`DuracaoDias` INTEGER,
	PRIMARY KEY(`ID`)
);


CREATE TABLE `Assinatura` (
	`ID` INTEGER,
	`TipoAssinaturaID` INTEGER NOT NULL,
	`DataInicio` DATE NOT NULL,
	`DataExpiracao` DATE NOT NULL,
	`Ativa` BOOLEAN DEFAULT true,
	PRIMARY KEY(`ID`)
);


CREATE TABLE `Usuario` (
	`ID` INTEGER,
	`Nome` VARCHAR(255),
	`Email` VARCHAR(255) UNIQUE,
	`DataCadastro` DATE,
	`AssinaturaAtivaID` INTEGER NOT NULL,
	PRIMARY KEY(`ID`)
);


ALTER TABLE `ArtistaAlbum`
ADD FOREIGN KEY(`ArtistaID`) REFERENCES `Artista`(`ID`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `ArtistaAlbum`
ADD FOREIGN KEY(`AlbumID`) REFERENCES `Album`(`ID`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `MusicaGenero`
ADD FOREIGN KEY(`MusicaID`) REFERENCES `Musica`(`ID`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `MusicaGenero`
ADD FOREIGN KEY(`GeneroID`) REFERENCES `Genero`(`ID`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `MusicaRanking`
ADD FOREIGN KEY(`RankingID`) REFERENCES `Ranking`(`ID`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `MusicaRanking`
ADD FOREIGN KEY(`MusicaID`) REFERENCES `Musica`(`ID`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `ArtistaMusica`
ADD FOREIGN KEY(`ArtistaID`) REFERENCES `Artista`(`ID`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `ArtistaMusica`
ADD FOREIGN KEY(`MusicaID`) REFERENCES `Musica`(`ID`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `PlaylistMusica`
ADD FOREIGN KEY(`PlaylistID`) REFERENCES `Playlist`(`ID`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `PlaylistMusica`
ADD FOREIGN KEY(`MusicaID`) REFERENCES `Musica`(`ID`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `Ranking`
ADD FOREIGN KEY(`LocalidadeID`) REFERENCES `Localidade`(`ID`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `MusicaAlbum`
ADD FOREIGN KEY(`AlbumID`) REFERENCES `Album`(`ID`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `MusicaAlbum`
ADD FOREIGN KEY(`MusicaID`) REFERENCES `Musica`(`ID`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `GeneroArtista`
ADD FOREIGN KEY(`ArtistaID`) REFERENCES `Artista`(`ID`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `GeneroArtista`
ADD FOREIGN KEY(`GeneroID`) REFERENCES `Genero`(`ID`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `Playlist`
ADD FOREIGN KEY(`UsuarioID`) REFERENCES `Usuario`(`ID`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `Usuario`
ADD FOREIGN KEY(`AssinaturaAtivaID`) REFERENCES `Assinatura`(`ID`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `Assinatura`
ADD FOREIGN KEY(`TipoAssinaturaID`) REFERENCES `TipoAssinatura`(`ID`)
ON UPDATE NO ACTION ON DELETE NO ACTION;