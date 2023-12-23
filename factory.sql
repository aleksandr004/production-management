-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Дек 23 2023 г., 15:48
-- Версия сервера: 8.0.30
-- Версия PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `factory`
--

-- --------------------------------------------------------

--
-- Структура таблицы `plan_user`
--

CREATE TABLE `plan_user` (
  `id_plan` int NOT NULL,
  `id_user_plan` int NOT NULL,
  `product_plan` text COLLATE utf8mb4_general_ci NOT NULL,
  `q_plan` bigint NOT NULL,
  `plan_completed` tinyint(1) DEFAULT NULL,
  `plan_time` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `plan_user`
--

INSERT INTO `plan_user` (`id_plan`, `id_user_plan`, `product_plan`, `q_plan`, `plan_completed`, `plan_time`) VALUES
(1, 1, 'изоляционные пленки', 100, 0, '2023-12-20'),
(2, 5, 'термоконтейнер', 34, NULL, '2024-01-25'),
(8, 5, 'термоконтейнер', 34, NULL, '2024-01-01');

-- --------------------------------------------------------

--
-- Структура таблицы `product`
--

CREATE TABLE `product` (
  `id_product` int NOT NULL,
  `name_product` text COLLATE utf8mb4_general_ci NOT NULL,
  `quantity_prod` bigint NOT NULL,
  `stand_prod` int NOT NULL,
  `id_user_prod` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `product`
--

INSERT INTO `product` (`id_product`, `name_product`, `quantity_prod`, `stand_prod`, `id_user_prod`) VALUES
(1, 'теплоизоляционные строительные плиты', 120, 6, 3),
(2, 'изоляционные пленки', 229, 4, 3),
(3, 'поливинилхлоридный линолеум', 60, 7, 4),
(4, 'термоконтейнер', 400, 2, 4),
(5, 'Транспортная упаковка для приборов', 469, 8, 4),
(6, 'теплоизоляционные строительные плиты', 30, 6, 3),
(13, 'изоляционные трубки', 65, 4, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `product_buy`
--

CREATE TABLE `product_buy` (
  `id_buy` int NOT NULL,
  `id_user_buy` int NOT NULL,
  `buy_product` text COLLATE utf8mb4_general_ci NOT NULL,
  `buy_q` int NOT NULL,
  `buy_table_us` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `product_buy`
--

INSERT INTO `product_buy` (`id_buy`, `id_user_buy`, `buy_product`, `buy_q`, `buy_table_us`) VALUES
(12, 1, 'пенополистирол', 10, 6);

-- --------------------------------------------------------

--
-- Структура таблицы `report_user`
--

CREATE TABLE `report_user` (
  `id_report` int NOT NULL,
  `id_user_rep` int NOT NULL,
  `report_text` text COLLATE utf8mb4_general_ci NOT NULL,
  `report_data` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `report_user`
--

INSERT INTO `report_user` (`id_report`, `id_user_rep`, `report_text`, `report_data`) VALUES
(1, 5, 'Сегодня в первую половину для Виталий Кошкин не соблюдая технику безопасности получил травму. Пострадавший был доставлен в больницу.', '2023-12-06'),
(2, 5, 'Я смог отправить запрос в базу данных', '2023-12-16'),
(7, 5, 'пппппппппп', '2023-12-22');

-- --------------------------------------------------------

--
-- Структура таблицы `shedule`
--

CREATE TABLE `shedule` (
  `id_shedule` int NOT NULL,
  `data_start` time NOT NULL,
  `data_end` time NOT NULL,
  `day_data` int NOT NULL,
  `week_data` text COLLATE utf8mb4_general_ci NOT NULL,
  `month_Data` text COLLATE utf8mb4_general_ci NOT NULL,
  `user_id_sh` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `shedule`
--

INSERT INTO `shedule` (`id_shedule`, `data_start`, `data_end`, `day_data`, `week_data`, `month_Data`, `user_id_sh`) VALUES
(1, '07:00:00', '19:00:00', 4, 'Понедельник', 'Декабрь', 5),
(2, '07:00:00', '19:00:00', 5, 'Вторник', 'Декабрь', 5),
(3, '07:00:00', '19:00:00', 6, 'Среда', 'Декабрь', 6),
(4, '07:00:00', '19:00:00', 7, 'Четверг', 'Декабрь', 6),
(5, '07:00:00', '19:00:00', 8, 'Пятница', 'Декабрь', 6),
(20, '07:00:00', '19:00:00', 22, 'Пятница', 'Декабрь', 5);

-- --------------------------------------------------------

--
-- Структура таблицы `user_data`
--

CREATE TABLE `user_data` (
  `id_user` int NOT NULL,
  `first_name` text COLLATE utf8mb4_general_ci NOT NULL,
  `last_name` text COLLATE utf8mb4_general_ci NOT NULL,
  `birthday` date NOT NULL,
  `access` text COLLATE utf8mb4_general_ci NOT NULL,
  `phone` bigint DEFAULT NULL,
  `mail` text COLLATE utf8mb4_general_ci,
  `card` bigint NOT NULL,
  `login` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `pass` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `table_us` int DEFAULT NULL,
  `absenteeism` tinyint(1) DEFAULT NULL,
  `salary` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `user_data`
--

INSERT INTO `user_data` (`id_user`, `first_name`, `last_name`, `birthday`, `access`, `phone`, `mail`, `card`, `login`, `pass`, `table_us`, `absenteeism`, `salary`) VALUES
(1, 'Алексей', 'Соловьёв', '1986-08-17', 'рабочий', 89117760098, 'aleks.solov.@mail.ru', 8907654567098745, 'rab01', '123123', 6, 0, 400),
(2, 'Виталий\r\n', 'Кошкин', '1989-07-08', 'рабочий', 89124545456, 'vital.kosh.@mail.ru', 7564563675867967, 'rab02', '19182', 5, 1, 80000),
(3, 'Дмитрий', 'Климов', '1987-02-18', 'кладовщик', 89124535436, 'dmitr.klim.@mail.ru\r\n', 1354877098067567, 'clad01', '321321', NULL, 3, 60000),
(4, 'Кирилл', 'Кузьмин', '1981-09-01', 'кладовщик', 89543654676, 'kiril.kyzm.@mail.ru', 9678565356578679, 'clad02', '87965', NULL, 3, 60000),
(5, 'Алиса', 'Степанова', '1990-09-24', 'менеджер', 89024567655, 'alis.stepan.@mail.ru', 878567456467558, 'meneg01', '456654', NULL, 8, 75000),
(6, 'Анна', 'Волкова', '1987-02-24', 'менеджер', 89124356678, 'anna.volk@mail.ru', 978567456362317, 'meneg02', '66321', NULL, 0, 75000),
(11, 'Дмитрий', 'Фокин', '1986-12-12', 'рабочий', 89548873219, 'dmitry.fokin@mail.ru', 56454565744545, 'rab01', '123123', 2, NULL, 80000);

-- --------------------------------------------------------

--
-- Структура таблицы `warehouse`
--

CREATE TABLE `warehouse` (
  `id_resusrs` int NOT NULL,
  `resurs` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `quantity` bigint NOT NULL,
  `stand` int NOT NULL,
  `id_user_res` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `warehouse`
--

INSERT INTO `warehouse` (`id_resusrs`, `resurs`, `quantity`, `stand`, `id_user_res`) VALUES
(1, 'полистирол\r\n', 600, 1, 3),
(2, 'рулонные покрытия', 400, 2, 3),
(3, 'пенополистирол', 467, 3, 3),
(4, 'никель', 100, 4, 4),
(5, 'цинк', 100, 5, 4),
(15, 'Ртуть', 12, 7, 3);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `plan_user`
--
ALTER TABLE `plan_user`
  ADD PRIMARY KEY (`id_plan`),
  ADD KEY `fk_lpan` (`id_user_plan`);

--
-- Индексы таблицы `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id_product`),
  ADD KEY `fk_product` (`id_user_prod`);

--
-- Индексы таблицы `product_buy`
--
ALTER TABLE `product_buy`
  ADD PRIMARY KEY (`id_buy`),
  ADD KEY `fk_buy_product` (`id_user_buy`);

--
-- Индексы таблицы `report_user`
--
ALTER TABLE `report_user`
  ADD PRIMARY KEY (`id_report`),
  ADD KEY `fk_report` (`id_user_rep`);

--
-- Индексы таблицы `shedule`
--
ALTER TABLE `shedule`
  ADD PRIMARY KEY (`id_shedule`),
  ADD KEY `fk_shedule` (`user_id_sh`);

--
-- Индексы таблицы `user_data`
--
ALTER TABLE `user_data`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `id_user` (`id_user`);

--
-- Индексы таблицы `warehouse`
--
ALTER TABLE `warehouse`
  ADD UNIQUE KEY `id_resusrs` (`id_resusrs`),
  ADD KEY `fk_warehouse` (`id_user_res`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `plan_user`
--
ALTER TABLE `plan_user`
  MODIFY `id_plan` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `product`
--
ALTER TABLE `product`
  MODIFY `id_product` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT для таблицы `product_buy`
--
ALTER TABLE `product_buy`
  MODIFY `id_buy` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `report_user`
--
ALTER TABLE `report_user`
  MODIFY `id_report` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `shedule`
--
ALTER TABLE `shedule`
  MODIFY `id_shedule` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT для таблицы `user_data`
--
ALTER TABLE `user_data`
  MODIFY `id_user` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `warehouse`
--
ALTER TABLE `warehouse`
  MODIFY `id_resusrs` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `plan_user`
--
ALTER TABLE `plan_user`
  ADD CONSTRAINT `fk_lpan` FOREIGN KEY (`id_user_plan`) REFERENCES `user_data` (`id_user`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `fk_product` FOREIGN KEY (`id_user_prod`) REFERENCES `user_data` (`id_user`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `product_buy`
--
ALTER TABLE `product_buy`
  ADD CONSTRAINT `fk_buy_product` FOREIGN KEY (`id_user_buy`) REFERENCES `user_data` (`id_user`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `report_user`
--
ALTER TABLE `report_user`
  ADD CONSTRAINT `fk_report` FOREIGN KEY (`id_user_rep`) REFERENCES `user_data` (`id_user`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `shedule`
--
ALTER TABLE `shedule`
  ADD CONSTRAINT `fk_shedule` FOREIGN KEY (`user_id_sh`) REFERENCES `user_data` (`id_user`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `warehouse`
--
ALTER TABLE `warehouse`
  ADD CONSTRAINT `fk_warehouse` FOREIGN KEY (`id_user_res`) REFERENCES `user_data` (`id_user`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
