-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 18-Jun-2021 às 22:14
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
-- Banco de dados: `biblioteca`
--
CREATE DATABASE IF NOT EXISTS `biblioteca` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `biblioteca`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `meutest`
--

CREATE TABLE `meutest` (
  `rua` int(11) NOT NULL,
  `casa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tautor`
--

CREATE TABLE `tautor` (
  `codautor` int(11) NOT NULL,
  `nome` varchar(30) NOT NULL,
  `apelido` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tautor`
--

INSERT INTO `tautor` (`codautor`, `nome`, `apelido`) VALUES
(1, 'Cipriano', 'Inácio'),
(5, 'lilo', 'hh');

-- --------------------------------------------------------

--
-- Estrutura da tabela `teditora`
--

CREATE TABLE `teditora` (
  `codeditora` int(11) NOT NULL,
  `nome` varchar(30) NOT NULL,
  `fkpais` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `teditora`
--

INSERT INTO `teditora` (`codeditora`, `nome`, `fkpais`) VALUES
(1, 'editoral', 15),
(2, 'ferm', 16),
(3, 'lelo', 15);

-- --------------------------------------------------------

--
-- Estrutura da tabela `temprestimo`
--

CREATE TABLE `temprestimo` (
  `fk_livro` int(11) NOT NULL,
  `fk_exempl` int(11) NOT NULL,
  `fk_user` int(11) NOT NULL,
  `datadev` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `texemplar`
--

CREATE TABLE `texemplar` (
  `numexpl` int(11) NOT NULL,
  `fk_livro` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tincumprimento`
--

CREATE TABLE `tincumprimento` (
  `fk_numex` int(11) NOT NULL,
  `fk_codlivro` int(11) NOT NULL,
  `fk_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tlivro`
--

CREATE TABLE `tlivro` (
  `codlivro` int(11) NOT NULL,
  `titulo` varchar(30) NOT NULL,
  `anoEd` date DEFAULT NULL,
  `fk_editora` int(11) DEFAULT NULL,
  `resumo` varchar(60) NOT NULL,
  `qtdP` int(11) DEFAULT NULL,
  `fk_materia` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tmateria`
--

CREATE TABLE `tmateria` (
  `codMateria` int(11) NOT NULL,
  `materia` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tpais`
--

CREATE TABLE `tpais` (
  `codpais` int(11) NOT NULL,
  `nome_pais` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tpais`
--

INSERT INTO `tpais` (`codpais`, `nome_pais`) VALUES
(11, '	Portugal'),
(12, 'Angola'),
(15, 'Brasil'),
(14, 'Cabo-Verde'),
(13, 'Portugal');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tsancao`
--

CREATE TABLE `tsancao` (
  `codSancao` int(11) NOT NULL,
  `typsancao` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tsancionados`
--

CREATE TABLE `tsancionados` (
  `datimp` int(11) DEFAULT NULL,
  `fk_user` int(11) NOT NULL,
  `fk_sanc` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tusuario`
--

CREATE TABLE `tusuario` (
  `BI` int(11) NOT NULL,
  `nome` varchar(30) NOT NULL,
  `apelido` varchar(30) NOT NULL,
  `area` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tusuario`
--

INSERT INTO `tusuario` (`BI`, `nome`, `apelido`, `area`) VALUES
(123, 'Ana', 'Maria', 'economia'),
(234, 'Elidio', 'Andrade', 'Electrica'),
(235, 'Henda', 'Hebo', 'Quimica');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `tautor`
--
ALTER TABLE `tautor`
  ADD PRIMARY KEY (`codautor`);

--
-- Índices para tabela `teditora`
--
ALTER TABLE `teditora`
  ADD PRIMARY KEY (`codeditora`);

--
-- Índices para tabela `temprestimo`
--
ALTER TABLE `temprestimo`
  ADD PRIMARY KEY (`fk_livro`,`fk_exempl`,`fk_user`),
  ADD KEY `fk_user` (`fk_user`);

--
-- Índices para tabela `texemplar`
--
ALTER TABLE `texemplar`
  ADD PRIMARY KEY (`numexpl`,`fk_livro`),
  ADD KEY `fk_livro` (`fk_livro`);

--
-- Índices para tabela `tincumprimento`
--
ALTER TABLE `tincumprimento`
  ADD PRIMARY KEY (`fk_numex`,`fk_codlivro`,`fk_user`),
  ADD KEY `fk_codlivro` (`fk_codlivro`),
  ADD KEY `fk_user` (`fk_user`);

--
-- Índices para tabela `tlivro`
--
ALTER TABLE `tlivro`
  ADD PRIMARY KEY (`codlivro`),
  ADD KEY `fk_editora` (`fk_editora`),
  ADD KEY `fk_materia` (`fk_materia`);

--
-- Índices para tabela `tmateria`
--
ALTER TABLE `tmateria`
  ADD PRIMARY KEY (`codMateria`);

--
-- Índices para tabela `tpais`
--
ALTER TABLE `tpais`
  ADD PRIMARY KEY (`codpais`),
  ADD UNIQUE KEY `nome_pais` (`nome_pais`);

--
-- Índices para tabela `tsancao`
--
ALTER TABLE `tsancao`
  ADD PRIMARY KEY (`codSancao`);

--
-- Índices para tabela `tsancionados`
--
ALTER TABLE `tsancionados`
  ADD PRIMARY KEY (`fk_user`,`fk_sanc`),
  ADD KEY `fk_sanc` (`fk_sanc`);

--
-- Índices para tabela `tusuario`
--
ALTER TABLE `tusuario`
  ADD PRIMARY KEY (`BI`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `tautor`
--
ALTER TABLE `tautor`
  MODIFY `codautor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `teditora`
--
ALTER TABLE `teditora`
  MODIFY `codeditora` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `texemplar`
--
ALTER TABLE `texemplar`
  MODIFY `numexpl` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tlivro`
--
ALTER TABLE `tlivro`
  MODIFY `codlivro` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tmateria`
--
ALTER TABLE `tmateria`
  MODIFY `codMateria` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tpais`
--
ALTER TABLE `tpais`
  MODIFY `codpais` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de tabela `tsancao`
--
ALTER TABLE `tsancao`
  MODIFY `codSancao` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `temprestimo`
--
ALTER TABLE `temprestimo`
  ADD CONSTRAINT `temprestimo_ibfk_1` FOREIGN KEY (`fk_user`) REFERENCES `tusuario` (`BI`),
  ADD CONSTRAINT `temprestimo_ibfk_2` FOREIGN KEY (`fk_livro`,`fk_exempl`) REFERENCES `texemplar` (`numexpl`, `fk_livro`);

--
-- Limitadores para a tabela `texemplar`
--
ALTER TABLE `texemplar`
  ADD CONSTRAINT `texemplar_ibfk_1` FOREIGN KEY (`fk_livro`) REFERENCES `tlivro` (`codlivro`);

--
-- Limitadores para a tabela `tincumprimento`
--
ALTER TABLE `tincumprimento`
  ADD CONSTRAINT `tincumprimento_ibfk_1` FOREIGN KEY (`fk_numex`) REFERENCES `texemplar` (`numexpl`),
  ADD CONSTRAINT `tincumprimento_ibfk_2` FOREIGN KEY (`fk_codlivro`) REFERENCES `tlivro` (`codlivro`),
  ADD CONSTRAINT `tincumprimento_ibfk_3` FOREIGN KEY (`fk_user`) REFERENCES `tusuario` (`BI`);

--
-- Limitadores para a tabela `tlivro`
--
ALTER TABLE `tlivro`
  ADD CONSTRAINT `tlivro_ibfk_1` FOREIGN KEY (`fk_editora`) REFERENCES `teditora` (`codeditora`),
  ADD CONSTRAINT `tlivro_ibfk_2` FOREIGN KEY (`fk_materia`) REFERENCES `tmateria` (`codMateria`);

--
-- Limitadores para a tabela `tsancionados`
--
ALTER TABLE `tsancionados`
  ADD CONSTRAINT `tsancionados_ibfk_1` FOREIGN KEY (`fk_user`) REFERENCES `tusuario` (`BI`),
  ADD CONSTRAINT `tsancionados_ibfk_2` FOREIGN KEY (`fk_sanc`) REFERENCES `tsancao` (`codSancao`);
--
-- Banco de dados: `ivonete`
--
CREATE DATABASE IF NOT EXISTS `ivonete` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `ivonete`;
--
-- Banco de dados: `ivonetest`
--
CREATE DATABASE IF NOT EXISTS `ivonetest` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `ivonetest`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `minhasroupa`
--

CREATE TABLE `minhasroupa` (
  `id_roupa` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
--
-- Banco de dados: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin DEFAULT NULL,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

--
-- Extraindo dados da tabela `pma__designer_settings`
--

INSERT INTO `pma__designer_settings` (`username`, `settings_data`) VALUES
('root', '{\"angular_direct\":\"direct\",\"snap_to_grid\":\"off\",\"relation_lines\":\"false\"}');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

--
-- Extraindo dados da tabela `pma__export_templates`
--

INSERT INTO `pma__export_templates` (`id`, `username`, `export_type`, `template_name`, `template_data`) VALUES
(1, 'root', 'database', 'projecto_prog3(1).sql', '{\"quick_or_custom\":\"quick\",\"what\":\"sql\",\"structure_or_data_forced\":\"0\",\"table_select[]\":[\"animal\",\"animalgastosmensais\",\"credito\",\"dizimos\",\"familia\",\"familiagastosmensais\",\"filho\",\"gastos\",\"mae\",\"pai\",\"pessoa\",\"pessoagastosmensais\",\"previsaomensal\",\"rendimento\"],\"table_structure[]\":[\"animal\",\"animalgastosmensais\",\"credito\",\"dizimos\",\"familia\",\"familiagastosmensais\",\"filho\",\"gastos\",\"mae\",\"pai\",\"pessoa\",\"pessoagastosmensais\",\"previsaomensal\",\"rendimento\"],\"table_data[]\":[\"animal\",\"animalgastosmensais\",\"credito\",\"dizimos\",\"familia\",\"familiagastosmensais\",\"filho\",\"gastos\",\"mae\",\"pai\",\"pessoa\",\"pessoagastosmensais\",\"previsaomensal\",\"rendimento\"],\"aliases_new\":\"\",\"output_format\":\"sendit\",\"filename_template\":\"@DATABASE@\",\"remember_template\":\"on\",\"charset\":\"utf-8\",\"compression\":\"none\",\"maxsize\":\"\",\"codegen_structure_or_data\":\"data\",\"codegen_format\":\"0\",\"csv_separator\":\",\",\"csv_enclosed\":\"\\\"\",\"csv_escaped\":\"\\\"\",\"csv_terminated\":\"AUTO\",\"csv_null\":\"NULL\",\"csv_structure_or_data\":\"data\",\"excel_null\":\"NULL\",\"excel_columns\":\"something\",\"excel_edition\":\"win\",\"excel_structure_or_data\":\"data\",\"json_structure_or_data\":\"data\",\"json_unicode\":\"something\",\"latex_caption\":\"something\",\"latex_structure_or_data\":\"structure_and_data\",\"latex_structure_caption\":\"estructura da tabela @TABLE@\",\"latex_structure_continued_caption\":\"estructura da tabela @TABLE@ (continuação)\",\"latex_structure_label\":\"tab:@TABLE@-structure\",\"latex_relation\":\"something\",\"latex_comments\":\"something\",\"latex_mime\":\"something\",\"latex_columns\":\"something\",\"latex_data_caption\":\"Conteúdo da tabela @TABLE@\",\"latex_data_continued_caption\":\"Conteúdo da tabela @TABLE@ (continuação)\",\"latex_data_label\":\"tab:@TABLE@-data\",\"latex_null\":\"\\\\textit{NULL}\",\"mediawiki_structure_or_data\":\"structure_and_data\",\"mediawiki_caption\":\"something\",\"mediawiki_headers\":\"something\",\"htmlword_structure_or_data\":\"structure_and_data\",\"htmlword_null\":\"NULL\",\"ods_null\":\"NULL\",\"ods_structure_or_data\":\"data\",\"odt_structure_or_data\":\"structure_and_data\",\"odt_relation\":\"something\",\"odt_comments\":\"something\",\"odt_mime\":\"something\",\"odt_columns\":\"something\",\"odt_null\":\"NULL\",\"pdf_report_title\":\"\",\"pdf_structure_or_data\":\"structure_and_data\",\"phparray_structure_or_data\":\"data\",\"sql_include_comments\":\"something\",\"sql_header_comment\":\"\",\"sql_use_transaction\":\"something\",\"sql_compatibility\":\"NONE\",\"sql_structure_or_data\":\"structure_and_data\",\"sql_create_table\":\"something\",\"sql_auto_increment\":\"something\",\"sql_create_view\":\"something\",\"sql_procedure_function\":\"something\",\"sql_create_trigger\":\"something\",\"sql_backquotes\":\"something\",\"sql_type\":\"INSERT\",\"sql_insert_syntax\":\"both\",\"sql_max_query_size\":\"50000\",\"sql_hex_for_binary\":\"something\",\"sql_utc_time\":\"something\",\"texytext_structure_or_data\":\"structure_and_data\",\"texytext_null\":\"NULL\",\"xml_structure_or_data\":\"data\",\"xml_export_events\":\"something\",\"xml_export_functions\":\"something\",\"xml_export_procedures\":\"something\",\"xml_export_tables\":\"something\",\"xml_export_triggers\":\"something\",\"xml_export_views\":\"something\",\"xml_export_contents\":\"something\",\"yaml_structure_or_data\":\"data\",\"\":null,\"lock_tables\":null,\"as_separate_files\":null,\"csv_removeCRLF\":null,\"csv_columns\":null,\"excel_removeCRLF\":null,\"json_pretty_print\":null,\"htmlword_columns\":null,\"ods_columns\":null,\"sql_dates\":null,\"sql_relation\":null,\"sql_mime\":null,\"sql_disable_fk\":null,\"sql_views_as_tables\":null,\"sql_metadata\":null,\"sql_create_database\":null,\"sql_drop_table\":null,\"sql_if_not_exists\":null,\"sql_view_current_user\":null,\"sql_or_replace_view\":null,\"sql_truncate\":null,\"sql_delayed\":null,\"sql_ignore\":null,\"texytext_columns\":null}');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Extraindo dados da tabela `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"vendas_produtos\",\"table\":\"tlivro\"},{\"db\":\"vendas_produtos\",\"table\":\"tproduto\"},{\"db\":\"vendas_produtos\",\"table\":\"tpedido\"},{\"db\":\"vendas_produtos\",\"table\":\"tpregulamentado\"},{\"db\":\"projecto_prog3\",\"table\":\"mae\"},{\"db\":\"test\",\"table\":\"tconta\"},{\"db\":\"test\",\"table\":\"tmov\"},{\"db\":\"test\",\"table\":\"tmovimento\"},{\"db\":\"biblioteca\",\"table\":\"tpais\"},{\"db\":\"biblioteca\",\"table\":\"teditora\"}]');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

--
-- Extraindo dados da tabela `pma__table_info`
--

INSERT INTO `pma__table_info` (`db_name`, `table_name`, `display_field`) VALUES
('projecto_prog3', 'gastos', 'design');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

--
-- Extraindo dados da tabela `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'projecto_prog3', 'previsaomensal', '{\"sorted_col\":\"`previsaomensal`.`designacao`  ASC\"}', '2021-02-24 21:23:24');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin DEFAULT NULL,
  `data_sql` longtext COLLATE utf8_bin DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Extraindo dados da tabela `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2021-06-18 20:13:35', '{\"Console\\/Mode\":\"show\",\"lang\":\"pt\",\"Console\\/Height\":-61.01050000000001,\"NavigationWidth\":251}');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Índices para tabela `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Índices para tabela `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Índices para tabela `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Índices para tabela `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Índices para tabela `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Índices para tabela `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Índices para tabela `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Índices para tabela `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Índices para tabela `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Índices para tabela `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Índices para tabela `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Índices para tabela `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Índices para tabela `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Índices para tabela `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Índices para tabela `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Índices para tabela `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Índices para tabela `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Banco de dados: `projctofinalpiii`
--
CREATE DATABASE IF NOT EXISTS `projctofinalpiii` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `projctofinalpiii`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `animal`
--

CREATE TABLE `animal` (
  `idanimail` int(11) NOT NULL,
  `nome` varchar(60) NOT NULL,
  `data_nasc` varchar(60) DEFAULT NULL,
  `raca` varchar(60) NOT NULL,
  `idfamilia` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `animal`
--

INSERT INTO `animal` (`idanimail`, `nome`, `data_nasc`, `raca`, `idfamilia`) VALUES
(1, 'Perry', '04/04/2018', 'Rott', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `credito`
--

CREATE TABLE `credito` (
  `idcredito` int(11) NOT NULL,
  `var_div` float NOT NULL,
  `var_conc` float NOT NULL,
  `dat_st` date NOT NULL,
  `var_venc` float NOT NULL,
  `dat_venc` date NOT NULL,
  `tot_rend` float NOT NULL,
  `idprevisao_mes` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `dizimo`
--

CREATE TABLE `dizimo` (
  `iddizimo` int(11) NOT NULL,
  `var_dizi` float NOT NULL,
  `instit` varchar(60) NOT NULL,
  `dat_dizi` date NOT NULL,
  `id_previsao` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `familia`
--

CREATE TABLE `familia` (
  `idfamilia` int(11) NOT NULL,
  `telf_casa` varchar(60) NOT NULL,
  `ender` varchar(60) NOT NULL,
  `bairro` varchar(60) NOT NULL,
  `idpai` int(11) NOT NULL,
  `idmae` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `familia`
--

INSERT INTO `familia` (`idfamilia`, `telf_casa`, `ender`, `bairro`, `idpai`, `idmae`) VALUES
(2, '922 333 444 555', 'Benfica', 'Patriota', 1, 0),
(3, '922 111 222 999', 'Talatona', 'Quifica', 2, 0),
(4, '922 111 222 999', 'Rocha', 'Padaria', 2, 0),
(5, '4554', 'Benfica', 'Patriota', 4, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `filho`
--

CREATE TABLE `filho` (
  `idfilho` int(11) NOT NULL,
  `idpessoa` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `gastos_mensais`
--

CREATE TABLE `gastos_mensais` (
  `idgasto_mes` int(11) NOT NULL,
  `desig` varchar(60) NOT NULL,
  `var_gasto` float NOT NULL,
  `loc_gasto` varchar(60) NOT NULL,
  `idfamilia` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `mae`
--

CREATE TABLE `mae` (
  `idmae` int(11) NOT NULL,
  `idpessoa` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `mae`
--

INSERT INTO `mae` (`idmae`, `idpessoa`) VALUES
(0, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pai`
--

CREATE TABLE `pai` (
  `idpai` int(11) NOT NULL,
  `idpessoa` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `pai`
--

INSERT INTO `pai` (`idpai`, `idpessoa`) VALUES
(1, 1),
(2, 2),
(3, 2),
(4, 0),
(5, 10);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pessoa`
--

CREATE TABLE `pessoa` (
  `idpessoa` int(11) NOT NULL,
  `nome` varchar(60) NOT NULL,
  `dat_nasc` varchar(60) NOT NULL,
  `tlf` varchar(60) NOT NULL,
  `email` varchar(60) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `pessoa`
--

INSERT INTO `pessoa` (`idpessoa`, `nome`, `dat_nasc`, `tlf`, `email`) VALUES
(1, 'Kipas', '11/11/1997', '912 999 999 999', 'kipas@gmail.com'),
(2, 'Antonio Pedro', '19-03-2000', '912 999 999 999', 'kipas@gmail.com'),
(3, 'Antonio Pedro', '11/11/1997', '912 999 999 999', 'kipas@gmail.com'),
(4, 'Joao Castro', '12/12/1998', '913 999 999 999', 'kipas@gmail.com');

-- --------------------------------------------------------

--
-- Estrutura da tabela `previsao_mes`
--

CREATE TABLE `previsao_mes` (
  `idprevisao_mes` int(11) NOT NULL,
  `design` varchar(60) NOT NULL,
  `var_prev` float NOT NULL,
  `finali` varchar(60) CHARACTER SET latin1 NOT NULL,
  `idfamilia` int(11) NOT NULL,
  `idgasto_mes` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `rendimento`
--

CREATE TABLE `rendimento` (
  `idrendimento` int(11) NOT NULL,
  `var_rendi` float NOT NULL,
  `orig` varchar(60) NOT NULL,
  `dat_rend` varchar(11) NOT NULL,
  `idprevisao_mes` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `animal`
--
ALTER TABLE `animal`
  ADD PRIMARY KEY (`idanimail`);

--
-- Índices para tabela `credito`
--
ALTER TABLE `credito`
  ADD PRIMARY KEY (`idcredito`);

--
-- Índices para tabela `dizimo`
--
ALTER TABLE `dizimo`
  ADD PRIMARY KEY (`iddizimo`);

--
-- Índices para tabela `familia`
--
ALTER TABLE `familia`
  ADD PRIMARY KEY (`idfamilia`);

--
-- Índices para tabela `filho`
--
ALTER TABLE `filho`
  ADD PRIMARY KEY (`idfilho`);

--
-- Índices para tabela `gastos_mensais`
--
ALTER TABLE `gastos_mensais`
  ADD PRIMARY KEY (`idgasto_mes`);

--
-- Índices para tabela `mae`
--
ALTER TABLE `mae`
  ADD PRIMARY KEY (`idmae`);

--
-- Índices para tabela `pai`
--
ALTER TABLE `pai`
  ADD PRIMARY KEY (`idpai`),
  ADD KEY `idpessoa` (`idpessoa`);

--
-- Índices para tabela `pessoa`
--
ALTER TABLE `pessoa`
  ADD PRIMARY KEY (`idpessoa`);

--
-- Índices para tabela `previsao_mes`
--
ALTER TABLE `previsao_mes`
  ADD PRIMARY KEY (`idprevisao_mes`);

--
-- Índices para tabela `rendimento`
--
ALTER TABLE `rendimento`
  ADD PRIMARY KEY (`idrendimento`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `animal`
--
ALTER TABLE `animal`
  MODIFY `idanimail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `credito`
--
ALTER TABLE `credito`
  MODIFY `idcredito` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `dizimo`
--
ALTER TABLE `dizimo`
  MODIFY `iddizimo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `familia`
--
ALTER TABLE `familia`
  MODIFY `idfamilia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `filho`
--
ALTER TABLE `filho`
  MODIFY `idfilho` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `gastos_mensais`
--
ALTER TABLE `gastos_mensais`
  MODIFY `idgasto_mes` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pai`
--
ALTER TABLE `pai`
  MODIFY `idpai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `pessoa`
--
ALTER TABLE `pessoa`
  MODIFY `idpessoa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Banco de dados: `projctofinalpiii2`
--
CREATE DATABASE IF NOT EXISTS `projctofinalpiii2` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `projctofinalpiii2`;
--
-- Banco de dados: `projecto_prog3`
--
CREATE DATABASE IF NOT EXISTS `projecto_prog3` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `projecto_prog3`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `animal`
--

CREATE TABLE `animal` (
  `idAnimal` int(11) NOT NULL,
  `nome` varchar(45) DEFAULT NULL,
  `raca` varchar(45) DEFAULT NULL,
  `data_nasc` varchar(45) DEFAULT NULL,
  `Familia_idFamilia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `animalgastosmensais`
--

CREATE TABLE `animalgastosmensais` (
  `idAnimal` int(11) NOT NULL,
  `idGastos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `credito`
--

CREATE TABLE `credito` (
  `idCredito` int(11) NOT NULL,
  `idPrevisaoMensal` int(11) NOT NULL,
  `valorConcedido` float DEFAULT NULL,
  `valorDivida` float DEFAULT NULL,
  `valorVencimento` float DEFAULT NULL,
  `totalRenda` float DEFAULT NULL,
  `dataSituacao` varchar(45) DEFAULT NULL,
  `data_venc` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `dizimos`
--

CREATE TABLE `dizimos` (
  `idDizimos` int(11) NOT NULL,
  `idPrevisaoMensal` int(11) NOT NULL,
  `valorDizimo` float DEFAULT NULL,
  `data_diz` varchar(20) NOT NULL,
  `instBeneficiaria` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `familia`
--

CREATE TABLE `familia` (
  `idFamilia` int(11) NOT NULL,
  `endereco` varchar(45) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `bairro` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `familia`
--

INSERT INTO `familia` (`idFamilia`, `endereco`, `telefone`, `bairro`) VALUES
(1, 'Patriota', '123456789', 'Benfica'),
(2, 'bellas', '12345', 'talatona');

-- --------------------------------------------------------

--
-- Estrutura da tabela `familiagastosmensais`
--

CREATE TABLE `familiagastosmensais` (
  `idFamilia` int(11) NOT NULL,
  `idGastos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `filho`
--

CREATE TABLE `filho` (
  `idPessoa` int(11) NOT NULL,
  `idFamilia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `filho`
--

INSERT INTO `filho` (`idPessoa`, `idFamilia`) VALUES
(6, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `gastos`
--

CREATE TABLE `gastos` (
  `idGastos` int(11) NOT NULL,
  `design` varchar(60) NOT NULL,
  `valor` float DEFAULT NULL,
  `local_de_gastos` varchar(45) DEFAULT NULL,
  `idPrevisaoMensal` int(11) NOT NULL,
  `Familia_idFamilia` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `mae`
--

CREATE TABLE `mae` (
  `idPessoa` int(11) NOT NULL,
  `idFamilia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `mae`
--

INSERT INTO `mae` (`idPessoa`, `idFamilia`) VALUES
(8, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pai`
--

CREATE TABLE `pai` (
  `idPessoa` int(11) NOT NULL,
  `idFamilia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `pai`
--

INSERT INTO `pai` (`idPessoa`, `idFamilia`) VALUES
(3, 1),
(4, 1),
(7, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pessoa`
--

CREATE TABLE `pessoa` (
  `idPessoa` int(11) NOT NULL,
  `nome` varchar(45) DEFAULT NULL,
  `telemovel` varchar(20) DEFAULT NULL,
  `dat_nasc` varchar(20) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `senha` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `pessoa`
--

INSERT INTO `pessoa` (`idPessoa`, `nome`, `telemovel`, `dat_nasc`, `email`, `senha`) VALUES
(1, 'Antonio', '912345678', '07/04/1987', 'antonio@gmail.com', ''),
(2, 'Pedro', '923456781', '20?08/2000', 'pedro@gmail.com', ''),
(3, 'jose', '912345678', '07/04/2001', 'jose@gmail.com', '123'),
(4, 'Ana', '90233456', '09/08/1998', 'ana@gmail', ''),
(5, 'ane', '009890999', '09/08/7999', 'ane@gmail', ''),
(6, 'carla', '923333333', '34/455/444', 'carla@gmail.com', '1234'),
(7, 'Twago', '123333', '12333444', 'twaga@gmail.com', '123456'),
(8, 'Twinga', '123456', '12345', 'twinga@hnjn', '12'),
(9, 'Twendo', '123456', '12345', 'twendo@gmailddf', '1');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pessoagastosmensais`
--

CREATE TABLE `pessoagastosmensais` (
  `idPessoa` int(11) NOT NULL,
  `idGastos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `previsaomensal`
--

CREATE TABLE `previsaomensal` (
  `idPrevisaoMensal` int(11) NOT NULL,
  `designacao` varchar(45) DEFAULT NULL,
  `valor` float DEFAULT NULL,
  `finalidade` varchar(45) DEFAULT NULL,
  `Familia_idFamilia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `previsaomensal`
--

INSERT INTO `previsaomensal` (`idPrevisaoMensal`, `designacao`, `valor`, `finalidade`, `Familia_idFamilia`) VALUES
(1, 'casa', 0, 'comida', 2),
(2, 'casa', 0, 'comida', 2),
(4, 'caderao', 0, 'compra', 2),
(5, 'caderao', 0, 'compra', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `rendimento`
--

CREATE TABLE `rendimento` (
  `idRendimento` int(11) NOT NULL,
  `idPrevisaoMensal` int(11) NOT NULL,
  `valorRend` float DEFAULT NULL,
  `origemRend` varchar(45) DEFAULT NULL,
  `data` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `animal`
--
ALTER TABLE `animal`
  ADD PRIMARY KEY (`idAnimal`),
  ADD KEY `fk_Animal_Familia1_idx` (`Familia_idFamilia`);

--
-- Índices para tabela `animalgastosmensais`
--
ALTER TABLE `animalgastosmensais`
  ADD PRIMARY KEY (`idAnimal`,`idGastos`),
  ADD KEY `fk_Animal_has_GastosMensais_Animal1_idx` (`idAnimal`),
  ADD KEY `fk_AnimalGastosMensais_Gastos1_idx` (`idGastos`);

--
-- Índices para tabela `credito`
--
ALTER TABLE `credito`
  ADD PRIMARY KEY (`idCredito`,`idPrevisaoMensal`),
  ADD KEY `fk_Credito_PrevisaoMensal1_idx` (`idPrevisaoMensal`);

--
-- Índices para tabela `dizimos`
--
ALTER TABLE `dizimos`
  ADD PRIMARY KEY (`idDizimos`,`idPrevisaoMensal`),
  ADD KEY `fk_Dizimos_PrevisaoMensal1_idx` (`idPrevisaoMensal`);

--
-- Índices para tabela `familia`
--
ALTER TABLE `familia`
  ADD PRIMARY KEY (`idFamilia`);

--
-- Índices para tabela `familiagastosmensais`
--
ALTER TABLE `familiagastosmensais`
  ADD PRIMARY KEY (`idFamilia`,`idGastos`),
  ADD KEY `fk_GastosMensais_has_Familia_Familia1_idx` (`idFamilia`),
  ADD KEY `fk_FamiliaGastosMensais_Gastos1_idx` (`idGastos`);

--
-- Índices para tabela `filho`
--
ALTER TABLE `filho`
  ADD PRIMARY KEY (`idPessoa`),
  ADD KEY `fk_Filho_Familia1_idx` (`idFamilia`);

--
-- Índices para tabela `gastos`
--
ALTER TABLE `gastos`
  ADD PRIMARY KEY (`idGastos`),
  ADD KEY `fk_GastosMensais_PrevisaoMensal1_idx` (`idPrevisaoMensal`);

--
-- Índices para tabela `mae`
--
ALTER TABLE `mae`
  ADD PRIMARY KEY (`idPessoa`,`idFamilia`),
  ADD KEY `fk_Mae_Familia1_idx` (`idFamilia`);

--
-- Índices para tabela `pai`
--
ALTER TABLE `pai`
  ADD PRIMARY KEY (`idPessoa`,`idFamilia`),
  ADD KEY `fk_Pai_Familia1_idx` (`idFamilia`);

--
-- Índices para tabela `pessoa`
--
ALTER TABLE `pessoa`
  ADD PRIMARY KEY (`idPessoa`);

--
-- Índices para tabela `pessoagastosmensais`
--
ALTER TABLE `pessoagastosmensais`
  ADD PRIMARY KEY (`idPessoa`,`idGastos`),
  ADD KEY `fk_Pessoa_has_GastosMensais_Pessoa1_idx` (`idPessoa`),
  ADD KEY `fk_PessoaGastosMensais_Gastos1_idx` (`idGastos`);

--
-- Índices para tabela `previsaomensal`
--
ALTER TABLE `previsaomensal`
  ADD PRIMARY KEY (`idPrevisaoMensal`),
  ADD KEY `fk_PrevisaoMensal_Familia1_idx` (`Familia_idFamilia`);

--
-- Índices para tabela `rendimento`
--
ALTER TABLE `rendimento`
  ADD PRIMARY KEY (`idRendimento`,`idPrevisaoMensal`),
  ADD KEY `fk_Rendimento_PrevisaoMensal1_idx` (`idPrevisaoMensal`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `animal`
--
ALTER TABLE `animal`
  MODIFY `idAnimal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `credito`
--
ALTER TABLE `credito`
  MODIFY `idCredito` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `dizimos`
--
ALTER TABLE `dizimos`
  MODIFY `idDizimos` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `familia`
--
ALTER TABLE `familia`
  MODIFY `idFamilia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `pessoa`
--
ALTER TABLE `pessoa`
  MODIFY `idPessoa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `previsaomensal`
--
ALTER TABLE `previsaomensal`
  MODIFY `idPrevisaoMensal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `rendimento`
--
ALTER TABLE `rendimento`
  MODIFY `idRendimento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `animal`
--
ALTER TABLE `animal`
  ADD CONSTRAINT `fk_Animal_Familia1` FOREIGN KEY (`Familia_idFamilia`) REFERENCES `familia` (`idFamilia`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `animalgastosmensais`
--
ALTER TABLE `animalgastosmensais`
  ADD CONSTRAINT `fk_AnimalGastosMensais_Gastos1` FOREIGN KEY (`idGastos`) REFERENCES `gastos` (`idGastos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Animal_has_GastosMensais_Animal1` FOREIGN KEY (`idAnimal`) REFERENCES `animal` (`idAnimal`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `credito`
--
ALTER TABLE `credito`
  ADD CONSTRAINT `fk_Credito_PrevisaoMensal1` FOREIGN KEY (`idPrevisaoMensal`) REFERENCES `previsaomensal` (`idPrevisaoMensal`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `dizimos`
--
ALTER TABLE `dizimos`
  ADD CONSTRAINT `fk_Dizimos_PrevisaoMensal1` FOREIGN KEY (`idPrevisaoMensal`) REFERENCES `previsaomensal` (`idPrevisaoMensal`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `familiagastosmensais`
--
ALTER TABLE `familiagastosmensais`
  ADD CONSTRAINT `fk_FamiliaGastosMensais_Gastos1` FOREIGN KEY (`idGastos`) REFERENCES `gastos` (`idGastos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_GastosMensais_has_Familia_Familia1` FOREIGN KEY (`idFamilia`) REFERENCES `familia` (`idFamilia`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `filho`
--
ALTER TABLE `filho`
  ADD CONSTRAINT `fk_Filho_Familia1` FOREIGN KEY (`idFamilia`) REFERENCES `familia` (`idFamilia`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Filho_Pessoa1` FOREIGN KEY (`idPessoa`) REFERENCES `pessoa` (`idPessoa`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `gastos`
--
ALTER TABLE `gastos`
  ADD CONSTRAINT `fk_GastosMensais_PrevisaoMensal1` FOREIGN KEY (`idPrevisaoMensal`) REFERENCES `previsaomensal` (`idPrevisaoMensal`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `mae`
--
ALTER TABLE `mae`
  ADD CONSTRAINT `fk_Mae_Familia1` FOREIGN KEY (`idFamilia`) REFERENCES `familia` (`idFamilia`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Mae_Pessoa1` FOREIGN KEY (`idPessoa`) REFERENCES `pessoa` (`idPessoa`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `pai`
--
ALTER TABLE `pai`
  ADD CONSTRAINT `fk_Pai_Familia1` FOREIGN KEY (`idFamilia`) REFERENCES `familia` (`idFamilia`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Pai_Pessoa` FOREIGN KEY (`idPessoa`) REFERENCES `pessoa` (`idPessoa`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `pessoagastosmensais`
--
ALTER TABLE `pessoagastosmensais`
  ADD CONSTRAINT `fk_PessoaGastosMensais_Gastos1` FOREIGN KEY (`idGastos`) REFERENCES `gastos` (`idGastos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Pessoa_has_GastosMensais_Pessoa1` FOREIGN KEY (`idPessoa`) REFERENCES `pessoa` (`idPessoa`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `previsaomensal`
--
ALTER TABLE `previsaomensal`
  ADD CONSTRAINT `fk_PrevisaoMensal_Familia1` FOREIGN KEY (`Familia_idFamilia`) REFERENCES `familia` (`idFamilia`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `rendimento`
--
ALTER TABLE `rendimento`
  ADD CONSTRAINT `fk_Rendimento_PrevisaoMensal1` FOREIGN KEY (`idPrevisaoMensal`) REFERENCES `previsaomensal` (`idPrevisaoMensal`) ON DELETE NO ACTION ON UPDATE NO ACTION;
--
-- Banco de dados: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tconta`
--

CREATE TABLE `tconta` (
  `idconta` int(11) NOT NULL,
  `natureza` varchar(20) DEFAULT NULL,
  `idmfk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tconta`
--

INSERT INTO `tconta` (`idconta`, `natureza`, `idmfk`) VALUES
(1, 'deposito', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tmov`
--

CREATE TABLE `tmov` (
  `idm` int(11) NOT NULL,
  `salar` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tmov`
--

INSERT INTO `tmov` (`idm`, `salar`) VALUES
(1, 12),
(2, 12);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tmovimento`
--

CREATE TABLE `tmovimento` (
  `idconta` int(11) NOT NULL,
  `miv` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `tconta`
--
ALTER TABLE `tconta`
  ADD PRIMARY KEY (`idconta`),
  ADD KEY `idmfk` (`idmfk`);

--
-- Índices para tabela `tmov`
--
ALTER TABLE `tmov`
  ADD PRIMARY KEY (`idm`);

--
-- Índices para tabela `tmovimento`
--
ALTER TABLE `tmovimento`
  ADD PRIMARY KEY (`idconta`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `tmovimento`
--
ALTER TABLE `tmovimento`
  MODIFY `idconta` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `tconta`
--
ALTER TABLE `tconta`
  ADD CONSTRAINT `tconta_ibfk_1` FOREIGN KEY (`idmfk`) REFERENCES `tmov` (`idm`);
--
-- Banco de dados: `vendas_produtos`
--
CREATE DATABASE IF NOT EXISTS `vendas_produtos` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `vendas_produtos`;

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
