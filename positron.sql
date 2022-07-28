-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июл 28 2022 г., 14:30
-- Версия сервера: 8.0.19
-- Версия PHP: 7.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `positron`
--

-- --------------------------------------------------------

--
-- Структура таблицы `author`
--

CREATE TABLE `author` (
  `id` int NOT NULL,
  `name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `author`
--

INSERT INTO `author` (`id`, `name`) VALUES
(1, 'Don Jones'),
(2, 'Richard Siddaway'),
(3, 'Jeffery Hicks'),
(4, 'David Wood'),
(5, 'Marsha Zaidman');

-- --------------------------------------------------------

--
-- Структура таблицы `book-author`
--

CREATE TABLE `book-author` (
  `id` int NOT NULL,
  `id_book` int NOT NULL,
  `id_author` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `book-author`
--

INSERT INTO `book-author` (`id`, `id_book`, `id_author`) VALUES
(2, 4, 3),
(4, 1, 1),
(5, 9, 5);

-- --------------------------------------------------------

--
-- Структура таблицы `books`
--

CREATE TABLE `books` (
  `id` int NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `isbn` int DEFAULT NULL,
  `pageCount` int DEFAULT NULL,
  `publishedDate` datetime DEFAULT NULL,
  `thumbnailUrl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `shortDescription` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `longDescription` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `books`
--

INSERT INTO `books` (`id`, `title`, `isbn`, `pageCount`, `publishedDate`, `thumbnailUrl`, `shortDescription`, `longDescription`, `status`) VALUES
(1, 'ssqq', 161, 1, '2022-07-20 19:56:58', '/images/books/Believe.jpg', 'asdadsd', 'dasdada', 'PUBLISH'),
(2, 'Augmented Reality Revealed', 1617290165, 0, NULL, '', NULL, NULL, 'MEAP'),
(3, 'Building Well-Structured JavaScript Applications', 1617290599, 0, NULL, '', NULL, NULL, 'MEAP'),
(4, 'Linked Data', 1617290394, 0, NULL, 'https://s3.amazonaws.com/AKIAJC5RLADLUMVRPFDQ.book-thumb-images/dwood.jpg', NULL, NULL, 'PUBLISH'),
(9, '\"Mule in Action, Second Edition\"', 1617290823, 0, NULL, 'https://s3.amazonaws.com/AKIAJC5RLADLUMVRPFDQ.book-thumb-images/dossot2.jpg', NULL, NULL, 'PUBLISH'),
(10, 'Single Page Web Applications', 1617290750, 0, NULL, 'https://s3.amazonaws.com/AKIAJC5RLADLUMVRPFDQ.book-thumb-images/mikowski.jpg', NULL, NULL, 'PUBLISH'),
(11, '\"The Art of Unit Testing, Second Edition\"', 1617290890, 0, NULL, 'https://s3.amazonaws.com/AKIAJC5RLADLUMVRPFDQ.book-thumb-images/osherove2.jpg', NULL, NULL, 'PUBLISH'),
(12, 'Play for Java', 1617290904, 0, NULL, 'https://s3.amazonaws.com/AKIAJC5RLADLUMVRPFDQ.book-thumb-images/leroux.jpg', '', '', 'PUBLISH'),
(13, 'Hello World! Second Edition', 1617290920, 0, NULL, 'https://s3.amazonaws.com/AKIAJC5RLADLUMVRPFDQ.book-thumb-images/sande2.jpg', NULL, NULL, 'PUBLISH'),
(14, 'Dart in Action', 1617290866, 0, NULL, 'https://s3.amazonaws.com/AKIAJC5RLADLUMVRPFDQ.book-thumb-images/buckett.jpg', NULL, NULL, 'PUBLISH'),
(15, 'Redis in Action', 1617290858, 0, NULL, 'https://s3.amazonaws.com/AKIAJC5RLADLUMVRPFDQ.book-thumb-images/carlson.jpg', NULL, NULL, 'PUBLISH'),
(16, 'Using the TI-83 Plus/TI-84 Plus', 0, 0, NULL, 'https://s3.amazonaws.com/AKIAJC5RLADLUMVRPFDQ.book-thumb-images/mitchell2.jpg', NULL, NULL, 'PUBLISH'),
(17, 'Neo4j in Action', 1617290769, 0, NULL, 'https://s3.amazonaws.com/AKIAJC5RLADLUMVRPFDQ.book-thumb-images/partner.jpg', NULL, NULL, 'MEAP'),
(18, 'Programming the TI-83 Plus/TI-84 Plus', 1617290777, 0, NULL, 'https://s3.amazonaws.com/AKIAJC5RLADLUMVRPFDQ.book-thumb-images/mitchell.jpg', NULL, NULL, 'PUBLISH'),
(19, 'Functional Programming in Scala', 1617290653, 0, NULL, 'https://s3.amazonaws.com/AKIAJC5RLADLUMVRPFDQ.book-thumb-images/bjarnason.jpg', NULL, NULL, 'MEAP'),
(20, 'Play for Scala', 1617290793, 0, NULL, 'https://s3.amazonaws.com/AKIAJC5RLADLUMVRPFDQ.book-thumb-images/hilton.jpg', NULL, NULL, 'PUBLISH'),
(21, 'Node.js in Practice', 1617290939, 0, NULL, 'https://s3.amazonaws.com/AKIAJC5RLADLUMVRPFDQ.book-thumb-images/templier2.jpg', NULL, NULL, 'MEAP'),
(22, 'SonarQube in Action', 1617290955, 0, NULL, 'https://s3.amazonaws.com/AKIAJC5RLADLUMVRPFDQ.book-thumb-images/papapetrou.jpg', NULL, NULL, 'PUBLISH'),
(23, 'Windows Store App Development: C# and XAML', 1617290947, 0, NULL, '', '', '', 'PUBLISH'),
(24, 'Learn Windows IIS in a Month of Lunches', 1617290971, 0, NULL, 'https://s3.amazonaws.com/AKIAJC5RLADLUMVRPFDQ.book-thumb-images/helmick.jpg', NULL, NULL, 'PUBLISH'),
(26, 'RabbitMQ in Depth', 1617291005, 0, NULL, 'https://s3.amazonaws.com/AKIAJC5RLADLUMVRPFDQ.book-thumb-images/roy.jpg', NULL, NULL, 'MEAP'),
(27, 'Akka in Action', 1617291013, 0, NULL, 'https://s3.amazonaws.com/AKIAJC5RLADLUMVRPFDQ.book-thumb-images/roestenburg.jpg', NULL, NULL, 'MEAP'),
(29, 'OCA Java SE 7 Programmer I Certification Guide', 1617291048, 0, NULL, 'https://s3.amazonaws.com/AKIAJC5RLADLUMVRPFDQ.book-thumb-images/gupta.jpg', NULL, NULL, 'PUBLISH'),
(30, 'Kanban in Action', 1617291056, 0, NULL, 'https://s3.amazonaws.com/AKIAJC5RLADLUMVRPFDQ.book-thumb-images/hammarberg.jpg', NULL, NULL, 'PUBLISH'),
(31, 'Solr in Action', 1617291021, 0, NULL, 'https://s3.amazonaws.com/AKIAJC5RLADLUMVRPFDQ.book-thumb-images/grainger.jpg', NULL, NULL, 'PUBLISH'),
(32, 'Making Sense of NoSQL', 1617291072, 0, NULL, 'https://s3.amazonaws.com/AKIAJC5RLADLUMVRPFDQ.book-thumb-images/mccreary.jpg', NULL, NULL, 'PUBLISH'),
(33, 'Jaguar Development with PowerBuilder 7', 1884777864, 0, NULL, '', NULL, NULL, 'PUBLISH'),
(34, '\"Grails in Action, Second Edition\"', 1617290963, 0, NULL, 'https://s3.amazonaws.com/AKIAJC5RLADLUMVRPFDQ.book-thumb-images/gsmith2.jpg', NULL, NULL, 'MEAP'),
(35, 'Rails 4 in Action', 1617291099, 0, NULL, 'https://s3.amazonaws.com/AKIAJC5RLADLUMVRPFDQ.book-thumb-images/bigg2.jpg', NULL, NULL, 'MEAP'),
(36, '\"Learn Windows PowerShell in a Month of Lunches, Second Edition\"', 1617291080, 0, NULL, 'https://s3.amazonaws.com/AKIAJC5RLADLUMVRPFDQ.book-thumb-images/jones3.jpg', NULL, NULL, 'PUBLISH'),
(37, 'AOP in .NET', 1617291145, 0, NULL, 'https://s3.amazonaws.com/AKIAJC5RLADLUMVRPFDQ.book-thumb-images/groves.jpg', NULL, NULL, 'PUBLISH'),
(38, 'Learn PowerShell Toolmaking in a Month of Lunches', 1617291161, 0, NULL, 'https://s3.amazonaws.com/AKIAJC5RLADLUMVRPFDQ.book-thumb-images/jones4.jpg', NULL, NULL, 'PUBLISH'),
(39, 'CMIS and Apache Chemistry in Action', 1617291153, 0, NULL, 'https://s3.amazonaws.com/AKIAJC5RLADLUMVRPFDQ.book-thumb-images/mueller.jpg', NULL, NULL, 'PUBLISH'),
(40, 'Action Guide (aka VB .NET)', 1930110324, 0, NULL, '', NULL, NULL, 'PUBLISH'),
(41, 'Learn Active Directory Management in a Month of Lunches', 1617291196, 0, NULL, 'https://s3.amazonaws.com/AKIAJC5RLADLUMVRPFDQ.book-thumb-images/siddaway3.jpg', NULL, NULL, 'PUBLISH'),
(43, 'The Mikado Method', 1617291218, 0, NULL, 'https://s3.amazonaws.com/AKIAJC5RLADLUMVRPFDQ.book-thumb-images/ellnestam.jpg', NULL, NULL, 'PUBLISH'),
(44, 'The Responsive Web', 1617291242, 0, NULL, 'https://s3.amazonaws.com/AKIAJC5RLADLUMVRPFDQ.book-thumb-images/carver.jpg', NULL, NULL, 'MEAP'),
(45, 'Fast ASP.NET Websites', 1617291250, 0, NULL, 'https://s3.amazonaws.com/AKIAJC5RLADLUMVRPFDQ.book-thumb-images/hume.jpg', NULL, NULL, 'PUBLISH'),
(46, 'SBT in Action', 1617291277, 0, NULL, 'https://s3.amazonaws.com/AKIAJC5RLADLUMVRPFDQ.book-thumb-images/suereth2.jpg', NULL, NULL, 'MEAP'),
(47, 'PowerShell Deep Dives', 1617291315, 0, NULL, 'https://s3.amazonaws.com/AKIAJC5RLADLUMVRPFDQ.book-thumb-images/hicks.jpg', NULL, NULL, 'PUBLISH'),
(48, 'Gradle in Action', 1617291307, 0, NULL, 'https://s3.amazonaws.com/AKIAJC5RLADLUMVRPFDQ.book-thumb-images/muschko.jpg', NULL, NULL, 'PUBLISH'),
(49, 'Scalatra in Action', 1617291293, 0, NULL, 'https://s3.amazonaws.com/AKIAJC5RLADLUMVRPFDQ.book-thumb-images/carrero2.jpg', NULL, NULL, 'MEAP'),
(50, 'AngularJS in Action', 1617291331, 0, NULL, 'https://s3.amazonaws.com/AKIAJC5RLADLUMVRPFDQ.book-thumb-images/bford.jpg', NULL, NULL, 'MEAP'),
(51, 'Software Development Metrics', 1617291358, 0, NULL, 'https://s3.amazonaws.com/AKIAJC5RLADLUMVRPFDQ.book-thumb-images/nicolette.jpg', NULL, NULL, 'MEAP'),
(52, 'F# Deep Dives', 1617291323, 0, NULL, 'https://s3.amazonaws.com/AKIAJC5RLADLUMVRPFDQ.book-thumb-images/petricek_trelford.jpg', NULL, NULL, 'MEAP'),
(54, '\"PostGIS in Action, Second Edition\"', 1617291390, 0, NULL, 'https://s3.amazonaws.com/AKIAJC5RLADLUMVRPFDQ.book-thumb-images/obe2.jpg', NULL, NULL, 'MEAP'),
(55, '\"R in Action, Second Edition\"', 1617291382, 0, NULL, 'https://s3.amazonaws.com/AKIAJC5RLADLUMVRPFDQ.book-thumb-images/kabacoff2.jpg', NULL, NULL, 'MEAP'),
(104, '\"The Joy of Clojure, Second Edition\"', 1617291412, 0, NULL, 'https://s3.amazonaws.com/AKIAJC5RLADLUMVRPFDQ.book-thumb-images/fogus2.jpg', NULL, NULL, 'PUBLISH'),
(105, 'iOS 7 in Action', 1617291420, 0, NULL, 'https://s3.amazonaws.com/AKIAJC5RLADLUMVRPFDQ.book-thumb-images/lim2.jpg', NULL, NULL, 'PUBLISH'),
(106, 'Hello App Inventor!', 1617291439, 0, NULL, 'https://s3.amazonaws.com/AKIAJC5RLADLUMVRPFDQ.book-thumb-images/beer.jpg', NULL, NULL, 'MEAP'),
(107, 'dfsfsefes', 1234233324, 592, '2022-07-20 14:30:31', 'https://s3.amazonaws.com/AKIAJC5RLADLUMVRPFDQ.book-thumb-images/ableson2.jpg', 'Android in Action, Second Edition is a comprehensive tutorial for Android developers. Taking you far beyond \"Hello Android,\" this fast-paced book puts you in the driver\'s seat as you learn important architectural concepts and implementation strategies. You\'ll master the SDK, build WebKit apps using HTML 5, and even learn to extend or replace Android\'s built-in features by building useful and intriguing examples. ', 'When it comes to mobile apps, Android can do almost anything   and with this book, so can you! Android runs on mobile devices ranging from smart phones to tablets to countless special-purpose gadgets. It\'s the broadest mobile platform available.    Android in Action, Second Edition is a comprehensive tutorial for Android developers. Taking you far beyond \"Hello Android,\" this fast-paced book puts you in the driver\'s seat as you learn important architectural concepts and implementation strategies. You\'ll master the SDK, build WebKit apps using HTML 5, and even learn to extend or replace Android\'s built-in features by building useful and intriguing examples. ', 'PUBLISH'),
(108, 'fsdaaqqww', 412214324, 592, '2022-07-20 14:30:31', 'https://s3.amazonaws.com/AKIAJC5RLADLUMVRPFDQ.book-thumb-images/ableson2.jpg', 'Android in Action, Second Edition is a comprehensive tutorial for Android developers. Taking you far beyond \"Hello Android,\" this fast-paced book puts you in the driver\'s seat as you learn important architectural concepts and implementation strategies. You\'ll master the SDK, build WebKit apps using HTML 5, and even learn to extend or replace Android\'s built-in features by building useful and intriguing examples. ', 'When it comes to mobile apps, Android can do almost anything   and with this book, so can you! Android runs on mobile devices ranging from smart phones to tablets to countless special-purpose gadgets. It\'s the broadest mobile platform available.    Android in Action, Second Edition is a comprehensive tutorial for Android developers. Taking you far beyond \"Hello Android,\" this fast-paced book puts you in the driver\'s seat as you learn important architectural concepts and implementation strategies. You\'ll master the SDK, build WebKit apps using HTML 5, and even learn to extend or replace Android\'s built-in features by building useful and intriguing examples. ', 'PUBLISH');

-- --------------------------------------------------------

--
-- Структура таблицы `books_parser`
--

CREATE TABLE `books_parser` (
  `id` int NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `isbn` int NOT NULL,
  `pageCount` int NOT NULL,
  `publishedDate` datetime NOT NULL,
  `thumbnailUrl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `shortDescription` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `longDescription` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `authors` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `categories` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `category`
--

CREATE TABLE `category` (
  `id` int NOT NULL,
  `category` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `feedback`
--

CREATE TABLE `feedback` (
  `id` int NOT NULL,
  `email` varchar(50) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `message` text NOT NULL,
  `phone` decimal(13,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `feedback`
--

INSERT INTO `feedback` (`id`, `email`, `name`, `message`, `phone`) VALUES
(1, 'example@gmail.com', 'dadwqwdq', 'daaaawaqqqqqqqqqqqqq', '8952204972');

-- --------------------------------------------------------

--
-- Структура таблицы `migration`
--

CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1658761506),
('m220725_141454_create_books_table', 1658761611),
('m220727_083510_create_author_table', 1658911232),
('m220727_084049_create_category_table', 1658911321),
('m220727_084739_create_book_author_table', 1658929272),
('m220727_154649_create_feedback_table', 1658937187);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `book-author`
--
ALTER TABLE `book-author`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chain_to_book` (`id_book`),
  ADD KEY `chain_to_author` (`id_author`) USING BTREE;

--
-- Индексы таблицы `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `title` (`title`),
  ADD UNIQUE KEY `isbn` (`isbn`);

--
-- Индексы таблицы `books_parser`
--
ALTER TABLE `books_parser`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `author`
--
ALTER TABLE `author`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `book-author`
--
ALTER TABLE `book-author`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `books`
--
ALTER TABLE `books`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT для таблицы `books_parser`
--
ALTER TABLE `books_parser`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `category`
--
ALTER TABLE `category`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `book-author`
--
ALTER TABLE `book-author`
  ADD CONSTRAINT `chain_to_author` FOREIGN KEY (`id_author`) REFERENCES `author` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `chain_to_book` FOREIGN KEY (`id_book`) REFERENCES `books` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
