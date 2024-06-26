-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-06-2024 a las 01:30:45
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `proyecto_final`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `profile_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `admin`
--

INSERT INTO `admin` (`admin_id`, `profile_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `description` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `category`
--

INSERT INTO `category` (`category_id`, `description`) VALUES
(1, 'Blog personal'),
(2, 'Músico/banda'),
(3, 'Gimnasio/sala de fitness'),
(4, 'Político'),
(5, 'Actor y otros artistas'),
(6, 'Diseñador web'),
(7, 'Científico'),
(8, 'Humorista'),
(9, 'Empresa o servicio local'),
(10, 'Servicio de productos'),
(11, 'Cultura'),
(14, 'Arte');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comment`
--

CREATE TABLE `comment` (
  `comment_id` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `publication_id` int(11) DEFAULT NULL,
  `profile_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `comment`
--

INSERT INTO `comment` (`comment_id`, `description`, `publication_id`, `profile_id`) VALUES
(1, 'Vestibulum rutrum rutrum neque. Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia.', 25, 1),
(2, 'Nulla mollis molestie lorem. Quisque ut erat. Curabitur gravida nisi at nibh.', 10, 3),
(3, 'Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat. Praesent blandit.', 2, 11),
(4, 'Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', 11, 7),
(5, 'Suspendisse ornare consequat lectus.', 17, 5),
(6, 'Integer a nibh. In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc.', 23, 3),
(7, 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum. In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo. Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', 3, 16),
(8, 'Suspendisse ornare consequat lectus.', 5, 17),
(9, 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque. Duis bibendum. Morbi non quam nec dui luctus rutrum.', 16, 17),
(10, 'Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat. Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', 4, 18),
(11, 'Proin at turpis a pede posuere nonummy. Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque. Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl.', 3, 2),
(12, 'Nulla facilisi. Cras non velit nec nisi vulputate nonummy.', 1, 10),
(13, 'Morbi a ipsum. Integer a nibh.', 26, 9),
(14, 'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.', 4, 13),
(15, 'Donec semper sapien a libero. Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius. Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.', 5, 2),
(16, 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue.', 13, 4),
(17, 'Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam.', 17, 16),
(18, 'Praesent blandit.', 15, 14),
(19, 'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim.', 26, 1),
(20, 'Praesent lectus. Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.', 25, 18),
(21, 'Vivamus vestibulum sagittis sapien.', 15, 13),
(22, 'Aenean sit amet justo. Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo.', 1, 12),
(23, 'Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.', 17, 3),
(24, 'Suspendisse accumsan tortor quis turpis. Sed ante.', 22, 13),
(25, 'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia.', 30, 1),
(26, 'In sagittis dui vel nisl.', 23, 1),
(27, 'Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.', 24, 2),
(28, 'Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien.', 22, 6),
(29, 'Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.', 5, 4),
(30, 'Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.', 20, 3),
(31, 'Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.', 24, 4),
(32, 'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat. Nulla nisl. Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus.', 2, 11),
(33, 'Integer tincidunt ante vel ipsum.', 24, 6),
(34, 'Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl. Duis ac nibh.', 24, 16),
(35, 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo.', 17, 5),
(36, 'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 12, 12),
(37, 'Donec posuere metus vitae ipsum. Aliquam non mauris. Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet.', 9, 9),
(38, 'Aenean sit amet justo. Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices.', 6, 10),
(39, 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.', 10, 5),
(40, 'Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc.', 28, 12),
(41, 'Morbi a ipsum. Integer a nibh. In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 15, 7),
(42, 'Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo.', 23, 16),
(43, 'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam. Nam tristique tortor eu pede.', 12, 4),
(44, 'Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti. In eleifend quam a odio.', 21, 9),
(45, 'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.', 26, 12),
(46, 'Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim.', 14, 16),
(47, 'In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat. Praesent blandit. Nam nulla.', 21, 9),
(48, 'In eleifend quam a odio. In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum.', 4, 16),
(49, 'Morbi a ipsum. Integer a nibh. In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo.', 17, 13),
(50, 'Nulla ac enim.', 13, 17),
(53, '544545465mnknjklhn', 20, 16),
(56, 'klhn sdsdfd  sdfdsf', 3, 18),
(57, '544545465mnknjklhn', 9, 3),
(58, 'klhn sdsdfd  sdfdsf', 3, 11),
(59, 'any', 5, 1),
(62, 'any', 5, 9),
(63, 'any', 5, 9),
(64, 'aadsasasasasny', 8, 11);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profile`
--

CREATE TABLE `profile` (
  `profile_id` int(11) NOT NULL,
  `firstName` varchar(150) DEFAULT NULL,
  `lastName` varchar(150) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `profile`
--

INSERT INTO `profile` (`profile_id`, `firstName`, `lastName`, `age`, `username`, `email`, `password`) VALUES
(1, 'admin', 'principal', 45, 'admin123', 'admin@host.com', 'pas1212woRDD'),
(2, 'hola', 'soy apellido', 35, 'soy un nuevo username', 'gsuffield1@merriam-webster.com', 'pas1212woRDD'),
(3, 'Estel', 'soy apellido', 30, 'emccarty2', 'emccarty2@mlb.com', 'pas1212woRDD'),
(4, 'Otha', 'Kelemen', 20, 'okelemen3', 'okelemen3@cyberchimps.com', 'pas1212woRDD'),
(5, 'Merna', 'soy apellido', 33, 'mryland4', 'mryland4@domainmarket.com', 'pas1212woRDD'),
(6, 'Rowland', 'Scurlock', 50, 'rscurlock5', 'rscurlock5@google.fr', 'pas1212woRDD'),
(7, 'Bent', 'Lasslett', 24, 'blasslett6', 'blasslett6@photobucket.com', 'pas1212woRDD'),
(9, 'Doro', 'Lawrenz', 23, 'dlawrenz8', 'dlawrenz8@dailymail.co.uk', 'pas1212woRDD'),
(10, 'Sharia', 'soy apellido', 28, 'skilday9', 'skilday9@wired.com', 'pas1212woRDD'),
(11, 'Tresa', 'Telfer', 46, 'ttelfera', 'ttelfera@miitbeian.gov.cn', 'pas1212woRDD'),
(12, 'Fulton', 'Frangello', 41, 'ffrangellob', 'ffrangellob@independent.co.uk', 'pas1212woRDD'),
(13, 'Gerrard', 'Simmgen', 18, 'gsimmgenc', 'gsimmgenc@ebay.com', 'pas1212woRDD'),
(14, 'Jasmine', 'Smith', 32, 'jsmithd', 'jsmithd@upenn.edu', 'pas1212woRDD'),
(15, 'Amalia', 'Blythe', 27, 'ablythee', 'ablythee@time.com', 'pas1212woRDD'),
(16, 'Tawsha', 'Tuohy', 30, 'ttuohyf', 'ttuohyf@icq.com', 'pas1212woRDD'),
(17, 'Gabriela', 'Daenen', 24, 'gdaeneng', 'gdaeneng@shareasale.com', 'pas1212woRDD'),
(18, 'Konstantine', 'Cunrado', 39, 'kcunradoh', 'kcunradoh@phoca.cz', 'pas1212woRDD'),
(21, 'Katheryn', 'Filoniere', 50, 'kfilonierek', 'kfilonierek@bbb.org', 'pas1212woRDD'),
(34, 'aaaaaa45n', 'aaa4al', 55, 'aaan123', 'ad4aaaan@host.com', 'paa4512woRDD'),
(35, 'aaaaaa45n', 'aaa4al', 55, 'aaan123', 'ad4aaaan@host.com', 'paa4512woRDD'),
(36, 'aaaaaa45n', 'aaa4al', 55, 'aaan123', 'ad4aaaan@host.com', 'paa4512woRDD'),
(37, 'adm455in', 'pr545incipal', 45, 'ad5445min123', 'adm4554in@host.com', 'pa455s1212woRDD'),
(38, 'adm455in', 'pr545incipal', 45, 'ad5445min123', 'adm4554in@host.com', 'pa455s1212woRDD'),
(39, 'adm455in', 'pr545incipal', 45, 'ad5445min123', 'adm4554in@host.com', 'pa455s1212woRDD'),
(40, 'adm455in', 'pr545incipal', 45, 'ad5445min123', 'adm4554in@host.com', 'pa455s1212woRDD'),
(41, 'adm455in', 'pr545incipal', 45, 'ad5445min123', 'adm4554in@host.com', 'pa455s1212woRDD'),
(42, 'adm455in', 'pr545incipal', 45, 'ad5445min123', 'adm4554in@host.com', 'pa455s1212woRDD'),
(43, 'adm455in', 'pr545incipal', 45, 'ad5445min123', 'adm4554in@host.com', 'pa455s1212woRDD'),
(44, 'asasasasasaadm455in', 'assaassapr545incipal', 45, 'ad5445min123', 'adm4554in@host.com', 'pa455s1212woRDD'),
(45, 'asasasasasaadm455in', 'assaassapr545incipal', 45, 'ad5445min123', 'adm4554in@host.com', 'pa455s1212woRDD'),
(46, 'asasasasasaadm455in', 'assaassapr545incipal', 45, 'ad5445min123', 'adm4554in@host.com', 'pa455s1212woRDD'),
(47, 'asasasasasaadm455in', 'assaassapr545incipal', 45, 'ad5445min123', 'adm4554in@host.com', 'pa455s1212woRDD'),
(48, 'asasasasasaadm455in', 'assaassapr545incipal', 45, 'ad5445min123', 'adm4554in@host.com', 'pa455s1212woRDD'),
(49, 'asasasasasaadm455in', 'assaassapr545incipal', 45, 'ad5445min123', 'adm4554in@host.com', 'pa455s1212woRDD'),
(50, 'asasasasasaadm455in', 'assaassapr545incipal', 45, 'ad5445min123', 'adm4554in@host.com', 'pa455s1212woRDD'),
(53, 'ajajajajajajajy', 'any', 0, 'any', 'any', 'any'),
(54, 'aaaaaaaaany', 'any', 0, 'any', 'any', 'any');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `publication`
--

CREATE TABLE `publication` (
  `publication_id` int(11) NOT NULL,
  `title` varchar(250) NOT NULL,
  `desciption` text DEFAULT NULL,
  `profile_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `publication`
--

INSERT INTO `publication` (`publication_id`, `title`, `desciption`, `profile_id`) VALUES
(1, 'nibh in', NULL, 1),
(2, 'id turpis integer aliquet', NULL, 2),
(3, 'aenean sit amet', NULL, 3),
(4, 'aenean sit amet', 'hsdjsajhd askdjaksdhjka asnkljsakd', 4),
(5, 'vestibulum sagittis sapien cum', NULL, 5),
(6, 'lectus pellentesque at nulla', NULL, 6),
(8, 'suspendisse potenti cras', NULL, 2),
(9, 'turpis integer aliquet', NULL, 9),
(10, 'eu massa donec dapibus', NULL, 10),
(11, 'morbi porttitor lorem', NULL, 11),
(12, 'luctus et ultrices posuere', NULL, 12),
(13, 'ligula suspendisse ornare', NULL, 13),
(14, 'rhoncus sed vestibulum sit amet', NULL, 14),
(15, 'faucibus cursus', NULL, 15),
(16, 'est donec odio justo sollicitudin', NULL, 16),
(17, 'ipsum primis in faucibus', NULL, 17),
(20, 'congue etiam justo', NULL, 15),
(21, 'lorem integer tincidunt ante vel', NULL, 1),
(22, 'suscipit a feugiat et eros', NULL, 2),
(23, 'eleifend pede', NULL, 3),
(24, 'auctor sed tristique in', NULL, 4),
(25, 'venenatis tristique', NULL, 5),
(26, 'vitae consectetuer eget rutrum at', NULL, 6),
(28, 'convallis eget eleifend', NULL, 5),
(29, 'in consequat ut nulla', NULL, 9),
(30, 'nulla neque', NULL, 10),
(32, '4aaaaaaaaaaaa4nibh in', '544545465mnknjklhn', 1),
(33, '44nibh in', '544545465mnknjklhn', 5),
(34, 'vvvvvvvvvvvvvva4nibh in', '544545465mnknjklhn', 1),
(36, '4aaaaaaaa4nibh in', '544545465mnknjklhn', 7),
(37, '4aaaaaaaa4nibh in', '544545465mnknjklhn', 1),
(38, '4aaaaaaaa4nibh in', '544545465mnknjklhn', 1),
(39, '4aaaaaaaa4nibh in', '544545465mnknjklhn', 1),
(40, '4aaaaaaaa4nibh in', '544545465mnknjklhn', 1),
(41, '4aaaaaaaa4nibh in', '544545465mnknjklhn', 1),
(48, '4aaaaaaaa4nibh in', '544545465mnknjklhn', 1),
(49, '4aaaaaaaa4nibh in', '544545465mnknjklhn', 1),
(50, 'aenean sit amet', NULL, 1),
(51, 'aenean sit amet', 'hsdjsajhd askdjaksdhjka asnkljsakd', 1),
(52, 'any', 'any', 5),
(53, 'any', 'any', 5),
(56, 'any', 'any', 1),
(57, 'any', 'any', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `publication_category`
--

CREATE TABLE `publication_category` (
  `publicationCategory_id` int(11) NOT NULL,
  `publication_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `publication_category`
--

INSERT INTO `publication_category` (`publicationCategory_id`, `publication_id`, `category_id`) VALUES
(3, 1, 5),
(4, 5, 5),
(5, 2, 5),
(8, 1, 2),
(9, 1, 4),
(10, 3, 1),
(19, 51, 1),
(20, 4, 1),
(21, 4, 2),
(22, 4, 3),
(23, 4, 5),
(24, 4, 6),
(41, 57, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `users_id` int(11) NOT NULL,
  `profile_id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`users_id`, `profile_id`, `admin_id`) VALUES
(1, 2, 1),
(2, 3, 1),
(3, 4, 1),
(4, 5, 1),
(5, 6, 1),
(6, 7, 1),
(8, 9, 1),
(9, 10, 1),
(10, 11, 1),
(11, 12, 1),
(12, 13, 1),
(13, 14, 1),
(14, 15, 1),
(15, 16, 1),
(16, 17, 1),
(17, 18, 1),
(21, 40, 1),
(22, 41, 1),
(23, 42, 1),
(24, 46, 1),
(25, 47, 1),
(26, 48, 1),
(27, 49, 1),
(28, 50, 1),
(31, 53, 1),
(32, 54, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`),
  ADD UNIQUE KEY `profile_id` (`profile_id`);

--
-- Indices de la tabla `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indices de la tabla `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `publication_id` (`publication_id`),
  ADD KEY `profile_id` (`profile_id`);

--
-- Indices de la tabla `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`profile_id`);

--
-- Indices de la tabla `publication`
--
ALTER TABLE `publication`
  ADD PRIMARY KEY (`publication_id`),
  ADD KEY `profile_id` (`profile_id`);

--
-- Indices de la tabla `publication_category`
--
ALTER TABLE `publication_category`
  ADD PRIMARY KEY (`publicationCategory_id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `publication_id` (`publication_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`users_id`),
  ADD KEY `profile_id` (`profile_id`),
  ADD KEY `admin_id` (`admin_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `comment`
--
ALTER TABLE `comment`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT de la tabla `profile`
--
ALTER TABLE `profile`
  MODIFY `profile_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT de la tabla `publication`
--
ALTER TABLE `publication`
  MODIFY `publication_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT de la tabla `publication_category`
--
ALTER TABLE `publication_category`
  MODIFY `publicationCategory_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `users_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`profile_id`) REFERENCES `profile` (`profile_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`publication_id`) REFERENCES `publication` (`publication_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`profile_id`) REFERENCES `profile` (`profile_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `publication`
--
ALTER TABLE `publication`
  ADD CONSTRAINT `publication_ibfk_3` FOREIGN KEY (`profile_id`) REFERENCES `profile` (`profile_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `publication_category`
--
ALTER TABLE `publication_category`
  ADD CONSTRAINT `publication_category_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `publication_category_ibfk_2` FOREIGN KEY (`publication_id`) REFERENCES `publication` (`publication_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`profile_id`) REFERENCES `profile` (`profile_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_2` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`admin_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
