create database BankArg;
use BankArg;

-- drop database BankArg;

-- Joaco
CREATE TABLE `Documentos` (
  `id_tipo_doc` int NOT NULL AUTO_INCREMENT,
  `tipo_doc` varchar(150),
  KEY `pk` (`id_tipo_doc`)
);

-- Joaco
CREATE TABLE `Sexos` (
  `id_tipo_sexo` int NOT NULL AUTO_INCREMENT,
  `tipo` varchar(150),
  KEY `pk` (`id_tipo_sexo`)
);

-- Eze
CREATE TABLE `paises` (
  `cod_pais` int NOT NULL AUTO_INCREMENT,
  `pais` varchar(250),
  KEY `pk` (`cod_pais`)
);

-- Eze
CREATE TABLE `provincias` (
  `cod_provincia` int NOT NULL AUTO_INCREMENT,
  `provincia` varchar(150),
  `cod_pais` int NOT NULL,
  FOREIGN KEY (`cod_pais`) REFERENCES `paises`(`cod_pais`),
  KEY `pk` (`cod_provincia`),
  KEY `fk` (`cod_pais`)
);

-- Eze
CREATE TABLE `localidades` (
  `cod_localidad` int NOT NULL AUTO_INCREMENT,
  `localidad` varchar(150),
  `cod_provincia` int NOT NULL,
  FOREIGN KEY (`cod_provincia`) REFERENCES `provincias`(`cod_provincia`),
  KEY `pk` (`cod_localidad`),
  KEY `fk` (`cod_provincia`)
);

-- Valen
CREATE TABLE `Clientes` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(120),
  `apellido` varchar(120),
  `id_tipo_doc` int NOT NULL,
  `nro_doc` varchar(20), -- Varchar x si hay gente de algun otro pais donde la identificacion tiene numeros. 20 maximo x si se pone puntos o etc.
  `cod_localidad` int NOT NULL,
  `nro_calle` int,
  `calle` varchar(150),
  `nro_afiliado` int,
  `fecha_nac` datetime,
  `id_tipo_sexo` int NOT NULL,
  FOREIGN KEY (`id_tipo_doc`) REFERENCES `Documentos`(`id_tipo_doc`),
  FOREIGN KEY (`id_tipo_sexo`) REFERENCES `Sexos`(`id_tipo_sexo`),
  FOREIGN KEY (`cod_localidad`) REFERENCES `localidades`(`cod_localidad`),
  KEY `pk` (`id_cliente`),
  KEY `fk` (`id_tipo_doc`, `cod_localidad`, `id_tipo_sexo`)
);

-- Maxi
CREATE TABLE `Tipos_transferencias` (
  `id_tipo_transferencia` int NOT NULL AUTO_INCREMENT,
  `tipo_transferencia` varchar(250),
  KEY `pk` (`id_tipo_transferencia`)
);

-- Valen
CREATE TABLE `Transferencias` (
  `id_transferencia` int NOT NULL AUTO_INCREMENT,
  `id_tipo_transferencia` int NOT NULL,
  `id_cliente` int NOT NULL,
  `fecha` datetime,
  `monto` int,
  `cuenta_envio` varchar(150), -- varchar x codigo o similar
  `cuenta_recibo` varchar(150), -- varchar x codigo o similar
  FOREIGN KEY (`id_tipo_transferencia`) REFERENCES `Tipos_transferencias`(`id_tipo_transferencia`),
  FOREIGN KEY (`id_cliente`) REFERENCES `Clientes`(`id_cliente`),
  KEY `pk` (`id_transferencia`),
  KEY `fk` (`id_tipo_transferencia`, `id_cliente`)
);

-- Eze
CREATE TABLE `Tipos_cuentas` (
  `id_tipo_cuenta` int NOT NULL AUTO_INCREMENT,
  `tipo_cuenta` varchar(150),
  KEY `pk` (`id_tipo_cuenta`)
);

-- Eze
CREATE TABLE `Tipo_moneda` (
  `id_tipo_moneda` int NOT NULL AUTO_INCREMENT,
  `tipo_moneda` varchar(150),
  KEY `pk` (`id_tipo_moneda`)
);

-- Eze
CREATE TABLE `Tipo_estado_cuenta` (
  `id_tipo_estado_cuenta` int NOT NULL AUTO_INCREMENT,
  `tipo_estado_cuenta` varchar(150),
  KEY `pk` (`id_tipo_estado_cuenta`)
);

-- Eze
CREATE TABLE `Cuenta` (
  `id_cuenta` int NOT NULL AUTO_INCREMENT,
  -- `id_cliente` int NOT NULL,
  -- `id_tipo_cuenta` int NOT NULL,
  -- `id_tipo_moneda` int NOT NULL,
  `id_tipo_estado_cuenta` int NOT NULL,
  `Monto` int,
  `fecha_creacion` datetime,
  `CBU` varchar(75),
  `Alias` varchar(150),
  `password` varchar(250),
  `Credito` boolean,
  `Debito` boolean,
  -- FOREIGN KEY (`id_cliente`) REFERENCES `Clientes`(`id_cliente`),
  -- FOREIGN KEY (`id_tipo_cuenta`) REFERENCES `Tipos_cuentas`(`id_tipo_cuenta`),
  -- FOREIGN KEY (`id_tipo_moneda`) REFERENCES `Tipo_moneda`(`id_tipo_moneda`),
  FOREIGN KEY (`id_tipo_estado_cuenta`) REFERENCES `Tipo_estado_cuenta`(`id_tipo_estado_cuenta`),
  KEY `pk` (`id_cuenta`),
  -- KEY `fk` (`id_cliente`, `id_tipo_cuenta`, `id_tipo_moneda`, `id_tipo_estado_cuenta`)
  KEY `fk` (`id_tipo_estado_cuenta`)
);

-- Maria Laura
-- CREATE TABLE `Cuenta` (
--   `id_cuenta` int NOT NULL AUTO_INCREMENT,
--   `id_cliente` int NOT NULL,
--   `id_tipo_cuenta` int NOT NULL,
--   `id_tipo_moneda` int NOT NULL,
--   `id_tipo_estado_cuenta` int NOT NULL,
--   `Monto` int,
--   `fecha_creacion` datetime,
--   `CBU` varchar(75),
--   `Alias` varchar(150),
--   `password` varchar(250),
--   `Credito` boolean,
--   `Debito` boolean,
--   KEY `pk` (`id_cuenta`),
--   KEY `fk` (`id_cliente`)
-- );

-- Maria Laura
CREATE TABLE `Cuenta_Transferencia` (
  `cod_cuenta_transferencia` int NOT NULL AUTO_INCREMENT,
  `id_cuenta` int NOT NULL,
  `id_transferencia` int NOT NULL,
  FOREIGN KEY (`id_transferencia`) REFERENCES `Transferencias`(`id_transferencia`),
  FOREIGN KEY (`id_cuenta`) REFERENCES `Cuenta`(`id_cuenta`),
  KEY `pk` (`cod_cuenta_transferencia`),
  KEY `fk` (`id_cuenta`, `id_transferencia`)
);

-- Maxi
CREATE TABLE `Tipos_contactos` (
  `id_tipo_contacto` int NOT NULL AUTO_INCREMENT,
  `tipo_contacto` varchar(150),
  KEY `pk` (`id_tipo_contacto`)
);

-- Eze tipo empleado
CREATE TABLE `Tipo_empleado` (
  `id_tipo_empleado` int NOT NULL AUTO_INCREMENT,
  `tipo_empleado` varchar(150),
  KEY `pk` (`id_tipo_empleado`)
);

-- Eze tipo estado empleado
CREATE TABLE `Tipo_estado_empleado` (
  `id_tipo_estado_empleado` int NOT NULL AUTO_INCREMENT,
  `tipo_estado_empleado` varchar(150),
  KEY `pk` (`id_tipo_estado_empleado`)
);

-- Sole
CREATE TABLE `Empleados` (
  `id_empleado` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(120),
  `apellido` varchar(120),
  `id_tipo_doc` int NOT NULL,
  `nro_doc` varchar(20), -- Varchar x si hay gente de algun otro pais donde la identificacion tiene numeros. 20 maximo x si se pone puntos o etc.
  `cod_localidad` int NOT NULL,
  `nro_calle` int NOT NULL,
  `calle` varchar(150),
  `fecha_nac` datetime,
  `id_tipo_sexo` int NOT NULL,
  `id_tipo_empleado` int NOT NULL,
  `id_tipo_estado_empleado` int NOT NULL,
  `fecha_ingreso` datetime,
  `sueldo` DECIMAL(10,2),
  FOREIGN KEY (`id_tipo_sexo`) REFERENCES `Sexos`(`id_tipo_sexo`),
  FOREIGN KEY (`id_tipo_doc`) REFERENCES `Documentos`(`id_tipo_doc`),
  FOREIGN KEY (`cod_localidad`) REFERENCES `localidades`(`cod_localidad`),
  FOREIGN KEY (`id_tipo_empleado`) REFERENCES `Tipo_empleado`(`id_tipo_empleado`),
  FOREIGN KEY (`id_tipo_estado_empleado`) REFERENCES `Tipo_estado_empleado`(`id_tipo_estado_empleado`),
  KEY `pk` (`id_empleado`),
  KEY `fk` (`id_tipo_sexo`, `id_tipo_doc`, `cod_localidad`, `id_tipo_empleado`, `id_tipo_estado_empleado`)
);

-- Sole
CREATE TABLE `Contactos` (
  `id_contactos` int NOT NULL AUTO_INCREMENT,
  `id_tipo_contacto` int NOT NULL,
  `id_cliente` int,
  `id_empleado` int,
  `contactos` varchar(150),
  FOREIGN KEY (`id_cliente`) REFERENCES `Clientes`(`id_cliente`),
  FOREIGN KEY (`id_empleado`) REFERENCES `Empleados`(`id_empleado`),
  FOREIGN KEY (`id_tipo_contacto`) REFERENCES `Tipos_contactos`(`id_tipo_contacto`),
  KEY `pk` (`id_contactos`),
  KEY `fk` (`id_tipo_contacto`, `id_cliente`, `id_empleado`)
);

-- Eze
CREATE TABLE `Tipo_prestamo` (
  `id_tipo_prestamo` int NOT NULL AUTO_INCREMENT,
  `tipo_prestamo` varchar(150),
  KEY `pk` (`id_tipo_prestamo`)
);

-- Eze
CREATE TABLE `Tipo_estado_prestamo` (
  `id_tipo_estado_prestamo` int NOT NULL AUTO_INCREMENT,
  `tipo_estado_prestamo` varchar(150),
  KEY `pk` (`id_tipo_estado_prestamo`)
);

-- Eze
CREATE TABLE `Tipo_cuota` (
  `id_tipo_cuota` int NOT NULL AUTO_INCREMENT,
  `tipo_cuota` varchar(150),
  KEY `pk` (`id_tipo_cuota`)
);

-- Eze
CREATE TABLE `Tipo_estado_cuota` (
  `id_tipo_estado_cuota` int NOT NULL AUTO_INCREMENT,
  `tipo_estado_cuota` varchar(150),
  KEY `pk` (`id_tipo_estado_cuota`)
);

-- Eze
CREATE TABLE `Tipo_interes` (
  `id_tipo_interes` int NOT NULL AUTO_INCREMENT,
  `tipo_interes` varchar(150),
  KEY `pk` (`id_tipo_interes`)
);

-- Eze
CREATE TABLE `Cantidad_cuotas` (
  `id_cantidad_cuotas` int NOT NULL AUTO_INCREMENT,
  `cantidad_cuotas` int,
  KEY `pk` (`id_cantidad_cuotas`)
);

-- Eze
CREATE TABLE `Prestamos` (
  `id_prestamo` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int NOT NULL,
  `id_tipo_moneda` int NOT NULL,
  `id_tipo_prestamo` int NOT NULL,
  `id_tipo_estado_prestamo` int NOT NULL,
  `id_tipo_cuota` int NOT NULL,
  `id_tipo_interes` int NOT NULL,
  `id_cantidad_cuotas` int NOT NULL,
  `monto` int,
  `fecha_creacion` datetime,
  `fecha_vencimiento` datetime,
  `fecha_pago` datetime,
  `fecha_cancelacion` datetime,
  `fecha_ultimo_pago` datetime,
  `monto_cuota` int,
  `monto_interes` int,
  `monto_total` int,
  `monto_ultimo_pago` int,
  `monto_cancelado` int,
  `monto_pendiente` int,
  FOREIGN KEY (`id_cliente`) REFERENCES `Clientes`(`id_cliente`),
  FOREIGN KEY (`id_tipo_moneda`) REFERENCES `Tipo_moneda`(`id_tipo_moneda`),
  FOREIGN KEY (`id_tipo_prestamo`) REFERENCES `Tipo_prestamo`(`id_tipo_prestamo`),
  FOREIGN KEY (`id_tipo_estado_prestamo`) REFERENCES `Tipo_estado_prestamo`(`id_tipo_estado_prestamo`),
  FOREIGN KEY (`id_tipo_cuota`) REFERENCES `Tipo_cuota`(`id_tipo_cuota`),
  FOREIGN KEY (`id_tipo_interes`) REFERENCES `Tipo_interes`(`id_tipo_interes`),
  FOREIGN KEY (`id_cantidad_cuotas`) REFERENCES `Cantidad_cuotas`(`id_cantidad_cuotas`),
  KEY `pk` (`id_prestamo`),
  KEY `fk` (`id_cliente`, `id_tipo_prestamo`, `id_tipo_estado_prestamo`, `id_tipo_cuota`, `id_tipo_interes`, `id_cantidad_cuotas`)
);

-- Eze
CREATE TABLE `Cuotas` (
  `id_cuota` int NOT NULL AUTO_INCREMENT,
  `nro_cuota` int,
  `id_prestamo` int NOT NULL,
  `id_tipo_cuota` int NOT NULL,
  `id_tipo_estado_cuota` int NOT NULL,
  `fecha_vencimiento` datetime,
  `fecha_pago` datetime,
  `monto` int,
  FOREIGN KEY (`id_prestamo`) REFERENCES `Prestamos`(`id_prestamo`),
  FOREIGN KEY (`id_tipo_cuota`) REFERENCES `Tipo_cuota`(`id_tipo_cuota`),
  FOREIGN KEY (`id_tipo_estado_cuota`) REFERENCES `Tipo_estado_cuota`(`id_tipo_estado_cuota`),
  KEY `pk` (`id_cuota`),
  KEY `fk` (`id_prestamo`, `id_tipo_cuota`, `id_tipo_estado_cuota`)
);

-- -- Flor 
-- CREATE TABLE `Prestamos` (
--   `id_prestamo` int NOT NULL AUTO_INCREMENT,
--   `id_cuenta` int NOT NULL,
--   `monto` int,
--   `interes_mes_porcentaje` int,
--   `fec_start` datetime,
--   `fec_venc` datetime,
--   FOREIGN KEY (`id_cuenta`) REFERENCES `Cuenta`(`id_cuenta`),
--   KEY `pk` (`id_prestamo`),
--   KEY `fk` (`id_cuenta`)
-- );

-- Eze
CREATE TABLE `Tipo_tarjeta` (
  `id_tipo_tarjeta` int NOT NULL AUTO_INCREMENT,
  `tipo_tarjeta` varchar(150),
  KEY `pk` (`id_tipo_tarjeta`)
);

-- Eze
CREATE TABLE `Tipo_estado_tarjeta` (
  `id_tipo_estado_tarjeta` int NOT NULL AUTO_INCREMENT,
  `tipo_estado_tarjeta` varchar(150),
  KEY `pk` (`id_tipo_estado_tarjeta`)
);

-- Eze
CREATE TABLE `Tarjeta`(
  `id_tarjeta` int NOT NULL AUTO_INCREMENT,
  `id_cuenta` int NOT NULL,
  `id_tipo_tarjeta` int NOT NULL,
  `id_tipo_estado_tarjeta` int NOT NULL,
  `fecha_vencimiento` datetime,
  `numero_tarjeta` varchar(150),
  `codigo_seguridad` varchar(150),
  FOREIGN KEY (`id_cuenta`) REFERENCES `Cuenta`(`id_cuenta`),
  FOREIGN KEY (`id_tipo_tarjeta`) REFERENCES `Tipo_tarjeta`(`id_tipo_tarjeta`),
  FOREIGN KEY (`id_tipo_estado_tarjeta`) REFERENCES `Tipo_estado_tarjeta`(`id_tipo_estado_tarjeta`),
  KEY `pk` (`id_tarjeta`),
  KEY `fk` (`id_cuenta`, `id_tipo_tarjeta`, `id_tipo_estado_tarjeta`)
);

-- Eze
CREATE TABLE `Cuenta-TipoCuenta`(
  `cod_ctc` int NOT NULL AUTO_INCREMENT,
  `id_cuenta` int NOT NULL,
  `id_tipo_cuenta` int NOT NULL,
  FOREIGN KEY (`id_cuenta`) REFERENCES `Cuenta`(`id_cuenta`),
  FOREIGN KEY (`id_tipo_cuenta`) REFERENCES `Tipos_cuentas`(`id_tipo_cuenta`),
  KEY `pk` (`cod_ctc`),
  KEY `fk` (`id_cuenta`, `id_tipo_cuenta`)
);

-- Eze
CREATE TABLE `Cuenta-TipoMoneda`(
  `cod_ctm` int NOT NULL AUTO_INCREMENT,
  `id_cuenta` int NOT NULL,
  `id_tipo_moneda` int NOT NULL,
  FOREIGN KEY (`id_cuenta`) REFERENCES `Cuenta`(`id_cuenta`),
  FOREIGN KEY (`id_tipo_moneda`) REFERENCES `Tipo_moneda`(`id_tipo_moneda`),
  KEY `pk` (`cod_ctm`),
  KEY `fk` (`id_cuenta`, `id_tipo_moneda`)
);

-- Eze
-- CREATE TABLE `Cuenta-TipoEstadoCuenta`(
--   `id_cuenta` int NOT NULL,
--   `id_tipo_estado_cuenta` int NOT NULL,
--   FOREIGN KEY (`id_cuenta`) REFERENCES `Cuenta`(`id_cuenta`),
--   FOREIGN KEY (`id_tipo_estado_cuenta`) REFERENCES `Tipo_estado_cuenta`(`id_tipo_estado_cuenta`),
--   KEY `pk` (`id_cuenta`, `id_tipo_estado_cuenta`)
-- )

-- Eze
CREATE TABLE `Cliente-Cuenta`(
  `cod_cc` int NOT NULL AUTO_INCREMENT,
  `id_cuenta` int NOT NULL,
  `id_cliente` int NOT NULL,
  FOREIGN KEY (`id_cuenta`) REFERENCES `Cuenta`(`id_cuenta`),
  FOREIGN KEY (`id_cliente`) REFERENCES `Clientes`(`id_cliente`),
  KEY `pk` (`cod_cc`),
  KEY `fk` (`id_cuenta`, `id_cliente`)
);

-- Eze
CREATE TABLE `Plazo_fijo`(
  `id_plazo_fijo` int NOT NULL AUTO_INCREMENT,
  `id_cuenta` int NOT NULL,
  `id_tipo_moneda` int NOT NULL,
  -- `id_tipo_estado_cuenta` int NOT NULL,
  `monto` int,
  `interes` float,
  `fecha_creacion` datetime,
  `fecha_vencimiento` datetime,
  FOREIGN KEY (`id_cuenta`) REFERENCES `Cuenta`(`id_cuenta`),
  FOREIGN KEY (`id_tipo_moneda`) REFERENCES `Tipo_moneda`(`id_tipo_moneda`),
  -- FOREIGN KEY (`id_tipo_estado_cuenta`) REFERENCES `Tipo_estado_cuenta`(`id_tipo_estado_cuenta`),
  KEY `pk` (`id_plazo_fijo`),
  KEY `fk` (`id_cuenta`, `id_tipo_moneda`)
);





-- Insertar Paises

insert into paises (pais) values ('Argentina');
insert into paises (pais) values ('Brasil');
insert into paises (pais) values ('Chile');
insert into paises (pais) values ('Uruguay');
insert into paises (pais) values ('Paraguay');
insert into paises (pais) values ('Bolivia');
insert into paises (pais) values ('Peru');
insert into paises (pais) values ('Ecuador');
insert into paises (pais) values ('Colombia');
insert into paises (pais) values ('Venezuela');
insert into paises (pais) values ('Panama');
insert into paises (pais) values ('Costa Rica');
insert into paises (pais) values ('El Salvador');
insert into paises (pais) values ('Guatemala');
insert into paises (pais) values ('Honduras');
insert into paises (pais) values ('Nicaragua');
insert into paises (pais) values ('Mexico');
insert into paises (pais) values ('Estados Unidos'); -- ID: 18
insert into paises (pais) values ('Canada');
insert into paises (pais) values ('España');
insert into paises (pais) values ('Francia');
insert into paises (pais) values ('Italia');
insert into paises (pais) values ('Alemania');
insert into paises (pais) values ('Inglaterra');
insert into paises (pais) values ('Portugal');
insert into paises (pais) values ('Rusia');
insert into paises (pais) values ('China');
insert into paises (pais) values ('Japon');
insert into paises (pais) values ('Corea del Sur');
insert into paises (pais) values ('Australia');
insert into paises (pais) values ('Nueva Zelanda');
insert into paises (pais) values ('Sudafrica');
insert into paises (pais) values ('Otro'); -- ID: 33

select * from paises;

-- Insertar Provincias

-- Arg
insert into provincias (provincia, cod_pais) values ('Buenos Aires', 1);
insert into provincias (provincia, cod_pais) values ('Catamarca', 1);
insert into provincias (provincia, cod_pais) values ('Chaco', 1);
insert into provincias (provincia, cod_pais) values ('Chubut', 1);
insert into provincias (provincia, cod_pais) values ('Cordoba', 1);
insert into provincias (provincia, cod_pais) values ('Corrientes', 1);
insert into provincias (provincia, cod_pais) values ('Entre Rios', 1);
insert into provincias (provincia, cod_pais) values ('Formosa', 1);
insert into provincias (provincia, cod_pais) values ('Jujuy', 1);
insert into provincias (provincia, cod_pais) values ('La Pampa', 1);
insert into provincias (provincia, cod_pais) values ('La Rioja', 1);
insert into provincias (provincia, cod_pais) values ('Mendoza', 1);
insert into provincias (provincia, cod_pais) values ('Misiones', 1);
insert into provincias (provincia, cod_pais) values ('Neuquen', 1);
insert into provincias (provincia, cod_pais) values ('Rio Negro', 1);
insert into provincias (provincia, cod_pais) values ('Salta', 1);
insert into provincias (provincia, cod_pais) values ('San Juan', 1);
insert into provincias (provincia, cod_pais) values ('San Luis', 1);
insert into provincias (provincia, cod_pais) values ('Santa Cruz', 1);
insert into provincias (provincia, cod_pais) values ('Santa Fe', 1);
insert into provincias (provincia, cod_pais) values ('Santiago del Estero', 1);
insert into provincias (provincia, cod_pais) values ('Tierra del Fuego', 1);
insert into provincias (provincia, cod_pais) values ('Tucuman', 1); -- ID: 23

Select * from provincias where cod_pais = 1;

-- Brasil
insert into provincias (provincia, cod_pais) values ('Acre', 2);
insert into provincias (provincia, cod_pais) values ('Alagoas', 2);
insert into provincias (provincia, cod_pais) values ('Amapa', 2);
insert into provincias (provincia, cod_pais) values ('Amazonas', 2);
insert into provincias (provincia, cod_pais) values ('Bahia', 2);
insert into provincias (provincia, cod_pais) values ('Ceara', 2);
insert into provincias (provincia, cod_pais) values ('Distrito Federal', 2);
insert into provincias (provincia, cod_pais) values ('Espirito Santo', 2);
insert into provincias (provincia, cod_pais) values ('Goias', 2);
insert into provincias (provincia, cod_pais) values ('Maranhao', 2);
insert into provincias (provincia, cod_pais) values ('Mato Grosso', 2);
insert into provincias (provincia, cod_pais) values ('Mato Grosso do Sul', 2);
insert into provincias (provincia, cod_pais) values ('Minas Gerais', 2);
insert into provincias (provincia, cod_pais) values ('Para', 2);
insert into provincias (provincia, cod_pais) values ('Paraiba', 2);
insert into provincias (provincia, cod_pais) values ('Parana', 2);
insert into provincias (provincia, cod_pais) values ('Pernambuco', 2);
insert into provincias (provincia, cod_pais) values ('Piaui', 2);
insert into provincias (provincia, cod_pais) values ('Rio de Janeiro', 2);
insert into provincias (provincia, cod_pais) values ('Rio Grande do Norte', 2);
insert into provincias (provincia, cod_pais) values ('Rio Grande do Sul', 2);
insert into provincias (provincia, cod_pais) values ('Rondonia', 2);
insert into provincias (provincia, cod_pais) values ('Roraima', 2);
insert into provincias (provincia, cod_pais) values ('Santa Catarina', 2);
insert into provincias (provincia, cod_pais) values ('Sao Paulo', 2);
insert into provincias (provincia, cod_pais) values ('Sergipe', 2);
insert into provincias (provincia, cod_pais) values ('Tocantins', 2); -- ID: 50

Select * from provincias where cod_pais = 2;

-- Chile
insert into provincias (provincia, cod_pais) values ('Arica y Parinacota', 3);
insert into provincias (provincia, cod_pais) values ('Tarapaca', 3);
insert into provincias (provincia, cod_pais) values ('Antofagasta', 3);
insert into provincias (provincia, cod_pais) values ('Atacama', 3);
insert into provincias (provincia, cod_pais) values ('Coquimbo', 3);
insert into provincias (provincia, cod_pais) values ('Valparaiso', 3);
insert into provincias (provincia, cod_pais) values ('Metropolitana de Santiago', 3);
insert into provincias (provincia, cod_pais) values ('Libertador General Bernardo O''Higgins', 3);
insert into provincias (provincia, cod_pais) values ('Maule', 3);
insert into provincias (provincia, cod_pais) values ('Biobio', 3);
insert into provincias (provincia, cod_pais) values ('La Araucania', 3);
insert into provincias (provincia, cod_pais) values ('Los Rios', 3);
insert into provincias (provincia, cod_pais) values ('Los Lagos', 3);
insert into provincias (provincia, cod_pais) values ('Aysen del General Carlos Ibanez del Campo', 3);
insert into provincias (provincia, cod_pais) values ('Magallanes y de la Antartica Chilena', 3); -- ID: 65

-- Uruguay
insert into provincias (provincia, cod_pais) values ('Artigas', 4);
insert into provincias (provincia, cod_pais) values ('Canelones', 4);
insert into provincias (provincia, cod_pais) values ('Cerro Largo', 4);
insert into provincias (provincia, cod_pais) values ('Colonia', 4);
insert into provincias (provincia, cod_pais) values ('Durazno', 4);
insert into provincias (provincia, cod_pais) values ('Flores', 4);
insert into provincias (provincia, cod_pais) values ('Florida', 4);
insert into provincias (provincia, cod_pais) values ('Lavalleja', 4);
insert into provincias (provincia, cod_pais) values ('Maldonado', 4);
insert into provincias (provincia, cod_pais) values ('Montevideo', 4);
insert into provincias (provincia, cod_pais) values ('Paysandu', 4); -- ID: 76

-- Paraguay
insert into provincias (provincia, cod_pais) values ('Alto Parana', 5);
insert into provincias (provincia, cod_pais) values ('Alto Paraguay', 5);
insert into provincias (provincia, cod_pais) values ('Amambay', 5);
insert into provincias (provincia, cod_pais) values ('Asuncion', 5);
insert into provincias (provincia, cod_pais) values ('Boqueron', 5);
insert into provincias (provincia, cod_pais) values ('Caaguazu', 5);
insert into provincias (provincia, cod_pais) values ('Caazapa', 5);
insert into provincias (provincia, cod_pais) values ('Canindeyu', 5);
insert into provincias (provincia, cod_pais) values ('Central', 5);
insert into provincias (provincia, cod_pais) values ('Concepcion', 5);
insert into provincias (provincia, cod_pais) values ('Cordillera', 5);
insert into provincias (provincia, cod_pais) values ('Guaira', 5);
insert into provincias (provincia, cod_pais) values ('Itapua', 5);
insert into provincias (provincia, cod_pais) values ('Misiones', 5);
insert into provincias (provincia, cod_pais) values ('Neembucu', 5);
insert into provincias (provincia, cod_pais) values ('Paraguari', 5);
insert into provincias (provincia, cod_pais) values ('Presidente Hayes', 5);
insert into provincias (provincia, cod_pais) values ('San Pedro', 5); -- ID: 94

-- Bolivia
insert into provincias (provincia, cod_pais) values ('Chuquisaca', 6);
insert into provincias (provincia, cod_pais) values ('Cochabamba', 6);
insert into provincias (provincia, cod_pais) values ('El Beni', 6);
insert into provincias (provincia, cod_pais) values ('La Paz', 6);
insert into provincias (provincia, cod_pais) values ('Oruro', 6);
insert into provincias (provincia, cod_pais) values ('Pando', 6);
insert into provincias (provincia, cod_pais) values ('Potosi', 6);
insert into provincias (provincia, cod_pais) values ('Santa Cruz', 6);
insert into provincias (provincia, cod_pais) values ('Tarija', 6); -- ID: 102

-- Peru
insert into provincias (provincia, cod_pais) values ('Amazonas', 7);
insert into provincias (provincia, cod_pais) values ('Ancash', 7);
insert into provincias (provincia, cod_pais) values ('Apurimac', 7);
insert into provincias (provincia, cod_pais) values ('Arequipa', 7);
insert into provincias (provincia, cod_pais) values ('Ayacucho', 7);
insert into provincias (provincia, cod_pais) values ('Cajamarca', 7);
insert into provincias (provincia, cod_pais) values ('Callao', 7);
insert into provincias (provincia, cod_pais) values ('Cusco', 7);
insert into provincias (provincia, cod_pais) values ('Huancavelica', 7);
insert into provincias (provincia, cod_pais) values ('Huanuco', 7);
insert into provincias (provincia, cod_pais) values ('Ica', 7);
insert into provincias (provincia, cod_pais) values ('Junin', 7);
insert into provincias (provincia, cod_pais) values ('La Libertad', 7);
insert into provincias (provincia, cod_pais) values ('Lambayeque', 7);
insert into provincias (provincia, cod_pais) values ('Lima', 7);
insert into provincias (provincia, cod_pais) values ('Loreto', 7);
insert into provincias (provincia, cod_pais) values ('Madre de Dios', 7);
insert into provincias (provincia, cod_pais) values ('Moquegua', 7);
insert into provincias (provincia, cod_pais) values ('Pasco', 7);
insert into provincias (provincia, cod_pais) values ('Piura', 7);
insert into provincias (provincia, cod_pais) values ('Puno', 7);
insert into provincias (provincia, cod_pais) values ('San Martin', 7);
insert into provincias (provincia, cod_pais) values ('Tacna', 7);
insert into provincias (provincia, cod_pais) values ('Tumbes', 7);
insert into provincias (provincia, cod_pais) values ('Ucayali', 7); -- ID: 126

-- Ecuador
insert into provincias (provincia, cod_pais) values ('Azuay', 8);
insert into provincias (provincia, cod_pais) values ('Bolivar', 8);
insert into provincias (provincia, cod_pais) values ('Quito', 8);
insert into provincias (provincia, cod_pais) values ('Carchi', 8); -- ID: 130

-- Colombia
insert into provincias (provincia, cod_pais) values ('Amazonas', 9);
insert into provincias (provincia, cod_pais) values ('Antioquia', 9);
insert into provincias (provincia, cod_pais) values ('Arauca', 9);
insert into provincias (provincia, cod_pais) values ('Atlantico', 9);
insert into provincias (provincia, cod_pais) values ('Bogota', 9);
insert into provincias (provincia, cod_pais) values ('Bolivar', 9); -- ID: 136

-- Venezuela
insert into provincias (provincia, cod_pais) values ('Caracas', 10);
insert into provincias (provincia, cod_pais) values ('Miranda', 10);
insert into provincias (provincia, cod_pais) values ('Distrito Capital', 10); -- ID: 139

-- Estados Unidos
insert into provincias (provincia, cod_pais) values ('Alabama', 18); -- ID: 140
insert into provincias (provincia, cod_pais) values ('Alaska', 18);
insert into provincias (provincia, cod_pais) values ('Arizona', 18);
insert into provincias (provincia, cod_pais) values ('Arkansas', 18);
insert into provincias (provincia, cod_pais) values ('California', 18);
insert into provincias (provincia, cod_pais) values ('Colorado', 18);
insert into provincias (provincia, cod_pais) values ('Connecticut', 18);
insert into provincias (provincia, cod_pais) values ('Delaware', 18);
insert into provincias (provincia, cod_pais) values ('Florida', 18);
insert into provincias (provincia, cod_pais) values ('Georgia', 18);
insert into provincias (provincia, cod_pais) values ('Hawaii', 18);
insert into provincias (provincia, cod_pais) values ('Idaho', 18);
insert into provincias (provincia, cod_pais) values ('Illinois', 18);
insert into provincias (provincia, cod_pais) values ('Indiana', 18);
insert into provincias (provincia, cod_pais) values ('Iowa', 18);
insert into provincias (provincia, cod_pais) values ('Kansas', 18);
insert into provincias (provincia, cod_pais) values ('Kentucky', 18);
insert into provincias (provincia, cod_pais) values ('Louisiana', 18);
insert into provincias (provincia, cod_pais) values ('Maine', 18);
insert into provincias (provincia, cod_pais) values ('Maryland', 18);
insert into provincias (provincia, cod_pais) values ('Massachusetts', 18);
insert into provincias (provincia, cod_pais) values ('Michigan', 18);
insert into provincias (provincia, cod_pais) values ('Minnesota', 18);
insert into provincias (provincia, cod_pais) values ('Mississippi', 18);
insert into provincias (provincia, cod_pais) values ('Missouri', 18);
insert into provincias (provincia, cod_pais) values ('Montana', 18);
insert into provincias (provincia, cod_pais) values ('Nebraska', 18);
insert into provincias (provincia, cod_pais) values ('Nevada', 18);
insert into provincias (provincia, cod_pais) values ('New Hampshire', 18);
insert into provincias (provincia, cod_pais) values ('New Jersey', 18);
insert into provincias (provincia, cod_pais) values ('New Mexico', 18);
insert into provincias (provincia, cod_pais) values ('New York', 18);
insert into provincias (provincia, cod_pais) values ('North Carolina', 18);
insert into provincias (provincia, cod_pais) values ('North Dakota', 18);
insert into provincias (provincia, cod_pais) values ('Ohio', 18);
insert into provincias (provincia, cod_pais) values ('Oklahoma', 18);
insert into provincias (provincia, cod_pais) values ('Oregon', 18);
insert into provincias (provincia, cod_pais) values ('Pennsylvania', 18);
insert into provincias (provincia, cod_pais) values ('Rhode Island', 18);
insert into provincias (provincia, cod_pais) values ('South Carolina', 18);
insert into provincias (provincia, cod_pais) values ('South Dakota', 18);
insert into provincias (provincia, cod_pais) values ('Tennessee', 18);
insert into provincias (provincia, cod_pais) values ('Texas', 18);
insert into provincias (provincia, cod_pais) values ('Utah', 18);
insert into provincias (provincia, cod_pais) values ('Vermont', 18);
insert into provincias (provincia, cod_pais) values ('Virginia', 18);
insert into provincias (provincia, cod_pais) values ('Washington', 18);
insert into provincias (provincia, cod_pais) values ('West Virginia', 18);
insert into provincias (provincia, cod_pais) values ('Wisconsin', 18);
insert into provincias (provincia, cod_pais) values ('Wyoming', 18); -- ID: 190

-- Canada
insert into provincias (provincia, cod_pais) values ('Alberta', 19);
insert into provincias (provincia, cod_pais) values ('British Columbia', 19);
insert into provincias (provincia, cod_pais) values ('Newfoundland', 19);
insert into provincias (provincia, cod_pais) values ('New Brunswick', 19);
insert into provincias (provincia, cod_pais) values ('Nova Scotia', 19);
insert into provincias (provincia, cod_pais) values ('Ontario', 19);
insert into provincias (provincia, cod_pais) values ('Prince Edward Island', 19);
insert into provincias (provincia, cod_pais) values ('Quebec', 19);
insert into provincias (provincia, cod_pais) values ('Saskatchewan', 19); -- ID: 199

-- Mexico
insert into provincias (provincia, cod_pais) values ('Aguascalientes', 20); -- ID: 200
insert into provincias (provincia, cod_pais) values ('Baja California', 20);
insert into provincias (provincia, cod_pais) values ('Baja California Sur', 20);
insert into provincias (provincia, cod_pais) values ('Campeche', 20);
insert into provincias (provincia, cod_pais) values ('Chiapas', 20);
insert into provincias (provincia, cod_pais) values ('Chihuahua', 20);
insert into provincias (provincia, cod_pais) values ('Coahuila', 20);
insert into provincias (provincia, cod_pais) values ('Colima', 20);
insert into provincias (provincia, cod_pais) values ('Distrito Federal', 20);
insert into provincias (provincia, cod_pais) values ('Durango', 20);
insert into provincias (provincia, cod_pais) values ('Guanajuato', 20);
insert into provincias (provincia, cod_pais) values ('Guerrero', 20);
insert into provincias (provincia, cod_pais) values ('Hidalgo', 20);
insert into provincias (provincia, cod_pais) values ('Jalisco', 20);
insert into provincias (provincia, cod_pais) values ('Mexico', 20);
insert into provincias (provincia, cod_pais) values ('Michoacan', 20);
insert into provincias (provincia, cod_pais) values ('Morelos', 20);
insert into provincias (provincia, cod_pais) values ('Nayarit', 20);
insert into provincias (provincia, cod_pais) values ('Nuevo Leon', 20);
insert into provincias (provincia, cod_pais) values ('Oaxaca', 20);
insert into provincias (provincia, cod_pais) values ('Puebla', 20);
insert into provincias (provincia, cod_pais) values ('Queretaro', 20);
insert into provincias (provincia, cod_pais) values ('Quintana Roo', 20);
insert into provincias (provincia, cod_pais) values ('San Luis Potosi', 20);
insert into provincias (provincia, cod_pais) values ('Sinaloa', 20);
insert into provincias (provincia, cod_pais) values ('Sonora', 20);
insert into provincias (provincia, cod_pais) values ('Tabasco', 20);
insert into provincias (provincia, cod_pais) values ('Tamaulipas', 20);
insert into provincias (provincia, cod_pais) values ('Tlaxcala', 20);
insert into provincias (provincia, cod_pais) values ('Veracruz', 20);
insert into provincias (provincia, cod_pais) values ('Yucatan', 20);
insert into provincias (provincia, cod_pais) values ('Zacatecas', 20); -- ID: 228

-- Otro
insert into provincias (provincia, cod_pais) values ('Otro', 21);
insert into provincias (provincia, cod_pais) values ('Otro', 22);
insert into provincias (provincia, cod_pais) values ('Otro', 23);
insert into provincias (provincia, cod_pais) values ('Otro', 24);
insert into provincias (provincia, cod_pais) values ('Otro', 25);
insert into provincias (provincia, cod_pais) values ('Otro', 26);
insert into provincias (provincia, cod_pais) values ('Otro', 27);
insert into provincias (provincia, cod_pais) values ('Otro', 28);
insert into provincias (provincia, cod_pais) values ('Otro', 29);
insert into provincias (provincia, cod_pais) values ('Otro', 30);
insert into provincias (provincia, cod_pais) values ('Otro', 31);
insert into provincias (provincia, cod_pais) values ('Otro', 32); -- ID: 239

-- Localidades Top 5

-- Argentina
-- Buenos Aires
insert into localidades (localidad, cod_provincia) values ('Buenos Aires', 1);
insert into localidades (localidad, cod_provincia) values ('La Plata', 1);
insert into localidades (localidad, cod_provincia) values ('Mar del Plata', 1);
insert into localidades (localidad, cod_provincia) values ('Quilmes', 1);
insert into localidades (localidad, cod_provincia) values ('Lomas de Zamora', 1); -- ID: 5
-- Catamarca
insert into localidades (localidad, cod_provincia) values ('San Fernando del Valle de Catamarca', 2);
-- Chaco
insert into localidades (localidad, cod_provincia) values ('Resistencia', 3);
-- Chubut
insert into localidades (localidad, cod_provincia) values ('Rawson', 4);
-- Córdoba
insert into localidades (localidad, cod_provincia) values ('Córdoba', 5);
insert into localidades (localidad, cod_provincia) values ('Río Cuarto', 5);
insert into localidades (localidad, cod_provincia) values ('Villa María', 5);
insert into localidades (localidad, cod_provincia) values ('Villa Carlos Paz', 5);
insert into localidades (localidad, cod_provincia) values ('Río Tercero', 5); -- ID: 13
-- Corrientes
insert into localidades (localidad, cod_provincia) values ('Corrientes', 6);
-- Entre Ríos
insert into localidades (localidad, cod_provincia) values ('Paraná', 7);
-- Formosa
insert into localidades (localidad, cod_provincia) values ('Formosa', 8);
-- Jujuy
insert into localidades (localidad, cod_provincia) values ('San Salvador de Jujuy', 9);
-- La Pampa
insert into localidades (localidad, cod_provincia) values ('Santa Rosa', 10);
-- La Rioja
insert into localidades (localidad, cod_provincia) values ('La Rioja', 11);
-- Mendoza
insert into localidades (localidad, cod_provincia) values ('Mendoza', 12);
insert into localidades (localidad, cod_provincia) values ('Godoy Cruz', 12);
insert into localidades (localidad, cod_provincia) values ('Guaymallén', 12);
insert into localidades (localidad, cod_provincia) values ('Luján de Cuyo', 12);
insert into localidades (localidad, cod_provincia) values ('San Rafael', 12); -- ID: 24
-- Misiones
insert into localidades (localidad, cod_provincia) values ('Posadas', 13);
-- Neuquén
insert into localidades (localidad, cod_provincia) values ('Neuquén', 14);
-- Rio Negro
insert into localidades (localidad, cod_provincia) values ('Viedma', 15);
-- Salta
insert into localidades (localidad, cod_provincia) values ('Salta', 16);
-- San Juan
insert into localidades (localidad, cod_provincia) values ('San Juan', 17);
-- San Luis
insert into localidades (localidad, cod_provincia) values ('San Luis', 18);
-- Santa Cruz
insert into localidades (localidad, cod_provincia) values ('Río Gallegos', 19);
-- Santa Fe
insert into localidades (localidad, cod_provincia) values ('Santa Fe', 20);
insert into localidades (localidad, cod_provincia) values ('Rosario', 20);
insert into localidades (localidad, cod_provincia) values ('Venado Tuerto', 20);
insert into localidades (localidad, cod_provincia) values ('San Lorenzo', 20);
insert into localidades (localidad, cod_provincia) values ('San Cristóbal', 20); -- ID: 36
-- Santiago del Estero
insert into localidades (localidad, cod_provincia) values ('Santiago del Estero', 21);
-- Tierra del Fuego
insert into localidades (localidad, cod_provincia) values ('Ushuaia', 22);
-- Tucumán
insert into localidades (localidad, cod_provincia) values ('San Miguel de Tucumán', 23);

-- Brasil
-- Acre
insert into localidades (localidad, cod_provincia) values ('Rio Branco', 24);
-- Alagoas
insert into localidades (localidad, cod_provincia) values ('Maceió', 25);
-- Amapá
insert into localidades (localidad, cod_provincia) values ('Macapá', 26);
-- Amazonas
insert into localidades (localidad, cod_provincia) values ('Amazonas', 27);
-- Bahia
insert into localidades (localidad, cod_provincia) values ('Salvador', 28);
insert into localidades (localidad, cod_provincia) values ('Feira de Santana', 28);
insert into localidades (localidad, cod_provincia) values ('Vitória da Conquista', 28);
insert into localidades (localidad, cod_provincia) values ('Camaçari', 28);
insert into localidades (localidad, cod_provincia) values ('Ilhéus', 28); -- ID: 48
-- Ceará
insert into localidades (localidad, cod_provincia) values ('Fortaleza', 29);
insert into localidades (localidad, cod_provincia) values ('Caucaia', 29);
insert into localidades (localidad, cod_provincia) values ('Sobral', 29);
insert into localidades (localidad, cod_provincia) values ('Juazeiro do Norte', 29);
insert into localidades (localidad, cod_provincia) values ('Maracanaú', 29); -- ID: 53
-- Distrito Federal
insert into localidades (localidad, cod_provincia) values ('Brasilia', 30);
-- Espírito Santo
insert into localidades (localidad, cod_provincia) values ('Vitória', 31);
-- Goiás
insert into localidades (localidad, cod_provincia) values ('Goiânia', 32);
insert into localidades (localidad, cod_provincia) values ('Aparecida de Goiânia', 32);
insert into localidades (localidad, cod_provincia) values ('Anápolis', 32);
insert into localidades (localidad, cod_provincia) values ('Rio Verde', 32);
insert into localidades (localidad, cod_provincia) values ('Catalão', 32); -- ID: 60
-- Maranhão
insert into localidades (localidad, cod_provincia) values ('São Luís', 33);
-- Mato Grosso
insert into localidades (localidad, cod_provincia) values ('Cuiabá', 34);
-- Mato Grosso do Sul
insert into localidades (localidad, cod_provincia) values ('Campo Grande', 35);
-- Minas Gerais
insert into localidades (localidad, cod_provincia) values ('Belo Horizonte', 36);
insert into localidades (localidad, cod_provincia) values ('Contagem', 36);
insert into localidades (localidad, cod_provincia) values ('Uberlândia', 36);
insert into localidades (localidad, cod_provincia) values ('Juiz de Fora', 36);
insert into localidades (localidad, cod_provincia) values ('Betim', 36); -- ID: 68
-- Pará
insert into localidades (localidad, cod_provincia) values ('Belém', 37);
-- Paraíba
insert into localidades (localidad, cod_provincia) values ('João Pessoa', 38);
-- Paraná
insert into localidades (localidad, cod_provincia) values ('Curitiba', 39);
insert into localidades (localidad, cod_provincia) values ('Londrina', 39);
insert into localidades (localidad, cod_provincia) values ('Maringá', 39);
insert into localidades (localidad, cod_provincia) values ('Cascavel', 39);
insert into localidades (localidad, cod_provincia) values ('Ponta Grossa', 39); -- ID: 75
-- Pernambuco
insert into localidades (localidad, cod_provincia) values ('Recife', 40);
-- Piauí
insert into localidades (localidad, cod_provincia) values ('Teresina', 41);
-- Rio de Janeiro
insert into localidades (localidad, cod_provincia) values ('Rio de Janeiro', 42);
insert into localidades (localidad, cod_provincia) values ('São Gonçalo', 42);
insert into localidades (localidad, cod_provincia) values ('Duque de Caxias', 42);
insert into localidades (localidad, cod_provincia) values ('Nova Iguaçu', 42);
insert into localidades (localidad, cod_provincia) values ('Niterói', 42); -- ID: 82
-- Rio Grande do Norte
insert into localidades (localidad, cod_provincia) values ('Natal', 43);
-- Rio Grande do Sul
insert into localidades (localidad, cod_provincia) values ('Porto Alegre', 44);
insert into localidades (localidad, cod_provincia) values ('Pelotas', 44);
insert into localidades (localidad, cod_provincia) values ('Canoas', 44);
insert into localidades (localidad, cod_provincia) values ('Santa Maria', 44);
insert into localidades (localidad, cod_provincia) values ('Caxias do Sul', 44);  -- ID: 88
-- Rondônia
insert into localidades (localidad, cod_provincia) values ('Porto Velho', 45);
-- Roraima
insert into localidades (localidad, cod_provincia) values ('Boa Vista', 46);
-- Santa Catarina
insert into localidades (localidad, cod_provincia) values ('Florianópolis', 47);
insert into localidades (localidad, cod_provincia) values ('Joinville', 47);
insert into localidades (localidad, cod_provincia) values ('Chapecó', 47);
insert into localidades (localidad, cod_provincia) values ('São José', 47);
insert into localidades (localidad, cod_provincia) values ('Blumenau', 47);
-- São Paulo
insert into localidades (localidad, cod_provincia) values ('São Paulo', 48);
insert into localidades (localidad, cod_provincia) values ('Guarulhos', 48);
insert into localidades (localidad, cod_provincia) values ('Campinas', 48);
insert into localidades (localidad, cod_provincia) values ('São Bernardo do Campo', 48);
insert into localidades (localidad, cod_provincia) values ('São José dos Campos', 48); -- ID: 100

-- Estados Unidos 
-- Alabama top 3
insert into localidades (localidad, cod_provincia) values ('Birmingham', 140);
insert into localidades (localidad, cod_provincia) values ('Montgomery', 140);
insert into localidades (localidad, cod_provincia) values ('Mobile', 140); -- ID: 103
-- Alaska top 3
insert into localidades (localidad, cod_provincia) values ('Anchorage', 141);
insert into localidades (localidad, cod_provincia) values ('Fairbanks', 141);
insert into localidades (localidad, cod_provincia) values ('Juneau', 141); -- ID: 106
-- Arizona top 3
insert into localidades (localidad, cod_provincia) values ('Phoenix', 142);
insert into localidades (localidad, cod_provincia) values ('Tucson', 142); 
insert into localidades (localidad, cod_provincia) values ('Mesa', 142); -- ID: 109
-- Arkansas top 3
insert into localidades (localidad, cod_provincia) values ('Little Rock', 143);
insert into localidades (localidad, cod_provincia) values ('Fort Smith', 143);
insert into localidades (localidad, cod_provincia) values ('Fayetteville', 143); -- ID: 112
-- California top 3
insert into localidades (localidad, cod_provincia) values ('Los Angeles', 144);
insert into localidades (localidad, cod_provincia) values ('San Diego', 144);
insert into localidades (localidad, cod_provincia) values ('San Jose', 144); -- ID: 115
-- Colorado top 3
insert into localidades (localidad, cod_provincia) values ('Denver', 145);
insert into localidades (localidad, cod_provincia) values ('Colorado Springs', 145);
insert into localidades (localidad, cod_provincia) values ('Aurora', 145); -- ID: 118
-- Connecticut top 3
insert into localidades (localidad, cod_provincia) values ('Bridgeport', 146);
insert into localidades (localidad, cod_provincia) values ('New Haven', 146);
insert into localidades (localidad, cod_provincia) values ('Hartford', 146); -- ID: 121
-- Delaware top 3
insert into localidades (localidad, cod_provincia) values ('Wilmington', 147);
insert into localidades (localidad, cod_provincia) values ('Dover', 147);
insert into localidades (localidad, cod_provincia) values ('Newark', 147); -- ID: 124
-- Florida top 3
insert into localidades (localidad, cod_provincia) values ('Jacksonville', 148);
insert into localidades (localidad, cod_provincia) values ('Miami', 148);
insert into localidades (localidad, cod_provincia) values ('Tampa', 148); -- ID: 127
-- Georgia top 3
insert into localidades (localidad, cod_provincia) values ('Atlanta', 149);
insert into localidades (localidad, cod_provincia) values ('Columbus', 149);
insert into localidades (localidad, cod_provincia) values ('Augusta', 149); -- ID: 130
-- Hawaii top 3
insert into localidades (localidad, cod_provincia) values ('Honolulu', 150);
insert into localidades (localidad, cod_provincia) values ('Hilo', 150);
insert into localidades (localidad, cod_provincia) values ('Kailua', 150); -- ID: 133
-- Idaho top 3
insert into localidades (localidad, cod_provincia) values ('Boise', 151);
insert into localidades (localidad, cod_provincia) values ('Nampa', 151);
insert into localidades (localidad, cod_provincia) values ('Meridian', 151);  -- ID: 136
-- Illinois top 3 
insert into localidades (localidad, cod_provincia) values ('Chicago', 152);
insert into localidades (localidad, cod_provincia) values ('Aurora', 152);
insert into localidades (localidad, cod_provincia) values ('Rockford', 152);    -- ID: 139
-- Indiana top 3
insert into localidades (localidad, cod_provincia) values ('Indianapolis', 153);
insert into localidades (localidad, cod_provincia) values ('Fort Wayne', 153);
insert into localidades (localidad, cod_provincia) values ('Evansville', 153);  -- ID: 142
-- Iowa top 3
insert into localidades (localidad, cod_provincia) values ('Des Moines', 154);
insert into localidades (localidad, cod_provincia) values ('Cedar Rapids', 154);
insert into localidades (localidad, cod_provincia) values ('Davenport', 154); -- ID: 145
-- Kansas top 3
insert into localidades (localidad, cod_provincia) values ('Wichita', 155);
insert into localidades (localidad, cod_provincia) values ('Overland Park', 155);
insert into localidades (localidad, cod_provincia) values ('Kansas City', 155); -- ID: 148
-- Kentucky top 3
insert into localidades (localidad, cod_provincia) values ('Louisville', 156);
insert into localidades (localidad, cod_provincia) values ('Lexington', 156);
insert into localidades (localidad, cod_provincia) values ('Bowling Green', 156); -- ID: 151
-- Louisiana top 3
insert into localidades (localidad, cod_provincia) values ('New Orleans', 157);
insert into localidades (localidad, cod_provincia) values ('Baton Rouge', 157);
insert into localidades (localidad, cod_provincia) values ('Shreveport', 157);  -- ID: 154
-- Maine top 3
insert into localidades (localidad, cod_provincia) values ('Portland', 158);
insert into localidades (localidad, cod_provincia) values ('Lewiston', 158);
insert into localidades (localidad, cod_provincia) values ('Bangor', 158);  -- ID: 157
-- Maryland top 3
insert into localidades (localidad, cod_provincia) values ('Baltimore', 159);
insert into localidades (localidad, cod_provincia) values ('Frederick', 159);
insert into localidades (localidad, cod_provincia) values ('Rockville', 159); -- ID: 160
-- Massachusetts top 3
insert into localidades (localidad, cod_provincia) values ('Boston', 160);
insert into localidades (localidad, cod_provincia) values ('Worcester', 160);
insert into localidades (localidad, cod_provincia) values ('Springfield', 160);   -- ID: 163
-- Michigan top 3
insert into localidades (localidad, cod_provincia) values ('Detroit', 161);
insert into localidades (localidad, cod_provincia) values ('Grand Rapids', 161);
insert into localidades (localidad, cod_provincia) values ('Warren', 161);  -- ID: 166
-- Minnesota top 3  
insert into localidades (localidad, cod_provincia) values ('Minneapolis', 162);
insert into localidades (localidad, cod_provincia) values ('Saint Paul', 162);
insert into localidades (localidad, cod_provincia) values ('Rochester', 162); -- ID: 169
-- Mississippi top 3
insert into localidades (localidad, cod_provincia) values ('Jackson', 163);
insert into localidades (localidad, cod_provincia) values ('Gulfport', 163);
insert into localidades (localidad, cod_provincia) values ('Southaven', 163); -- ID: 172
-- Missouri top 3
insert into localidades (localidad, cod_provincia) values ('Kansas City', 164);
insert into localidades (localidad, cod_provincia) values ('Saint Louis', 164);
insert into localidades (localidad, cod_provincia) values ('Springfield', 164); -- ID: 175
-- Montana top 3
insert into localidades (localidad, cod_provincia) values ('Billings', 165);
insert into localidades (localidad, cod_provincia) values ('Missoula', 165);
insert into localidades (localidad, cod_provincia) values ('Great Falls', 165); -- ID: 178
-- Nebraska top 3
insert into localidades (localidad, cod_provincia) values ('Omaha', 166);
insert into localidades (localidad, cod_provincia) values ('Lincoln', 166);
insert into localidades (localidad, cod_provincia) values ('Bellevue', 166);  -- ID: 181
-- Nevada top 3
insert into localidades (localidad, cod_provincia) values ('Las Vegas', 167);
insert into localidades (localidad, cod_provincia) values ('Henderson', 167);
insert into localidades (localidad, cod_provincia) values ('Reno', 167);    -- ID: 184
-- New Hampshire top 3
insert into localidades (localidad, cod_provincia) values ('Manchester', 168);
insert into localidades (localidad, cod_provincia) values ('Nashua', 168);
insert into localidades (localidad, cod_provincia) values ('Concord', 168); -- ID: 187
-- New Jersey top 3
insert into localidades (localidad, cod_provincia) values ('Newark', 169);
insert into localidades (localidad, cod_provincia) values ('Jersey City', 169);
insert into localidades (localidad, cod_provincia) values ('Paterson', 169);  -- ID: 190
-- New Mexico top 3
insert into localidades (localidad, cod_provincia) values ('Albuquerque', 170);
insert into localidades (localidad, cod_provincia) values ('Las Cruces', 170);
insert into localidades (localidad, cod_provincia) values ('Rio Rancho', 170);  -- ID: 193
-- New York top 3
insert into localidades (localidad, cod_provincia) values ('New York', 171);
insert into localidades (localidad, cod_provincia) values ('Buffalo', 171);
insert into localidades (localidad, cod_provincia) values ('Rochester', 171); -- ID: 196
-- North Carolina top 3
insert into localidades (localidad, cod_provincia) values ('Charlotte', 172);
insert into localidades (localidad, cod_provincia) values ('Raleigh', 172);
insert into localidades (localidad, cod_provincia) values ('Greensboro', 172);  -- ID: 199
-- North Dakota top 3
insert into localidades (localidad, cod_provincia) values ('Fargo', 173);
insert into localidades (localidad, cod_provincia) values ('Bismarck', 173);
insert into localidades (localidad, cod_provincia) values ('Grand Forks', 173); -- ID: 202
-- Ohio top 3
insert into localidades (localidad, cod_provincia) values ('Columbus', 174);
insert into localidades (localidad, cod_provincia) values ('Cleveland', 174);
insert into localidades (localidad, cod_provincia) values ('Cincinnati', 174);  -- ID: 205
-- Oklahoma top 3
insert into localidades (localidad, cod_provincia) values ('Oklahoma City', 175);
insert into localidades (localidad, cod_provincia) values ('Tulsa', 175);
  insert into localidades (localidad, cod_provincia) values ('Norman', 175);  -- ID: 208
  -- Oregon top 3
insert into localidades (localidad, cod_provincia) values ('Portland', 176);
insert into localidades (localidad, cod_provincia) values ('Eugene', 176);
insert into localidades (localidad, cod_provincia) values ('Salem', 176); -- ID: 211
-- Pennsylvania top 3
insert into localidades (localidad, cod_provincia) values ('Philadelphia', 177);
insert into localidades (localidad, cod_provincia) values ('Pittsburgh', 177);
insert into localidades (localidad, cod_provincia) values ('Allentown', 177); -- ID: 214
-- Rhode Island top 3
insert into localidades (localidad, cod_provincia) values ('Providence', 178);
insert into localidades (localidad, cod_provincia) values ('Warwick', 178);
insert into localidades (localidad, cod_provincia) values ('Cranston', 178);  -- ID: 217
-- South Carolina top 3
insert into localidades (localidad, cod_provincia) values ('Columbia', 179);
insert into localidades (localidad, cod_provincia) values ('Charleston', 179);
insert into localidades (localidad, cod_provincia) values ('North Charleston', 179);  -- ID: 220
-- South Dakota top 3 
insert into localidades (localidad, cod_provincia) values ('Sioux Falls', 180);
insert into localidades (localidad, cod_provincia) values ('Rapid City', 180);
insert into localidades (localidad, cod_provincia) values ('Aberdeen', 180);  -- ID: 223
-- Tennessee top 3
insert into localidades (localidad, cod_provincia) values ('Memphis', 181);
insert into localidades (localidad, cod_provincia) values ('Nashville', 181);
insert into localidades (localidad, cod_provincia) values ('Knoxville', 181); -- ID: 226
-- Texas top 3
insert into localidades (localidad, cod_provincia) values ('Houston', 182);
insert into localidades (localidad, cod_provincia) values ('San Antonio', 182);
insert into localidades (localidad, cod_provincia) values ('Dallas', 182);  -- ID: 229
-- Utah top 3
insert into localidades (localidad, cod_provincia) values ('Salt Lake City', 183);
insert into localidades (localidad, cod_provincia) values ('West Valley City', 183);  
insert into localidades (localidad, cod_provincia) values ('Provo', 183); -- ID: 232
-- Vermont top 3
insert into localidades (localidad, cod_provincia) values ('Burlington', 184);
insert into localidades (localidad, cod_provincia) values ('South Burlington', 184);
insert into localidades (localidad, cod_provincia) values ('Rutland', 184); -- ID: 235
-- Virginia top 3
insert into localidades (localidad, cod_provincia) values ('Virginia Beach', 185);
insert into localidades (localidad, cod_provincia) values ('Norfolk', 185);
insert into localidades (localidad, cod_provincia) values ('Chesapeake', 185);  -- ID: 238
-- Washington top 3
insert into localidades (localidad, cod_provincia) values ('Seattle', 186);
insert into localidades (localidad, cod_provincia) values ('Spokane', 186);
insert into localidades (localidad, cod_provincia) values ('Tacoma', 186);  -- ID: 241
-- West Virginia top 3
insert into localidades (localidad, cod_provincia) values ('Charleston', 187);
insert into localidades (localidad, cod_provincia) values ('Huntington', 187);
insert into localidades (localidad, cod_provincia) values ('Parkersburg', 187); -- ID: 244
-- Wisconsin top 3
insert into localidades (localidad, cod_provincia) values ('Milwaukee', 188);
insert into localidades (localidad, cod_provincia) values ('Madison', 188);
insert into localidades (localidad, cod_provincia) values ('Green Bay', 188); -- ID: 247
-- Wyoming top 3
insert into localidades (localidad, cod_provincia) values ('Cheyenne', 189);
insert into localidades (localidad, cod_provincia) values ('Casper', 189);
insert into localidades (localidad, cod_provincia) values ('Laramie', 189); -- ID: 250


-- Documentos
insert into Documentos (tipo_doc) values ('Dni');
insert into Documentos (tipo_doc) values ('Pasaporte');
insert into Documentos (tipo_doc) values ('Obra social');
insert into Documentos (tipo_doc) values ('Licencia de conducir'); -- ID: 4


-- Sexos
insert into Sexos (tipo) values ('Hombre');
insert into Sexos (tipo) values ('Mujer');
insert into Sexos (tipo) values ('Otro'); -- ID:3

-- Clientes
insert into Clientes (nombre, apellido, id_tipo_doc, nro_doc, cod_localidad, nro_calle, calle, nro_afiliado, fecha_nac, id_tipo_sexo) values ('Juan', 'Perez', 1, "24262153", 9, '1414', 'Mendoza', 9, '1997-10-08', 1);
insert into Clientes (nombre, apellido, id_tipo_doc, nro_doc, cod_localidad, nro_calle, calle, nro_afiliado, fecha_nac, id_tipo_sexo) values ('Maria', 'Flores', 1, "36765125", 1, '2336', 'Rivadavia', 10, '1996-03-20', 2);
insert into Clientes (nombre, apellido, id_tipo_doc, nro_doc, cod_localidad, nro_calle, calle, nro_afiliado, fecha_nac, id_tipo_sexo) values ('Silvia', 'Saravia', 1, "40679134", 10, '1472', 'Mitre', 11, '1997-06-25', 2);
insert into Clientes (nombre, apellido, id_tipo_doc, nro_doc, cod_localidad, nro_calle, calle, nro_afiliado, fecha_nac, id_tipo_sexo) values ('Pablo', 'Gomez', 1, "32346851", 2, '2448', 'Calle 16', 12, '1997-11-30', 1);
insert into Clientes (nombre, apellido, id_tipo_doc, nro_doc, cod_localidad, nro_calle, calle, nro_afiliado, fecha_nac, id_tipo_sexo) values ('Rocio', 'Toledo', 1, "26497316", 12, '3546', 'Alvear', 13, '1997-02-15', 2); -- ID: 5
select * from Clientes;

-- Tipos de transferencias
insert into tipos_transferencias (tipo_transferencia) values ('Transferencia_interna');
insert into tipos_transferencias (tipo_transferencia) values ('Transferencia_externa');
insert into tipos_transferencias (tipo_transferencia) values ('Transferencia_internacional');
insert into tipos_transferencias (tipo_transferencia) values ('Transferencia_urgente'); -- ID: 4
select * from tipos_transferencias;

-- Tipos de contactos
insert into tipos_contactos (tipo_contacto) values ('Email');
insert into tipos_contactos (tipo_contacto) values ('Telefono');
insert into tipos_contactos (tipo_contacto) values ('Linkedin');
insert into tipos_contactos (tipo_contacto) values ('Telegram');
insert into tipos_contactos (tipo_contacto) values ('Instagram'); -- ID: 5

-- Transferencias 
insert into Transferencias (id_tipo_transferencia, id_cliente, fecha, monto, cuenta_envio, cuenta_recibo) values (2, 1, '2022-10-21', 1500, '1364679600006437649134', '3100213000041679456123');
insert into Transferencias (id_tipo_transferencia, id_cliente, fecha, monto, cuenta_envio, cuenta_recibo) values (1, 3, '2022-10-21', 5400, '3160003467798464685643', '3164614677984631856433');
insert into Transferencias (id_tipo_transferencia, id_cliente, fecha, monto, cuenta_envio, cuenta_recibo) values (2, 4, '2022-10-21', 10000, '9467346976413461978003', '5854879461300213467985');
select * from Transferencias;

-- Tipos de cuentas
insert into Tipos_cuentas (tipo_cuenta) values ('Caja de ahorro');
insert into Tipos_cuentas (tipo_cuenta) values ('Cuenta corriente');
insert into Tipos_cuentas (tipo_cuenta) values ('Cuenta de ahorro');
insert into Tipos_cuentas (tipo_cuenta) values ('Cuenta de inversion'); -- ID: 4

-- Tipo de moneda
insert into Tipo_moneda (tipo_moneda) values ('Pesos');
insert into Tipo_moneda (tipo_moneda) values ('Dolares');
insert into Tipo_moneda (tipo_moneda) values ('Euros'); -- ID: 3

-- Tipo estado de cuenta
insert into Tipo_estado_cuenta (tipo_estado_cuenta) values ('Activa');
insert into Tipo_estado_cuenta (tipo_estado_cuenta) values ('Inactiva');
insert into Tipo_estado_cuenta (tipo_estado_cuenta) values ('Bloqueada'); -- ID: 3

-- Cuentas

Insert into Cuenta (id_tipo_estado_cuenta, Monto, fecha_creacion, CBU, Alias, password, Credito, Debito) values (1, 100000, '2022-10-09', 0622060411100072958132, 'Ciruela.Gradas.Azul', 'd2b-18B2Mw', true, false);
Insert into Cuenta (id_tipo_estado_cuenta, Monto, fecha_creacion, CBU, Alias, password, Credito, Debito) values (1, 72586, '2022-05-12', 0622060411100072757630, 'Patin.Mojado.Barco', 'nqB0ZyPUF', true, true);
Insert into Cuenta (id_tipo_estado_cuenta, Monto, fecha_creacion, CBU, Alias, password, Credito, Debito) values (1, 20086.50, '2021-07-16', 0622060411100030086433, 'Ancla.Tarjeta.Bisagra', 'MK&dh03+h', true, false);
Insert into Cuenta (id_tipo_estado_cuenta, Monto, fecha_creacion, CBU, Alias, password, Credito, Debito) values (1, 724.15, '2021-12-01', 0622060411100028299306, 'Auto.Barrio.Pulsera', 'HRFNXgPJM', true, true);

-- -- insert into Cuenta (id_cliente, Monto, fecha_creacion, CBU, Alias, password, Credito, Debito) values (1, 100000, '2022-10-09', 0622060411100072958132, 'Ciruela.Gradas.Azul', 'd2b-18B2Mw', true, false);
-- Insert into Cuenta (id_cliente, id_tipo_cuenta, id_tipo_moneda, id_tipo_estado_cuenta, Monto, fecha_creacion, CBU, Alias, password, Credito, Debito) values (1, 1, 1, 1, 100000, '2022-10-09', 0622060411100072958132, 'Ciruela.Gradas.Azul', 'd2b-18B2Mw', true, false);
-- -- insert into Cuenta (id_cliente, Monto, fecha_creacion, CBU, Alias, password, Credito, Debito) values (2, 72586, '2022-05-12', 0622060411100072757630, 'Patin.Mojado.Barco', 'nqB0ZyPUF', true, true);
-- Insert into Cuenta (id_cliente, id_tipo_cuenta, id_tipo_moneda, id_tipo_estado_cuenta, Monto, fecha_creacion, CBU, Alias, password, Credito, Debito) values (2, 2, 1, 1, 72586, '2022-05-12', 0622060411100072757630, 'Patin.Mojado.Barco', 'nqB0ZyPUF', true, true);
-- -- insert into Cuenta (id_cliente, Monto, fecha_creacion, CBU, Alias, password, Credito, Debito) values (3, 20086.50, '2021-07-16', 0622060411100030086433, 'Ancla.Tarjeta.Bisagra', 'MK&dh03+h', true, false);
-- Insert into Cuenta (id_cliente, id_tipo_cuenta, id_tipo_moneda, id_tipo_estado_cuenta, Monto, fecha_creacion, CBU, Alias, password, Credito, Debito) values (3, 3, 1, 1, 20086.50, '2021-07-16', 0622060411100030086433, 'Ancla.Tarjeta.Bisagra', 'MK&dh03+h', true, false);
-- -- insert into Cuenta (id_cliente, Monto, fecha_creacion, CBU, Alias, password, Credito, Debito) values (4, 724.15, '2021-12-01', 0622060411100028299306, 'Auto.Barrio.Pulsera', 'HRFNXgPJM', true, true);
-- Insert into Cuenta (id_cliente, id_tipo_cuenta, id_tipo_moneda, id_tipo_estado_cuenta, Monto, fecha_creacion, CBU, Alias, password, Credito, Debito) values (4, 4, 1, 1, 724.15, '2021-12-01', 0622060411100028299306, 'Auto.Barrio.Pulsera', 'HRFNXgPJM', true, true);
-- -- insert into Cuenta (id_cliente, Monto, fecha_creacion, CBU, Alias, password, Credito, Debito) values (5, 149.30, '2022-2-14', 0622060411100040578115, 'Boca.Mi.Vida', 'RosariTO*77', true, true);

-- Cuenta_Transferencia
insert into cuenta_transferencia (id_cuenta, id_transferencia) values (4,2);
insert into cuenta_transferencia (id_cuenta, id_transferencia) values (2,3);

-- Tipo empleado
insert into Tipo_empleado (tipo_empleado) values ('Administrador');
insert into Tipo_empleado (tipo_empleado) values ('Cajero');
insert into Tipo_empleado (tipo_empleado) values ('Gerente');
insert into Tipo_empleado (tipo_empleado) values ('Supervisor');

-- Tipo estado empleado
insert into Tipo_estado_empleado (tipo_estado_empleado) values ('Activo');
insert into Tipo_estado_empleado (tipo_estado_empleado) values ('Inactivo');
insert into Tipo_estado_empleado (tipo_estado_empleado) values ('Vacaciones');

-- Empleados
insert into Empleados (id_empleado, nombre, apellido, id_tipo_doc, nro_doc, cod_localidad, nro_calle, calle, fecha_nac, id_tipo_sexo, id_tipo_empleado, id_tipo_estado_empleado, fecha_ingreso, sueldo) values (1, 'Juan', 'Perez', 1, 12345678, 1, 1234, 'Av. Siempreviva', '1990-01-01', 1, 1, 1, '2021-01-01', 100000);
insert into Empleados (id_empleado, nombre, apellido, id_tipo_doc, nro_doc, cod_localidad, nro_calle, calle, fecha_nac, id_tipo_sexo, id_tipo_empleado, id_tipo_estado_empleado, fecha_ingreso, sueldo) values (2, 'Pedro', 'Gomez', 1, 12345678, 1, 1234, 'Av. Siempreviva', '1990-01-01', 1, 2, 1, '2021-01-01', 100000);
insert into Empleados (id_empleado, nombre, apellido, id_tipo_doc, nro_doc, cod_localidad, nro_calle, calle, fecha_nac, id_tipo_sexo, id_tipo_empleado, id_tipo_estado_empleado, fecha_ingreso, sueldo) values (3, 'Maria', 'Gonzalez', 1, 12345678, 1, 1234, 'Av. Siempreviva', '1990-01-01', 2, 3, 1, '2021-01-01', 100000);

-- insert into Empleados (id_empleado, nombre, apellido, id_tipo_doc, nro_doc, cod_localidad, nro_calle, calle, fecha_nac, id_tipo_sexo) values (1, 'Carolina', 'Moya', 1, '10988567', 9, '4600', 'Av. Sabattini', '1953-12-01', 2);
insert into Empleados (nombre, apellido, id_tipo_doc, nro_doc, cod_localidad, nro_calle, calle, fecha_nac, id_tipo_sexo, id_tipo_empleado, id_tipo_estado_empleado, fecha_ingreso, sueldo) values ('Carolina', 'Moya', 1, '10988567', 9, '4600', 'Av. Sabattini', '1953-12-01', 2, 3, 1, '2021-01-01', 100000);
-- insert into Empleados (id_empleado, nombre, apellido, id_tipo_doc, nro_doc, cod_localidad, nro_calle, calle, fecha_nac, id_tipo_sexo) values (2, 'Federico', 'Napolitano', 1, '36785009', 9, '200', 'Salta', '1992-07-27', 1);
insert into Empleados (nombre, apellido, id_tipo_doc, nro_doc, cod_localidad, nro_calle, calle, fecha_nac, id_tipo_sexo, id_tipo_empleado, id_tipo_estado_empleado, fecha_ingreso, sueldo) values ('Federico', 'Napolitano', 1, '36785009', 9, '200', 'Salta', '1992-07-27', 1, 3, 1, '2021-01-01', 100000);
-- insert into Empleados (id_empleado, nombre, apellido, id_tipo_doc, nro_doc, cod_localidad, nro_calle, calle, fecha_nac, id_tipo_sexo) values (3, 'Josefina', 'Carballo', 1, '40987520', 9, '541', 'Rondeau', '1996-05-15', 2);
insert into Empleados (nombre, apellido, id_tipo_doc, nro_doc, cod_localidad, nro_calle, calle, fecha_nac, id_tipo_sexo, id_tipo_empleado, id_tipo_estado_empleado, fecha_ingreso, sueldo) values ('Josefina', 'Carballo', 1, '40987520', 9, '541', 'Rondeau', '1996-05-15', 2, 3, 1, '2021-01-01', 100000);
-- insert into Empleados (id_empleado, nombre, apellido, id_tipo_doc, nro_doc, cod_localidad, nro_calle, calle, fecha_nac, id_tipo_sexo) values (4, 'Giuliana', 'Serrano', 1, '20525010', 9, '1162', 'Deán Funes', '1980-04-10', 2);
insert into Empleados (nombre, apellido, id_tipo_doc, nro_doc, cod_localidad, nro_calle, calle, fecha_nac, id_tipo_sexo, id_tipo_empleado, id_tipo_estado_empleado, fecha_ingreso, sueldo) values ('Giuliana', 'Serrano', 1, '20525010', 9, '1162', 'Deán Funes', '1980-04-10', 2, 3, 1, '2021-01-01', 100000);
-- insert into Empleados (id_empleado, nombre, apellido, id_tipo_doc, nro_doc, cod_localidad, nro_calle, calle, fecha_nac, id_tipo_sexo) values (5, 'Alejandro', 'Savid', 1, '38710238', 9, '476', 'Coronel Pedro Zanni', '1993-09-12', 1);
insert into Empleados (nombre, apellido, id_tipo_doc, nro_doc, cod_localidad, nro_calle, calle, fecha_nac, id_tipo_sexo, id_tipo_empleado, id_tipo_estado_empleado, fecha_ingreso, sueldo) values ('Alejandro', 'Savid', 1, '38710238', 9, '476', 'Coronel Pedro Zanni', '1993-09-12', 1, 3, 1, '2021-01-01', 100000);
-- insert into Empleados (id_empleado, nombre, apellido, id_tipo_doc, nro_doc, cod_localidad, nro_calle, calle, fecha_nac, id_tipo_sexo) values (6, 'Gregorio', 'Lábaque', 1, '19089123', 9, '4011', 'Tristán Malbrán', '1960-06-13', 1);
insert into Empleados (nombre, apellido, id_tipo_doc, nro_doc, cod_localidad, nro_calle, calle, fecha_nac, id_tipo_sexo, id_tipo_empleado, id_tipo_estado_empleado, fecha_ingreso, sueldo) values ('Gregorio', 'Lábaque', 1, '19089123', 9, '4011', 'Tristán Malbrán', '1960-06-13', 1, 3, 1, '2021-01-01', 100000);
-- insert into Empleados (id_empleado, nombre, apellido, id_tipo_doc, nro_doc, cod_localidad, nro_calle, calle, fecha_nac, id_tipo_sexo) values (7, 'Marcela', 'Luna', 1, '25467361', 9, '940', 'Av. Castro Barros', '1975-03-20',2);
insert into Empleados (nombre, apellido, id_tipo_doc, nro_doc, cod_localidad, nro_calle, calle, fecha_nac, id_tipo_sexo, id_tipo_empleado, id_tipo_estado_empleado, fecha_ingreso, sueldo) values ('Marcela', 'Luna', 1, '25467361', 9, '940', 'Av. Castro Barros', '1975-03-20',2, 3, 1, '2021-01-01', 100000);
-- insert into Empleados (id_empleado, nombre, apellido, id_tipo_doc, nro_doc, cod_localidad, nro_calle, calle, fecha_nac, id_tipo_sexo) values (8, 'Jorge', 'Cádiz', 1, '21000345', 9, '5008', 'Fray Luis Beltrán', '1981-10-30', 1);
insert into Empleados (nombre, apellido, id_tipo_doc, nro_doc, cod_localidad, nro_calle, calle, fecha_nac, id_tipo_sexo, id_tipo_empleado, id_tipo_estado_empleado, fecha_ingreso, sueldo) values ('Jorge', 'Cádiz', 1, '21000345', 9, '5008', 'Fray Luis Beltrán', '1981-10-30', 1, 3, 1, '2021-01-01', 100000);
-- insert into Empleados (id_empleado, nombre, apellido, id_tipo_doc, nro_doc, cod_localidad, nro_calle, calle, fecha_nac, id_tipo_sexo) values (9, 'Sebastián', 'Ayala', 1, '36783214', 9, '5858', 'Av. Juan B. Justo', '1991-02-25', 1);
insert into Empleados (nombre, apellido, id_tipo_doc, nro_doc, cod_localidad, nro_calle, calle, fecha_nac, id_tipo_sexo, id_tipo_empleado, id_tipo_estado_empleado, fecha_ingreso, sueldo) values ('Sebastián', 'Ayala', 1, '36783214', 9, '5858', 'Av. Juan B. Justo', '1991-02-25', 1, 3, 1, '2021-01-01', 100000);
-- insert into Empleados (id_empleado, nombre, apellido, id_tipo_doc, nro_doc, cod_localidad, nro_calle, calle, fecha_nac, id_tipo_sexo) values (10, 'Isabel', 'Carreras', 1, '28106554', 9, '1050', 'Bv. Elias Yofre', '1985-06-14', 2);
insert into Empleados (nombre, apellido, id_tipo_doc, nro_doc, cod_localidad, nro_calle, calle, fecha_nac, id_tipo_sexo, id_tipo_empleado, id_tipo_estado_empleado, fecha_ingreso, sueldo) values ('Isabel', 'Carreras', 1, '28106554', 9, '1050', 'Bv. Elias Yofre', '1985-06-14', 2, 3, 1, '2021-01-01', 100000);
select * from Empleados;

-- Contactos
insert into Contactos (id_tipo_contacto, id_cliente, contactos) values (1, 2, 'mariaflo@gmail.com');
insert into Contactos (id_tipo_contacto, id_cliente, contactos) values (2, 2, '1155555555');
insert into Contactos (id_tipo_contacto, id_cliente, contactos) values (1, 3, 'silviasar@gmail.com');
insert into Contactos (id_tipo_contacto, id_cliente, contactos) values (2, 3, '1166666666');
insert into Contactos (id_tipo_contacto, id_cliente, contactos) values (1, 4, 'pablogom@gmail.com');
insert into Contactos (id_tipo_contacto, id_cliente, contactos) values (2, 4, '1177777777');

insert into Contactos (id_tipo_contacto, id_empleado, contactos)  values (2, 1, '1522366554');
insert into Contactos (id_tipo_contacto, id_empleado, contactos)  values (2, 2, '1522366555');
insert into Contactos (id_tipo_contacto, id_empleado, contactos)  values (2, 3, '1522366556');
insert into Contactos (id_tipo_contacto, id_empleado, contactos)  values (2, 4, '1522366557');
insert into Contactos (id_tipo_contacto, id_empleado, contactos)  values (2, 5, '1522366558');

-- insert into Contactos (id_contactos, id_tipo_contacto, id_cliente, id_empleado) values (1, 5, 2, 7);
-- insert into Contactos (id_contactos, id_tipo_contacto, id_cliente, id_empleado) values (2, 1, 3, 10);
select * from Contactos;


-- Tipo Prestamo
insert into Tipo_prestamo(tipo_prestamo) values ('Hipotecario');
insert into Tipo_prestamo(tipo_prestamo) values ('Personal');
insert into Tipo_prestamo(tipo_prestamo) values ('Automotor');
insert into Tipo_prestamo(tipo_prestamo) values ('Consumo');
insert into Tipo_prestamo(tipo_prestamo) values ('Tarjeta de Credito');
select * from Tipo_prestamo;

-- Tipo estado prestamo
insert into Tipo_estado_prestamo(tipo_estado_prestamo) values ('Pendiente');
insert into Tipo_estado_prestamo(tipo_estado_prestamo) values ('Aprobado');
insert into Tipo_estado_prestamo(tipo_estado_prestamo) values ('Rechazado');
insert into Tipo_estado_prestamo(tipo_estado_prestamo) values ('Cancelado');
select * from Tipo_estado_prestamo;

-- Tipo cuota
insert into Tipo_cuota(tipo_cuota) values ('Mensual');
insert into Tipo_cuota(tipo_cuota) values ('Quincenal');
insert into Tipo_cuota(tipo_cuota) values ('Semanal');
select * from Tipo_cuota;

-- tipo estado cuota
insert into Tipo_estado_cuota(tipo_estado_cuota) values ('Pendiente');
insert into Tipo_estado_cuota(tipo_estado_cuota) values ('Pagada');
insert into Tipo_estado_cuota(tipo_estado_cuota) values ('Vencida');
select * from Tipo_estado_cuota;

-- Tipo interes
insert into Tipo_interes(tipo_interes) values ('Fijo');
insert into Tipo_interes(tipo_interes) values ('Variable');
select * from Tipo_interes;

-- Cantidad cuotas
insert into Cantidad_cuotas(cantidad_cuotas) values (3);
insert into Cantidad_cuotas(cantidad_cuotas) values (6);
insert into Cantidad_cuotas(cantidad_cuotas) values (9);
insert into Cantidad_cuotas(cantidad_cuotas) values (12);
insert into Cantidad_cuotas(cantidad_cuotas) values (24);
insert into Cantidad_cuotas(cantidad_cuotas) values (36);
insert into Cantidad_cuotas(cantidad_cuotas) values (48);
insert into Cantidad_cuotas(cantidad_cuotas) values (60);
select * from Cantidad_cuotas;

-- Prestamos
insert into Prestamos(id_cliente, id_tipo_moneda, id_tipo_prestamo, id_tipo_estado_prestamo, id_tipo_cuota, id_tipo_interes, id_cantidad_cuotas, monto, fecha_creacion, fecha_vencimiento, fecha_pago, fecha_cancelacion, fecha_ultimo_pago, monto_cuota, monto_interes, monto_total, monto_ultimo_pago, monto_cancelado, monto_pendiente) values (2, 1, 1, 1, 1, 1, 1, 100000, '2019-01-01', '2019-03-01', '2019-03-01', '2019-03-01', '2019-03-01', 100000, 100000, 100000, 100000, 100000, 0);
insert into Prestamos(id_cliente, id_tipo_moneda, id_tipo_prestamo, id_tipo_estado_prestamo, id_tipo_cuota, id_tipo_interes, id_cantidad_cuotas, monto, fecha_creacion, fecha_vencimiento, fecha_pago, fecha_cancelacion, fecha_ultimo_pago, monto_cuota, monto_interes, monto_total, monto_ultimo_pago, monto_cancelado, monto_pendiente) values (3, 1, 2, 1, 2, 2, 2, 200000, '2019-01-01', '2019-06-01', '2019-06-01', '2019-06-01', '2019-06-01', 100000, 100000, 200000, 100000, 200000, 0);
insert into Prestamos(id_cliente, id_tipo_moneda, id_tipo_prestamo, id_tipo_estado_prestamo, id_tipo_cuota, id_tipo_interes, id_cantidad_cuotas, monto, fecha_creacion, fecha_vencimiento, fecha_pago, fecha_cancelacion, fecha_ultimo_pago, monto_cuota, monto_interes, monto_total, monto_ultimo_pago, monto_cancelado, monto_pendiente) values (4, 1, 3, 1, 3, 1, 3, 300000, '2019-01-01', '2019-09-01', '2019-09-01', '2019-09-01', '2019-09-01', 100000, 100000, 300000, 100000, 300000, 0);
insert into Prestamos(id_cliente, id_tipo_moneda, id_tipo_prestamo, id_tipo_estado_prestamo, id_tipo_cuota, id_tipo_interes, id_cantidad_cuotas, monto, fecha_creacion, fecha_vencimiento, fecha_pago, fecha_cancelacion, fecha_ultimo_pago, monto_cuota, monto_interes, monto_total, monto_ultimo_pago, monto_cancelado, monto_pendiente) values (5, 1, 4, 1, 1, 2, 4, 400000, '2019-01-01', '2019-12-01', '2019-12-01', '2019-12-01', '2019-12-01', 100000, 100000, 400000, 100000, 400000, 0);
select * from Prestamos;

-- Prestamos
-- INSERT INTO Prestamos (id_prestamo, id_cuenta, monto, interes_mes_porcentaje, fec_start, fec_venc) VALUES (1,4,8000,10,'2022-10-02','2022-11-02');
-- INSERT INTO Prestamos (id_prestamo, id_cuenta, monto, interes_mes_porcentaje, fec_start, fec_venc) VALUES (2,5,5000,15,'2022-10-23','2022-11-23');
-- SELECT * FROM Prestamos;

-- Cuotas
insert into Cuotas(id_prestamo, nro_cuota, id_tipo_cuota, id_tipo_estado_cuota, fecha_vencimiento, fecha_pago, monto) values (1, 1, 1, 1, '2019-01-01', '2019-01-01', 100000);
insert into Cuotas(id_prestamo, nro_cuota, id_tipo_cuota, id_tipo_estado_cuota, fecha_vencimiento, fecha_pago, monto) values (1, 2, 1, 1, '2019-02-01', '2019-02-01', 100000);
insert into Cuotas(id_prestamo, nro_cuota, id_tipo_cuota, id_tipo_estado_cuota, fecha_vencimiento, fecha_pago, monto) values (1, 3, 1, 1, '2019-03-01', '2019-03-01', 100000);
insert into Cuotas(id_prestamo, nro_cuota, id_tipo_cuota, id_tipo_estado_cuota, fecha_vencimiento, fecha_pago, monto) values (2, 1, 2, 1, '2019-01-01', '2019-01-01', 100000);
insert into Cuotas(id_prestamo, nro_cuota, id_tipo_cuota, id_tipo_estado_cuota, fecha_vencimiento, fecha_pago, monto) values (2, 2, 2, 1, '2019-02-01', '2019-02-01', 100000);
insert into Cuotas(id_prestamo, nro_cuota, id_tipo_cuota, id_tipo_estado_cuota, fecha_vencimiento, fecha_pago, monto) values (2, 3, 2, 1, '2019-03-01', '2019-03-01', 100000);
select * from Cuotas;

-- Tipo tarjeta
insert into Tipo_tarjeta(tipo_tarjeta) values ('Credito');
insert into Tipo_tarjeta(tipo_tarjeta) values ('Debito');
select * from Tipo_tarjeta;

-- Tipo estado tarjeta
insert into Tipo_estado_tarjeta(tipo_estado_tarjeta) values ('Activa');
insert into Tipo_estado_tarjeta(tipo_estado_tarjeta) values ('Inactiva');
insert into Tipo_estado_tarjeta(tipo_estado_tarjeta) values ('Bloqueada');
select * from Tipo_estado_tarjeta;

-- Tarjetas
-- insert into Tarjetas(id_tipo_tarjeta, id_tipo_estado_tarjeta, id_cuenta, fecha_vencimiento, numero) values ( )
select * from Tarjetas;

-- 