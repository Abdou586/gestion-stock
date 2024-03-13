-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 13 mars 2024 à 15:48
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `gestion_stock_dclic`
--

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

CREATE TABLE `article` (
  `id` int(11) NOT NULL,
  `nom_article` varchar(50) NOT NULL,
  `quantite` int(11) NOT NULL,
  `prix_unitaire` int(11) NOT NULL,
  `date_fabrication` datetime NOT NULL,
  `date_expiration` datetime NOT NULL,
  `id_categorie` int(11) NOT NULL,
  `images` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `article`
--

INSERT INTO `article` (`id`, `nom_article`, `quantite`, `prix_unitaire`, `date_fabrication`, `date_expiration`, `id_categorie`, `images`) VALUES
(5, 'Ordinateur', 0, 1000, '2024-03-10 13:59:00', '2024-03-24 13:59:00', 1, NULL),
(6, 'Clavier', 0, 25, '2024-03-10 13:59:00', '2024-03-24 13:59:00', 2, NULL),
(7, 'Manette sans fil', -2, 24, '2024-03-10 13:59:00', '2024-03-24 13:59:00', 1, NULL),
(8, 'acer', 0, 999, '2024-03-11 14:31:00', '2024-04-07 14:31:00', 1, NULL),
(9, 'hp', 3, 999, '2024-03-11 17:04:00', '2024-04-07 17:05:00', 1, NULL),
(10, 'Dell', 7, 1200, '2024-03-12 12:09:00', '2024-03-31 12:09:00', 1, NULL),
(11, 'Dell', 12, 1299, '2024-03-12 12:41:00', '2024-03-31 12:41:00', 1, '../images/dell.jpeg'),
(12, 'souris sans fil', 4, 128, '2024-03-12 13:02:00', '2024-03-28 13:02:00', 1, '../images/souris.jpeg');

-- --------------------------------------------------------

--
-- Structure de la table `categorie_article`
--

CREATE TABLE `categorie_article` (
  `id` int(11) NOT NULL,
  `libelle_categorie` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `categorie_article`
--

INSERT INTO `categorie_article` (`id`, `libelle_categorie`) VALUES
(1, 'Informatique'),
(2, 'Jeux vidéo');

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `id` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `telephone` varchar(50) NOT NULL,
  `adresse` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`id`, `nom`, `prenom`, `telephone`, `adresse`) VALUES
(1, 'Txxxxxxx', 'Axxxx Lxxxx', '+33xxxxxxxxx', '77 xxxxxxxxxxx'),
(2, 'Txxxxxxxxx', 'Gxxxxxxxxxx', '+33xxxxxxx', '285 r xxxxxxxxxxxxxx'),
(3, 'Zxxxxxxxx', 'Nxxxxxxxxxx', '+33xxxxxxxxxx', 'Paris Sxx-Cxxx-de-xxxxx'),
(4, 'Axxxxx', 'Cxxxxxxx', '+33xxxxxxxxxx', '114 Pxxxxx, Dxxxxxx');

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE `commande` (
  `id` int(11) NOT NULL,
  `id_article` int(11) NOT NULL,
  `id_fournisseur` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  `prix` int(11) NOT NULL,
  `date_commande` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`id`, `id_article`, `id_fournisseur`, `quantite`, `prix`, `date_commande`) VALUES
(1, 5, 1, 2, 2000, '2024-03-11 13:39:23'),
(2, 6, 1, 10, 10000, '2024-03-11 13:45:54'),
(3, 7, 1, 5, 120, '2024-03-11 15:41:07');

-- --------------------------------------------------------

--
-- Structure de la table `fournisseur`
--

CREATE TABLE `fournisseur` (
  `id` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `telephone` varchar(50) NOT NULL,
  `adresse` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `fournisseur`
--

INSERT INTO `fournisseur` (`id`, `nom`, `prenom`, `telephone`, `adresse`) VALUES
(1, 'Bxxxxxxx', 'Axxxx Lxxxx', '+33xxxxxxxxx', 'Lille Saint-Martin-la-Pallu'),
(2, 'Yxxxxxxxxx', 'Luc', '+33xxxxxxxxxxx', '114  Peytavin');

-- --------------------------------------------------------

--
-- Structure de la table `vente`
--

CREATE TABLE `vente` (
  `id` int(11) NOT NULL,
  `id_article` int(11) NOT NULL,
  `id_client` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  `prix` int(11) NOT NULL,
  `date_vente` timestamp NOT NULL DEFAULT current_timestamp(),
  `etat` enum('0','1') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `vente`
--

INSERT INTO `vente` (`id`, `id_article`, `id_client`, `quantite`, `prix`, `date_vente`, `etat`) VALUES
(1, 5, 1, 2, 2000, '2024-03-11 04:32:07', '0'),
(2, 6, 2, 2, 150, '2024-03-11 06:43:03', '0'),
(3, 5, 1, 2, 2000, '2024-03-11 11:11:02', '1'),
(4, 6, 1, 2, 50, '2024-03-11 12:47:58', '0'),
(5, 6, 1, 20, 500, '2024-03-11 14:39:28', '1'),
(6, 5, 2, 7, 7000, '2024-03-11 14:39:48', '1'),
(7, 7, 2, 3, 72, '2024-03-11 16:08:22', '1'),
(8, 7, 4, 5, 120, '2024-03-11 16:08:32', '1'),
(9, 9, 3, 7, 6993, '2024-03-11 16:08:49', '1'),
(10, 8, 2, 3, 2997, '2024-03-11 16:09:07', '1'),
(11, 7, 4, 5, 120, '2024-03-11 16:09:25', '1'),
(12, 8, 2, 2, 1998, '2024-03-11 16:09:57', '1'),
(13, 8, 1, 3, 2997, '2024-03-11 16:10:10', '1'),
(14, 8, 1, 2, 1998, '2024-03-12 10:41:16', '1'),
(15, 7, 1, 2, 48, '2024-03-12 10:41:58', '1');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_categorie` (`id_categorie`);

--
-- Index pour la table `categorie_article`
--
ALTER TABLE `categorie_article`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_article` (`id_article`),
  ADD KEY `id_fournisseur` (`id_fournisseur`);

--
-- Index pour la table `fournisseur`
--
ALTER TABLE `fournisseur`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `vente`
--
ALTER TABLE `vente`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_article` (`id_article`),
  ADD KEY `id_client` (`id_client`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `article`
--
ALTER TABLE `article`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `categorie_article`
--
ALTER TABLE `categorie_article`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `commande`
--
ALTER TABLE `commande`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `fournisseur`
--
ALTER TABLE `fournisseur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `vente`
--
ALTER TABLE `vente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `commande_ibfk_1` FOREIGN KEY (`id_article`) REFERENCES `article` (`id`),
  ADD CONSTRAINT `commande_ibfk_2` FOREIGN KEY (`id_fournisseur`) REFERENCES `fournisseur` (`id`);

--
-- Contraintes pour la table `vente`
--
ALTER TABLE `vente`
  ADD CONSTRAINT `vente_ibfk_1` FOREIGN KEY (`id_article`) REFERENCES `article` (`id`),
  ADD CONSTRAINT `vente_ibfk_2` FOREIGN KEY (`id_client`) REFERENCES `client` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
