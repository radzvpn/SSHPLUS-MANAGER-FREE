-- phpMyAdmin SQL Dump
-- version 4.0.10deb1ubuntu0.1
-- http://www.phpmyadmin.net
--
-- Server: localhost
-- Generation Time: 03/03/2020 at 20:35
-- Server version: 5.5.62-0ubuntu0.14.04.1
-- PHP version: 5.5.9-1ubuntu4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `sshplus`
--

-- --------------------------------------------------------

--
-- Structure for `server_server` table
--

CREATE TABLE IF NOT EXISTS `server_server` (
  `server_server_id` int (10) NOT NULL AUTO_INCREMENT,
  `server_server int (11) NOT NULL,
  `user_id` int (11) NOT NULL,
  `id_mestre` int (11) NOT NULL DEFAULT '0',
  `master_server_id` int (11) NOT NULL DEFAULT '0',
  `qtd` int (10) NOT NULL DEFAULT '0',
  datetime NOT NULL,
  `demo` int (2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`server_server_id`)
) ENGINE = InnoDB DEFAULT CHARSET = latin1 AUTO_INCREMENT = 4;

-- --------------------------------------------------------

--
- Structure for `admin` table
-

CREATE TABLE IF NOT EXISTS `admin` (
  `admin_id` int (11) NOT NULL AUTO_INCREMENT,
  `login` varchar (60) NOT NULL,
  `password` varchar (60) NOT NULL,
  `name` varchar (100) NOT NULL,
  `email` varchar (100) NOT NULL,
  `accessKEY` varchar (100) DEFAULT NULL,
  `site` varchar (255) NOT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE = InnoDB DEFAULT CHARSET = latin1 AUTO_INCREMENT = 2;

-
- Dumping data to the `admin` table
-

INSERT INTO `admin` (` admin_id`, `login`,` password`, `name`,` email`, `accessKEY`,` website`) VALUES
(1, 'admin', 'admin', 'Admin', 'admin@gmail.com', NULL, 'www.yoursite.com');

-- --------------------------------------------------------

--
-- Table structure `ads`
--

CREATE TABLE IF NOT EXISTS `adverts` (
  `anuncio1` text NOT NULL,
  `anuncio2` text NOT NULL,
  `anuncio3` text NOT NULL,
  `anuncio4` text NOT NULL,
  `anuncio5` text NOT NULL,
  `anuncio6` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure for `file_download` table
--

CREATE TABLE IF NOT EXISTS `file_download` (
  `id` int (11) NOT NULL AUTO_INCREMENT,
  `name` varchar (255) NOT NULL,
  `status` enum ('working', 'tests') NOT NULL,
  `tipo` enum ('ehi', 'apk', 'others') NOT NULL,
  `operator` enum ('all', 'clear', 'alive', 'tim', 'hi') NOT NULL,
  `data` datetime NOT NULL,
  `details` text NOT NULL,
  `filename` varchar (255) NOT NULL,
  `type_ client` enum ('vpn', 'resale', 'all') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = MyISAM DEFAULT CHARSET = latin1 AUTO_INCREMENT = 1 ;

-- --------------------------------------------------------

--
-- Table structure `called`
-

CREATE TABLE IF NOT EXISTS `called` (
  `id` int (11) NOT NULL AUTO_INCREMENT,
  `user_id` int (11) NOT NULL,
  `id_mestre` int (11) NOT NULL DEFAULT '0',
  `tipo` enum ('contassh', 'resellassh', 'userssh', 'server', 'others') NOT NULL,
  `status` enum ('open', 'reply', 'closed') NOT NULL,
  `reply` text NOT NULL,
  `login` varchar (255) NOT NULL,
  `reason` varchar (255) NOT NULL,
  `message` text NOT NULL,
  `data` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = MyISAM DEFAULT CHARSET = latin1 AUTO_INCREMENT = 1 ;

-- --------------------------------------------------------

--
-- Structure for table `configuration`
--

CREATE TABLE IF NOT EXISTS `configuracao` (
  `id_configuracao` int (11) NOT NULL AUTO_INCREMENT,
  `user_id` int (10) NOT NULL,
  `titulo_pagina` varchar (60) NOT NULL,
  PRIMARY KEY (`id_configuracao`)
) ENGINE = InnoDB DEFAULT CHARSET = latin1 AUTO_INCREMENT = 1 ;

-- ------------------------------------------------ --------

--
-- Structure for table `invoice`
--

CREATE TABLE IF NOT EXISTS `invoice` (
  `id` int (11) NOT NULL AUTO_INCREMENT,
  `user_id` int (11) NOT NULL,
  `server_id` int (11) NOT NULL,
  `conta_id` int (11) NOT NULL,
  `tipo` enum ('vpn', 'resale', 'others') NOT NULL,
  `qtd` int (11) NOT NULL,
  `data` datetime NOT NULL,
  `datavencimento` datetime NOT NULL,
  `status` enum ('pending', 'canceled', 'paid') NOT NULL,
  `description` text NOT NULL,
  `value` int (11) NOT NULL,
  `discount` int (11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = MyISAM DEFAULT CHARSET = latin1 AUTO_INCREMENT = 1 ;

-- ------------------------------------------------ --------

--
-- Structure for table `invoice_clientes`
--

CREATE TABLE IF NOT EXISTS `invoice_clientes` (
  `id` int (11) NOT NULL AUTO_INCREMENT,
  `user_id` int (11) NOT NULL,
  `id_mestre` int (11) NOT NULL DEFAULT '0',
  `server_id` int (11) NOT NULL,
  `conta_id` int (11) NOT NULL,
  `tipo` enum ('vpn', 'resale', 'others') NOT NULL,
  `qtd` int (11) NOT NULL,
  `data` datetime NOT NULL,
  `datavencimento` datetime NOT NULL,
  `status` enum ('pending', 'canceled', 'paid') NOT NULL,
  `description` text NOT NULL,
  `value` int (11) NOT NULL,
  `discount` int (11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = MyISAM DEFAULT CHARSET = latin1 AUTO_INCREMENT = 1 ;
-- --------------------------------------------------------

--
-- Structure for table `invoice_comproving`
--

CREATE TABLE IF NOT EXISTS `invoice_comproving` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fatura_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` enum('aberto','fechado') NOT NULL DEFAULT 'aberto',
  `data` datetime NOT NULL,
  `formapagamento` enum('boleto','deptra') NOT NULL,
  `nota` text NOT NULL,
  `imagem` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure for table `invoice vouchers to customers`
--

CREATE TABLE IF NOT EXISTS `invoice vouchers to customers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_mestre` int(11) NOT NULL DEFAULT '0',
  `fatura_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` enum('aberto','fechado') NOT NULL DEFAULT 'aberto',
  `data` datetime NOT NULL,
  `formapagamento` enum('boleto','deptra') NOT NULL,
  `nota` text NOT NULL,
  `imagem` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Structure for table `historic_login`
--

CREATE TABLE IF NOT EXISTS `historic_login` (
  `id_historic_login` int(10) NOT NULL AUTO_INCREMENT,
  `id_user` int(10) NOT NULL,
  `data_login` datetime NOT NULL,
  `ip_login` varchar(100) NOT NULL,
  `navegador` varchar(100) NOT NULL,
  PRIMARY KEY (`id_historic_login`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure for table `hist_user_ssh_online`
--

CREATE TABLE IF NOT EXISTS `hist_user_ssh_online` (
  `id_hist_usrSSH` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `hora_conexao` datetime NOT NULL,
  `hora_desconexao` datetime DEFAULT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id_hist_usrSSH`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure for table `hist_user_ssh_online_free`
--

CREATE TABLE IF NOT EXISTS `hist_user_ssh_online_free` (
  `id_hist_usrSSH` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `hora_conexao` datetime NOT NULL,
  `hora_desconexao` datetime DEFAULT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id_hist_usrSSH`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure for table `informative`
--

CREATE TABLE IF NOT EXISTS `informative` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data` datetime NOT NULL,
  `imagem` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Structure for table `mercadopago`
--

CREATE TABLE IF NOT EXISTS `mercadopago` (
  `CLIENT_ID` varchar(255) NOT NULL,
  `CLIENT_SECRET` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `mercadopago`
--

INSERT INTO `mercadopago` (`CLIENT_ID`, `CLIENT_SECRET`) VALUES
('966453177918365', 'hb86SFXeO8vtqgGT7orgddnZ24gZPBBg');

-- --------------------------------------------------------

--
-- Structure for table `noticias`
--

CREATE TABLE IF NOT EXISTS `noticias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` enum('ativo','desativado') NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `subtitulo` varchar(255) NOT NULL,
  `msg` text NOT NULL,
  `data` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure for table `notificacoes`
--

CREATE TABLE IF NOT EXISTS `notificacoes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `conta_id` int(11) NOT NULL,
  `data` datetime NOT NULL,
  `tipo` enum('fatura','conta','revenda','outros','user','chamados') NOT NULL,
  `linkfatura` varchar(255) NOT NULL,
  `mensagem` text NOT NULL,
  `info_outros` varchar(50) NOT NULL,
  `lido` enum('nao','sim') NOT NULL DEFAULT 'nao',
  `admin` enum('nao','sim') NOT NULL DEFAULT 'nao',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Structure for table `ovpn`
--

CREATE TABLE IF NOT EXISTS `ovpn` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `servidor_id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `arquivo` varchar(255) NOT NULL,
  `data` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure for table `servidor`
--

CREATE TABLE IF NOT EXISTS `servidor` (
  `id_servidor` int(11) NOT NULL AUTO_INCREMENT,
  `ativo` int(10) NOT NULL DEFAULT '0',
  `nome` varchar(100) NOT NULL,
  `regiao` enum('asia','america','europa','australia') NOT NULL,
  `limite_user` int(10) NOT NULL DEFAULT '0',
  `ip_servidor` varchar(100) NOT NULL,
  `site_servidor` varchar(255) NOT NULL,
  `login_server` varchar(30) NOT NULL,
  `senha` varchar(60) NOT NULL,
  `porta` int(10) NOT NULL DEFAULT '22',
  `dias` int(10) NOT NULL DEFAULT '0',
  `demo` int(11) NOT NULL DEFAULT '0',
  `ehi` varchar(1000) DEFAULT NULL,
  `localizacao` varchar(255) NOT NULL,
  `localizacao_img` varchar(50) NOT NULL,
  `validade` int(11) NOT NULL,
  `limite` int(11) NOT NULL,
  `tipo` enum('premium','free') NOT NULL DEFAULT 'premium',
  `manutencao` enum('nao','sim') NOT NULL DEFAULT 'nao',
  PRIMARY KEY (`id_servidor`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Structure for table `sms`
--

CREATE TABLE IF NOT EXISTS `sms` (
  `id_sms` int(11) NOT NULL AUTO_INCREMENT,
  `id_remetente` int(11) NOT NULL,
  `id_destinatario` int(11) NOT NULL,
  `assunto` varchar(100) NOT NULL,
  `mensagem` varchar(500) NOT NULL,
  `hora_resquisicao` datetime NOT NULL,
  `hora_envio` datetime NOT NULL,
  `status` enum('Aguardando','Enviado','Erro') NOT NULL DEFAULT 'Aguardando',
  PRIMARY KEY (`id_sms`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure for table `smtp`
--

CREATE TABLE IF NOT EXISTS `smtp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `servidor` varchar(255) NOT NULL,
  `porta` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `ssl_secure` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure for table `smtp_users`
--

CREATE TABLE IF NOT EXISTS `smtp_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ssl_secure` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `servidor` varchar(255) NOT NULL,
  `empresa` varchar(255) NOT NULL,
  `porta` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `senha` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id_user` int(60) NOT NULL AUTO_INCREMENT,
  `id_mestre` int(10) DEFAULT '0',
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  `atualiza_dados` int(11) NOT NULL DEFAULT '0',
  `login` varchar(60) NOT NULL,
  `senha` varchar(60) NOT NULL,
  `nome` varchar(60) DEFAULT NULL,
  `avatar` varchar(50) NOT NULL DEFAULT '1',
  `email` varchar(100) DEFAULT NULL,
  `celular` varchar(20) NOT NULL,
  `data_cadastro` datetime DEFAULT NULL,
  `tipo` enum('vpn','revenda','','') NOT NULL,
  `subrevenda` enum('nao','sim') NOT NULL,
  `validade` date DEFAULT NULL,
  `suspenso` date DEFAULT NULL,
  `token_user` varchar(120) DEFAULT NULL,
  `permitir_demo` int(11) NOT NULL DEFAULT '0',
  `dias_demo_sub` int(10) NOT NULL DEFAULT '0',
  `apagar` int(11) NOT NULL DEFAULT '0',
  `idcliente_mp` varchar(255) NOT NULL,
  `tokensecret_mp` varchar(255) NOT NULL,
  `dadosdeposito` text NOT NULL,
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `login` (`login`),
  UNIQUE KEY `token_user` (`token_user`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=31 ;

-- --------------------------------------------------------

--
-- Structure for table `user_ssh`
--

CREATE TABLE IF NOT EXISTS `user_ssh` (
  `id_user_ssh` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `id_servidor` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `login` varchar(30) NOT NULL,
  `senha` varchar(20) NOT NULL,
  `data_validade` date NOT NULL,
  `data_suspensao` datetime DEFAULT NULL,
  `apagar` int(2) NOT NULL DEFAULT '0',
  `acesso` int(10) NOT NULL DEFAULT '1',
  `online` int(11) NOT NULL DEFAULT '0',
  `online_start` datetime DEFAULT NULL,
  `online_hist` int(11) NOT NULL DEFAULT '0',
  `demo` enum('nao','sim') NOT NULL DEFAULT 'nao',
  PRIMARY KEY (`id_user_ssh`),
  UNIQUE KEY `login` (`login`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure for table `user_ssh_free`
--

CREATE TABLE IF NOT EXISTS `user_ssh_free` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(255) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `servidor` int(11) NOT NULL,
  `validade` datetime NOT NULL,
  `ip` varchar(255) NOT NULL,
  `online` int(11) NOT NULL DEFAULT '0',
  `online_start` datetime DEFAULT NULL,
  `online_hist` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
