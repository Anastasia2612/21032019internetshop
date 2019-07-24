-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Июл 18 2019 г., 11:50
-- Версия сервера: 10.1.40-MariaDB
-- Версия PHP: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `21_03_2019_polyakova`
--

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id` int(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  `parent_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `name`, `parent_id`) VALUES
(1, 'Женщинам', 0),
(2, 'Мужчинам', 0),
(3, 'Детям', 0),
(4, 'Верхняя одежда', 1),
(5, 'Обувь', 1),
(6, 'Верхняя одежда', 2),
(7, 'Обувь', 2),
(8, 'Верхняя одежда', 16),
(9, 'Обувь', 16),
(10, 'Низ', 1),
(11, 'Низ', 2),
(12, 'Низ', 16),
(13, 'Аксессуары', 1),
(14, 'Аксессуары', 2),
(15, 'Аксессуары', 16),
(16, 'Девочкам', 3),
(17, 'Мальчикам', 3),
(18, 'Верхняя одежда', 17),
(19, 'Обувь', 17),
(20, 'Низ', 17),
(21, 'Аксессуары', 17),
(22, 'Платья', 1),
(23, 'Платья', 16),
(24, 'Верх', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `contacts`
--

CREATE TABLE `contacts` (
  `id` int(1) NOT NULL,
  `adres` varchar(50) NOT NULL,
  `tel` varchar(20) NOT NULL,
  `email` varchar(20) NOT NULL,
  `clock` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `contacts`
--

INSERT INTO `contacts` (`id`, `adres`, `tel`, `email`, `clock`) VALUES
(0, 'Адрес: Москва ул.Комсомола 12 оф.234', 'Тел.: 8(495)222-11-0', 'Email: Norway@mytrav', 'Часы работы: пн-вс с 8.00 до 22.00');

-- --------------------------------------------------------

--
-- Структура таблицы `myorders`
--

CREATE TABLE `myorders` (
  `id` int(5) NOT NULL,
  `question` text NOT NULL,
  `services` varchar(100) NOT NULL,
  `phone_call` varchar(15) NOT NULL,
  `user_id` int(5) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `myorders`
--

INSERT INTO `myorders` (`id`, `question`, `services`, `phone_call`, `user_id`, `date`) VALUES
(1, 'jbmnnm,', 'Помощь в получении визы', 'c 9.00 до 13.00', 13, '2019-06-16'),
(2, 'jbmnnm,', 'Помощь в получении визы', 'c 9.00 до 13.00', 13, '2019-06-16'),
(3, 'ну наконец-то', 'Готовый тур,Помощь в получении визы', 'c 9.00 до 13.00', 11, '2019-06-16'),
(16, 'lkjn,bjhvgcfdxszxdcvbnm,.lkmjugytfdxc', 'Готовый тур,Помощь в получении визы', 'с 13.00 до 15.0', 11, '2019-06-17'),
(17, 'lkjn,bjhvgcfdxszxdcvbnm,.lkmjugytfdxc', 'Готовый тур,Помощь в получении визы', 'с 13.00 до 15.0', 11, '2019-06-17'),
(18, 'lkjn,bjhvgcfdxszxdcvbnm,.lkmjugytfdxc', 'Готовый тур,Помощь в получении визы', 'с 13.00 до 15.0', 11, '2019-06-17'),
(19, 'ссс', 'Разработка индивидуального маршрута,Помощь в получении визы', 'c 9.00 до 13.00', 14, '2019-06-17'),
(20, 'ссс', 'Разработка индивидуального маршрута,Помощь в получении визы', 'c 9.00 до 13.00', 14, '2019-06-17'),
(21, 'ссс', 'Разработка индивидуального маршрута,Помощь в получении визы', 'c 9.00 до 13.00', 14, '2019-06-17'),
(22, 'ссс', 'Разработка индивидуального маршрута,Помощь в получении визы', 'c 9.00 до 13.00', 14, '2019-06-17'),
(23, 'ссс', 'Разработка индивидуального маршрута,Помощь в получении визы', 'c 9.00 до 13.00', 14, '2019-06-17'),
(24, 'ссс', 'Разработка индивидуального маршрута,Помощь в получении визы', 'c 9.00 до 13.00', 14, '2019-06-17'),
(25, 'ссс', 'Разработка индивидуального маршрута,Помощь в получении визы', 'c 9.00 до 13.00', 14, '2019-06-17'),
(26, 'jkg,hjgbjkbmn', '', '', 11, '2019-06-24'),
(27, 'jkhbn n', '', '', 11, '2019-06-29'),
(28, 'jkhbn n', '', '', 11, '2019-06-29'),
(29, 'jkhbn n', '', '', 11, '2019-06-29');

-- --------------------------------------------------------

--
-- Структура таблицы `news`
--

CREATE TABLE `news` (
  `id` int(2) NOT NULL,
  `date` date NOT NULL,
  `new` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `news`
--

INSERT INTO `news` (`id`, `date`, `new`) VALUES
(1, '2019-04-11', 'Тролльтунга – одна из самых потрясающих природных смотровых площадок Норвегии. Она представляет собой скалу, нависающую над обрывом на высоте 1100 метров над уровнем моря. Однако восхождение на нее непростое, и каждый год спасателям приходится вызволять незадачливых походников из беды.'),
(2, '2019-04-17', '17 мая – праздник в честь дня подписания Конституции в 1814 году. Масштаб празднования Дня Конституции поистине всенародный.\r\n');

-- --------------------------------------------------------

--
-- Структура таблицы `shop`
--

CREATE TABLE `shop` (
  `id` int(5) NOT NULL,
  `pic` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(15) NOT NULL,
  `category` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `shop`
--

INSERT INTO `shop` (`id`, `pic`, `name`, `price`, `category`) VALUES
(1, '1.jpg', 'Куртка синяя', 5400, 6),
(2, '2.jpg', 'Кожаная куртка', 22500, 6),
(3, '3.png', 'Куртка с карманами', 9200, 6),
(4, '4.jpg', 'Куртка с капюшоном', 6100, 6),
(5, '5.jpg', 'Куртка Casual', 8800, 6),
(6, '6.jpg', 'Стильная кожаная куртка', 12800, 6),
(7, '7.jpg', 'Кеды серые', 2900, 7),
(8, '8.jpg', 'Кеды черные', 4500, 7),
(9, '9.jpg', 'Кеды Cesual', 5900, 7),
(10, '10.jpg', 'Кеды всепогодные', 9200, 7),
(11, '11.jpg', 'Джинсы', 4800, 11),
(12, '12.jpg', 'Джинсы голубые', 4200, 11),
(13, '13.jpg', 'Футболка', 3300, 24),
(14, '14.jpg', 'Платье', 6100, 22),
(15, '15.jpg', 'Топ', 2500, 24),
(16, '16.jpg', 'Кардиган', 5700, 4),
(17, '17.jpg', 'Джинсовка', 12100, 4),
(18, '18.jpg', 'Пиджак белый', 4500, 4),
(19, '19.jpg', 'Платье на тонких брителях', 5900, 22),
(20, '20.jpg', 'Щорты с бантом', 3400, 10),
(21, '21.jpg', 'Шорты с поясом', 4900, 10),
(22, '22.jpg', 'Платье макси', 11000, 22);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(5) NOT NULL,
  `fio` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `fio`, `email`, `phone`) VALUES
(1, 'Головина Анастасия', 'olo@mail.ru', '7878787'),
(11, 'Po', 'babator57@gmail.com', '9268455350'),
(12, 'Настя', 'n@m.y', '65453'),
(13, 'Настя', '34@9.ru', '54212'),
(14, 'Поляков', '9267179839@mail.ru', '89267179839');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `myorders`
--
ALTER TABLE `myorders`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Индексы таблицы `shop`
--
ALTER TABLE `shop`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT для таблицы `myorders`
--
ALTER TABLE `myorders`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT для таблицы `news`
--
ALTER TABLE `news`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `shop`
--
ALTER TABLE `shop`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
