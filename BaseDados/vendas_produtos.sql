-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 18-Jun-2021 às 22:22
-- Versão do servidor: 10.4.16-MariaDB
-- versão do PHP: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `vendas_produtos`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `tlivro`
--

CREATE TABLE `tlivro` (
  `codnu` int(11) NOT NULL,
  `nomeresp` varchar(30) NOT NULL,
  `endereco` varchar(30) NOT NULL,
  `plano_jaba` varchar(10) DEFAULT NULL,
  `n_membro` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tpedido`
--

CREATE TABLE `tpedido` (
  `fk_idproduto` int(11) NOT NULL,
  `fk_codnu` int(11) NOT NULL,
  `qtdade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tplivre`
--

CREATE TABLE `tplivre` (
  `padicional` float NOT NULL,
  `fk_idproduto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tpregulamentado`
--

CREATE TABLE `tpregulamentado` (
  `fk_idproduto` int(11) NOT NULL,
  `qtdade_max` int(11) DEFAULT NULL,
  `nive_subsidio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tproduto`
--

CREATE TABLE `tproduto` (
  `idproduto` int(11) NOT NULL,
  `nomep` varchar(20) NOT NULL,
  `estado` int(11) NOT NULL,
  `tipologia` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tproduto`
--

INSERT INTO `tproduto` (`idproduto`, `nomep`, `estado`, `tipologia`) VALUES
(1, 'Macã', 1, 'nacional'),
(2, 'Banana', 0, 'importado');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `tlivro`
--
ALTER TABLE `tlivro`
  ADD PRIMARY KEY (`codnu`);

--
-- Índices para tabela `tpedido`
--
ALTER TABLE `tpedido`
  ADD PRIMARY KEY (`fk_codnu`,`fk_idproduto`),
  ADD KEY `fk_idproduto` (`fk_idproduto`);

--
-- Índices para tabela `tplivre`
--
ALTER TABLE `tplivre`
  ADD PRIMARY KEY (`fk_idproduto`);

--
-- Índices para tabela `tpregulamentado`
--
ALTER TABLE `tpregulamentado`
  ADD PRIMARY KEY (`fk_idproduto`);

--
-- Índices para tabela `tproduto`
--
ALTER TABLE `tproduto`
  ADD PRIMARY KEY (`idproduto`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `tlivro`
--
ALTER TABLE `tlivro`
  MODIFY `codnu` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tplivre`
--
ALTER TABLE `tplivre`
  MODIFY `fk_idproduto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tproduto`
--
ALTER TABLE `tproduto`
  MODIFY `idproduto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `tpedido`
--
ALTER TABLE `tpedido`
  ADD CONSTRAINT `tpedido_ibfk_1` FOREIGN KEY (`fk_idproduto`) REFERENCES `tproduto` (`idproduto`),
  ADD CONSTRAINT `tpedido_ibfk_2` FOREIGN KEY (`fk_codnu`) REFERENCES `tlivro` (`codnu`);

--
-- Limitadores para a tabela `tplivre`
--
ALTER TABLE `tplivre`
  ADD CONSTRAINT `tplivre_ibfk_1` FOREIGN KEY (`fk_idproduto`) REFERENCES `tproduto` (`idproduto`);

--
-- Limitadores para a tabela `tpregulamentado`
--
ALTER TABLE `tpregulamentado`
  ADD CONSTRAINT `tpregulamentado_ibfk_1` FOREIGN KEY (`fk_idproduto`) REFERENCES `tproduto` (`idproduto`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
