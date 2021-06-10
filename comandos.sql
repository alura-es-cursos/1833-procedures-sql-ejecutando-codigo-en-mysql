/* 
En este script encontrarás todos los comandos que ejecutaremos durante el desarrollo de nuestro entrenamiento

¡Muchos éxitos en tus estudios!

Ahora que tu ambiente está preparado, llegó el momento de colocar en práctica tu código.

¡Manos a la obra!
*/

-- PROYECTO DEL AULA ANTERIOR 2

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `hola_mundo`()
BEGIN
SELECT "Hola Mundo!!!!";
END$$
DELIMITER ;

CALL hola_mundo;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `muestra_numero`()
BEGIN
SELECT(9+5)*2 AS RESULTADO;
END$$
DELIMITER ;

CALL muestra_numero;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `concatenar`()
BEGIN
SELECT CONCAT('Hola Mundo', " ", '!!!!') AS RESULTADO;
END$$
DELIMITER ;

CALL concatenar;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `concatenar_con_comentarios`()
BEGIN
/*
Este es un ejemplo de comentario
al interior de un procedire
*/
-- Así se comenta un stored procedure.
# Así también.
SELECT CONCAT("Hola a todos!!", ' ', 'Este procedure concatena strings.') AS RESULTADO;
END$$
DELIMITER ;

CALL concatenar_con_comentarios;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `concatenar2`()
BEGIN
SELECT CONCAT('Hola Mundo', " ", '!!!!') AS RESULTADO;
END$$
DELIMITER ;

CALL concatenar2;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `exhibir_variable`()
BEGIN
DECLARE texto CHAR(20) DEFAULT 'Hola Mundo!!!!!!!';
SELECT texto;
END$$
DELIMITER ;

CALL exhibir_variable;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `declaracion`()
BEGIN
DECLARE v VARCHAR(30) DEFAULT "Caracteres Variables";
DECLARE i INTEGER DEFAULT 564;
DECLARE d DECIMAL(5,3) DEFAULT 89.765;
DECLARE f DATE DEFAULT "2021-01-01";
DECLARE ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP();
SELECT v;
SELECT i;
SELECT d;
SELECT f;
SELECT ts;
END$$
DELIMITER ;

CALL declaracion;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sin_declaracion`()
BEGIN
SELECT texto;
END$$
DELIMITER ;

CALL sin_declaracion;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `atribuir_valores`()
BEGIN
DECLARE numero INTEGER DEFAULT 987;
SELECT numero;
SET numero = 324;
SELECT numero;
END$$
DELIMITER ;

CALL atribuir_valores;

-- PROYECTO DEL AULA ANTERIOR 3

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `manipulacion`()
BEGIN
INSERT INTO tabla_de_productos (CODIGO_DEL_PRODUCTO,NOMBRE_DEL_PRODUCTO,SABOR,TAMANO,ENVASE,PRECIO_DE_LISTA)
     VALUES ('1001001','Sabor Alpino','Mango','700 ml','Botella',7.50),
         ('1001000','Sabor Alpino','Melón','700 ml','Botella',7.50),
         ('1001002','Sabor Alpino','Guanábana','700 ml','Botella',7.50),
         ('1001003','Sabor Alpino','Mandarina','700 ml','Botella',7.50),
         ('1001004','Sabor Alpino','Banana','700 ml','Botella',7.50),
         ('1001005','Sabor Alpino','Asaí','700 ml','Botella',7.50),
         ('1001006','Sabor Alpino','Mango','1 Litro','Botella',7.50),
         ('1001007','Sabor Alpino','Melón','1 Litro','Botella',7.50),
         ('1001008','Sabor Alpino','Guanábana','1 Litro','Botella',7.50),
         ('1001009','Sabor Alpino','Mandarina','1 Litro','Botella',7.50),
         ('1001010','Sabor Alpino','Banana','1 Litro','Botella',7.50),
         ('1001011','Sabor Alpino','Asaí','1 Litro','Botella',7.50);


SELECT * FROM tabla_de_productos WHERE NOMBRE_DEL_PRODUCTO LIKE 'Sabor Alp%';

UPDATE tabla_de_productos SET PRECIO_DE_LISTA= 5 WHERE NOMBRE_DEL_PRODUCTO LIKE 'Sabor Alp%';

SELECT * FROM tabla_de_productos WHERE NOMBRE_DEL_PRODUCTO LIKE 'Sabor Alp%';

DELETE FROM tabla_de_productos WHERE NOMBRE_DEL_PRODUCTO LIKE 'Sabor Alp%';

SELECT * FROM tabla_de_productos WHERE NOMBRE_DEL_PRODUCTO LIKE 'Sabor Alp%';
END$$
DELIMITER ;

CALL manipulacion;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `incluir_producto`()
BEGIN
DECLARE vcodigo VARCHAR(20) DEFAULT '3003001';
DECLARE vnombre VARCHAR(20) DEFAULT 'Sabor Intenso';
DECLARE vsabor VARCHAR(20) DEFAULT 'Tutti Frutti';
DECLARE vtamano VARCHAR(20) DEFAULT '700 ml';
DECLARE venvase VARCHAR(20) DEFAULT 'Botella PET';
DECLARE vprecio DECIMAL(4,2) DEFAULT 7.25;
INSERT INTO tabla_de_productos (CODIGO_DEL_PRODUCTO,NOMBRE_DEL_PRODUCTO,SABOR,TAMANO,ENVASE,PRECIO_DE_LISTA)
     VALUES (vcodigo, vnombre, vsabor, vtamano, venvase, vprecio);
END$$
DELIMITER ;

CALL incluir_producto;

SELECT * FROM tabla_de_productos WHERE NOMBRE_DEL_PRODUCTO LIKE 'Sabor In%';

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `incluir_producto_parametros`(vcodigo VARCHAR(20), vnombre VARCHAR(20),vsabor VARCHAR(20),
vtamano VARCHAR(20), venvase VARCHAR(20), vprecio DECIMAL(4,2))
BEGIN
DECLARE mensaje VARCHAR(40);
DECLARE EXIT HANDLER FOR 1062
BEGIN
  SET mensaje = 'Producto duplicado! ';
  SELECT mensaje;
END;
INSERT INTO tabla_de_productos (CODIGO_DEL_PRODUCTO,NOMBRE_DEL_PRODUCTO,SABOR,TAMANO,ENVASE,PRECIO_DE_LISTA)
     VALUES (vcodigo, vnombre, vsabor, vtamano, venvase, vprecio);
SET mensaje = 'Producto incluido con éxito!';
SELECT mensaje;
END$$
DELIMITER ;

CALL incluir_producto_parametros('1000800','Sabor del Mar',
'Naranja', '700 ml', 'Botella de Vidrio', 2.25);

SELECT * FROM tabla_de_productos WHERE CODIGO_DEL_PRODUCTO = '1000800';

CALL incluir_producto_parametros('1000801','Sabor del Mar',
'Naranja', '700 ml', 'Botella de Vidrio', 3.25);

CALL incluir_producto_parametros('1000800','Sabor del Mar',
'Naranja', '700 ml', 'Botella de Vidrio', 2.25);

SELECT * FROM tabla_de_productos WHERE CODIGO_DEL_PRODUCTO = '1000800';

SELECT CODIGO_DEL_PRODUCTO, SABOR FROM tabla_de_productos;

SELECT SABOR FROM tabla_de_productos WHERE CODIGO_DEL_PRODUCTO = "1078680";

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `mostrar_sabor`(vcodigo VARCHAR(15))
BEGIN
DECLARE vsabor VARCHAR(20);
SELECT SABOR INTO vsabor FROM tabla_de_productos WHERE CODIGO_DEL_PRODUCTO = vcodigo;
SELECT vsabor;
END$$
DELIMITER ;

CALL mostrar_sabor('1101035');

-- PROYECTO DEL AULA ANTERIOR 4

SELECT * FROM tabla_de_clientes;

SELECT FECHA_DE_NACIMIENTO FROM tabla_de_clientes
WHERE DNI = '1471156710';

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `edad_clientes`(vdni VARCHAR(20))
BEGIN
DECLARE vresultado VARCHAR(50);
DECLARE vfecha DATE;
SELECT FECHA_DE_NACIMIENTO INTO vfecha FROM tabla_de_clientes WHERE DNI = vdni;
IF 
vfecha < '19950101'
THEN
SET vresultado = 'Cliente Viejo.';
ELSE
SET vresultado = 'Cliente Joven.';
END IF;
SELECT vresultado;
END$$
DELIMITER ;

CALL edad_clientes('50534475787');

CALL edad_clientes('5648641702');


SELECT * FROM tabla_de_productos;

/* 
precio >= 12 producto costoso.
precio >= 7 y precio < 12 producto asequible.
precio < 7 producto barato.
*/

SELECT PRECIO_DE_LISTA FROM tabla_de_productos 
WHERE CODIGO_DEL_PRODUCTO = '1000800';

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `precio_producto`(vcodigo VARCHAR(20))
BEGIN
DECLARE vresultado VARCHAR(40);
DECLARE vprecio FLOAT;
SELECT PRECIO_DE_LISTA INTO vprecio FROM tabla_de_productos 
WHERE CODIGO_DEL_PRODUCTO = vcodigo;
IF vprecio >=12 
THEN SET vresultado = 'Producto costoso.';
ELSEIF
vprecio >= 7 AND vprecio < 12
THEN SET vresultado = 'Producto asequible.';
ELSE
SET vresultado = 'Producto barato.';
END IF;
SELECT vresultado;
END$$
DELIMITER ;

CALL precio_producto('1000801');

CALL precio_producto('1013793');

CALL precio_producto('1096818');


SELECT DISTINCT SABOR FROM tabla_de_productos;

/* 
Maracuyá Rico
Limón Rico
Frutilla Rico
Uva Rico
Sandía Normal
Mango Normal
Los demás Comunes
*/

SELECT * FROM tabla_de_productos;

SELECT SABOR FROM tabla_de_productos WHERE CODIGO_DEL_PRODUCTO = '1002767';

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `define_sabor`(vcodigo VARCHAR(20))
BEGIN
DECLARE vsabor VARCHAR(20);
SELECT SABOR INTO vsabor FROM tabla_de_productos WHERE CODIGO_DEL_PRODUCTO = vcodigo;
CASE vsabor
WHEN 'Maracuyá' THEN SELECT 'Muy Rico';
WHEN 'Limón' THEN SELECT 'Muy Rico';
WHEN 'Frutilla' THEN SELECT 'Muy Rico';
WHEN 'Uva' THEN SELECT 'Muy Rico';
WHEN 'Sandía' THEN SELECT 'Normal';
WHEN 'Mango' THEN SELECT 'Normal';
ELSE SELECT 'Jugos comunes';
END CASE;
END$$
DELIMITER ;

CALL define_sabor('1096818');

CALL define_sabor('243083');

SELECT SABOR, CODIGO_DEL_PRODUCTO FROM tabla_de_productos;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `define_sabor_con_error`(vcodigo VARCHAR(20))
BEGIN
DECLARE vsabor VARCHAR(20);
DECLARE mensajeerror VARCHAR(50);
DECLARE CONTINUE HANDLER FOR 1339
SET mensajeerror = 'Sabor no definido en ningún caso.';
SELECT SABOR INTO vsabor FROM tabla_de_productos WHERE CODIGO_DEL_PRODUCTO = vcodigo;
CASE vsabor
WHEN 'Maracuyá' THEN SELECT 'Muy Rico';
WHEN 'Limón' THEN SELECT 'Muy Rico';
WHEN 'Frutilla' THEN SELECT 'Muy Rico';
WHEN 'Uva' THEN SELECT 'Muy Rico';
WHEN 'Sandía' THEN SELECT 'Normal';
WHEN 'Mango' THEN SELECT 'Normal';
END CASE;
SELECT mensajeerror;
END$$
DELIMITER ;

CALL define_sabor_con_error('1000800');


DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `precio_producto_case`(vcodigo VARCHAR(20))
BEGIN
DECLARE vresultado VARCHAR(40);
DECLARE vprecio FLOAT;
SELECT PRECIO_DE_LISTA INTO vprecio FROM tabla_de_productos 
WHERE CODIGO_DEL_PRODUCTO = vcodigo;
CASE 
WHEN vprecio >=12 THEN SET vresultado = 'Producto costoso.';
WHEN vprecio >= 7 AND vprecio < 12 THEN SET vresultado = 'Producto asequible.';
WHEN vprecio < 7 THEN SET vresultado = 'Producto barato.';
END CASE;
SELECT vresultado;
END
$$

CALL precio_producto_case('1000801');

CALL precio_producto_case('1013793');

CALL precio_producto_case('1096818');


CREATE TABLE tb_looping (ID INT);

SELECT * FROM tb_looping;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `looping`(vinicial INT, vfinal INT)
BEGIN
DECLARE vcontador INT;
DELETE FROM tb_looping;
SET vcontador = vinicial;
WHILE vcontador <= vfinal
DO
INSERT INTO tb_looping VALUES(vcontador);
SET vcontador = vcontador+1;
END WHILE;
SELECT * FROM tb_looping;
END$$
DELIMITER ;

CALL looping(1,10);

-- PROYECTO FINAL

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `problema_select_into`()
BEGIN
DECLARE vnombre VARCHAR(50);
SELECT NOMBRE INTO vnombre FROM tabla_de_clientes;
SELECT vnombre;
END$$
DELIMITER ;

CALL problema_select_into;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `cursor_1`()
BEGIN
DECLARE vnombre VARCHAR(50);
DECLARE c CURSOR FOR SELECT NOMBRE FROM tabla_de_clientes LIMIT 4;
OPEN c;
FETCH c INTO vnombre;
SELECT vnombre;
FETCH c INTO vnombre;
SELECT vnombre;
FETCH c INTO vnombre;
SELECT vnombre;
FETCH c INTO vnombre;
SELECT vnombre;
FETCH c INTO vnombre;
SELECT vnombre;
CLOSE c;
END$$
DELIMITER ;

CALL cursor_1;

SELECT NOMBRE FROM tabla_de_clientes LIMIT 4;


DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `cursor_looping`()
BEGIN
DECLARE fin_c INT DEFAULT 0;
DECLARE vnombre VARCHAR(50);
DECLARE c CURSOR FOR SELECT NOMBRE FROM tabla_de_clientes;
DECLARE CONTINUE HANDLER FOR NOT FOUND
SET fin_c = 1;
OPEN c;
WHILE fin_c = 0
DO
FETCH c INTO vnombre;
IF fin_c = 0 
THEN SELECT vnombre;
END IF;
END WHILE;
CLOSE c;
END$$
DELIMITER ;

CALL cursor_looping;

SELECT NOMBRE FROM tabla_de_clientes;


SELECT * FROM tabla_de_clientes;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `cursor_looping_varios_campos`()
BEGIN
DECLARE fin_c INT DEFAULT 0;
DECLARE vbarrio, vciudad, vestado, vcp VARCHAR(50);
DECLARE vnombre, vdireccion VARCHAR(150);
DECLARE c CURSOR FOR SELECT NOMBRE, DIRECCION_1, BARRIO, CIUDAD, ESTADO, CP FROM tabla_de_clientes;
DECLARE CONTINUE HANDLER FOR NOT FOUND
SET fin_c = 1;
OPEN c;
WHILE fin_c = 0
DO
FETCH c INTO vnombre, vdireccion, vbarrio, vciudad, vestado, vcp;
IF fin_c = 0 
THEN SELECT CONCAT(vnombre, ' Dirección: ', vdireccion, " - ", vbarrio, ' - ', vciudad, ' - ', vestado, ' - ',vcp) AS RESULTADO;
END IF;
END WHILE;
CLOSE c;
END$$
DELIMITER ;

CALL cursor_looping_varios_campos;


SET GLOBAL log_bin_trust_function_creators = 1;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` FUNCTION `f_define_sabor`(vsabor VARCHAR(40)) RETURNS varchar(40) CHARSET utf8mb4
BEGIN
DECLARE vretorno VARCHAR(40) DEFAULT "";
CASE vsabor
WHEN 'Maracuyá' THEN SET vretorno = 'Muy Rico';
WHEN 'Limón' THEN SET vretorno = 'Muy Rico';
WHEN 'Frutilla' THEN SET vretorno = 'Muy Rico';
WHEN 'Uva' THEN SET vretorno = 'Muy Rico';
WHEN 'Sandía' THEN SET vretorno = 'Normal';
WHEN 'Mango' THEN SET vretorno = 'Normal';
ELSE SET vretorno = 'Jugos comunes';
END CASE;
RETURN vretorno;
END$$
DELIMITER ;

SELECT f_define_sabor('Maracuyá');

SELECT NOMBRE_DEL_PRODUCTO, SABOR, f_define_sabor(SABOR) AS TIPO
FROM tabla_de_productos;

SELECT NOMBRE_DEL_PRODUCTO, SABOR FROM tabla_de_productos
WHERE f_define_sabor(SABOR) = 'Muy Rico';
