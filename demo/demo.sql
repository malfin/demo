-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Апр 16 2022 г., 19:13
-- Версия сервера: 8.0.24
-- Версия PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `demo`
--

-- --------------------------------------------------------

--
-- Структура таблицы `authapp_myuser`
--

CREATE TABLE `authapp_myuser` (
  `id` bigint NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `patronymic` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `authapp_myuser`
--

INSERT INTO `authapp_myuser` (`id`, `password`, `last_login`, `is_superuser`, `username`, `is_staff`, `is_active`, `date_joined`, `first_name`, `last_name`, `patronymic`, `email`) VALUES
(1, 'pbkdf2_sha256$260000$3p7MDdCWEkfbGkxlLU3Qvv$L9OgXycjAO8SFVWV0jezsOFtb/36yT4Uj6AM32LSUB8=', '2022-04-16 15:59:54.430807', 1, 'admin', 1, 1, '2022-04-16 14:39:34.191702', 'Алексей', 'Пухов', '', 'admin@admin.ru'),
(3, 'pbkdf2_sha256$260000$rnROmRuZr6nw5JoCgEbo5a$ZT7ZNW0uYRK0+eVtwbaxnn8aSOnaujFNRij065y5RRU=', '2022-04-16 15:26:53.516735', 0, 'dima', 0, 1, '2022-04-16 15:26:43.834944', 'Дмитрий', 'Павлов', '', 'dima@mail.ru');

-- --------------------------------------------------------

--
-- Структура таблицы `authapp_myuser_groups`
--

CREATE TABLE `authapp_myuser_groups` (
  `id` bigint NOT NULL,
  `myuser_id` bigint NOT NULL,
  `group_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `authapp_myuser_user_permissions`
--

CREATE TABLE `authapp_myuser_user_permissions` (
  `id` bigint NOT NULL,
  `myuser_id` bigint NOT NULL,
  `permission_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add session', 5, 'add_session'),
(18, 'Can change session', 5, 'change_session'),
(19, 'Can delete session', 5, 'delete_session'),
(20, 'Can view session', 5, 'view_session'),
(21, 'Can add user', 6, 'add_myuser'),
(22, 'Can change user', 6, 'change_myuser'),
(23, 'Can delete user', 6, 'delete_myuser'),
(24, 'Can view user', 6, 'view_myuser'),
(25, 'Can add товар', 7, 'add_products'),
(26, 'Can change товар', 7, 'change_products'),
(27, 'Can delete товар', 7, 'delete_products'),
(28, 'Can view товар', 7, 'view_products'),
(29, 'Can add категория', 8, 'add_category'),
(30, 'Can change категория', 8, 'change_category'),
(31, 'Can delete категория', 8, 'delete_category'),
(32, 'Can view категория', 8, 'view_category'),
(33, 'Can add заказ', 9, 'add_order'),
(34, 'Can change заказ', 9, 'change_order'),
(35, 'Can delete заказ', 9, 'delete_order'),
(36, 'Can view заказ', 9, 'view_order');

-- --------------------------------------------------------

--
-- Структура таблицы `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL
) ;

--
-- Дамп данных таблицы `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2022-04-16 14:45:19.681979', '1', 'Приторный', 1, '[{\"added\": {}}]', 8, 1),
(2, '2022-04-16 14:45:24.169287', '2', 'Цветочные', 1, '[{\"added\": {}}]', 8, 1),
(3, '2022-04-16 14:45:50.791414', '1', '1', 1, '[{\"added\": {}}]', 7, 1),
(4, '2022-04-16 14:45:58.766749', '2', '2', 1, '[{\"added\": {}}]', 7, 1),
(5, '2022-04-16 14:46:14.847316', '3', '3', 1, '[{\"added\": {}}]', 7, 1),
(6, '2022-04-16 14:46:23.764199', '4', '4', 1, '[{\"added\": {}}]', 7, 1),
(7, '2022-04-16 14:46:41.673425', '5', '5', 1, '[{\"added\": {}}]', 7, 1),
(8, '2022-04-16 14:46:52.280540', '6', '6', 1, '[{\"added\": {}}]', 7, 1),
(9, '2022-04-16 14:47:09.691783', '7', '7', 1, '[{\"added\": {}}]', 7, 1),
(10, '2022-04-16 14:47:25.456990', '8', '8', 1, '[{\"added\": {}}]', 7, 1),
(11, '2022-04-16 14:47:34.581997', '9', '9', 1, '[{\"added\": {}}]', 7, 1),
(12, '2022-04-16 16:00:17.059389', '9', '9', 2, '[{\"changed\": {\"fields\": [\"\\u0424\\u043e\\u0442\\u043e\"]}}]', 7, 1),
(13, '2022-04-16 16:00:26.887655', '8', '8', 2, '[{\"changed\": {\"fields\": [\"\\u0424\\u043e\\u0442\\u043e\"]}}]', 7, 1),
(14, '2022-04-16 16:00:37.193381', '7', '7', 2, '[{\"changed\": {\"fields\": [\"\\u0424\\u043e\\u0442\\u043e\"]}}]', 7, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(6, 'authapp', 'myuser'),
(4, 'contenttypes', 'contenttype'),
(8, 'mainapp', 'category'),
(9, 'mainapp', 'order'),
(7, 'mainapp', 'products'),
(5, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Структура таблицы `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2022-04-16 14:10:00.060282'),
(2, 'contenttypes', '0002_remove_content_type_name', '2022-04-16 14:10:00.210281'),
(3, 'auth', '0001_initial', '2022-04-16 14:10:00.530342'),
(4, 'auth', '0002_alter_permission_name_max_length', '2022-04-16 14:10:00.602969'),
(5, 'auth', '0003_alter_user_email_max_length', '2022-04-16 14:10:00.612958'),
(6, 'auth', '0004_alter_user_username_opts', '2022-04-16 14:10:00.623984'),
(7, 'auth', '0005_alter_user_last_login_null', '2022-04-16 14:10:00.634972'),
(8, 'auth', '0006_require_contenttypes_0002', '2022-04-16 14:10:00.638960'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2022-04-16 14:10:00.648554'),
(10, 'auth', '0008_alter_user_username_max_length', '2022-04-16 14:10:00.658661'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2022-04-16 14:10:00.668659'),
(12, 'auth', '0010_alter_group_name_max_length', '2022-04-16 14:10:00.736483'),
(13, 'auth', '0011_update_proxy_permissions', '2022-04-16 14:10:00.750466'),
(14, 'auth', '0012_alter_user_first_name_max_length', '2022-04-16 14:10:00.765462'),
(15, 'authapp', '0001_initial', '2022-04-16 14:10:01.183463'),
(16, 'admin', '0001_initial', '2022-04-16 14:10:01.369459'),
(17, 'admin', '0002_logentry_remove_auto_add', '2022-04-16 14:10:01.384460'),
(18, 'admin', '0003_logentry_add_action_flag_choices', '2022-04-16 14:10:01.399459'),
(19, 'sessions', '0001_initial', '2022-04-16 14:10:01.450456'),
(20, 'mainapp', '0001_initial', '2022-04-16 14:18:24.805108'),
(21, 'mainapp', '0002_auto_20220416_2000', '2022-04-16 15:00:31.421302');

-- --------------------------------------------------------

--
-- Структура таблицы `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('pancze8gz39wa48fns85gytldfuo96cj', '.eJxVjDsOwjAQRO_iGln-r01Jzxmstb3gALKlOKkQdyeRUkAzxbw382YR16XGddAcp8LOTLLTb5cwP6ntoDyw3TvPvS3zlPiu8IMOfu2FXpfD_TuoOOq2xhIkpS0zSKM9UZDaYtY3UYyl4hQZRd4rBKkAwAanMpA1DoUDSYJ9vvDaN3w:1nfkq2:eC-Vh4eZ0ak-U7fCJcEF86NP-OGs5yxCl6jtzSxrxak', '2022-04-30 15:59:54.438810');

-- --------------------------------------------------------

--
-- Структура таблицы `mainapp_category`
--

CREATE TABLE `mainapp_category` (
  `id` bigint NOT NULL,
  `name` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `mainapp_category`
--

INSERT INTO `mainapp_category` (`id`, `name`) VALUES
(1, 'Приторный'),
(2, 'Цветочные');

-- --------------------------------------------------------

--
-- Структура таблицы `mainapp_order`
--

CREATE TABLE `mainapp_order` (
  `id` bigint NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `products_id` bigint NOT NULL,
  `user_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `mainapp_order`
--

INSERT INTO `mainapp_order` (`id`, `created_at`, `products_id`, `user_id`) VALUES
(1, '2022-04-16 15:08:57.912797', 8, 1),
(2, '2022-04-16 15:14:06.282826', 9, 1),
(3, '2022-04-16 15:46:54.210719', 9, 3),
(4, '2022-04-16 15:48:54.486267', 8, 3),
(5, '2022-04-16 15:49:02.329817', 6, 3),
(6, '2022-04-16 15:49:06.557161', 4, 3),
(7, '2022-04-16 15:49:10.008420', 5, 3),
(8, '2022-04-16 16:01:24.741079', 7, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `mainapp_products`
--

CREATE TABLE `mainapp_products` (
  `id` bigint NOT NULL,
  `title` varchar(128) NOT NULL,
  `desc` longtext NOT NULL,
  `price` decimal(6,2) NOT NULL,
  `photo` varchar(100) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `category_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `mainapp_products`
--

INSERT INTO `mainapp_products` (`id`, `title`, `desc`, `price`, `photo`, `created_at`, `category_id`) VALUES
(1, '1', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', '2000.00', 'products/2022/04/16/257_257sb.jpg', '2022-04-16 14:45:50.790402', 1),
(2, '2', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', '3000.00', 'products/2022/04/16/257_257sb_1NO8YEU.jpg', '2022-04-16 14:45:58.764768', 2),
(3, '3', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', '4000.00', 'products/2022/04/16/257_257sb_qdReLBB.jpg', '2022-04-16 14:46:14.846332', 1),
(4, '4', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', '3211.00', 'products/2022/04/16/257_257sb_qgVsVTc.jpg', '2022-04-16 14:46:23.761200', 2),
(5, '5', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', '3600.00', 'products/2022/04/16/257_257sb_ysGm03h.jpg', '2022-04-16 14:46:41.671464', 1),
(6, '6', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', '1200.00', 'products/2022/04/16/257_257sb_QqLiL09.jpg', '2022-04-16 14:46:52.277543', 2),
(7, '7', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', '3000.00', 'products/2022/04/16/6ecb40574c4c724897bc13efac1335bca137068d787f779ba971a2a3643b9304.jpg', '2022-04-16 16:00:37.188383', 1),
(8, '8', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', '6999.00', 'products/2022/04/16/luna-na-prozrachnom-fone-.png', '2022-04-16 16:00:26.883656', 2),
(9, '9', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', '800.00', 'products/2022/04/16/test_2.png', '2022-04-16 16:00:17.057374', 2);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `authapp_myuser`
--
ALTER TABLE `authapp_myuser`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Индексы таблицы `authapp_myuser_groups`
--
ALTER TABLE `authapp_myuser_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `authapp_myuser_groups_myuser_id_group_id_9ba7b803_uniq` (`myuser_id`,`group_id`),
  ADD KEY `authapp_myuser_groups_group_id_bba1a7ac_fk_auth_group_id` (`group_id`);

--
-- Индексы таблицы `authapp_myuser_user_permissions`
--
ALTER TABLE `authapp_myuser_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `authapp_myuser_user_perm_myuser_id_permission_id_925c0aee_uniq` (`myuser_id`,`permission_id`),
  ADD KEY `authapp_myuser_user__permission_id_f77bf217_fk_auth_perm` (`permission_id`);

--
-- Индексы таблицы `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Индексы таблицы `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Индексы таблицы `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Индексы таблицы `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_authapp_myuser_id` (`user_id`);

--
-- Индексы таблицы `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Индексы таблицы `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Индексы таблицы `mainapp_category`
--
ALTER TABLE `mainapp_category`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `mainapp_order`
--
ALTER TABLE `mainapp_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mainapp_order_products_id_e9897c76_fk_mainapp_products_id` (`products_id`),
  ADD KEY `mainapp_order_user_id_6b7d645b_fk_authapp_myuser_id` (`user_id`);

--
-- Индексы таблицы `mainapp_products`
--
ALTER TABLE `mainapp_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mainapp_products_category_id_c48cc5d4_fk_mainapp_category_id` (`category_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `authapp_myuser`
--
ALTER TABLE `authapp_myuser`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `authapp_myuser_groups`
--
ALTER TABLE `authapp_myuser_groups`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `authapp_myuser_user_permissions`
--
ALTER TABLE `authapp_myuser_user_permissions`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT для таблицы `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT для таблицы `mainapp_category`
--
ALTER TABLE `mainapp_category`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `mainapp_order`
--
ALTER TABLE `mainapp_order`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `mainapp_products`
--
ALTER TABLE `mainapp_products`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `authapp_myuser_groups`
--
ALTER TABLE `authapp_myuser_groups`
  ADD CONSTRAINT `authapp_myuser_groups_group_id_bba1a7ac_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `authapp_myuser_groups_myuser_id_706c92a6_fk_authapp_myuser_id` FOREIGN KEY (`myuser_id`) REFERENCES `authapp_myuser` (`id`);

--
-- Ограничения внешнего ключа таблицы `authapp_myuser_user_permissions`
--
ALTER TABLE `authapp_myuser_user_permissions`
  ADD CONSTRAINT `authapp_myuser_user__myuser_id_bb5980d0_fk_authapp_m` FOREIGN KEY (`myuser_id`) REFERENCES `authapp_myuser` (`id`),
  ADD CONSTRAINT `authapp_myuser_user__permission_id_f77bf217_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Ограничения внешнего ключа таблицы `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Ограничения внешнего ключа таблицы `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Ограничения внешнего ключа таблицы `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_authapp_myuser_id` FOREIGN KEY (`user_id`) REFERENCES `authapp_myuser` (`id`);

--
-- Ограничения внешнего ключа таблицы `mainapp_order`
--
ALTER TABLE `mainapp_order`
  ADD CONSTRAINT `mainapp_order_products_id_e9897c76_fk_mainapp_products_id` FOREIGN KEY (`products_id`) REFERENCES `mainapp_products` (`id`),
  ADD CONSTRAINT `mainapp_order_user_id_6b7d645b_fk_authapp_myuser_id` FOREIGN KEY (`user_id`) REFERENCES `authapp_myuser` (`id`);

--
-- Ограничения внешнего ключа таблицы `mainapp_products`
--
ALTER TABLE `mainapp_products`
  ADD CONSTRAINT `mainapp_products_category_id_c48cc5d4_fk_mainapp_category_id` FOREIGN KEY (`category_id`) REFERENCES `mainapp_category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
