-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 11-Dez-2020 às 22:47
-- Versão do servidor: 10.4.13-MariaDB
-- versão do PHP: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `escola`
--
CREATE DATABASE IF NOT EXISTS `escola` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `escola`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cargo`
--

CREATE TABLE `cargo` (
  `codcargo` int(11) NOT NULL,
  `cargo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `cargo`
--

INSERT INTO `cargo` (`codcargo`, `cargo`) VALUES
(1, 'professor'),
(2, 'coordpeda'),
(3, 'coordbiblio'),
(4, 'coordinfo'),
(5, 'coordenme'),
(6, 'coordrh'),
(7, 'diretor');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cargofunc`
--

CREATE TABLE `cargofunc` (
  `codfuncionario` int(11) NOT NULL,
  `codcargo` int(11) NOT NULL,
  `dataentrada` date NOT NULL,
  `datasaida` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `cargofunc`
--

INSERT INTO `cargofunc` (`codfuncionario`, `codcargo`, `dataentrada`, `datasaida`) VALUES
(1, 1, '2010-08-12', NULL),
(1, 5, '2012-10-26', '2015-12-16'),
(1, 2, '2016-02-05', '0000-00-00'),
(3, 1, '2012-06-17', NULL),
(3, 6, '2019-03-16', NULL),
(3, 3, '2015-03-24', NULL),
(2, 1, '2006-10-10', NULL),
(2, 4, '2009-05-17', '2012-12-14'),
(4, 1, '2006-04-16', NULL),
(4, 5, '2008-02-10', '2010-12-05');

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionario`
--

CREATE TABLE `funcionario` (
  `codfuncionario` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `dataentrada` date NOT NULL,
  `datasaida` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `funcionario`
--

INSERT INTO `funcionario` (`codfuncionario`, `nome`, `dataentrada`, `datasaida`) VALUES
(1, 'Amanda', '2010-08-12', NULL),
(2, 'Anderson', '2006-10-10', NULL),
(3, 'Agda', '2012-06-17', NULL),
(4, 'Nicolau', '2006-04-16', NULL);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `cargo`
--
ALTER TABLE `cargo`
  ADD PRIMARY KEY (`codcargo`);

--
-- Índices para tabela `cargofunc`
--
ALTER TABLE `cargofunc`
  ADD KEY `codfuncionario` (`codfuncionario`),
  ADD KEY `codcargo` (`codcargo`);

--
-- Índices para tabela `funcionario`
--
ALTER TABLE `funcionario`
  ADD PRIMARY KEY (`codfuncionario`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `cargo`
--
ALTER TABLE `cargo`
  MODIFY `codcargo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `funcionario`
--
ALTER TABLE `funcionario`
  MODIFY `codfuncionario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `cargofunc`
--
ALTER TABLE `cargofunc`
  ADD CONSTRAINT `cargofunc_ibfk_1` FOREIGN KEY (`codcargo`) REFERENCES `cargo` (`codcargo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cargofunc_ibfk_2` FOREIGN KEY (`codfuncionario`) REFERENCES `funcionario` (`codfuncionario`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
