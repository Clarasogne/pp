-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3307
-- Tiempo de generación: 03-11-2023 a las 09:58:45
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sistemaexamenes`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumnos`
--

CREATE TABLE `alumnos` (
  `dni_alumno` int(8) NOT NULL,
  `apellido` varchar(22) NOT NULL,
  `nombre` varchar(22) NOT NULL,
  `email` varchar(40) NOT NULL,
  `curso_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `alumnos`
--

INSERT INTO `alumnos` (`dni_alumno`, `apellido`, `nombre`, `email`, `curso_id`) VALUES
(32542883, 'Salas', 'Martín', '32542883@terciariourquiza.edu.ar', 1),
(41512690, 'Sogne', 'Clara', '41512690@terciariourquiza.edu.ar', 1),
(42327796, 'Peña', 'Laureano', '42327796@terciariourquiza.edu.ar', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumno_respuesta`
--

CREATE TABLE `alumno_respuesta` (
  `dni_alumno` int(11) NOT NULL,
  `id_examen` int(11) NOT NULL,
  `id_pregunta` int(11) NOT NULL,
  `id_respuesta` int(11) NOT NULL,
  `respuesta` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clase`
--

CREATE TABLE `clase` (
  `id` int(11) NOT NULL,
  `espacio_curricular` varchar(50) DEFAULT NULL,
  `curso_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clase`
--

INSERT INTO `clase` (`id`, `espacio_curricular`, `curso_id`) VALUES
(28, 'Práctica Profesionalizante I', 1),
(29, 'Programación I', 1),
(30, 'Ingeniería de Software II', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clase_alumno`
--

CREATE TABLE `clase_alumno` (
  `id_clase` int(4) NOT NULL,
  `dni_alumno` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clase_alumno`
--

INSERT INTO `clase_alumno` (`id_clase`, `dni_alumno`) VALUES
(28, 32542883),
(28, 41512690),
(28, 42327796),
(29, 32542883),
(29, 41512690),
(29, 42327796),
(30, 32542883),
(30, 41512690),
(30, 42327796);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clase_profesor`
--

CREATE TABLE `clase_profesor` (
  `id_clase` int(4) NOT NULL,
  `dni_profesor` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clase_profesor`
--

INSERT INTO `clase_profesor` (`id_clase`, `dni_profesor`) VALUES
(28, 11222333),
(29, 22333444),
(30, 11222333);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cursos`
--

CREATE TABLE `cursos` (
  `id` int(11) NOT NULL,
  `curso` varchar(20) DEFAULT NULL,
  `division` varchar(20) DEFAULT NULL,
  `carrera` varchar(50) DEFAULT NULL,
  `anio` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cursos`
--

INSERT INTO `cursos` (`id`, `curso`, `division`, `carrera`, `anio`) VALUES
(1, '2do', '1era', 'DS', 2023),
(2, '1ero', '1era', 'DS', 2023);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `examenes`
--

CREATE TABLE `examenes` (
  `id_examen` int(11) NOT NULL,
  `id_clases` int(11) NOT NULL,
  `hora_comienzo` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `hora_final` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preguntas`
--

CREATE TABLE `preguntas` (
  `id_pregunta` int(11) NOT NULL,
  `pregunta` varchar(255) NOT NULL,
  `tipo_pregunta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesores`
--

CREATE TABLE `profesores` (
  `dni_profesor` int(8) NOT NULL,
  `apellido` varchar(22) NOT NULL,
  `nombre` varchar(22) NOT NULL,
  `email` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `profesores`
--

INSERT INTO `profesores` (`dni_profesor`, `apellido`, `nombre`, `email`) VALUES
(11222333, 'Serván', 'Diego', 'diego.servan@terciariourquiza.edu.ar'),
(22333444, 'Pla', 'Marcelo', 'marcelo.pla@terciariourquiza.edu.ar');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `respuestas`
--

CREATE TABLE `respuestas` (
  `id_pregunta` int(11) NOT NULL,
  `id_respuesta` int(11) NOT NULL,
  `respuesta` varchar(255) NOT NULL,
  `correcta` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `permisos` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `username`, `password`, `permisos`) VALUES
(1, 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', 0),
(2, 'profe', 'f10e2821bbbea527ea02200352313bc059445190', 1),
(3, 'laureano', 'f10e2821bbbea527ea02200352313bc059445190', 2),
(4, 'diego.servan@terciariourquiza.edu.ar', '8354336224c63279aadd00a9621757ef4fdf31fc', 1),
(5, '42327796@terciariourquiza.edu.ar', '0f3fde0103dd44077c040215a2fabd09a097aecc', 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  ADD PRIMARY KEY (`dni_alumno`),
  ADD KEY `fk_curso` (`curso_id`);

--
-- Indices de la tabla `alumno_respuesta`
--
ALTER TABLE `alumno_respuesta`
  ADD PRIMARY KEY (`dni_alumno`,`id_examen`,`id_pregunta`,`id_respuesta`),
  ADD KEY `id_pregunta` (`id_pregunta`),
  ADD KEY `id_examen` (`id_examen`),
  ADD KEY `id_respuesta` (`id_respuesta`);

--
-- Indices de la tabla `clase`
--
ALTER TABLE `clase`
  ADD PRIMARY KEY (`id`),
  ADD KEY `curso_id` (`curso_id`);

--
-- Indices de la tabla `clase_alumno`
--
ALTER TABLE `clase_alumno`
  ADD PRIMARY KEY (`id_clase`,`dni_alumno`),
  ADD KEY `dni_alumno` (`dni_alumno`);

--
-- Indices de la tabla `clase_profesor`
--
ALTER TABLE `clase_profesor`
  ADD PRIMARY KEY (`id_clase`,`dni_profesor`),
  ADD KEY `dni_profesor` (`dni_profesor`);

--
-- Indices de la tabla `cursos`
--
ALTER TABLE `cursos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `examenes`
--
ALTER TABLE `examenes`
  ADD PRIMARY KEY (`id_examen`);

--
-- Indices de la tabla `preguntas`
--
ALTER TABLE `preguntas`
  ADD PRIMARY KEY (`id_pregunta`);

--
-- Indices de la tabla `profesores`
--
ALTER TABLE `profesores`
  ADD PRIMARY KEY (`dni_profesor`);

--
-- Indices de la tabla `respuestas`
--
ALTER TABLE `respuestas`
  ADD PRIMARY KEY (`id_respuesta`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clase`
--
ALTER TABLE `clase`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `cursos`
--
ALTER TABLE `cursos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alumnos`
--
ALTER TABLE `alumnos`
  ADD CONSTRAINT `fk_curso` FOREIGN KEY (`curso_id`) REFERENCES `cursos` (`id`);

--
-- Filtros para la tabla `alumno_respuesta`
--
ALTER TABLE `alumno_respuesta`
  ADD CONSTRAINT `alumno_respuesta_ibfk_1` FOREIGN KEY (`id_pregunta`) REFERENCES `respuestas` (`id_respuesta`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `alumno_respuesta_ibfk_2` FOREIGN KEY (`id_examen`) REFERENCES `examenes` (`id_examen`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `alumno_respuesta_ibfk_3` FOREIGN KEY (`id_respuesta`) REFERENCES `preguntas` (`id_pregunta`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `alumno_respuesta_ibfk_4` FOREIGN KEY (`dni_alumno`) REFERENCES `alumnos` (`dni_alumno`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `clase`
--
ALTER TABLE `clase`
  ADD CONSTRAINT `clase_ibfk_1` FOREIGN KEY (`curso_id`) REFERENCES `cursos` (`id`);

--
-- Filtros para la tabla `clase_alumno`
--
ALTER TABLE `clase_alumno`
  ADD CONSTRAINT `clase_alumno_ibfk_1` FOREIGN KEY (`dni_alumno`) REFERENCES `alumnos` (`dni_alumno`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `clase_profesor`
--
ALTER TABLE `clase_profesor`
  ADD CONSTRAINT `clase_profesor_ibfk_1` FOREIGN KEY (`dni_profesor`) REFERENCES `profesores` (`dni_profesor`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
