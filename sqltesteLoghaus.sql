create schema crudusuarios
use crudusuarios

CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nomeCompleto` varchar(100) NOT NULL,
  `endereco` varchar(100) NOT NULL,
  `cidade` varchar(100) NOT NULL,
  `unidadeFederativa` varchar(100) NOT NULL,
  `CPF` varchar(100) NOT NULL,
  `telefone` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
)

INSERT INTO `usuario` (`nomeCompleto`, `endereco`, `cidade`, `unidadeFederativa`, `CPF`, `telefone`) VALUES
('Tai', 'Rua x', 'Pomerode', 'SC', '05555555', '33873719')

select * from usuario

//códigos não utilizados:
CREATE TABLE IF NOT EXISTS `telefone` (
	`telefoneId` INT(10) NOT NULL AUTO_INCREMENT,
	`numero` int(10) NOT NULL,
    `usuarioId` int(10) NOT NULL REFERENCES usuario(`id`),
    PRIMARY KEY(`telefoneId`)
)
insert into `telefone` (`numero`, `usuarioId`) VALUES ('88888888', '1')
