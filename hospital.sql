/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50524
Source Host           : localhost:3306
Source Database       : hospital

Target Server Type    : MYSQL
Target Server Version : 50524
File Encoding         : 65001

Date: 2021-06-25 16:12:56
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for actas_entrega
-- ----------------------------
DROP TABLE IF EXISTS `actas_entrega`;
CREATE TABLE `actas_entrega` (
  `id_acta` int(255) NOT NULL AUTO_INCREMENT,
  `id_almacenista` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fecha_emision` datetime DEFAULT NULL,
  `fecha_recepcion` datetime DEFAULT NULL,
  `subtotal_grava_iva` decimal(20,2) DEFAULT NULL,
  `subtotal_iva_0_medicinas` decimal(20,2) DEFAULT NULL,
  `subtotal_iva_0_equipos` decimal(20,2) DEFAULT NULL,
  `subtotal_no_objeto_iva` decimal(20,2) DEFAULT NULL,
  `subtotal_excento_iva` decimal(20,2) DEFAULT NULL,
  `subtotal_sin_impuestos` decimal(20,2) DEFAULT NULL,
  `total_descuento_grava_iva` decimal(20,2) DEFAULT NULL,
  `total_descuento_iva_0_medicinas` decimal(20,2) DEFAULT NULL,
  `total_descuento_iva_0_equipos` decimal(20,2) DEFAULT NULL,
  `total_descuento_excento_iva` decimal(20,2) DEFAULT NULL,
  `total_descuento_sin_impuestos` decimal(20,2) DEFAULT NULL,
  `iva_gravado` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `iva` decimal(20,2) DEFAULT NULL,
  `ice` decimal(20,2) DEFAULT NULL,
  `irbpnr` decimal(20,2) DEFAULT NULL,
  `valor_total` decimal(20,2) DEFAULT NULL,
  `donación` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reingreso` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `observaciones` text COLLATE utf8_unicode_ci,
  `id_farmaceuta` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_acta`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of actas_entrega
-- ----------------------------
INSERT INTO `actas_entrega` VALUES ('1', 'admin', '2021-06-25 00:00:00', '2021-06-26 00:00:00', null, null, null, null, null, null, null, null, null, null, null, '', null, null, null, null, '', '', '', '');

-- ----------------------------
-- Table structure for actas_entrega_equipos
-- ----------------------------
DROP TABLE IF EXISTS `actas_entrega_equipos`;
CREATE TABLE `actas_entrega_equipos` (
  `id_acta_entrega_equipo` int(255) NOT NULL AUTO_INCREMENT,
  `id_acta_entrega` int(255) DEFAULT NULL,
  `id_stock_equipo` int(255) DEFAULT NULL,
  `código_barras` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_producto` int(255) DEFAULT NULL,
  `descripción` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cantidad` int(20) DEFAULT NULL,
  `precio_unitario` decimal(20,2) DEFAULT NULL,
  `descuento` decimal(20,2) DEFAULT NULL,
  `precio_total` decimal(20,2) DEFAULT NULL,
  `fecha_fabricación` date DEFAULT NULL,
  `fecha_caducidad` date DEFAULT NULL,
  `donación` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reingreso` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `observaciones` text COLLATE utf8_unicode_ci,
  `almacenado` decimal(20,2) DEFAULT NULL,
  `no_almacenado` decimal(20,2) DEFAULT NULL,
  `id_almacenista` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_farmaceuta` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_acta_entrega_equipo`) USING BTREE,
  KEY `idae` (`id_acta_entrega`),
  KEY `idsteq` (`id_stock_equipo`),
  CONSTRAINT `idae` FOREIGN KEY (`id_acta_entrega`) REFERENCES `actas_entrega` (`id_acta`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `idsteq` FOREIGN KEY (`id_stock_equipo`) REFERENCES `stock_equipos` (`id_stock_equipo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of actas_entrega_equipos
-- ----------------------------

-- ----------------------------
-- Table structure for actas_entrega_general
-- ----------------------------
DROP TABLE IF EXISTS `actas_entrega_general`;
CREATE TABLE `actas_entrega_general` (
  `id_acta_entrega_general` int(255) NOT NULL AUTO_INCREMENT,
  `id_acta_entrega` int(255) DEFAULT NULL,
  `id_stock_general` int(255) DEFAULT NULL,
  `código_barras` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_producto` int(255) DEFAULT NULL,
  `descripción` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cantidad` int(20) DEFAULT NULL,
  `precio_unitario` decimal(20,2) DEFAULT NULL,
  `descuento` decimal(20,2) DEFAULT NULL,
  `precio_total` decimal(20,2) DEFAULT NULL,
  `fecha_fabricación` date DEFAULT NULL,
  `fecha_caducidad` date DEFAULT NULL,
  `reingreso` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `donación` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `observaciones` text COLLATE utf8_unicode_ci,
  `almacenado` decimal(20,2) DEFAULT NULL,
  `no_almacenado` decimal(20,2) DEFAULT NULL,
  `id_almacenista` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_farmaceuta` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_acta_entrega_general`) USING BTREE,
  KEY `idae` (`id_acta_entrega`),
  KEY `idsteq` (`id_stock_general`),
  CONSTRAINT `actas_entrega_general_ibfk_1` FOREIGN KEY (`id_stock_general`) REFERENCES `stock_general` (`id_stock_general`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `actas_entrega_general_ibfk_2` FOREIGN KEY (`id_acta_entrega`) REFERENCES `actas_entrega` (`id_acta`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of actas_entrega_general
-- ----------------------------

-- ----------------------------
-- Table structure for actas_entrega_medicamentos
-- ----------------------------
DROP TABLE IF EXISTS `actas_entrega_medicamentos`;
CREATE TABLE `actas_entrega_medicamentos` (
  `id_acta_entrega_medicamento` int(255) NOT NULL AUTO_INCREMENT,
  `id_acta_entrega` int(255) DEFAULT NULL,
  `id_stock_medicamentos` int(255) DEFAULT NULL,
  `código_barras` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `código_cnmb` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_producto` int(255) DEFAULT NULL,
  `descripción` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `forma_farmaceutica` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `concentración` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fecha_fabricación` date DEFAULT NULL,
  `fecha_caducidad` date DEFAULT NULL,
  `cantidad` decimal(20,2) DEFAULT NULL,
  `precio_unitario` decimal(20,2) DEFAULT NULL,
  `descuento` decimal(20,2) DEFAULT NULL,
  `precio_total` decimal(20,2) DEFAULT NULL,
  `reingreso` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `donación` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `observaciones` text COLLATE utf8_unicode_ci,
  `almacenado` decimal(20,2) DEFAULT NULL,
  `no_almacenado` decimal(20,2) DEFAULT NULL,
  `id_almacenista` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_farmaceuta` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_acta_entrega_medicamento`) USING BTREE,
  KEY `fac_prov_med` (`id_acta_entrega`),
  KEY `idstockmed` (`id_stock_medicamentos`),
  CONSTRAINT `actas_entrega_medicamentos_ibfk_1` FOREIGN KEY (`id_acta_entrega`) REFERENCES `actas_entrega` (`id_acta`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `idstockmed` FOREIGN KEY (`id_stock_medicamentos`) REFERENCES `stock_medicamentos` (`id_stock_medicamentos`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of actas_entrega_medicamentos
-- ----------------------------

-- ----------------------------
-- Table structure for conf_camas
-- ----------------------------
DROP TABLE IF EXISTS `conf_camas`;
CREATE TABLE `conf_camas` (
  `id_cama` varchar(255) DEFAULT NULL,
  `cama` varchar(255) DEFAULT NULL,
  `id_tecnico` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of conf_camas
-- ----------------------------
INSERT INTO `conf_camas` VALUES ('1', '1', null);
INSERT INTO `conf_camas` VALUES ('2', '2', null);
INSERT INTO `conf_camas` VALUES ('3', '3', null);
INSERT INTO `conf_camas` VALUES ('4', '4', null);
INSERT INTO `conf_camas` VALUES ('5', '5', null);
INSERT INTO `conf_camas` VALUES ('6', '6', null);
INSERT INTO `conf_camas` VALUES ('7', '7', null);
INSERT INTO `conf_camas` VALUES ('8', '8', null);
INSERT INTO `conf_camas` VALUES ('9', '9', null);
INSERT INTO `conf_camas` VALUES ('10', '10', null);

-- ----------------------------
-- Table structure for conf_cantones
-- ----------------------------
DROP TABLE IF EXISTS `conf_cantones`;
CREATE TABLE `conf_cantones` (
  `id_canton` int(255) NOT NULL AUTO_INCREMENT,
  `canton` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `id_provincia` int(255) NOT NULL,
  `id_tecnico` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id_canton`),
  KEY `FK_canton_provincia_id` (`id_provincia`),
  CONSTRAINT `FK_canton_provincia_id` FOREIGN KEY (`id_provincia`) REFERENCES `conf_provincias` (`id_provincia`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=225 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of conf_cantones
-- ----------------------------
INSERT INTO `conf_cantones` VALUES ('1', 'Cuenca', '1', null);
INSERT INTO `conf_cantones` VALUES ('2', 'Girón', '1', null);
INSERT INTO `conf_cantones` VALUES ('3', 'Gualaceo', '1', null);
INSERT INTO `conf_cantones` VALUES ('4', 'Nabón', '1', null);
INSERT INTO `conf_cantones` VALUES ('5', 'Paute', '1', null);
INSERT INTO `conf_cantones` VALUES ('6', 'Pucara', '1', null);
INSERT INTO `conf_cantones` VALUES ('7', 'San Fernando', '1', null);
INSERT INTO `conf_cantones` VALUES ('8', 'Santa Isabel', '1', null);
INSERT INTO `conf_cantones` VALUES ('9', 'Sigsig', '1', null);
INSERT INTO `conf_cantones` VALUES ('10', 'Oña', '1', null);
INSERT INTO `conf_cantones` VALUES ('11', 'Chordeleg', '1', null);
INSERT INTO `conf_cantones` VALUES ('12', 'El Pan', '1', null);
INSERT INTO `conf_cantones` VALUES ('13', 'Sevilla de Oro', '1', null);
INSERT INTO `conf_cantones` VALUES ('14', 'Guachapala', '1', null);
INSERT INTO `conf_cantones` VALUES ('15', 'Camilo Ponce Enríquez', '1', null);
INSERT INTO `conf_cantones` VALUES ('16', 'Guaranda', '2', null);
INSERT INTO `conf_cantones` VALUES ('17', 'Chillanes', '2', null);
INSERT INTO `conf_cantones` VALUES ('18', 'Chimbo', '2', null);
INSERT INTO `conf_cantones` VALUES ('19', 'Echeandía', '2', null);
INSERT INTO `conf_cantones` VALUES ('20', 'San Miguel', '2', null);
INSERT INTO `conf_cantones` VALUES ('21', 'Caluma', '2', null);
INSERT INTO `conf_cantones` VALUES ('22', 'Las Naves', '2', null);
INSERT INTO `conf_cantones` VALUES ('23', 'Azogues', '3', null);
INSERT INTO `conf_cantones` VALUES ('24', 'Biblián', '3', null);
INSERT INTO `conf_cantones` VALUES ('25', 'Cañar', '3', null);
INSERT INTO `conf_cantones` VALUES ('26', 'La Troncal', '3', null);
INSERT INTO `conf_cantones` VALUES ('27', 'El Tambo', '3', null);
INSERT INTO `conf_cantones` VALUES ('28', 'Déleg', '3', null);
INSERT INTO `conf_cantones` VALUES ('29', 'Suscal', '3', null);
INSERT INTO `conf_cantones` VALUES ('30', 'Tulcán', '4', null);
INSERT INTO `conf_cantones` VALUES ('31', 'Bolívar', '4', null);
INSERT INTO `conf_cantones` VALUES ('32', 'Espejo', '4', null);
INSERT INTO `conf_cantones` VALUES ('33', 'Mira', '4', null);
INSERT INTO `conf_cantones` VALUES ('34', 'Montúfar', '4', null);
INSERT INTO `conf_cantones` VALUES ('35', 'San Pedro de Huaca', '4', null);
INSERT INTO `conf_cantones` VALUES ('36', 'Latacunga', '5', null);
INSERT INTO `conf_cantones` VALUES ('37', 'La Maná', '5', null);
INSERT INTO `conf_cantones` VALUES ('38', 'Pangua', '5', null);
INSERT INTO `conf_cantones` VALUES ('39', 'Pujili', '5', null);
INSERT INTO `conf_cantones` VALUES ('40', 'Salcedo', '5', null);
INSERT INTO `conf_cantones` VALUES ('41', 'Saquisilí', '5', null);
INSERT INTO `conf_cantones` VALUES ('42', 'Sigchos', '5', null);
INSERT INTO `conf_cantones` VALUES ('43', 'Riobamba', '6', null);
INSERT INTO `conf_cantones` VALUES ('44', 'Alausi', '6', null);
INSERT INTO `conf_cantones` VALUES ('45', 'Colta', '6', null);
INSERT INTO `conf_cantones` VALUES ('46', 'Chambo', '6', null);
INSERT INTO `conf_cantones` VALUES ('47', 'Chunchi', '6', null);
INSERT INTO `conf_cantones` VALUES ('48', 'Guamote', '6', null);
INSERT INTO `conf_cantones` VALUES ('49', 'Guano', '6', null);
INSERT INTO `conf_cantones` VALUES ('50', 'Pallatanga', '6', null);
INSERT INTO `conf_cantones` VALUES ('51', 'Penipe', '6', null);
INSERT INTO `conf_cantones` VALUES ('52', 'Cumandá', '6', null);
INSERT INTO `conf_cantones` VALUES ('53', 'Machala', '7', null);
INSERT INTO `conf_cantones` VALUES ('54', 'Arenillas', '7', null);
INSERT INTO `conf_cantones` VALUES ('55', 'Atahualpa', '7', null);
INSERT INTO `conf_cantones` VALUES ('56', 'Balsas', '7', null);
INSERT INTO `conf_cantones` VALUES ('57', 'Chilla', '7', null);
INSERT INTO `conf_cantones` VALUES ('58', 'El Guabo', '7', null);
INSERT INTO `conf_cantones` VALUES ('59', 'Huaquillas', '7', null);
INSERT INTO `conf_cantones` VALUES ('60', 'Marcabelí', '7', null);
INSERT INTO `conf_cantones` VALUES ('61', 'Pasaje', '7', null);
INSERT INTO `conf_cantones` VALUES ('62', 'Piñas', '7', null);
INSERT INTO `conf_cantones` VALUES ('63', 'Portovelo', '7', null);
INSERT INTO `conf_cantones` VALUES ('64', 'Santa Rosa', '7', null);
INSERT INTO `conf_cantones` VALUES ('65', 'Zaruma', '7', null);
INSERT INTO `conf_cantones` VALUES ('66', 'Las Lajas', '7', null);
INSERT INTO `conf_cantones` VALUES ('67', 'Esmeraldas', '8', null);
INSERT INTO `conf_cantones` VALUES ('68', 'Eloy Alfaro', '8', null);
INSERT INTO `conf_cantones` VALUES ('69', 'Muisne', '8', null);
INSERT INTO `conf_cantones` VALUES ('70', 'Quinindé', '8', null);
INSERT INTO `conf_cantones` VALUES ('71', 'San Lorenzo', '8', null);
INSERT INTO `conf_cantones` VALUES ('72', 'Atacames', '8', null);
INSERT INTO `conf_cantones` VALUES ('73', 'Rioverde', '8', null);
INSERT INTO `conf_cantones` VALUES ('74', 'La Concordia', '8', null);
INSERT INTO `conf_cantones` VALUES ('75', 'Guayaquil', '9', null);
INSERT INTO `conf_cantones` VALUES ('76', 'Alfredo Baquerizo Moreno (Juján)', '9', null);
INSERT INTO `conf_cantones` VALUES ('77', 'Balao', '9', null);
INSERT INTO `conf_cantones` VALUES ('78', 'Balzar', '9', null);
INSERT INTO `conf_cantones` VALUES ('79', 'Colimes', '9', null);
INSERT INTO `conf_cantones` VALUES ('80', 'Daule', '9', null);
INSERT INTO `conf_cantones` VALUES ('81', 'Durán', '9', null);
INSERT INTO `conf_cantones` VALUES ('82', 'El Empalme', '9', null);
INSERT INTO `conf_cantones` VALUES ('83', 'El Triunfo', '9', null);
INSERT INTO `conf_cantones` VALUES ('84', 'Milagro', '9', null);
INSERT INTO `conf_cantones` VALUES ('85', 'Naranjal', '9', null);
INSERT INTO `conf_cantones` VALUES ('86', 'Naranjito', '9', null);
INSERT INTO `conf_cantones` VALUES ('87', 'Palestina', '9', null);
INSERT INTO `conf_cantones` VALUES ('88', 'Pedro Carbo', '9', null);
INSERT INTO `conf_cantones` VALUES ('89', 'Samborondón', '9', null);
INSERT INTO `conf_cantones` VALUES ('90', 'Santa Lucía', '9', null);
INSERT INTO `conf_cantones` VALUES ('91', 'Salitre (Urbina Jado)', '9', null);
INSERT INTO `conf_cantones` VALUES ('92', 'San Jacinto de Yaguachi', '9', null);
INSERT INTO `conf_cantones` VALUES ('93', 'Playas', '9', null);
INSERT INTO `conf_cantones` VALUES ('94', 'Simón Bolívar', '9', null);
INSERT INTO `conf_cantones` VALUES ('95', 'Coronel Marcelino Maridueña', '9', null);
INSERT INTO `conf_cantones` VALUES ('96', 'Lomas de Sargentillo', '9', null);
INSERT INTO `conf_cantones` VALUES ('97', 'Nobol', '9', null);
INSERT INTO `conf_cantones` VALUES ('98', 'General Antonio Elizalde', '9', null);
INSERT INTO `conf_cantones` VALUES ('99', 'Isidro Ayora', '9', null);
INSERT INTO `conf_cantones` VALUES ('100', 'Ibarra', '10', null);
INSERT INTO `conf_cantones` VALUES ('101', 'Antonio Ante', '10', null);
INSERT INTO `conf_cantones` VALUES ('102', 'Cotacachi', '10', null);
INSERT INTO `conf_cantones` VALUES ('103', 'Otavalo', '10', null);
INSERT INTO `conf_cantones` VALUES ('104', 'Pimampiro', '10', null);
INSERT INTO `conf_cantones` VALUES ('105', 'San Miguel de Urcuquí', '10', null);
INSERT INTO `conf_cantones` VALUES ('106', 'Loja', '11', null);
INSERT INTO `conf_cantones` VALUES ('107', 'Calvas', '11', null);
INSERT INTO `conf_cantones` VALUES ('108', 'Catamayo', '11', null);
INSERT INTO `conf_cantones` VALUES ('109', 'Celica', '11', null);
INSERT INTO `conf_cantones` VALUES ('110', 'Chaguarpamba', '11', null);
INSERT INTO `conf_cantones` VALUES ('111', 'Espíndola', '11', null);
INSERT INTO `conf_cantones` VALUES ('112', 'Gonzanamá', '11', null);
INSERT INTO `conf_cantones` VALUES ('113', 'Macará', '11', null);
INSERT INTO `conf_cantones` VALUES ('114', 'Paltas', '11', null);
INSERT INTO `conf_cantones` VALUES ('115', 'Puyango', '11', null);
INSERT INTO `conf_cantones` VALUES ('116', 'Saraguro', '11', null);
INSERT INTO `conf_cantones` VALUES ('117', 'Sozoranga', '11', null);
INSERT INTO `conf_cantones` VALUES ('118', 'Zapotillo', '11', null);
INSERT INTO `conf_cantones` VALUES ('119', 'Pindal', '11', null);
INSERT INTO `conf_cantones` VALUES ('120', 'Quilanga', '11', null);
INSERT INTO `conf_cantones` VALUES ('121', 'Olmedo', '11', null);
INSERT INTO `conf_cantones` VALUES ('122', 'Babahoyo', '12', null);
INSERT INTO `conf_cantones` VALUES ('123', 'Baba', '12', null);
INSERT INTO `conf_cantones` VALUES ('124', 'Montalvo', '12', null);
INSERT INTO `conf_cantones` VALUES ('125', 'Puebloviejo', '12', null);
INSERT INTO `conf_cantones` VALUES ('126', 'Quevedo', '12', null);
INSERT INTO `conf_cantones` VALUES ('127', 'Urdaneta', '12', null);
INSERT INTO `conf_cantones` VALUES ('128', 'Ventanas', '12', null);
INSERT INTO `conf_cantones` VALUES ('129', 'Vínces', '12', null);
INSERT INTO `conf_cantones` VALUES ('130', 'Palenque', '12', null);
INSERT INTO `conf_cantones` VALUES ('131', 'Buena Fé', '12', null);
INSERT INTO `conf_cantones` VALUES ('132', 'Valencia', '12', null);
INSERT INTO `conf_cantones` VALUES ('133', 'Mocache', '12', null);
INSERT INTO `conf_cantones` VALUES ('134', 'Quinsaloma', '12', null);
INSERT INTO `conf_cantones` VALUES ('135', 'Portoviejo', '13', null);
INSERT INTO `conf_cantones` VALUES ('136', 'Bolívar', '13', null);
INSERT INTO `conf_cantones` VALUES ('137', 'Chone', '13', null);
INSERT INTO `conf_cantones` VALUES ('138', 'El Carmen', '13', null);
INSERT INTO `conf_cantones` VALUES ('139', 'Flavio Alfaro', '13', null);
INSERT INTO `conf_cantones` VALUES ('140', 'Jipijapa', '13', null);
INSERT INTO `conf_cantones` VALUES ('141', 'Junín', '13', null);
INSERT INTO `conf_cantones` VALUES ('142', 'Manta', '13', null);
INSERT INTO `conf_cantones` VALUES ('143', 'Montecristi', '13', null);
INSERT INTO `conf_cantones` VALUES ('144', 'Paján', '13', null);
INSERT INTO `conf_cantones` VALUES ('145', 'Pichincha', '13', null);
INSERT INTO `conf_cantones` VALUES ('146', 'Rocafuerte', '13', null);
INSERT INTO `conf_cantones` VALUES ('147', 'Santa Ana', '13', null);
INSERT INTO `conf_cantones` VALUES ('148', 'Sucre', '13', null);
INSERT INTO `conf_cantones` VALUES ('149', 'Tosagua', '13', null);
INSERT INTO `conf_cantones` VALUES ('150', '24 de Mayo', '13', null);
INSERT INTO `conf_cantones` VALUES ('151', 'Pedernales', '13', null);
INSERT INTO `conf_cantones` VALUES ('152', 'Olmedo', '13', null);
INSERT INTO `conf_cantones` VALUES ('153', 'Puerto López', '13', null);
INSERT INTO `conf_cantones` VALUES ('154', 'Jama', '13', null);
INSERT INTO `conf_cantones` VALUES ('155', 'Jaramijó', '13', null);
INSERT INTO `conf_cantones` VALUES ('156', 'San Vicente', '13', null);
INSERT INTO `conf_cantones` VALUES ('157', 'Morona', '14', null);
INSERT INTO `conf_cantones` VALUES ('158', 'Gualaquiza', '14', null);
INSERT INTO `conf_cantones` VALUES ('159', 'Limón Indanza', '14', null);
INSERT INTO `conf_cantones` VALUES ('160', 'Palora', '14', null);
INSERT INTO `conf_cantones` VALUES ('161', 'Santiago', '14', null);
INSERT INTO `conf_cantones` VALUES ('162', 'Sucúa', '14', null);
INSERT INTO `conf_cantones` VALUES ('163', 'Huamboya', '14', null);
INSERT INTO `conf_cantones` VALUES ('164', 'San Juan Bosco', '14', null);
INSERT INTO `conf_cantones` VALUES ('165', 'Taisha', '14', null);
INSERT INTO `conf_cantones` VALUES ('166', 'Logroño', '14', null);
INSERT INTO `conf_cantones` VALUES ('167', 'Pablo Sexto', '14', null);
INSERT INTO `conf_cantones` VALUES ('168', 'Tiwintza', '14', null);
INSERT INTO `conf_cantones` VALUES ('169', 'Tena', '15', null);
INSERT INTO `conf_cantones` VALUES ('170', 'Archidona', '15', null);
INSERT INTO `conf_cantones` VALUES ('171', 'El Chaco', '15', null);
INSERT INTO `conf_cantones` VALUES ('172', 'Quijos', '15', null);
INSERT INTO `conf_cantones` VALUES ('173', 'Carlos Julio Arosemena Tola', '15', null);
INSERT INTO `conf_cantones` VALUES ('174', 'Pastaza', '16', null);
INSERT INTO `conf_cantones` VALUES ('175', 'Mera', '16', null);
INSERT INTO `conf_cantones` VALUES ('176', 'Santa Clara', '16', null);
INSERT INTO `conf_cantones` VALUES ('177', 'Arajuno', '16', null);
INSERT INTO `conf_cantones` VALUES ('178', 'Quito', '17', null);
INSERT INTO `conf_cantones` VALUES ('179', 'Cayambe', '17', null);
INSERT INTO `conf_cantones` VALUES ('180', 'Mejia', '17', null);
INSERT INTO `conf_cantones` VALUES ('181', 'Pedro Moncayo', '17', null);
INSERT INTO `conf_cantones` VALUES ('182', 'Rumiñahui', '17', null);
INSERT INTO `conf_cantones` VALUES ('183', 'San Miguel de Los Bancos', '17', null);
INSERT INTO `conf_cantones` VALUES ('184', 'Pedro Vicente Maldonado', '17', null);
INSERT INTO `conf_cantones` VALUES ('185', 'Puerto Quito', '17', null);
INSERT INTO `conf_cantones` VALUES ('186', 'Ambato', '18', null);
INSERT INTO `conf_cantones` VALUES ('187', 'Baños de Agua Santa', '18', null);
INSERT INTO `conf_cantones` VALUES ('188', 'Cevallos', '18', null);
INSERT INTO `conf_cantones` VALUES ('189', 'Mocha', '18', null);
INSERT INTO `conf_cantones` VALUES ('190', 'Patate', '18', null);
INSERT INTO `conf_cantones` VALUES ('191', 'Quero', '18', null);
INSERT INTO `conf_cantones` VALUES ('192', 'San Pedro de Pelileo', '18', null);
INSERT INTO `conf_cantones` VALUES ('193', 'Santiago de Píllaro', '18', null);
INSERT INTO `conf_cantones` VALUES ('194', 'Tisaleo', '18', null);
INSERT INTO `conf_cantones` VALUES ('195', 'Zamora', '19', null);
INSERT INTO `conf_cantones` VALUES ('196', 'Chinchipe', '19', null);
INSERT INTO `conf_cantones` VALUES ('197', 'Nangaritza', '19', null);
INSERT INTO `conf_cantones` VALUES ('198', 'Yacuambi', '19', null);
INSERT INTO `conf_cantones` VALUES ('199', 'Yantzaza (Yanzatza)', '19', null);
INSERT INTO `conf_cantones` VALUES ('200', 'El Pangui', '19', null);
INSERT INTO `conf_cantones` VALUES ('201', 'Centinela del Cóndor', '19', null);
INSERT INTO `conf_cantones` VALUES ('202', 'Palanda', '19', null);
INSERT INTO `conf_cantones` VALUES ('203', 'Paquisha', '19', null);
INSERT INTO `conf_cantones` VALUES ('204', 'San Cristóbal', '20', null);
INSERT INTO `conf_cantones` VALUES ('205', 'Isabela', '20', null);
INSERT INTO `conf_cantones` VALUES ('206', 'Santa Cruz', '20', null);
INSERT INTO `conf_cantones` VALUES ('207', 'Lago Agrio', '21', null);
INSERT INTO `conf_cantones` VALUES ('208', 'Gonzalo Pizarro', '21', null);
INSERT INTO `conf_cantones` VALUES ('209', 'Putumayo', '21', null);
INSERT INTO `conf_cantones` VALUES ('210', 'Shushufindi', '21', null);
INSERT INTO `conf_cantones` VALUES ('211', 'Sucumbíos', '21', null);
INSERT INTO `conf_cantones` VALUES ('212', 'Cascales', '21', null);
INSERT INTO `conf_cantones` VALUES ('213', 'Cuyabeno', '21', null);
INSERT INTO `conf_cantones` VALUES ('214', 'Orellana', '22', null);
INSERT INTO `conf_cantones` VALUES ('215', 'Aguarico', '22', null);
INSERT INTO `conf_cantones` VALUES ('216', 'La Joya de Los Sachas', '22', null);
INSERT INTO `conf_cantones` VALUES ('217', 'Loreto', '22', null);
INSERT INTO `conf_cantones` VALUES ('218', 'Santo Domingo', '23', null);
INSERT INTO `conf_cantones` VALUES ('219', 'Santa Elena', '24', null);
INSERT INTO `conf_cantones` VALUES ('220', 'La Libertad', '24', null);
INSERT INTO `conf_cantones` VALUES ('221', 'Salinas', '24', null);
INSERT INTO `conf_cantones` VALUES ('222', 'Las Golondrinas', '25', null);
INSERT INTO `conf_cantones` VALUES ('223', 'Manga del Cura', '25', null);
INSERT INTO `conf_cantones` VALUES ('224', 'El Piedrero', '25', null);

-- ----------------------------
-- Table structure for conf_cuadro_nacional_de_medicamentos_basicos
-- ----------------------------
DROP TABLE IF EXISTS `conf_cuadro_nacional_de_medicamentos_basicos`;
CREATE TABLE `conf_cuadro_nacional_de_medicamentos_basicos` (
  `id_cnmb` int(255) NOT NULL AUTO_INCREMENT,
  `código` varchar(255) DEFAULT NULL,
  `descripción` varchar(255) DEFAULT NULL,
  `forma_farmacéutica` varchar(255) DEFAULT NULL,
  `concentración` varchar(255) DEFAULT NULL,
  `nivel_prescripción` varchar(255) DEFAULT NULL,
  `nivel_atención_1` varchar(255) DEFAULT NULL,
  `nivel_atención_2` varchar(255) DEFAULT NULL,
  `nivel_atención_3` varchar(255) DEFAULT NULL,
  `vía_administrativa` varchar(255) DEFAULT NULL,
  `uso_exclusivo` varchar(255) DEFAULT NULL,
  `valor_unitario` varchar(255) DEFAULT NULL,
  `restingido` varchar(255) DEFAULT NULL,
  `autorizados` varchar(255) DEFAULT NULL,
  `id_tecnico` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_cnmb`),
  KEY `código` (`código`(191))
) ENGINE=InnoDB AUTO_INCREMENT=917 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of conf_cuadro_nacional_de_medicamentos_basicos
-- ----------------------------
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('1', 'J05AF06', 'Abacavir', 'Líquido oral', '10 mg/mL', 'E -p-', '', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('2', 'J05AF06', 'Abacavir', 'Líquido oral', '20 mg/mL', 'E -p-', '', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('3', 'J05AF06', 'Abacavir', 'Sólido oral ', '300 mg', '-p-', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('4', 'S01EC01', 'Acetazolamida', 'Sólido oral', '250 mg', 'E -p-', '', '2', '3', 'O', '', '0.24', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('5', 'R05CB01', 'Acetilcisteína', 'Líquido para inhalación', '100 mg/mL', 'E', '', '2', '3', 'I', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('6', 'V03AB23', 'Acetilcisteína', 'Líquido parenteral', '100 mg/mL ', 'E -p-', '', '2', '3', 'P', '', '1.17', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('7', 'J05AB01', 'Aciclovir', 'Líquido oral', '200 mg/5mL', '', '1', '2', '3', 'O', '', '0.25', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('8', 'S01AD03', 'Aciclovir', 'Semisólido oftálmico', '3 %', 'E', '', '2', '3', 'Oc', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('9', 'J05AB01', 'Aciclovir', 'Sólido oral ', '200 mg', '', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('10', 'J05AB01', 'Aciclovir', 'Sólido oral ', '400 mg', '', '1', '2', '3', 'O', '', '0.21', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('11', 'J05AB01', 'Aciclovir', 'Sólido oral ', '800 mg', '', '1', '2', '3', 'O', '', '0.55', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('12', 'J05AB01', 'Aciclovir', 'Sólido parenteral', '250 mg', 'HE', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('13', 'B01AC06', 'Ácido acetilsalicílico', 'Sólido oral', '100 mg', '', '1', '2', '3', 'O', '', '0.04', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('14', 'N02BA01', 'Ácido acetilsalicílico', 'Sólido oral', '500 mg', '', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('15', 'M05BA04', 'Ácido alendrónico -Alendronato sódico-', 'Sólido oral ', '70 mg', '', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('16', 'A11GA01', 'Ácido ascórbico -Vitamina C-', 'Líquido parenteral', '100 mg/mL', '', '', '2', '3', 'P', '', '0.35', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('17', 'B03BB01', 'Ácido fólico', 'Sólido oral', '1 mg', '', '1', '2', '3', 'O', '', '0.01', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('18', 'B03BB01', 'Ácido fólico', 'Sólido oral', '5 mg', '', '1', '2', '3', 'O', '', '0.04', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('19', 'D06AX01', 'Ácido fusídico', 'Semisólido cutáneo', '2 %', '', '1', '2', '3', 'T', '', '2.67', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('20', 'B02AA02', 'Ácido tranexámico', 'Líquido parenteral', '100 mg/mL', 'HE', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('21', 'B02AA02', 'Ácido tranexámico', 'Sólido oral', '250 mg', 'E', '', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('22', 'B02AA02', 'Ácido tranexámico', 'Sólido oral', '500 mg', 'E', '', '2', '3', 'O', '', '0.93', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('23', 'L01XX14', 'Ácido Trans Retinoico -Tretinoína-*', 'Sólido oral', '10 mg', 'HE', '', '2', '3', 'O', '*Leucemia promielocítica aguda -LPA-, en pacientes de nuevo diagnóstico, recidivantes o refractarios a la quimioterapia.  ', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('24', 'N03AG01', 'Ácido valproico -sal sódica-', 'Líquido oral', '200 mg/mL', '-p-', '', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('25', 'N03AG01', 'Ácido valproico -sal sódica-', 'Líquido oral', '250 mg/5 mL', '-p-', '', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('26', 'N03AG01', 'Ácido valproico -sal sódica-', 'Líquido oral', '375 mg/mL', '-p-', '', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('27', 'N03AG01', 'Ácido valproico -sal sódica-', 'Líquido parenteral ', '100 mg/mL', '-p-', '1', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('28', 'N03AG01', 'Ácido valproico -sal sódica-', 'Sólido oral', '250 mg', '-p-', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('29', 'N03AG01', 'Ácido valproico -sal sódica-', 'Sólido oral', '500 mg', '-p-', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('30', 'M05BA08', 'Ácido zolendrónico', 'Líquido parenteral o sólido parenteral', '4 mg', 'E', '', '', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('31', 'L04AB04', 'Adalimumab*', 'Líquido parenteral', '40 mg', 'HE', '', '2', '3', 'P', '*Artritis psoriásica, artritis reumatoidea activa de intensidad moderada y grave  que no ceden a otros ANTI TNF presentes en el CNMB,  psoriasis.', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('32', 'D10AD03', 'Adapaleno', 'Semisólido cutáneo', '0,1 %', '', '1', '2', '3', 'T', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('33', 'C01EB10', 'Adenosina', 'Líquido parenteral', '3 mg/mL', 'E', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('34', 'L01XE13', 'Afatinib*', 'Sólido oral', '20 mg', 'HE', '', '', '3', 'O', '*Tratamiento de pacientes adultos con cáncer de pulmón de células no pequeñas -CPCNP- localmente avanzado o metastásico, con mutaciones del EGFR  específicamente deleción del exón 19. Antes de comenzar el tratamiento con Afatinib, los pacientes deber ser ', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('35', 'L01XE13', 'Afatinib*', 'Sólido oral', '30 mg', 'HE', '', '', '3', 'O', '*Tratamiento de pacientes adultos con cáncer de pulmón de células no pequeñas -CPCNP- localmente avanzado o metastásico, con mutaciones del EGFR  específicamente deleción del exón 19. Antes de comenzar el tratamiento con Afatinib, los pacientes deber ser ', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('36', 'L01XE13', 'Afatinib*', 'Sólido oral', '40 mg', 'HE', '', '', '3', 'O', '*Tratamiento de pacientes adultos con cáncer de pulmón de células no pequeñas -CPCNP- localmente avanzado o metastásico, con mutaciones del EGFR  específicamente deleción del exón 19. Antes de comenzar el tratamiento con Afatinib, los pacientes deber ser ', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('37', 'L01XE13', 'Afatinib*', 'Sólido oral', '50 mg', 'HE', '', '', '3', 'O', '*Tratamiento de pacientes adultos con cáncer de pulmón de células no pequeñas -CPCNP- localmente avanzado o metastásico, con mutaciones del EGFR  específicamente deleción del exón 19. Antes de comenzar el tratamiento con Afatinib, los pacientes deber ser ', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('38', 'B05AA06', 'Agentes gelatinas ', 'Líquido parenteral', '3,5 %', 'H', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('39', 'B05AA06', 'Agentes gelatinas ', 'Líquido parenteral', '4 %', 'H', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('40', 'B05AA06', 'Agentes gelatinas ', 'Líquido parenteral', '5,5 %', 'H', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('41', 'V07AB', 'Agua para inyección', 'Líquido parenteral', '5 mL', '', '1', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('42', 'V07AB', 'Agua para inyección', 'Líquido parenteral', '10 mL', '', '1', '2', '3', 'P', '', '0.26', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('43', 'V07AB', 'Agua para inyección', 'Líquido parenteral', '250 mL', '', '1', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('44', 'V07AB', 'Agua para irrigación*', 'Líquido parenteral', '3.000 mL', '', '1', '2', '3', 'P', '*No inyectable', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('45', 'P02CA03', 'Albendazol', 'Líquido oral', '20 mg/mL', '', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('46', 'P02CA03', 'Albendazol', 'Sólido oral', '400 mg', '', '1', '2', '3', 'O', '', '0.15', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('47', 'B05AA01', 'Albúmina Humana* ', 'Líquido parenteral', '0,2', 'E', '', '2', '3', 'P', '*Plasmaféresis, ascitis refractaria,  recambio plasmático en neonatos, compensación  en caso de trasplantes.', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('48', 'M04AA01', 'Alopurinol', 'Sólido oral ', '100 mg', '', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('49', 'M04AA01', 'Alopurinol', 'Sólido oral ', '300 mg', '', '1', '2', '3', 'O', '', '0.06', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('50', 'N05BA12', 'Alprazolam', 'Sólido oral', '0,25 mg', '', '1', '2', '3', 'O', '', '0.11', 'Rojo', 'x', null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('51', 'N05BA12', 'Alprazolam', 'Sólido oral', '0,50 mg', '', '1', '2', '3', 'O', '', '0.2', 'Rojo', 'x', null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('52', 'C01EA01', 'Alprostadil* ', 'Líquido parenteral', '20 mcg/mL', 'E', '', '2', '3', 'P', '*Cardiopatías simples o complejas -Cardiopatías Ductus Dependientes- con estenosis severa o atresia pulmonar cuya circulación pulmonar depende exclusivamente del ductus. ', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('53', 'C01EA01', 'Alprostadil* ', 'Líquido parenteral', '500 mcg/mL', 'E', '', '2', '3', 'P', '*Cardiopatías simples o complejas -Cardiopatías Ductus Dependientes- con estenosis severa o atresia pulmonar cuya circulación pulmonar depende exclusivamente del ductus. ', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('54', 'D05AA', 'Alquitrán de hulla', 'Líquido cutáneo', '5 %', '', '1', '2', '3', 'T', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('55', 'B01AD02', 'Alteplasa*', 'Sólido parenteral', '50 mg', 'HE', '', '2', '3', 'P', '*Ictus isquémico  agudo entre las 3 a 4 horas y media del inicio de los síntomas. Infarto agudo de miocardio.', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('56', 'J02AA01', 'Amfotericina B ', 'Sólido parenteral', '50 mg', 'HE-p-', '', '2', '3', 'P', '', '', 'Celeste', 'x', null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('57', 'J02AA01', 'Amfotericina B liposomal*', 'Líquido parenteral', '50 mg', 'HE-p-', '', '2', '3', 'P', '*Micosis sistémica en pacientes con alto riesgo de  desarrollar falla renal. Uso exclusivo bajo resolución de comité de infecciones.', '', 'Celeste', 'x', null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('58', 'V03AF05', 'Amifostina', 'Sólido parenteral', '500 mg', 'E -p-', '', '', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('59', 'J01GB06', 'Amikacina', 'Líquido parenteral', '250 mg/mL', '', '', '2', '3', 'P', '', '0.95', 'Amarillo', 'x', null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('60', 'J01GB06', 'Amikacina', 'Líquido parenteral', '50 mg/mL', '', '', '2', '3', 'P', '', '0.35', 'Amarillo', 'x', null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('61', 'B05BA01', 'Aminoácidos', 'Líquido parenteral', '10 %', 'HE', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('62', 'B05BA01', 'Aminoácidos', 'Líquido parenteral', '15 %', 'HE', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('63', 'R03DA05', 'Aminofilina', 'Líquido parenteral', '25 mg/mL', 'H', '', '2', '3', 'P', '', '1', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('64', 'C01BD01', 'Amiodarona', 'Líquido parenteral', '50 mg/mL', 'HE', '', '2', '3', 'P', '', '1.55', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('65', 'C01BD01', 'Amiodarona', 'Sólido oral', '200 mg', '', '', '2', '3', 'O', '', '0.30', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('66', 'N06AA09', 'Amitriptilina', 'Sólido oral', '10 mg', '-p-', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('67', 'N06AA09', 'Amitriptilina', 'Sólido oral', '25 mg', '-p-', '1', '2', '3', 'O', '', '0.07', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('68', 'C08CA01', 'Amlodipina', 'Sólido oral ', '10 mg', '', '1', '2', '3', 'O', '', '0.05', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('69', 'C08CA01', 'Amlodipina', 'Sólido oral ', '5 mg', '', '1', '2', '3', 'O', '', '0.05', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('70', 'J01CR02', 'Amoxicilina + Ácido clavulánico', 'Sólido oral  -polvo-', '-125 mg + 31,25 mg-/5 mL', '', '1', '2', '3', 'O', '', '', 'Celeste', 'x', null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('71', 'J01CR02', 'Amoxicilina + Ácido clavulánico', 'Sólido oral  -polvo-', '-250 mg + 62,5 mg-/5 mL', '', '1', '2', '3', 'O', '', '4.71', 'Celeste', 'x', null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('72', 'J01CR02', 'Amoxicilina + Ácido clavulánico', 'Sólido oral ', '500 mg + 125 mg', '', '1', '2', '3', 'O', '', '0.46', 'Celeste', 'x', null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('73', 'J01CR02', 'Amoxicilina + Ácido clavulánico', 'Sólido parenteral', '1.000 mg + 200 mg', 'H', '', '2', '3', 'P', '', '', 'Celeste', 'x', null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('74', 'J01CA04', 'Amoxicilina', 'Sólido oral -polvo-', '100 mg/mL', '', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('75', 'J01CA04', 'Amoxicilina', 'Sólido oral -polvo-', '250 mg/5mL', '', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('76', 'J01CA04', 'Amoxicilina', 'Sólido oral ', '500 mg ', '', '1', '2', '3', 'O', '', '0.05', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('77', 'J01CR01', 'Ampicilina + Sulbactam', 'Sólido parenteral', '1.000 mg + 500 mg', '', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('78', 'J01CA01', 'Ampicilina', 'Sólido parenteral', '1.000 mg', '', '1', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('79', 'J01CA01', 'Ampicilina', 'Sólido parenteral', '500 mg', '', '1', '2', '3', 'P', '', '30', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('80', 'S01HA', 'Anéstesico local oftálmico', 'Líquido oftálmico', '', 'E -p-', '1', '2', '3', 'Oc', '', '1.72', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('81', 'P01BF01', 'Artemeter + lumefantrina', 'Sólido oral', '20 mg + 120 mg', '', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('82', 'P01BE03', 'Artesunato*', 'Sólido parenteral', '60 mg', '', '', '2', '3', 'P', '*Manejo intrahospitalario de malaria severa', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('83', 'L01XX02', 'Asparaginasa', 'Sólido parenteral', '10.000 UI', 'HE-p-', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('84', 'J05AE08', 'Atazanavir', 'Sólido oral ', '150 mg', '-p-', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('85', 'J05AE08', 'Atazanavir', 'Sólido oral ', '200 mg', '-p-', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('86', 'C07AB03', 'Atenolol', 'Sólido oral ', '100 mg', '', '1', '2', '3', 'O', '', '0.18', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('87', 'C07AB03', 'Atenolol', 'Sólido oral ', '50 mg', '', '1', '2', '3', 'O', '', '0.17', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('88', 'C10AA05', 'Atorvastatina ', 'Sólido oral', '20 mg*', 'E', '', '2', '3', 'O', '*Manejo de dislipidemias en pacientes con VIH', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('89', 'C10AA05', 'Atorvastatina ', 'Sólido oral', '40 mg*', 'E', '', '2', '3', 'O', '*Manejo de dislipidemias en pacientes con VIH', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('90', 'C10AA05', 'Atorvastatina ', 'Sólido oral', '80 mg*', 'E ', '', '', '3', 'O', '*Síndrome Coronario Agudo de alto y muy alto  riesgo que requieren dosis altas de estatinas -80 mg- para manejo intensivo. ', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('91', 'S01FA01', 'Atropina', 'Líquido oftálmico', '0,5 %', 'E -p-', '', '2', '3', 'Oc', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('92', 'S01FA01', 'Atropina', 'Líquido oftálmico', '1 %', 'E -p-', '', '2', '3', 'Oc', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('93', 'A03BA01', 'Atropina', 'Líquido parenteral', '1 mg/mL', '', '1', '2', '3', 'P', '', '0.11', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('94', 'L04AX01', 'Azatioprina', 'Sólido oral ', '50 mg', 'E -p-', '', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('95', 'L04AX01', 'Azatioprina', 'Sólido parenteral', '100 mg', 'E -p-', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('96', 'J01FA10', 'Azitromicina', 'Sólido oral  -polvo-', '200 mg/5 mL ', '', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('97', 'J01FA10', 'Azitromicina', 'Sólido oral ', '250 mg', '', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('98', 'J01FA10', 'Azitromicina', 'Sólido oral ', '500 mg', '', '1', '2', '3', 'O', '', '0.15', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('99', 'L04AC02', 'Basiliximab', 'Sólido parenteral', '10 mg', 'HE-p-', '', '', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('100', 'L04AC02', 'Basiliximab', 'Sólido parenteral', '20 mg', 'HE-p-', '', '', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('101', 'R03BA01', 'Beclometasona', 'Líquido para inhalación', '250 mcg/dosis', 'E', '1', '2', '3', 'I', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('102', 'R03BA01', 'Beclometasona', 'Líquido para inhalación', '50 mcg/dosis', 'E', '1', '2', '3', 'I', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('103', 'J01CE01', 'Bencilpenicilina -Penicilina G Cristalina-', 'Sólido parenteral', '1´000.000 UI', '', '1', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('104', 'J01CE01', 'Bencilpenicilina -Penicilina G Cristalina-', 'Sólido parenteral', '5´000.000 UI', '', '1', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('105', 'J01CE08', 'Bencilpenicilina benzatínica -Penicilina G benzatínica-', 'Sólido parenteral', '1´200.000 UI', '', '1', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('106', 'J01CE08', 'Bencilpenicilina benzatínica -Penicilina G benzatínica-', 'Sólido parenteral', '2´400.000 UI', '', '1', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('107', 'J01CE08', 'Bencilpenicilina benzatínica -Penicilina G benzatínica-', 'Sólido parenteral', '600.000 UI', '', '1', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('108', 'L01AA09', 'Bendamustina*', 'Sólido parenteral', '100 mg', 'E-p- ', '', '2', '3', 'P', '*Leucemia linfocítica crónica, linfoma folicular -indolente-. Uso exclusivo bajo protocolo. ', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('109', 'L01AA09', 'Bendamustina*', 'Sólido parenteral', '25 mg', 'E-p- ', '', '2', '3', 'P', '*Leucemia linfocítica crónica, linfoma folicular -indolente-. Uso exclusivo bajo protocolo. ', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('110', 'P01CA02', 'Benznidazol', 'Sólido oral', '50 mg', '-p-', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('111', 'P01CA02', 'Benznidazol', 'Sólido oral', '100 mg', '-p-', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('112', 'H02AB01', 'Betametasona', 'Líquido parenteral', '4 mg/mL', '', '1', '2', '3', 'P', '', '0.53', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('113', 'D07AC01', 'Betametasona', 'Semisólido cutáneo/ líquido cutáneo', '0,05 %', '', '1', '2', '3', 'T', '', '1.36', 'Celeste', 'x', null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('114', 'D07AC01', 'Betametasona', 'Semisólido cutáneo/ líquido cutáneo', '0,1 %', '', '1', '2', '3', 'T', '', '', 'Celeste', 'x', null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('115', 'L01XC07', 'Bevacizumab*', 'Líquido parenteral', '25 mg/mL', 'HE -p-', '', '', '3', 'P', '*Uso exclusivo en pacientes con carcinoma de células renales, cáncer avanzado de pulmón -no microcítico-, cáncer de ovario epitelial, trompa de Falopio, CÁNCER DE CERVIX,  peritoneal primario, cáncer de colon metástico  bajo estricto protocolo y degenerac', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('116', 'L02BB03', 'Bicalutamida*', 'Sólido oral ', '50 mg', 'E ', '', '2', '3', 'O', '*Cáncer de próstata metastásico.', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('117', 'B05XA02', 'Bicarbonato de sodio', 'Líquido parenteral', '1 mEq/mL -8,4%-', '', '1', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('118', 'N04AA02', 'Biperideno', 'Líquido parenteral', '5 mg/mL', '-p-', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('119', 'N04AA02', 'Biperideno', 'Sólido oral', '2 mg', '-p-', '', '2', '3', 'O', '', '0.11', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('120', 'N04AA02', 'Biperideno', 'Sólido oral', '4 mg', '-p-', '', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('121', 'L01DC01', 'Bleomicina', 'Sólido parenteral', '15 UI', 'HE-p-', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('122', 'L01XX32', 'Bortezomib* ', 'Sólido parenteral', '3,5 mg', 'E ', '', '2', '3', 'P', '*Mieloma múltiple', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('123', 'N01BB01', 'Bupivacaína -sin epinefrina-', 'Líquido parenteral', '0,5 %', 'E -p-', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('124', 'N01BB01', 'Bupivacaína -sin epinefrina-', 'Líquido parenteral', '0,75 %', 'E -p-', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('125', 'N01BB51', 'Bupivacaína hiperbárica', 'Líquido parenteral', '0,5 %', 'HE', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('126', 'N01BB51', 'Bupivacaína hiperbárica', 'Líquido parenteral', '0,75 %', 'HE', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('127', 'N02AE01', 'Buprenorfina', 'Líquido parenteral', '0,3 mg/mL', '-p-', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('128', 'N02AE01', 'Buprenorfina', 'Parche transdérmico', '10 mg', '-p-', '1', '2', '3', 'T', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('129', 'N02AE01', 'Buprenorfina', 'Parche transdérmico', '20 mg', '-p-', '1', '2', '3', 'T', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('130', 'N02AE01', 'Buprenorfina', 'Parche transdérmico', '5 mg', '-p-', '1', '2', '3', 'T', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('131', 'N02AE01', 'Buprenorfina', 'Sólido oral -Sublingual-', '0,2 mg', '-p-', '', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('132', 'A03BB01', 'Butilescopolamina -N-butilbromuro de hioscina-', 'Líquido parenteral', '20 mg/mL', '', '1', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('133', 'G02CB03', 'Cabergolina ', 'Sólido oral', '0,5 mg', 'E', '', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('134', 'N04BC06', 'Cabergolina', 'Sólido oral', '0,5 mg', 'E', '', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('135', 'N06BC01', 'Cafeína*', 'Líquido parenteral ', '20 mg/mL', '', '', '2', '3', 'P', '*Apnea en prematuros', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('136', 'N06BC01', 'Cafeína*', 'Sólido oral', '100 mg', '', '', '2', '3', 'O', '*Apnea en prematuros', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('137', 'N06BC01', 'Cafeína*', 'Sólido oral', '200 mg', '', '', '2', '3', 'O', '*Apnea en prematuros', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('138', 'A12AA04', 'Calcio carbonato*', 'Sólido oral', '500 mg', '', '1', '2', '3', 'O', '*Uso exclusivo en mujeres con alto riesgo de preeclampsia, en embarazadas que viven en áreas donde la ingesta de calcio es baja y en pacientes que se encuentran en uso crónico de corticoides', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('139', 'A12AA03', 'Calcio gluconato', 'Líquido parenteral', '10 %', '', '1', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('140', 'D05AX52', 'Calcipotriol + Betametasona dipropionato', 'Semisólido cutáneo', '-50 mcg + 0,5 mg-/g', 'E', '', '2', '3', 'T', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('141', 'A11CC04', 'Calcitriol', 'Sólido oral', '0,5 mcg', 'E', '', '2', '3', 'O', '', '0.22', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('142', 'L01BC06', 'Capecitabina', 'Sólido oral ', '500 mg', 'E -p-', '', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('143', 'J04AB30', 'Capreomicina', 'Sólido parenteral', '1.000 mg', '-p-', '1', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('144', 'N03AF01', 'Carbamazepina', 'Líquido oral', '100 mg/5 mL', '-p-', '1', '2', '3', 'O', '', '1.45', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('145', 'N03AF01', 'Carbamazepina', 'Sólido oral \n-Liberación controlada-', '400 mg', '-p-', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('146', 'N03AF01', 'Carbamazepina', 'Sólido oral', '200 mg', '-p-', '1', '2', '3', 'O', '', '0.06', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('147', 'B05BA03', 'Carbohidratos -Dextrosa en agua-', 'Líquido parenteral', '10 %', 'H', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('148', 'B05BA03', 'Carbohidratos -Dextrosa en agua-', 'Líquido parenteral', '5 %', '', '1', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('149', 'B05BA03', 'Carbohidratos -Dextrosa en agua-', 'Líquido parenteral', '50 %', 'H', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('150', 'A07BA01', 'Carbón Activado', 'Sólido oral', '', '', '1', '2', '3', 'O', '', '', 'Celeste', 'x', null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('151', 'L01XA02', 'Carboplatino', 'Líquido parenteral', '10 mg/mL', 'HE-p-', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('152', 'L01XA02', 'Carboplatino', 'Sólido parenteral', '150 mg', 'HE-p-', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('153', 'L01XA02', 'Carboplatino', 'Sólido parenteral', '450 mg', 'HE-p-', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('154', 'C07AG02', 'Carvedilol', 'Sólido oral ', '12,5 mg', 'E', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('155', 'C07AG02', 'Carvedilol', 'Sólido oral ', '25 mg', 'E', '1', '2', '3', 'O', '', '0.37', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('156', 'C07AG02', 'Carvedilol', 'Sólido oral ', '6,25 mg', 'E', '1', '2', '3', 'O', '', '0.04', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('157', 'J02AX04', 'Caspofungina*', 'Sólido parenteral', '50 mg', 'HE-p-', '', '2', '3', 'P', '*Uso exclusivo en pacientes con aspergilosis resistente a voriconazol y cuando esté contraindicado el uso de Anfotericina B.', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('158', 'J02AX04', 'Caspofungina*', 'Sólido parenteral', '70 mg', 'HE-p-', '', '2', '3', 'P', '*Uso exclusivo en pacientes con aspergilosis resistente a voriconazol y cuando esté contraindicado el uso de Anfotericina B.', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('159', 'J01DB01', 'Cefalexina', 'Sólido oral ', '250 mg/5mL', '', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('160', 'J01DB01', 'Cefalexina', 'Sólido oral ', '500 mg', '', '1', '2', '3', 'O', '', '0.10', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('161', 'J01DB04', 'Cefazolina', 'Sólido parenteral', '1.000 mg', 'H', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('162', 'J01DE01', 'Cefepima', 'Sólido parenteral', '1.000 mg', 'HE-p-', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('163', 'J01DD01', 'Cefotaxima', 'Sólido parenteral', '1.000 mg', 'HE-p-', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('164', 'J01DD02', 'Ceftazidima', 'Sólido parenteral', '1.000 mg', 'HE-p-', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('165', 'J01DD02', 'Ceftazidima', 'Sólido parenteral', '500 mg', 'HE-p-', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('166', 'J01DD04', 'Ceftriaxona', 'Sólido parenteral', '1.000 mg', 'HE-p-', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('167', 'J01DD04', 'Ceftriaxona', 'Sólido parenteral', '500 mg', 'HE-p-', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('168', 'J01DC02', 'Cefuroxima ', 'Sólido oral -polvo-', '125 mg/5 mL', '', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('169', 'J01DC02', 'Cefuroxima ', 'Sólido oral -polvo-', '250 mg/5 mL', '', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('170', 'J01DC02', 'Cefuroxima ', 'Sólido oral', '250 mg', '', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('171', 'J01DC02', 'Cefuroxima ', 'Sólido oral', '500 mg', '', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('172', 'J01DC02', 'Cefuroxima ', 'Sólido parenteral', '750 mg', 'E', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('173', 'L01XC06', 'Cetuximab* ', 'Líquido parenteral', '5 mg/mL', 'HE', '', '', '3', 'P', '*Pacientes con cáncer de células escamosas de cabeza y cuello; cáncer colorectal metastásico con expresión del receptor del factor de crecimiento epidérmico - EGFR-, con gen RAS de tipo nativo diagnosticado con un método validado.  ', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('174', 'L01AA01', 'Ciclofosfamida', 'Sólido oral ', '50 mg', 'E-p-', '', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('175', 'L01AA01', 'Ciclofosfamida', 'Sólido parenteral', '1.000 mg', '', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('176', 'L01AA01', 'Ciclofosfamida', 'Sólido parenteral', '500 mg', '', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('177', 'J04AB01', 'Cicloserina', 'Sólido oral ', '250 mg', '-p-', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('178', 'L04AD01', 'Ciclosporina', 'Líquido oral', '100 mg/mL', 'E', '', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('179', 'L04AD01', 'Ciclosporina', 'Líquido parenteral', '50 mg/mL', 'HE', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('180', 'L04AD01', 'Ciclosporina', 'Sólido oral ', '100 mg', 'E', '', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('181', 'L04AD01', 'Ciclosporina', 'Sólido oral ', '25 mg', 'E', '', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('182', 'L04AD01', 'Ciclosporina', 'Sólido oral ', '50 mg', 'E', '', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('183', 'S01AE03', 'Ciprofloxacina', 'Líquido oftálmico', '0,3 %', '', '1', '2', '3', 'Oc', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('184', 'J01MA02', 'Ciprofloxacina', 'Líquido parenteral', '10 mg/mL', 'HE', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('185', 'J01MA02', 'Ciprofloxacina', 'Líquido parenteral', '2 mg/mL', 'HE', '', '2', '3', 'P', '', '3.15', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('186', 'J01MA02', 'Ciprofloxacina', 'Líquido parenteral', '20 mg/mL', 'HE', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('187', 'J01MA02', 'Ciprofloxacina', 'Sólido oral ', '500 mg ', '', '1', '2', '3', 'O', '', '0.06', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('188', 'L01XA01', 'Cisplatino', 'Líquido parenteral', '0,5 mg/mL', 'HE-p-', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('189', 'L01XA01', 'Cisplatino', 'Líquido parenteral', '1 mg/mL', 'HE-p-', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('190', 'L01XA01', 'Cisplatino', 'Sólido parenteral', '10 mg', 'HE-p-', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('191', 'L01XA01', 'Cisplatino', 'Sólido parenteral', '50 mg', 'HE-p-', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('192', 'L01BC01', 'Citarabina', 'Sólido parenteral', '1.000 mg', 'HE-p-', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('193', 'L01BC01', 'Citarabina', 'Sólido parenteral', '100 mg', 'HE-p-', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('194', 'L01BC01', 'Citarabina', 'Sólido parenteral', '500 mg', 'HE-p-', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('195', 'J01FA09', 'Claritromicina', 'Sólido oral  -polvo-', '125 mg/5 mL', '', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('196', 'J01FA09', 'Claritromicina', 'Sólido oral  -polvo-', '250 mg/5 mL', '', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('197', 'J01FA09', 'Claritromicina', 'Sólido oral ', '500 mg', '', '1', '2', '3', 'O', '', '0.31', 'Amarillo', 'x', null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('198', 'J01FA09', 'Claritromicina', 'Sólido parenteral', '500 mg', 'HE-p-', '', '2', '3', 'P', '', '11', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('199', 'D10AF01', 'Clindamicina', 'Líquido cutáneo ', '0,01', '', '1', '2', '3', 'T', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('200', 'J01FF01', 'Clindamicina', 'Líquido parenteral', '150 mg/mL', 'HE -p-', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('201', 'J01FF01', 'Clindamicina', 'Sólido oral ', '300 mg', '', '1', '2', '3', 'O', '', '0.13', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('202', 'G01AA10', 'Clindamicina', 'Sólido vaginal', '100 mg', '', '1', '2', '3', 'V', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('203', 'N05BA09', 'Clobazam*', 'Sólido oral ', '10 mg', '', '', '2', '3', 'O', '*Tratamiento coadyuvante en niños con epilepsia generalizada, así como refractarias', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('204', 'J04BA01', 'Clofazimina', 'Sólido oral ', '100 mg', 'E-p-', '', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('205', 'G03GB02', 'Clomifeno', 'Sólido oral ', '50 mg', 'E', '', '2', '3', 'O', '', '0.38', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('206', 'N03AE01', 'Clonazepam', 'Líquido oral', '2,5 mg/mL', '-p-', '1', '2', '3', 'O', '', '1', 'Rojo', 'x', null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('207', 'N03AE01', 'Clonazepam', 'Sólido oral', '0,5 mg', '-p-', '1', '2', '3', 'O', '', '1', 'Rojo', 'x', null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('208', 'N03AE01', 'Clonazepam', 'Sólido oral', '1 mg', '-p-', '1', '2', '3', 'O', '', '1', 'Rojo', 'x', null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('209', 'N03AE01', 'Clonazepam', 'Sólido oral', '2 mg', '-p-', '1', '2', '3', 'O', '', '1', 'Rojo', 'x', null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('210', 'B01AC04', 'Clopidogrel', 'Sólido oral', '300 mg', 'E', '', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('211', 'B01AC04', 'Clopidogrel', 'Sólido oral', '75 mg', 'E', '', '2', '3', 'O', '', '1.29', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('212', 'L01AA02', 'Clorambucilo', 'Sólido oral ', '2 mg', 'E-p-', '', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('213', 'S01AA01', 'Cloranfenicol', 'Líquido oftálmico', '0,25 %', '', '1', '2', '3', 'Oc', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('214', 'S01AA01', 'Cloranfenicol', 'Líquido oftálmico', '0,5 %', '', '1', '2', '3', 'Oc', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('215', 'S01AA01', 'Cloranfenicol', 'Semisólido oftálmico', '1 %', '', '1', '2', '3', 'Oc', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('216', 'P01BA01', 'Cloroquina', 'Líquido parenteral', '40 mg/mL', 'H', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('217', 'P01BA01', 'Cloroquina', 'Sólido oral', '250 mg', '', '1', '2', '3', 'O', '', '0.04', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('218', 'N05AA01', 'Clorpromazina', 'Líquido parenteral', '12,5 mg/mL', 'E', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('219', 'N05AA01', 'Clorpromazina', 'Sólido oral', '100 mg', 'E', '', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('220', 'N05AA01', 'Clorpromazina', 'Sólido oral', '25 mg', 'E', '', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('221', 'C03BA04', 'Clortalidona', 'Sólido oral ', '25 mg', '', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('222', 'C03BA04', 'Clortalidona', 'Sólido oral ', '50 mg', '', '1', '2', '3', 'O', '', '0.08', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('223', 'B05XA01', 'Cloruro de Potasio', 'Líquido parenteral', '2 mEq/mL ', '', '1', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('224', 'B05CB01', 'Cloruro de sodio', 'Líquido parenteral', '0,9 %', '', '1', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('225', 'B05XA03', 'Cloruro de sodio', 'Líquido parenteral', '3,4 mEq/mL -20%-', '', '1', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('226', 'D01AC01', 'Clotrimazol', 'Líquido cutáneo', '1 %', '', '1', '2', '3', 'T', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('227', 'D01AC01', 'Clotrimazol', 'Semisólido cutáneo', '1 %', '', '1', '2', '3', 'T', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('228', 'G01AF02', 'Clotrimazol', 'Semisólido vaginal', '0,02', '', '1', '2', '3', 'V', '', '1.54', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('229', 'G01AF02', 'Clotrimazol', 'Semisólido vaginal', '1 %', '', '1', '2', '3', 'V', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('230', 'G01AF02', 'Clotrimazol', 'Sólido vaginal ', '100 mg', '', '1', '2', '3', 'V', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('231', 'G01AF02', 'Clotrimazol', 'Sólido vaginal ', '200 mg', '', '1', '2', '3', 'V', '', '0.25', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('232', 'G01AF02', 'Clotrimazol', 'Sólido vaginal ', '500 mg', '', '1', '2', '3', 'V', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('233', 'N02AA08', 'Codeína*', 'Líquido oral', '10 mg/5mL', '-p-', '1', '2', '3', 'O', '*Uso exclusivo para el manejo de dolor', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('234', 'N02AA08', 'Codeína*', 'Sólido oral', '10 mg', '-p-', '1', '2', '3', 'O', '*Uso exclusivo para el manejo de dolor', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('235', 'N02AA08', 'Codeína*', 'Sólido oral', '30 mg', '-p-', '1', '2', '3', 'O', '*Uso exclusivo para el manejo de dolor', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('236', 'M04AC01', 'Colchicina', 'Sólido oral ', '0,5 mg', '', '1', '2', '3', 'O', '', '0.27', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('237', 'J01XB01', 'Colistina*', 'Sólido parenteral', '100 mg', '', '', '2', '3', 'P', '*Uso exclusivo en pacientes con cultivo sensible a colistina y resistente a otras opciones que constan en el CNMB', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('238', 'B05CB10', 'Combinaciones -Lactato de Ringer-', 'Líquido parenteral', '', '', '1', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('239', 'A11JA', 'Combinaciones de vitaminas compatibles con NPT', 'Sólido parenteral/Líquido parenteral', '', '', '1', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('240', 'A11DB', 'Complejo B: \n•Tiamina -Vitamina B1-\n•Piridoxina -Vitamina B6- \n•Cianocobalamina -Vitamina B12-', 'Líquido parenteral', '• 100 mg\n• 100 mg\n• 1 mg', '', '1', '2', '3', 'P/IM', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('241', 'A11DB', 'Complejo B: \n•Tiamina -Vitamina B1-\n•Piridoxina -Vitamina B6- \n•Cianocobalamina -Vitamina B12-', 'Sólido oral', '≥ 4 mg\n≥  1 mg\n≥  1 mcg', '', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('242', 'A11DB', 'Complejo B: \n•Tiamina -Vitamina B1-\n•Piridoxina -Vitamina B6- \n•Cianocobalamina -Vitamina B12-', 'Sólido parenteral', '• 200 mg\n• 50 mg\n• 0,03 mg\nNota:\nSe describen los componentes y concentraciones  mínimos necesarios  de esta combinación, se pueden adherir otras vitaminas del complejo B, siempre y cuando se cumplan con los requerimientos aquí detallados.', '', '', '2', '3', 'P/IV', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('243', 'J01EE01', 'Cotrimoxazol -Sulfametoxazol + Trimetoprim-', 'Líquido oral', '-200 mg + 40 mg-/5 mL', '', '1', '2', '3', 'O', '', '0.58', 'Amarillo', 'x', null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('244', 'J01EE01', 'Cotrimoxazol -Sulfametoxazol + Trimetoprim-', 'Líquido parenteral/Sólido parenteral', '400 mg + 80 mg', 'HE', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('245', 'J01EE01', 'Cotrimoxazol -Sulfametoxazol + Trimetoprim-', 'Líquido parenteral/Sólido parenteral', '800 mg + 160 mg', 'HE', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('246', 'J01EE01', 'Cotrimoxazol -Sulfametoxazol + Trimetoprim-', 'Sólido oral ', '400 mg + 80 mg', '', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('247', 'J01EE01', 'Cotrimoxazol -Sulfametoxazol + Trimetoprim-', 'Sólido oral ', '800 mg + 160 mg', '', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('248', 'L01AX04', 'Dacarbazina', 'Sólido parenteral', '100 mg', 'HE-p-', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('249', 'L01AX04', 'Dacarbazina', 'Sólido parenteral', '200 mg', 'HE-p-', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('250', 'L01DA01', 'Dactinomicina', 'Sólido parenteral', '0,5 mg', 'HE-p-', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('251', 'M03CA01', 'Dantroleno', 'Sólido parenteral', '20 mg', 'HE -p-', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('252', 'J04BA02', 'Dapsona', 'Sólido oral ', '100 mg', 'E-p-', '', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('253', 'J05AE10', 'Darunavir', 'Sólido oral ', '400 mg', '-p-', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('254', 'J05AE10', 'Darunavir', 'Sólido oral ', '600 mg', '-p-', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('255', 'L01DB02', 'Daunorubicina', 'Líquido parenteral', '2 mg/mL  ', 'HE-p-', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('256', 'L01DB02', 'Daunorubicina', 'Sólido parenteral', '20 mg', 'HE-p-', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('257', 'V03AC03', 'Deferasirox', 'Sólido oral', '125 mg', 'E -p-', '', '', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('258', 'V03AC03', 'Deferasirox', 'Sólido oral', '250 mg', 'E -p-', '', '', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('259', 'V03AC03', 'Deferasirox', 'Sólido oral', '500 mg', 'E -p-', '', '', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('260', 'H01BA02', 'Desmopresina', 'Líquido para inhalación', '100 mcg/mL', 'E', '', '2', '3', 'N', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('261', 'H01BA02', 'Desmopresina', 'Líquido parenteral', '15 mcg/mL', 'E', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('262', 'H01BA02', 'Desmopresina', 'Sólido oral', '0,1 mg', 'E', '', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('263', 'S01CA01', 'Dexametasona + Tobramicina ', 'Líquido oftálmico', '0,1 % + 0,3 %', '', '1', '2', '3', 'Oc', '', '5.33', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('264', 'S01CA01', 'Dexametasona + Tobramicina ', 'Semisólido oftálmico', '0,1 % + 0,3 %', '', '1', '2', '3', 'Oc', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('265', 'S01BA01', 'Dexametasona', 'Líquido oftálmico', '1 mg/mL', '', '1', '2', '3', 'Oc', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('266', 'H02AB02', 'Dexametasona', 'Líquido parenteral', '4 mg/mL', 'H', '', '2', '3', 'P', '', '0.45', 'Celeste', 'x', null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('267', 'H02AB02', 'Dexametasona', 'Sólido oral ', '4 mg', '', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('268', 'H02AB02', 'Dexametasona', 'Sólido oral ', '8 mg', '', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('269', 'N05CM18', 'Dexmedetomidina*', 'Líquido parenteral ', '100 mcg/mL', '', '', '2', '3', 'P', '*Para sedación de pacientes con alto riesgo de presentar delirio con ventilación mecánica asistida durante el tratamiento en unidades de cuidados intensivos', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('270', 'V03AF02', 'Dexrazoxano*', 'Sólido parenteral', '500 mg ', 'HE', '', '', '3', 'P', '*Cardioprotector previo al uso de antraciclinas en población pediátrica. ', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('271', 'N05BA01', 'Diazepam', 'Líquido oral', '0,4 mg/mL -2 mg/5 mL-', '', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('272', 'N05BA01', 'Diazepam', 'Líquido parenteral', '5 mg/mL', '', '1', '2', '3', 'P', '', '0.45', 'Rojo', 'x', null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('273', 'N05BA01', 'Diazepam', 'Sólido oral', '10 mg', '', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('274', 'N05BA01', 'Diazepam', 'Sólido oral', '5 mg', '', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('275', 'S01BC03', 'Diclofenaco', 'Líquido oftálmico', '0,1 %', '', '1', '2', '3', 'Oc', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('276', 'M01AB05', 'Diclofenaco', 'Líquido parenteral', '25 mg/mL', '', '1', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('277', 'M01AB05', 'Diclofenaco', 'Sólido oral ', '50 mg ', '', '1', '2', '3', 'O', '', '0.02', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('278', 'J01CF01', 'Dicloxacilina', 'Sólido oral  -polvo-', '125 mg/5 mL', '', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('279', 'J01CF01', 'Dicloxacilina', 'Sólido oral  -polvo-', '250 mg/5 mL', '', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('280', 'J01CF01', 'Dicloxacilina', 'Sólido oral ', '500 mg', '', '1', '2', '3', 'O', '', '0.05', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('281', 'R06AA02', 'Difenhidramina', 'Líquido oral', '12,5 mg/5 mL', '', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('282', 'R06AA02', 'Difenhidramina', 'Líquido parenteral', '50 mg/mL', '', '1', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('283', 'R06AA02', 'Difenhidramina', 'Sólido oral', '50 mg', '', '1', '2', '3', 'O', '', '0.03', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('284', 'J06AA01', 'Diftérica antitoxina', 'Líquido parenteral', '', '', '1', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('285', 'C01AA05', 'Digoxina', 'Líquido oral', '50 mcg/mL', 'E', '', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('286', 'C01AA05', 'Digoxina', 'Líquido parenteral', '0,25 mg/mL ', 'E', '', '2', '3', 'P', '', '3.69', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('287', 'C01AA05', 'Digoxina', 'Sólido oral', '250 mcg', 'E', '', '2', '3', 'O', '', '0.03', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('288', 'C01AA05', 'Digoxina', 'Sólido oral', '62,5 mcg', 'E', '', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('289', 'C08DB01', 'Diltiazem', 'Líquido parenteral', '5 mg/mL', 'HE', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('290', 'C08DB01', 'Diltiazem', 'Sólido oral -liberación prolongada-', '120 mg', 'E', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('291', 'C08DB01', 'Diltiazem', 'Sólido oral -liberación prolongada-', '90 mg', 'E', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('292', 'C08DB01', 'Diltiazem', 'Sólido oral ', '60 mg ', 'E', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('293', 'C08DB01', 'Diltiazem', 'Sólido parenteral', '25 mg', 'HE', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('294', 'N07CA', 'Dimenhidrinato', 'Sólido oral', '50 mg', '', '1', '2', '3', 'O', '', '0.04', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('295', 'V03AB09', 'Dimercaprol', 'Líquido parenteral', '100 mg/mL', '-p-', '1', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('296', 'C01DA08', 'Dinitrato de isosorbida', 'Sólido oral sublingual', '5 mg', '', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('297', 'N07BB01', 'Disulfiram', 'Sólido oral', '500 mg', 'E -p-', '', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('298', 'C01CA07', 'Dobutamina', 'Líquido parenteral', '50 mg/mL', 'HE', '', '2', '3', 'P', '', '5.81', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('299', 'L01CD02', 'Docetaxel', 'Líquido parenteral', '20 mg', 'HE-p-', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('300', 'L01CD02', 'Docetaxel', 'Líquido parenteral', '80 mg', 'HE-p-', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('301', 'J05AX12', 'Dolutegravir*', 'Sólido oral ', '50 mg', 'E -p-', '', '2', '3', 'O', '*Tratamiento de VIH conforme la normativa  y esquemas vigente', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('302', 'C01CA04', 'Dopamina', 'Líquido parenteral', '40 mg/mL', 'HE', '', '2', '3', 'P', '', '1.1', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('303', 'R05CB13', 'Dornasa alfa-desoxirribonucleasa-*', 'Líquido para inhalación', '2,5 mg/2,5 mL \n-2 500 UI-', '', '1', '2', '3', 'I', '*Uso exclusivo en pacientes con fibrosis quística', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('304', 'C02CA04', 'Doxazosina ', 'Sólido oral ', '2 mg', 'E', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('305', 'C02CA04', 'Doxazosina ', 'Sólido oral ', '4 mg', 'E', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('306', 'J01AA02', 'Doxiciclina', 'Sólido oral ', '100 mg ', '', '1', '2', '3', 'O', '', '0.34', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('307', 'L01DB01', 'Doxorubicina', 'Sólido parenteral', '10 mg', 'HE-p-', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('308', 'L01DB01', 'Doxorubicina', 'Sólido parenteral', '50 mg', 'HE-p-', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('309', 'G04CB02', 'Dutasterida* ', 'Sólido oral', '0,5 mg', 'E', '', '2', '3', 'O', '*Tratamiento  de la hiperplasia prostática benigna con sintomatología moderada o severa y en aquellos  pacientes con alto riesgo quirúrgico que no pueden ser sometidos a prostatectomía', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('310', 'J05AG03', 'Efavirenz', 'Líquido oral', '30 mg/mL', '-p-', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('311', 'J05AG03', 'Efavirenz', 'Sólido oral ', '200 mg', '-p-', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('312', 'J05AG03', 'Efavirenz', 'Sólido oral ', '50 mg', '-p-', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('313', 'J05AG03', 'Efavirenz', 'Sólido oral ', '600 mg', '-p-', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('314', 'C01CA26', 'Efedrina', 'Líquido parenteral', '60 mg/mL', 'H', '', '2', '3', 'P', '', '0.37', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('315', 'B05BB02', 'Electrolitos con carbohidratos\n-Dextrosa en solución salina-', 'Líquido parenteral', '5 % + 0,9 %', '', '1', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('316', 'J05AF09', 'Emtricitabina', 'Líquido oral', '10 mg/mL', '-p-', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('317', 'J05AF09', 'Emtricitabina', 'Sólido oral ', '200 mg', '-p-', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('318', 'B05BA02', 'Emulsiones grasas -lípidos-', 'Líquido parenteral', '10 %', 'HE', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('319', 'B05BA02', 'Emulsiones grasas -lípidos-', 'Líquido parenteral', '20 %', 'HE', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('320', 'C09AA02', 'Enalapril', 'Líquido parenteral', '1,25 mg/mL', 'HE', '', '2', '3', 'P', '', '6.75', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('321', 'C09AA02', 'Enalapril', 'Sólido oral ', '10 mg', '', '1', '2', '3', 'O', '', '0.03', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('322', 'C09AA02', 'Enalapril', 'Sólido oral ', '20 mg', '', '1', '2', '3', 'O', '', '0.01', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('323', 'C09AA02', 'Enalapril', 'Sólido oral ', '5 mg', '', '1', '2', '3', 'O', '', '0.04', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('324', 'B01AB05', 'Enoxaparina', 'Líquido parenteral', '10.000 UI -100 mg-', 'E', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('325', 'B01AB05', 'Enoxaparina', 'Líquido parenteral', '2.000 UI -20 mg-', 'E', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('326', 'B01AB05', 'Enoxaparina', 'Líquido parenteral', '4.000 UI -40 mg-', 'E', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('327', 'B01AB05', 'Enoxaparina', 'Líquido parenteral', '6.000 UI -60 mg-', 'E', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('328', 'B01AB05', 'Enoxaparina', 'Líquido parenteral', '8.000 UI -80 mg-', 'E', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('329', 'L02BB04', 'Enzalutamida*', 'Sólido oral', '40 mg', 'E ', '', '2', '3', 'O', '*Cáncer de próstata metastásico resistente a la castración, no resecable que han progresado a pesar de la terapia de deprivación androgénica, en pacientes con Karnofsky mayor a 70%.', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('330', 'R03AA01', 'Epinefrina -adrenalina- racémica', 'Líquido para nebulización', '22,5 mg/mL -2,25 %-', '-p-', '1', '2', '3', 'I', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('331', 'C01CA24', 'Epinefrina -adrenalina-', 'Líquido parenteral', '1 mg/mL', '', '1', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('332', 'L01DB03', 'Epirubicina', 'Sólido parenteral /Líquido parenteral', '10 mg', 'HE-p-', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('333', 'L01DB03', 'Epirubicina', 'Sólido parenteral /Líquido parenteral', '50 mg', 'HE-p-', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('334', 'D10AF02', 'Eritromicina', 'Líquido cutáneo ', '0,04', '', '1', '2', '3', 'T', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('335', 'S01AA17', 'Eritromicina', 'Semisólido oftálmico', '0,5 %', '', '1', '2', '3', 'Oc', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('336', 'J01FA01', 'Eritromicina', 'Sólido oral  -polvo-', '200 mg/5 mL', '', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('337', 'J01FA01', 'Eritromicina', 'Sólido oral  -polvo-', '400 mg/5 mL', '', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('338', 'J01FA01', 'Eritromicina', 'Sólido oral ', '250 mg', '', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('339', 'J01FA01', 'Eritromicina', 'Sólido oral ', '500 mg', '', '1', '2', '3', 'O', '', '0.10', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('340', 'B03XA01', 'Eritropoyetina ', 'Líquido o sólido parenteral', '10.000 UI', 'E', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('341', 'B03XA01', 'Eritropoyetina ', 'Líquido o sólido parenteral', '2.000 UI', 'E', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('342', 'B03XA01', 'Eritropoyetina ', 'Líquido o sólido parenteral', '30.000 UI', 'E', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('343', 'B03XA01', 'Eritropoyetina ', 'Líquido o sólido parenteral', '4.000 UI', 'E', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('344', 'B03XA01', 'Eritropoyetina ', 'Líquido o sólido parenteral', '5.000 UI', 'E', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('345', 'J01FA02', 'Espiramicina', 'Sólido oral', '3´000.000 UI', 'E-p-', '', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('346', 'C03DA01', 'Espironolactona', 'Sólido oral ', '100 mg', '', '1', '2', '3', 'O', '', '0.48', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('347', 'C03DA01', 'Espironolactona', 'Sólido oral ', '25 mg', '', '1', '2', '3', 'O', '', '0.20', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('348', 'G03CA03', 'Estradiol ', 'Sólido cutáneo -parche transdérmico-', '3,9 mg', 'E ', '', '2', '3', 'T', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('349', 'G03CA03', 'Estradiol ', 'Sólido oral ', '1 mg', 'E', '', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('350', 'G03AA05', 'Estradiol valerato + Noretisterona enantato', 'Líquido parenteral', '-5 mg + 50 mg-/mL', '', '1', '2', '3', 'P', '', '', 'Rojo', 'x', null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('351', 'J01GA01', 'Estreptomicina', 'Sólido parenteral', '1.000 mg', '', '1', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('352', 'B01AD01', 'Estreptoquinasa', 'Sólido parenteral', '1´500.000 UI', 'HE -p-', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('353', 'G03CA04', 'Estriol', 'Semisólido vaginal', '0,001', '', '1', '2', '3', 'V', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('354', 'J04AM03', 'Etambutol + Isoniazida', 'Sólido oral ', '400 mg + 150 mg', '-p-', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('355', 'J04AK02', 'Etambutol', 'Sólido oral ', '400 mg', '-p-', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('356', 'L04AB01', 'Etanercept', 'Líquido parenteral', '25 mg', 'E', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('357', 'L04AB01', 'Etanercept', 'Líquido parenteral', '50 mg', 'E', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('358', 'L04AB01', 'Etanercept', 'Sólido parenteral', '25 mg  ', 'E', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('359', 'J04AD03', 'Etionamida', 'Sólido oral ', '250 mg', '-p-', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('360', 'J04AD03', 'Etionamida', 'Sólido oral ', '500 mg', '-p-', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('361', 'L01CB01', 'Etopósido', 'Líquido parenteral', '20 mg/mL', 'HE-p-', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('362', 'L01CB01', 'Etopósido', 'Sólido oral ', '50 mg', 'E -p-', '', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('363', 'J05AG04', 'Etravirina', 'Sólido oral ', '100 mg', '-p-', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('364', 'J05AG04', 'Etravirina', 'Sólido oral ', '200 mg', '-p-', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('365', 'L04AA18', 'Everólimus', 'Sólido oral ', '0,50 mg', 'E -p-', '', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('366', 'L04AA18', 'Everólimus', 'Sólido oral ', '0,75 mg', 'E -p-', '', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('367', 'L02BG06', 'Exemestano*', 'Sólido oral ', '25 mg', 'E -p-', '', '2', '3', 'O', '*Uso exclusivo en mujeres con cáncer de mama receptores hormonales positivos', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('368', 'B02BD04', 'Factor IX Plasmático', 'Sólido parenteral', '1.200 UI', 'E -p-', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('369', 'B02BD04', 'Factor IX Plasmático', 'Sólido parenteral', '250 UI', 'E -p-', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('370', 'B02BD04', 'Factor IX Plasmático', 'Sólido parenteral', '600 UI', 'E -p-', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('371', 'B02BD04', 'Factor IX Recombinante', 'Sólido parenteral', '1.000 UI', 'E -p-', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('372', 'B02BD04', 'Factor IX Recombinante', 'Sólido parenteral', '1.200 UI', 'E -p-', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('373', 'B02BD04', 'Factor IX Recombinante', 'Sólido parenteral', '250 UI', 'E -p-', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('374', 'B02BD04', 'Factor IX Recombinante', 'Sólido parenteral', '500 UI', 'E -p-', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('375', 'B02BD04', 'Factor IX Recombinante', 'Sólido parenteral', '600 UI', 'E -p-', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('376', 'B02BD02', 'Factor VIII Plasmático*', 'Sólido parenteral', '1.000 UI', 'E ', '', '2', '3', 'P', '*Tratamiento y profilaxis de episodios hemorrágicos en pacientes con hemofilia tipo A', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('377', 'B02BD02', 'Factor VIII Plasmático*', 'Sólido parenteral', '1.500 UI', 'E ', '', '2', '3', 'P', '*Tratamiento y profilaxis de episodios hemorrágicos en pacientes con hemofilia tipo A', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('378', 'B02BD02', 'Factor VIII Plasmático*', 'Sólido parenteral', '2.000 UI', 'E ', '', '2', '3', 'P', '*Tratamiento y profilaxis de episodios hemorrágicos en pacientes con hemofilia tipo A', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('379', 'B02BD02', 'Factor VIII Plasmático*', 'Sólido parenteral', '250 UI', 'E ', '', '2', '3', 'P', '*Tratamiento y profilaxis de episodios hemorrágicos en pacientes con hemofilia tipo A', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('380', 'B02BD02', 'Factor VIII Plasmático*', 'Sólido parenteral', '500 UI', 'E ', '', '2', '3', 'P', '*Tratamiento y profilaxis de episodios hemorrágicos en pacientes con hemofilia tipo A', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('381', 'B02BD02', 'Factor VIII Recombinante*', 'Sólido parenteral', '1.000 UI', 'E ', '', '2', '3', 'P', '*Tratamiento y profilaxis de episodios hemorrágicos en pacientes con hemofilia tipo A', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('382', 'B02BD02', 'Factor VIII Recombinante*', 'Sólido parenteral', '1.500 UI', 'E ', '', '2', '3', 'P', '*Tratamiento y profilaxis de episodios hemorrágicos en pacientes con hemofilia tipo A', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('383', 'B02BD02', 'Factor VIII Recombinante*', 'Sólido parenteral', '2.000 UI', 'E ', '', '2', '3', 'P', '*Tratamiento y profilaxis de episodios hemorrágicos en pacientes con hemofilia tipo A', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('384', 'B02BD02', 'Factor VIII Recombinante*', 'Sólido parenteral', '250 UI', 'E ', '', '2', '3', 'P', '*Tratamiento y profilaxis de episodios hemorrágicos en pacientes con hemofilia tipo A', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('385', 'B02BD02', 'Factor VIII Recombinante*', 'Sólido parenteral', '500 UI', 'E ', '', '2', '3', 'P', '*Tratamiento y profilaxis de episodios hemorrágicos en pacientes con hemofilia tipo A', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('386', 'N03AB02', 'Fenitoína', 'Líquido oral', '125 mg/5 mL', '', '1', '2', '3', 'O', '', '75', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('387', 'N03AB02', 'Fenitoína', 'Líquido parenteral', '50 mg/mL', '-p-', '', '2', '3', 'P', '', '0.69', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('388', 'N03AB02', 'Fenitoína', 'Sólido oral', '100 mg', '', '1', '2', '3', 'O', '', '0.13', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('389', 'N03AA02', 'Fenobarbital', 'Líquido oral', '4 mg/mL', '', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('390', 'N03AA02', 'Fenobarbital', 'Líquido parenteral', '60 mg/mL', 'H -p-', '', '2', '3', 'P', '', '0.29', 'Rojo', 'x', null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('391', 'N03AA02', 'Fenobarbital', 'Sólido oral', '100 mg', '', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('392', 'N01AH01', 'Fentanilo', 'Líquido parenteral', '0,05 mg/mL', 'HE -p-', '', '2', '3', 'P', '', '0.288', 'Rojo', 'x', null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('393', 'N01AH01', 'Fentanilo', 'Sólido cutáneo \n', '4,2 mg -25 mcg/hora-', 'HE -p-', '', '2', '3', 'T', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('394', 'B03AA07', 'Ferroso sulfato', 'Líquido oral', '25 - 50 mg/5mL -equivalente a hierro elemental-', '', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('395', 'B03AA07', 'Ferroso sulfato', 'Líquido oral', '25 mg/mL -equivalente a hierro elemental-', '', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('396', 'B03AA07', 'Ferroso sulfato', 'Sólido oral', '50 mg - 100 mg -equivalente a hierro elemental-', '', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('397', 'L03AA02', 'Filgrastim', 'Líquido parenteral', '300 mcg', 'HE-p-', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('398', 'B02BA01', 'Fitomenadiona', 'Líquido parenteral ', '10 mg/mL', '', '1', '2', '3', 'P -IV/IM-', '', '0.066', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('399', 'J02AC01', 'Fluconazol', 'Líquido parenteral', '2 mg/mL', 'HE-p-', '', '2', '3', 'P', '', '2.2', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('400', 'J02AC01', 'Fluconazol', 'Sólido oral ', '150 mg', '', '1', '2', '3', 'O', '', '0.29', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('401', 'L01BB05', 'Fludarabina', 'Sólido parenteral', '50 mg', 'HE-p-', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('402', 'H02AA02', 'Fludrocortisona*', 'Sólido oral', '0,1 mg', 'E-p-', '', '2', '3', 'O', '*Uso exclusivo en pacientes con hiperplasia suprarrenal congénita o insuficiencia suprarrenal primaria que requiere reemplazo mineralocorticoide', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('403', 'V03AB25', 'Flumazenil', 'Líquido parenteral', '0,1 mg/mL', '-p-', '1', '2', '3', 'P', '', '5', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('404', 'S01BA07', 'Fluorometolona', 'Líquido oftálmico', '0,1 %', 'E', '1', '2', '3', 'Oc', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('405', 'L01BC02', 'Fluoruracilo', 'Líquido parenteral', '25 mg/mL - 50 mg/mL -500 mg-', 'HE-p-', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('406', 'L01BC02', 'Fluoruracilo', 'Semisólido cutáneo', '5 %', 'E-p-', '', '2', '3', 'T', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('407', 'N06AB03', 'Fluoxetina', 'Sólido oral', '20 mg', 'E -p-', '', '2', '3', 'O', '', '0.34', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('408', 'L02BB01', 'Flutamida', 'Sólido oral ', '125 mg', 'E-p-', '', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('409', 'L02BB01', 'Flutamida', 'Sólido oral ', '250 mg', 'E-p-', '', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('410', 'R03BA05', 'Fluticasona* ', 'Líquido para inhalación', '125 mcg', '', '', '2', '3', 'I', '*Tratamiento y seguimiento del asma moderado y persistente. Síndrome overlap. Enfermedad pulmonar obstructiva crónica -EPOC-  tipo C y D. Hiperreactividad bronquial. Aspergilosis broncopulmonar. ', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('411', 'R03BA05', 'Fluticasona* ', 'Líquido para inhalación', '250 mcg', '', '', '2', '3', 'I', '*Tratamiento y seguimiento del asma moderado y persistente. Síndrome overlap. Enfermedad pulmonar obstructiva crónica -EPOC-  tipo C y D. Hiperreactividad bronquial. Aspergilosis broncopulmonar. ', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('412', 'V03AF03', 'Folinato cálcico -Leucovorina-', 'Líquido parenteral', '10 mg/mL', 'E -p-', '', '', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('413', 'V03AF03', 'Folinato cálcico -Leucovorina-', 'Sólido oral', '15 mg', 'E -p-', '', '', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('414', 'V03AB34', 'Fomepizol', 'Líquido parenteral', '1 g/mL', '-p-', '1', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('415', 'V06DB', 'Fórmulas para nutrición enteral', 'Líquido oral', '', 'HE -p-', '', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('416', 'V06DB', 'Fórmulas para nutrición enteral', 'Sólido oral', '', 'HE -p-', '', '2', '3', 'O', '', '0.12', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('417', 'R07AA02', 'Fosfolípidos naturales -Surfactante pulmonar-', 'Líquido intratraqueal', '25 mg/mL', 'HE -p-', '', '2', '3', 'IT', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('418', 'R07AA02', 'Fosfolípidos naturales -Surfactante pulmonar-', 'Líquido intratraqueal', '27 mg/mL', 'HE -p-', '', '2', '3', 'IT', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('419', 'J01XX01', 'Fosfomicina ', 'Sólido oral -gránulos- Trometamol', '3 g', '', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('420', 'J01XX01', 'Fosfomicina ', 'Sólido oral -polvo-', '250 mg/5mL', '', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('421', 'J01XX01', 'Fosfomicina ', 'Sólido oral', '500 mg', '', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('422', 'J01XX01', 'Fosfomicina ', 'Sólido parenteral', '1 g', 'E ', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('423', 'L02BA03', 'Fulvestrant*', 'Líquido parenteral ', '50 mg/mL', 'HE', '', '2', '3', 'P', '*Pacientes post-menopaúsicas con cáncer de mama localmente avanzado o metastásico cuyos receptores hormonales son positivos y que hayan tenido una recurrencia o progresión luego del uso de antiestrógenos y luego del uso de inhibidores de aromatasa.', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('424', 'C03CA01', 'Furosemida', 'Líquido parenteral', '10 mg/mL', '', '1', '2', '3', 'P', '', '0.29', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('425', 'C03CA01', 'Furosemida', 'Sólido oral ', '40 mg', '', '1', '2', '3', 'O', '', '0.26', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('426', 'N03AX12', 'Gabapentina', 'Sólido oral', '300 mg', '-p-', '', '2', '3', 'O', '', '0.36', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('427', 'L01BC05', 'Gemcitabina', 'Sólido parenteral', '1.000 mg', 'E -p-', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('428', 'L01BC05', 'Gemcitabina', 'Sólido parenteral', '200 mg', 'E -p-', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('429', 'C10AB04', 'Gemfibrozilo', 'Sólido oral ', '600 mg', '', '1', '2', '3', 'O', '', '0.12', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('430', 'J01GB03', 'Gentamicina', 'Líquido parenteral', '10 mg/mL', '', '1', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('431', 'J01GB03', 'Gentamicina', 'Líquido parenteral', '140 mg/mL', '', '1', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('432', 'J01GB03', 'Gentamicina', 'Líquido parenteral', '40 mg/mL', '', '1', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('433', 'J01GB03', 'Gentamicina', 'Líquido parenteral', '80 mg/mL', '', '1', '2', '3', 'P', '', '0.26', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('434', 'A06AG04', 'Glicerol', 'Sólido rectal', '0,92 g - 3 g', '', '1', '2', '3', 'R', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('435', 'A10BB09', 'Gliclazida*', 'Sólido oral  -liberación prolongada- ', '30 mg', '', '1', '2', '3', 'O', '*Diabetes mellitus tipo 2,  cuando metformina en monoterapia a dosis máxima no es suficiente para lograr control glicémico individualizado.', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('436', 'A10BB09', 'Gliclazida*', 'Sólido oral  -liberación prolongada- ', '60 mg', '', '1', '2', '3', 'O', '*Diabetes mellitus tipo 2,  cuando metformina en monoterapia a dosis máxima no es suficiente para lograr control glicémico individualizado.', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('437', 'H04AA01', 'Glucagón', 'Sólido parenteral', '1 mg -1UI-', '', '1', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('438', 'D01BA01', 'Griseofulvina', 'Sólido oral ', '125 mg', 'E', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('439', 'D01BA01', 'Griseofulvina', 'Sólido oral ', '250 mg', 'E', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('440', 'D01BA01', 'Griseofulvina', 'Sólido oral ', '500 mg', 'E', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('441', 'N05AD01', 'Haloperidol decanoato', 'Líquido parenteral', '50 mg/mL', 'E', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('442', 'N05AD01', 'Haloperidol', 'Líquido oral', '2 mg/mL', 'E', '', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('443', 'N05AD01', 'Haloperidol', 'Líquido parenteral', '5 mg/mL', '', '1', '2', '3', 'P-IM-', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('444', 'N05AD01', 'Haloperidol', 'Sólido oral', '10 mg', 'E', '', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('445', 'N05AD01', 'Haloperidol', 'Sólido oral', '5 mg', 'E', '', '2', '3', 'O', '', '0.46', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('446', 'B01AB01', 'Heparina  - no fraccionada -', 'Líquido parenteral', '5.000 UI/mL', 'HE', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('447', 'C02DB02', 'Hidralazina', 'Líquido parenteral', '20 mg/mL', 'HE', '', '2', '3', 'P', '', '11617', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('448', 'C02DB02', 'Hidralazina', 'Sólido oral ', '50 mg', '', '', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('449', 'N05CC01', 'Hidrato de cloral', 'Líquido oral', '100 mg/mL', 'E', '', '2', '3', 'O', '', '30999', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('450', 'H02AB09', 'Hidrocortisona*', 'Sólido oral', '10 mg', 'E', '', '2', '3', 'O', '*Uso exclusivo en pacientes con hiperplasia suprarrenal congénita o insuficiencia suprarrenal primaria que requieren reemplazo glucocorticoide', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('451', 'H02AB09', 'Hidrocortisona*', 'Sólido oral', '20 mg', 'E', '', '2', '3', 'O', '*Uso exclusivo en pacientes con hiperplasia suprarrenal congénita o insuficiencia suprarrenal primaria que requieren reemplazo glucocorticoide', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('452', 'H02AB09', 'Hidrocortisona*', 'Sólido oral', '5 mg', 'E', '', '2', '3', 'O', '*Uso exclusivo en pacientes con hiperplasia suprarrenal congénita o insuficiencia suprarrenal primaria que requieren reemplazo glucocorticoide', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('453', 'D07AA02', 'Hidrocortisona', 'Semisólido cutáneo/ líquido cutáneo', '0,5 %', '', '1', '2', '3', 'T', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('454', 'D07AA02', 'Hidrocortisona', 'Semisólido cutáneo/ líquido cutáneo', '1 %', '', '1', '2', '3', 'T', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('455', 'H02AB09', 'Hidrocortisona, succinato sódico', 'Sólido parenteral', '100 mg', '', '1', '2', '3', 'P', '', '2.1', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('456', 'H02AB09', 'Hidrocortisona, succinato sódico', 'Sólido parenteral', '500 mg', '', '1', '2', '3', 'P', '', '3.1', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('457', 'N02AA03', 'Hidromorfona', 'Líquido parenteral', '2 mg/mL ', '-p-', '1', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('458', 'N02AA03', 'Hidromorfona', 'Sólido oral', '2,5 mg', '-p-', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('459', 'N02AA03', 'Hidromorfona', 'Sólido oral', '5 mg', '-p-', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('460', 'L01XX05', 'Hidroxicarbamida \n-Hidroxiurea-', 'Sólido oral ', '500 mg', 'E-p-', '', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('461', 'P01BA02', 'Hidroxicloroquina*', 'Sólido oral ', '200 mg', 'E ', '1', '2', '3', 'O', '*Fármacos antirreumáticos modificadores de la enfermedad -FARME-', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('462', 'P01BA02', 'Hidroxicloroquina*', 'Sólido oral ', '400 mg', 'E ', '1', '2', '3', 'O', '*Fármacos antirreumáticos modificadores de la enfermedad -FARME-', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('463', 'V03AB33', 'Hidroxicobalamina -Vitamina B12-', 'Líquido parenteral', '1 mg/mL', '', '1', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('464', 'B03AC', 'Hierro sacaratado, óxido de', 'Líquido parenteral', '100 mg', 'E', '', '2', '3', 'P-IV-', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('465', 'B03AE04', 'Hierro, multivitaminas y minerales:\n•Hierro\n•Zinc\n•Vitamina A\n•Ácido fólico\n•Ácido ascórbico                 ', 'Sólido oral -polvo-', '\n• 12,5 mg\n• 5 mg\n• 300 mcg\n• 160 mcg\n• 30 mg', '', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('466', 'M01AE01', 'Ibuprofeno', 'Líquido oral', '200 mg/5mL', '', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('467', 'M01AE01', 'Ibuprofeno', 'Sólido oral ', '400 mg', '', '1', '2', '3', 'O', '', '0.04', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('468', 'L01DB06', 'Idarubicina', 'Líquido parenteral', '1 mg/mL', 'HE-p-', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('469', 'L01AA06', 'Ifosfamida', 'Sólido parenteral', '1 g', 'HE-p-', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('470', 'L01XE01', 'Imatinib', 'Sólido oral ', '100 mg', 'E -p-', '', '', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('471', 'L01XE01', 'Imatinib', 'Sólido oral ', '400 mg', 'E -p-', '', '', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('472', 'J01DH51', 'Imipenem + Cilastatina', 'Sólido parenteral', '500 mg + 500 mg', 'HE-p-', '', '2', '3', 'P', '', '6.2', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('473', 'R03AC18', 'Indacaterol*', 'Sólido para inhalación', '150 mcg', 'HE', '', '2', '3', 'I', '*Enfermedad pulmonar obstructiva crónica -EPOC-', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('474', 'R03AC18', 'Indacaterol*', 'Sólido para inhalación', '300 mcg', 'HE', '', '2', '3', 'I', '*Enfermedad pulmonar obstructiva crónica -EPOC-', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('475', 'L04AB02', 'Infliximab', 'Sólido parenteral', '100 mg', 'HE-p-', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('476', 'L04AA04', 'Inmunoglobulina  Antitimocítica  -Conejo-', 'Líquido parenteral', '50 mg/ml', 'HE-p-', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('477', 'L04AA04', 'Inmunoglobulina  Antitimocítica  -Conejo-', 'Sólido parenteral', '25 mg', 'HE-p-', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('478', 'L04AA03', 'Inmunoglobulina  Antitimocítica  -Equina -', 'Líquido parenteral ', '50 mg/mL ', 'HE', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('479', 'J06BB01', 'Inmunoglobulina anti D -rh-', 'Líquido parenteral', '200 mcg', 'E', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('480', 'J06BB01', 'Inmunoglobulina anti D -rh-', 'Líquido parenteral', '250 mcg', 'E', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('481', 'J06BB01', 'Inmunoglobulina anti D -rh-', 'Líquido parenteral', '300 mcg', 'E', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('482', 'J06BB05', 'Inmunoglobulina antirrábica', 'Líquido parenteral', '1.500 Ul/mL', '', '1', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('483', 'J06BB05', 'Inmunoglobulina antirrábica', 'Líquido parenteral', '150 UI/mL', '', '1', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('484', 'J06BB05', 'Inmunoglobulina antirrábica', 'Líquido parenteral', '300 UI/mL', '', '1', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('485', 'J06BB02', 'Inmunoglobulina antitetánica', 'Líquido parenteral/ sólido parenteral', '200 UI', '', '1', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('486', 'J06BB02', 'Inmunoglobulina antitetánica', 'Líquido parenteral/ sólido parenteral', '250 Ul', '', '1', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('487', 'J06BB02', 'Inmunoglobulina antitetánica', 'Líquido parenteral/ sólido parenteral', '500 Ul', '', '1', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('488', 'J06BB04', 'Inmunoglobulina hepatitis B*', 'Líquido parenteral', '', '', '1', '2', '3', 'P', '*Profilaxis en personas que no se han vacunado y expuestas a la hepatitis B -abuso sexual-', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('489', 'J06BA02', 'Inmunoglobulina humana normal para administración intravascular', 'Líquido parenteral/ sólido parenteral', '', '', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('490', 'A10AE04', 'Insulina Glargina* ', 'Líquido parenteral  ', '100 UI/ mL', 'E ', '', '2', '3', 'P', '*Diabetes tipo 1, diabetes mellitus tipo 2 en insulinoterapia con NPH y que presentan riesgo de hipoglicemia severa* -Hipoglicemia severa: una hipoglicemia que requiere la ayuda de un tercero para superarla-.', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('491', 'A10AE04', 'Insulina Glargina* ', 'Líquido parenteral-plumas  /cartuchos -', '100 UI/ mL', 'E ', '', '2', '3', 'P', '*Diabetes tipo 1, diabetes mellitus tipo 2 en insulinoterapia con NPH y que presentan riesgo de hipoglicemia severa* -Hipoglicemia severa: una hipoglicemia que requiere la ayuda de un tercero para superarla-.', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('492', 'A10AB01', 'Insulina humana -acción rápida-', 'Líquido parenteral ', '100 UI/mL', '', '1', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('493', 'A10AC01', 'Insulina humana NPH -acción intermedia-', 'Líquido parenteral ', '100 UI/mL', '', '1', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('494', 'A10AB05', 'Insulina Ultrarápida -asparta-*', 'Líquido parenteral  ', '100 UI/mL', 'E ', '', '2', '3', 'P', '*Pacientes adultos y niños  con diabetes  tipo  I. Pacientes con diabetes mellitus gestacional', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('495', 'A10AB05', 'Insulina Ultrarápida -asparta-*', 'Líquido parenteral-plumas  /cartuchos -', '100 UI/mL', 'E ', '', '2', '3', 'P', '*Pacientes adultos y niños  con diabetes  tipo  I. Pacientes con diabetes mellitus gestacional', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('496', 'A10AB04', 'Insulina Ultrarápida -lispro-*', 'Líquido parenteral-plumas  /cartuchos -', '100 UI/mL', 'E ', '', '2', '3', 'P', '*Pacientes adultos y niños  con diabetes  tipo  I. Pacientes con diabetes mellitus gestacional', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('497', 'L03AB05', 'Interferón alfa 2b', 'Líquido parenteral/ sólido parenteral', '10´000.000 UI', 'HE-p-', '', '2', '3', 'SC', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('498', 'L03AB05', 'Interferón alfa 2b', 'Líquido parenteral/ sólido parenteral', '15´000.000 UI', 'HE-p-', '', '2', '3', 'SC', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('499', 'L03AB05', 'Interferón alfa 2b', 'Líquido parenteral/ sólido parenteral', '25´000.000 UI', 'HE-p-', '', '2', '3', 'SC', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('500', 'L03AB05', 'Interferón alfa 2b', 'Líquido parenteral/ sólido parenteral', '3´000.000 UI', 'HE-p-', '', '2', '3', 'SC', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('501', 'L03AB05', 'Interferón alfa 2b', 'Líquido parenteral/ sólido parenteral', '30´000.000 UI', 'HE-p-', '', '2', '3', 'SC', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('502', 'L03AB05', 'Interferón alfa 2b', 'Líquido parenteral/ sólido parenteral', '5´000.000 UI', 'HE-p-', '', '2', '3', 'SC', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('503', 'L03AB07', 'Interferón beta 1a', 'Líquido parenteral/ sólido parenteral', '12´000.000 UI', 'HE -p-', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('504', 'L03AB07', 'Interferón beta 1a', 'Líquido parenteral/ sólido parenteral', '36´000.000 UI', 'HE -p-', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('505', 'L03AB07', 'Interferón beta 1a', 'Líquido parenteral/ sólido parenteral', '6´000.000 UI', 'HE -p-', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('506', 'L03AB08', 'Interferón beta 1b', 'Líquido parenteral', '8´000.000 UI', 'HE -p-', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('507', 'R03BB01', 'Ipratropio bromuro', 'Líquido para inhalación', '0,02 mg/dosis', '', '1', '2', '3', 'I ', '', '7.18', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('508', 'R03BB01', 'Ipratropio bromuro', 'Líquido para nebulización', '0,25 mg/mL', 'E', '1', '2', '3', 'I ', '', '8.02', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('509', 'L01XX19', 'Irinotecan', 'Líquido parenteral', '20 mg/mL', 'E-p-', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('510', 'J04AC01', 'Isoniazida', 'Sólido oral ', '100 mg', '-p-', '1', '2', '3', 'O', '', '0.30', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('511', 'J04AC01', 'Isoniazida', 'Sólido oral ', '300 mg', '-p-', '1', '2', '3', 'O', '', '6', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('512', 'D10AD04', 'Isotretinoina*', 'Sólido oral ', '10 mg', 'E', '', '2', '3', 'O', '*Formas graves de acné: acné nodular, quístico, cicatrizal,  conglobata.', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('513', 'D10AD04', 'Isotretinoina*', 'Sólido oral ', '20 mg', 'E', '', '2', '3', 'O', '*Formas graves de acné: acné nodular, quístico, cicatrizal,  conglobata.', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('514', 'J02AC02', 'Itraconazol', 'Líquido oral', '10 mg/mL', 'E', '', '2', '3', 'O', '', '1', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('515', 'J02AC02', 'Itraconazol', 'Sólido oral ', '100 mg', 'E', '', '2', '3', 'O', '', '1', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('516', 'P02CF01', 'Ivermectina', 'Líquido oral', '6 mg/mL', '', '1', '2', '3', 'O', '', '1', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('517', 'P02CF01', 'Ivermectina', 'Sólido oral', '6 mg', '', '1', '2', '3', 'O', '', '1', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('518', 'M01AB15', 'Ketorolaco', 'Líquido parenteral', '30 mg/mL', '', '', '2', '3', 'P', '', '0.33', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('519', 'C07AG01', 'Labetalol*', 'Líquido parenteral', '5 mg/mL', 'HE ', '', '2', '3', 'P', '*Crisis hipertensivas. Control de taquiarritmias.', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('520', 'C07AG01', 'Labetalol*', 'Sólido oral', '200 mg', 'E ', '', '2', '3', 'O', '*Crisis hipertensivas. Control de taquiarritmias.', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('521', 'A06AD11', 'Lactulosa', 'Líquido oral', '65 %', '', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('522', 'S01XA20', 'Lágrimas artificiales y otros preparados inertes', 'Líquido oftálmico', '', '', '1', '2', '3', 'Oc', '', '1.24', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('523', 'S01XA20', 'Lágrimas artificiales y otros preparados inertes', 'Semisólido oftálmico', '', 'E', '1', '2', '3', 'Oc', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('524', 'J05AR02', 'Lamivudina + Abacavir', 'Sólido oral ', '300 mg + 600 mg', '-p-', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('525', 'J05AF05', 'Lamivudina', 'Líquido oral', '50 mg/5mL', '-p-', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('526', 'J05AF05', 'Lamivudina', 'Sólido oral ', '150 mg', '-p-', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('527', 'N03AX09', 'Lamotrigina', 'Sólido oral', '100 mg', '-p-', '', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('528', 'N03AX09', 'Lamotrigina', 'Sólido oral', '25 mg', '-p-', '', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('529', 'N03AX09', 'Lamotrigina', 'Sólido oral', '50 mg', '-p-', '', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('530', 'S01EE01', 'Latanoprost', 'Líquido oftálmico', '0,005 %', 'E -p-', '', '2', '3', 'Oc', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('531', 'L04AA13', 'Leflunomida*', 'Sólido oral', '20 mg', 'E', '', '2', '3', 'O', '*Pacientes adultos con Artritis Reumatoide activa, refractaria, antes de decidir uso de terapia biológica.', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('532', 'L04AX04', 'Lenalidomida*', 'Sólido oral', '10 mg', 'HE', '', '', '3', 'O', '*Tratamiento de pacientes adultos con mieloma múltiple refractarios o recaídos a dos terapias previas de tratamiento. ', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('533', 'L04AX04', 'Lenalidomida*', 'Sólido oral', '15 mg', 'HE', '', '', '3', 'O', '*Tratamiento de pacientes adultos con mieloma múltiple refractarios o recaídos a dos terapias previas de tratamiento. ', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('534', 'L04AX04', 'Lenalidomida*', 'Sólido oral', '2,5 mg', 'HE', '', '', '3', 'O', '*Tratamiento de pacientes adultos con mieloma múltiple refractarios o recaídos a dos terapias previas de tratamiento. ', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('535', 'L04AX04', 'Lenalidomida*', 'Sólido oral', '20 mg', 'HE', '', '', '3', 'O', '*Tratamiento de pacientes adultos con mieloma múltiple refractarios o recaídos a dos terapias previas de tratamiento. ', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('536', 'L04AX04', 'Lenalidomida*', 'Sólido oral', '25 mg', 'HE', '', '', '3', 'O', '*Tratamiento de pacientes adultos con mieloma múltiple refractarios o recaídos a dos terapias previas de tratamiento. ', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('537', 'L04AX04', 'Lenalidomida*', 'Sólido oral', '5 mg', 'HE', '', '', '3', 'O', '*Tratamiento de pacientes adultos con mieloma múltiple refractarios o recaídos a dos terapias previas de tratamiento. ', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('538', 'L02BG04', 'Letrozol*', 'Sólido oral ', '2,5 mg', 'E -p-', '', '2', '3', 'O', '*Uso exclusivo en mujeres con cáncer de mama receptores hormonales positivos', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('539', 'L02AE02', 'Leuprorelina -leuprolide-', 'Líquido parenteral o sólido parenteral', '11,25 mg', 'E-p-', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('540', 'L02AE02', 'Leuprorelina -leuprolide-', 'Líquido parenteral o sólido parenteral', '3,75 mg', 'E-p-', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('541', 'L02AE02', 'Leuprorelina -leuprolide-', 'Líquido parenteral o sólido parenteral', '5 mg', 'E-p-', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('542', 'L02AE02', 'Leuprorelina -leuprolide-', 'Líquido parenteral o sólido parenteral', '7,5 mg', 'E-p-', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('543', 'N03AX14', 'Levetiracetam*', 'Líquido oral', '500 mg/5 mL', 'HE', '', '2', '3', 'O', '*Epilepsia refractaria que no cede a otras alternativas presentes en el CNMB', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('544', 'N03AX14', 'Levetiracetam*', 'Líquido parenteral', '100 mg/mL', 'HE', '', '', '3', 'P', '*Epilepsia refractaria que no cede a otras alternativas presentes en el CNMB', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('545', 'N03AX14', 'Levetiracetam*', 'Sólido oral ', '1.000 mg', 'HE', '', '2', '3', 'O', '*Epilepsia refractaria que no cede a otras alternativas presentes en el CNMB', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('546', 'N03AX14', 'Levetiracetam*', 'Sólido oral ', '500 mg', 'HE', '', '2', '3', 'O', '*Epilepsia refractaria que no cede a otras alternativas presentes en el CNMB', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('547', 'N04BA02', 'Levodopa + Carbidopa', 'Sólido oral', '100 mg + 10 mg', 'E', '', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('548', 'N04BA02', 'Levodopa + Carbidopa', 'Sólido oral', '250 mg + 25 mg', 'E', '', '2', '3', 'O', '', '1', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('549', 'J01MA12', 'Levofloxacina', 'Líquido parenteral', '5 mg/mL', 'HE', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('550', 'J01MA12', 'Levofloxacina', 'Sólido oral ', '250 mg', 'E', '', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('551', 'J01MA12', 'Levofloxacina', 'Sólido oral ', '500 mg ', 'E', '', '2', '3', 'O', '', '0.58', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('552', 'N05AA02', 'Levomepromazina', 'Líquido oral', '40 mg/mL', 'E', '', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('553', 'N05AA02', 'Levomepromazina', 'Líquido parenteral', '25 mg/mL', 'E', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('554', 'N05AA02', 'Levomepromazina', 'Sólido oral', '100 mg', 'E', '', '2', '3', 'O', '', '0.12', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('555', 'N05AA02', 'Levomepromazina', 'Sólido oral', '25 mg', 'E', '', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('556', 'G03AA07', 'Levonorgestrel + Etinilestradiol', 'Sólido oral ', '150 mcg + 30 mcg', '', '1', '2', '3', 'O', '', '', 'Rojo', 'x', null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('557', 'G03AC03', 'Levonorgestrel*', 'Sistema intrauterino', '52 mg', 'E', '', '2', '3', 'IU', '*Menorragia idiopática.', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('558', 'G03AC03', 'Levonorgestrel', 'Sólido oral ', '0,030 mg', '', '1', '2', '3', 'O', '', '', 'Rojo', 'x', null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('559', 'G03AD01', 'Levonorgestrel', 'Sólido oral ', '0,75 mg', '', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('560', 'G03AD01', 'Levonorgestrel', 'Sólido oral ', '1,5 mg', '', '1', '2', '3', 'O', '', '', 'Rojo', 'x', null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('561', 'G03AC03', 'Levonorgestrel', 'Sólido parenteral -Implante subdérmico- ', '150 mg -2 varillas de 75 mg-', '', '1', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('562', 'H03AA01', 'Levotiroxina sódica', 'Sólido oral ', '25 mcg', 'E', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('563', 'H03AA01', 'Levotiroxina sódica', 'Sólido oral ', '50 mcg', 'E', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('564', 'H03AA01', 'Levotiroxina sódica', 'Sólido oral ', '75 mcg', 'E', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('565', 'H03AA01', 'Levotiroxina sódica', 'Sólido oral ', '88 mcg', 'E', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('566', 'H03AA01', 'Levotiroxina sódica', 'Sólido oral ', '100 mcg', 'E', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('567', 'H03AA01', 'Levotiroxina sódica', 'Sólido oral ', '112 mcg', 'E', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('568', 'H03AA01', 'Levotiroxina sódica', 'Sólido oral ', '125 mcg', 'E', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('569', 'H03AA01', 'Levotiroxina sódica', 'Sólido oral ', '150 mcg', 'E', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('570', 'H03AA01', 'Levotiroxina sódica', 'Sólido oral ', '175 mcg', 'E', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('571', 'H03AA01', 'Levotiroxina sódica', 'Sólido oral ', '200 mcg', 'E', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('572', 'N01BB02', 'Lidocaína -sin epinefrina-', 'Líquido parenteral ', '2 %', '', '1', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('573', 'N01BB02', 'Lidocaína ', 'Sólido cutáneo -parche-*', '5 %', 'E ', '', '2', '3', 'T', '*Dolor neuropático, acorde a la Guía de Práctica Clínica de Dolor', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('574', 'N01BB52', 'Lidocaína con Epinefrina', 'Líquido parenteral', '2 % + 1:200.000', '', '1', '2', '3', 'P', '', '0.04', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('575', 'N01BB52', 'Lidocaína con Epinefrina', 'Líquido parenteral', '2% + 1:80.000 -cartucho dental-', '', '1', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('576', 'D04AB01', 'Lidocaína', 'Líquido cutáneo', '10 %', '', '1', '2', '3', 'T', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('577', 'D04AB01', 'Lidocaína', 'Semisólido cutáneo', '2 %', '', '1', '2', '3', 'T', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('578', 'D04AB01', 'Lidocaína', 'Semisólido cutáneo', '5 %', '', '1', '2', '3', 'T', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('579', 'J01XX08', 'Linezolid*', 'Líquido parenteral', '2 mg/mL', 'HE-p-', '', '2', '3', 'P', '*Infecciones de piel y tracto respiratorio causados por Gram-positivos incluyendo enterococos resistentes a Vancomicina y estafilococos aureos resistente a meticilina.  TB resistente en asociación a otros medicamentos en esquema individualizado.', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('580', 'J01XX08', 'Linezolid*', 'Sólido oral ', '600 mg', 'E-p-', '', '2', '3', 'O', '*Infecciones de piel y tracto respiratorio causados por Gram-positivos incluyendo enterococos resistentes a Vancomicina y estafilococos aureos resistente a meticilina.  TB resistente en asociación a otros medicamentos en esquema individualizado.', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('581', 'N05AN01', 'Litio, carbonato', 'Sólido oral', '300 mg', 'E', '', '2', '3', 'O', '', '0.13', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('582', 'A07DA03', 'Loperamida', 'Sólido oral', '2 mg', '', '1', '2', '3', 'O', '', '1019', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('583', 'J05AR10', 'Lopinavir + Ritonavir', 'Líquido oral', '80 mg + 20 mg/mL', '-p-', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('584', 'J05AR10', 'Lopinavir + Ritonavir', 'Sólido oral ', '100 mg + 25 mg', '-p-', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('585', 'J05AR10', 'Lopinavir + Ritonavir', 'Sólido oral ', '200 mg + 50 mg', '-p-', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('586', 'R06AX13', 'Loratadina', 'Líquido oral', '5 mg/5 mL', '', '1', '2', '3', 'O', '', '0.67', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('587', 'R06AX13', 'Loratadina', 'Sólido oral', '10 mg', '', '1', '2', '3', 'O', '', '0.04', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('588', 'N05BA06', 'Lorazepam ', 'Líquido parenteral*', '2 mg/mL', 'HE', '', '2', '3', 'P', '*Manejo de status convulsivo', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('589', 'N05BA06', 'Lorazepam ', 'Líquido parenteral*', '4 mg/mL', 'HE', '', '2', '3', 'P', '*Manejo de status convulsivo', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('590', 'N05BA06', 'Lorazepam ', 'Sólido oral*', '1 mg', 'E ', '', '2', '3', 'O', '*Benzodiazepina de acción corta en adultos mayores, manejo de síndrome de abstinencia alcohólica en pacientes ancianos con potencial riesgo de daño hepático.', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('591', 'N05BA06', 'Lorazepam ', 'Sólido oral*', '2 mg', 'E ', '', '2', '3', 'O', '*Benzodiazepina de acción corta en adultos mayores, manejo de síndrome de abstinencia alcohólica en pacientes ancianos con potencial riesgo de daño hepático.', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('592', 'C09CA01', 'Losartán', 'Sólido oral ', '100 mg', '', '1', '2', '3', 'O', '', '0.13', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('593', 'C09CA01', 'Losartán', 'Sólido oral ', '50 mg', '', '1', '2', '3', 'O', '', '0.06', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('594', 'A02AF01', 'Magaldrato con simeticona -Hidróxido de Al y Mg-', 'Líquido oral', '', '', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('595', 'B05BC01', 'Manitol', 'Líquido parenteral', '20 %', 'HE', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('596', 'G03FA12', 'Medroxiprogesterona + estrógenos conjugados', 'Sólido oral ', '2,5 mg + 0,625 mg', 'E', '', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('597', 'P01CB01', 'Meglumina antimoniato', 'Líquido parenteral', '300 mg/mL', '-p-', '1', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('598', 'L01AA03', 'Melfalán', 'Sólido oral ', '2 mg', 'E-p-', '', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('599', 'L01AA03', 'Melfalán', 'Sólido parenteral', '50 mg', 'HE', '', '', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('600', 'L01BB02', 'Mercaptopurina', 'Sólido oral ', '50 mg', 'E-p-', '', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('601', 'J01DH02', 'Meropenem', 'Sólido parenteral', '1.000 mg', 'HE-p-', '', '2', '3', 'P', '', '', 'Rojo', 'x', null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('602', 'J01DH02', 'Meropenem', 'Sólido parenteral', '500 mg', 'HE-p-', '', '2', '3', 'P', '', '', 'Rojo', 'x', null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('603', 'A07EC02', 'Mesalazina*', 'Sólido oral -polvo-', '1 g', 'E ', '', '2', '3', 'O', '*Tratamiento de la fase aguda de la colitis ulcerosa leve a moderada', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('604', 'A07EC02', 'Mesalazina*', 'Sólido oral -polvo-', '2 g', 'E ', '', '2', '3', 'O', '*Tratamiento de la fase aguda de la colitis ulcerosa leve a moderada', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('605', 'A07EC02', 'Mesalazina*', 'Sólido oral', '500 mg', 'E ', '', '2', '3', 'O', '*Tratamiento de la fase aguda de la colitis ulcerosa leve a moderada', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('606', 'A07EC02', 'Mesalazina*', 'Sólido rectal', '1 g', 'E ', '', '2', '3', 'R', '*Tratamiento de la fase aguda de la colitis ulcerosa leve a moderada', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('607', 'V03AF01', 'Mesna', 'Líquido parenteral', '100 mg/mL', 'E -p-', '', '', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('608', 'N07BC02', 'Metadona', 'Líquido parenteral', '5 mg/mL', '', '1', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('609', 'N07BC02', 'Metadona', 'Sólido oral', '10 mg', '', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('610', 'A10BA02', 'Metformina', 'Sólido oral', '1000 mg', '', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('611', 'A10BA02', 'Metformina', 'Sólido oral', '500 mg', '', '1', '2', '3', 'O', '', '0.14', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('612', 'A10BA02', 'Metformina', 'Sólido oral', '750 mg', '', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('613', 'A10BA02', 'Metformina', 'Sólido oral', '850 mg', '', '1', '2', '3', 'O', '', '0.19', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('614', 'C02AB01', 'Metildopa - levógira -', 'Sólido oral ', '250 mg', 'E', '', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('615', 'C02AB01', 'Metildopa - levógira -', 'Sólido oral ', '500 mg', 'E', '', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('616', 'G02AB01', 'Metilergometrina\n- o G02AB03 Ergometrina -', 'Líquido parenteral', '0,2 mg/mL', '', '1', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('617', 'G02AB01', 'Metilergometrina\n- o G02AB03 Ergometrina -', 'Sólido oral ', '0,125 mg', '', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('618', 'H02AB04', 'Metilprednisolona, acetato', 'Sólido parenteral', '40 mg', 'E', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('619', 'H02AB04', 'Metilprednisolona, acetato', 'Sólido parenteral', '80 mg', 'E', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('620', 'H02AB04', 'Metilprednisolona, succinato', 'Sólido parenteral', '125 mg', 'E', '', '2', '3', 'P', '', '23', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('621', 'H02AB04', 'Metilprednisolona, succinato', 'Sólido parenteral', '500 mg', 'E', '', '2', '3', 'P', '', '2.75', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('622', 'A03FA01', 'Metoclopramida', 'Líquido parenteral', '5 mg/mL', '', '1', '2', '3', 'P', '', '0.013', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('623', 'A03FA01', 'Metoclopramida', 'Sólido oral', '10 mg', '', '1', '2', '3', 'O', '', '0.02', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('624', 'L01BA01', 'Metotrexato', 'Líquido parenteral ', '25 mg/mL ', 'HE-p-', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('625', 'L01BA01', 'Metotrexato', 'Sólido parenteral', '50 mg', 'HE-p-', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('626', 'L01BA01', 'Metotrexato', 'Sólido parenteral', '500 mg', 'HE-p-', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('627', 'L01BA01', 'Metotrexato', 'Sólido oral ', '2,5 mg', 'E -p-', '1', '2', '3', 'O', '', '0.17', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('628', 'P01AB01', 'Metronidazol', 'Líquido oral', '125 mg/5 mL', '', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('629', 'P01AB01', 'Metronidazol', 'Líquido oral', '250 mg/5 mL', '', '1', '2', '3', 'O', '', '0.85', 'Amarillo', 'x', null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('630', 'J01XD01', 'Metronidazol', 'Líquido parenteral', '5 mg/mL', 'HE -p-', '', '2', '3', 'P', '', '0.98', 'Amarillo', 'x', null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('631', 'P01AB01', 'Metronidazol', 'Sólido oral', '250 mg', '', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('632', 'P01AB01', 'Metronidazol', 'Sólido oral', '500 mg', '', '1', '2', '3', 'O', '', '0.013', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('633', 'G01AF01', 'Metronidazol', 'Sólido vaginal ', '1.000 mg', '', '1', '2', '3', 'V', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('634', 'G01AF01', 'Metronidazol', 'Sólido vaginal ', '500 mg', '', '1', '2', '3', 'V', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('635', 'L04AA06', 'Micofenolato', 'Sólido oral ', '180 mg', 'E -p-', '', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('636', 'L04AA06', 'Micofenolato', 'Sólido oral ', '250 mg', 'E -p-', '', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('637', 'L04AA06', 'Micofenolato', 'Sólido oral ', '360 mg', 'E -p-', '', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('638', 'L04AA06', 'Micofenolato', 'Sólido oral ', '500 mg', 'E -p-', '', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('639', 'N05CD08', 'Midazolam', 'Líquido oral -solución bucal-', '10 mg/mL ', ' ', '1', '2', '3', 'O', '', '', 'Rojo', 'x', null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('640', 'N05CD08', 'Midazolam', 'Líquido parenteral', '1 mg/mL', 'E', '', '2', '3', 'P', '', '', 'Rojo', 'x', null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('641', 'N05CD08', 'Midazolam', 'Líquido parenteral', '5 mg/mL', 'E', '', '2', '3', 'P', '', '1.87', 'Rojo', 'x', null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('642', 'L01XX09', 'Miltefosina', 'Sólido oral', '10 mg', '-p-', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('643', 'L01XX09', 'Miltefosina', 'Sólido oral', '50 mg', '-p-', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('644', 'G02AD06', 'Misoprostol', 'Sólido oral ', '200 mcg', '-p-', '1', '2', '3', 'O/V', '', '0.33', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('645', 'L01DC03', 'Mitomicina', 'Sólido parenteral', '20 mg', 'HE-p-', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('646', 'L01DB07', 'Mitoxantrona', 'Líquido parenteral', '2 mg/mL  ', 'HE-p-', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('647', 'R01AD09', 'Mometasona', 'Líquido para inhalación nasal ', '50 mcg', '', '1', '2', '3', 'I', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('648', 'C01DA14', 'Mononitrato de isosorbida', 'Sólido oral ', '20 mg ', '', '1', '2', '3', 'O', '', '0.23', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('649', 'N02AA01', 'Morfina', 'Líquido oral ', '2 mg/mL', '-p-', '1', '2', '3', 'O', '', '', 'Rojo', 'x', null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('650', 'N02AA01', 'Morfina', 'Líquido oral ', '20 mg/mL', '-p-', '1', '2', '3', 'O', '', '', 'Rojo', 'x', null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('651', 'N02AA01', 'Morfina', 'Líquido parenteral', '10 mg/mL', '-p-', '1', '2', '3', 'P', '', '', 'Rojo', 'x', null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('652', 'N02AA01', 'Morfina', 'Líquido parenteral', '20 mg/mL', '-p-', '1', '2', '3', 'P', '', '', 'Rojo', 'x', null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('653', 'N02AA01', 'Morfina', 'Sólido oral \n-liberación prolongada-', '10 mg', '-p-', '1', '2', '3', 'O', '', '', 'Rojo', 'x', null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('654', 'N02AA01', 'Morfina', 'Sólido oral \n-liberación prolongada-', '30 mg', '-p-', '1', '2', '3', 'O', '', '', 'Rojo', 'x', null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('655', 'N02AA01', 'Morfina', 'Sólido oral \n-liberación prolongada-', '60 mg', '-p-', '1', '2', '3', 'O', '', '', 'Rojo', 'x', null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('656', 'N02AA01', 'Morfina', 'Sólido oral ', '10 mg  ', '-p-', '1', '2', '3', 'O', '', '', 'Rojo', 'x', null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('657', 'A09AA02', 'Multienzimas pancreáticas*', 'Sólido oral', 'Pancreatina: 150 mg\nAmilasa: 8.000 UI\nLipasa 10.000 UI\nProteasa:  600 UI', 'E -p-', '', '', '3', 'O', '*Insuficiencia pancreática exócrina provocada por fibrosis quística, pancreatitis crónica, pancreatectomía, gastrectomía total y resecciones gástricas parciales, obstrucción de conductos por neoplasias. Malformaciones de la vía biliar en neonatos.', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('658', 'A11AA03', 'Multivitaminas con minerales: \n•Tiamina -Vitamina B1-\n•Nicotinamida -Vitamina B3-\n•Piridoxina -Vitamina B6-\n•Cianocobalamina -Vitamina B12-\n•Ácido ascórbico -Vitamina C-\n•Vitamina A\n•Zinc\n\n\n', 'Líquido oral -jarabe/gotas-', 'Tiamina  0,5 - 1,2 mg/5mL Nicotinamida 6 - 16 mg/5mL\nPiridoxina 0,5 - 1 mg/5mL\nCianocobalamina 1 - 2 mcg/5 mL\nÁcido Ascórbico 15 - 50 mg/5mL\nVitamina A 1.000 - 3 000 UI/5 mL\nZinc 3 - 8 mg/5mL\nNota:\nSe describen los componentes y concentraciones  mínimas n', '', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('659', 'V03AB15', 'Naloxona', 'Líquido parenteral', '0,4 mg/mL', '-p-', '1', '2', '3', 'P', '', '9', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('660', 'N07AA01', 'Neostigmina', 'Líquido parenteral', '0,5 mg/mL', 'E -p-', '', '2', '3', 'P', '', '0.16', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('661', 'J05AG01', 'Nevirapina', 'Líquido oral', '50 mg/5mL', '-p-', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('662', 'J05AG01', 'Nevirapina', 'Sólido oral ', '200 mg', '-p-', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('663', 'C08CA05', 'Nifedipina', 'Sólido oral ', '10 mg', 'E', '1', '2', '3', 'O', '', '0.08', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('664', 'L01XE08', 'Nilotinib*', 'Sólido oral ', '150 mg', 'HE ', '', '2', '3', 'O', '*Pacientes con leucemia mieloide crónica que tengan la presencia del cromosoma Filadelfia y que han fracasado al Imatinib o cualquier inhibidor de tirosincinasa sea por  resistencia o intolerancia.', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('665', 'L01XE08', 'Nilotinib*', 'Sólido oral ', '200 mg', 'HE ', '', '2', '3', 'O', '*Pacientes con leucemia mieloide crónica que tengan la presencia del cromosoma Filadelfia y que han fracasado al Imatinib o cualquier inhibidor de tirosincinasa sea por  resistencia o intolerancia.', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('666', 'A07AA02', 'Nistatina', 'Líquido oral', '100.000 UI/mL', '', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('667', 'J01XE01', 'Nitrofurantoína', 'Líquido oral', '5 mg/mL', '', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('668', 'J01XE01', 'Nitrofurantoína', 'Sólido oral ', '100 mg', '', '1', '2', '3', 'O', '', '0.15', 'Amarillo', 'x', null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('669', 'C02DD01', 'Nitroprusiato sódico', 'Sólido parenteral', '50 mg', 'HE', '', '2', '3', 'P', '', '7.5', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('670', 'C01CA03', 'Norepinefrina', 'Líquido parenteral', '1 mg/mL', 'HE', '', '2', '3', 'P', '', '7', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('671', 'H01CB02', 'Octreotide*', 'Líquido parenteral', '0,1 mg/mL  ', 'E ', '', '2', '3', 'P -IV,IM y SC-', '*Uso exclusivo en pacientes con acromegalia, tumores carcinoides, VIPomas y glucagonomas', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('672', 'H01CB02', 'Octreotide*', 'Sólido parenteral -Liberación prolongada-', '20 mg', 'E -p-', '', '', '3', 'P', '*Uso exclusivo en pacientes con acromegalia, tumores carcinoides, VIPomas y glucagonomas', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('673', 'H01CB02', 'Octreotide*', 'Sólido parenteral -Liberación prolongada-', '30 mg', 'E -p-', '', '', '3', 'P', '*Uso exclusivo en pacientes con acromegalia, tumores carcinoides, VIPomas y glucagonomas', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('674', 'B05XX', 'Oligoelementos', 'Líquido parenteral', '', 'HE', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('675', 'S01GX09', 'Olopatadina*', 'Líquido oftálmico', '0,1 %', '', '1', '2', '3', 'Oc', '*Tratamiento de la conjuntivitis alérgica y prurito ocular asociado.', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('676', 'S01GX09', 'Olopatadina*', 'Líquido oftálmico', '0,2 %', '', '1', '2', '3', 'Oc', '*Tratamiento de la conjuntivitis alérgica y prurito ocular asociado.', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('677', 'A02BC01', 'Omeprazol', 'Sólido oral -polvo-', '10 mg/5mL', '', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('678', 'A02BC01', 'Omeprazol', 'Sólido oral', '20 mg', '', '1', '2', '3', 'O', '', '0.04', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('679', 'A02BC01', 'Omeprazol', 'Sólido parenteral', '40 mg', 'H', '', '2', '3', 'P', '', '1.8', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('680', 'A04AA01', 'Ondansetrón', 'Líquido parenteral', '2 mg/mL', 'E', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('681', 'A04AA01', 'Ondansetrón', 'Sólido oral', '4 mg', 'E', '', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('682', 'A04AA01', 'Ondansetrón', 'Sólido oral', '8 mg', 'E', '', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('683', 'J05AH02', 'Oseltamivir', 'Sólido oral', '75 mg', '-p-', '1', '2', '3', 'O', '', '1', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('684', 'J01CF04', 'Oxacilina', 'Sólido parenteral', '1.000 mg', 'HE', '', '2', '3', 'P', '', '0.68', 'Amarillo', 'x', null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('685', 'L01XA03', 'Oxaliplatino', 'Líquido parenteral/Sólido parenteral', '100 mg', 'HE-p-', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('686', 'L01XA03', 'Oxaliplatino', 'Líquido parenteral/Sólido parenteral', '50 mg', 'HE-p-', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('687', 'N02AA05', 'Oxicodona ', 'Sólido oral \n-liberación prolongada-', '10 mg', '-p-', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('688', 'N02AA05', 'Oxicodona ', 'Sólido oral \n-liberación prolongada-', '20 mg', '-p-', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('689', 'N02AA05', 'Oxicodona ', 'Sólido oral \n-liberación prolongada-', '40 mg', '-p-', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('690', 'N02AA05', 'Oxicodona ', 'Sólido oral', '5 mg', '-p-', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('691', 'H01BB02', 'Oxitocina', 'Líquido parenteral', '10 UI/mL', '', '1', '2', '3', 'P', '', '0.45', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('692', 'L01CD01', 'Paclitaxel', 'Líquido parenteral', '6 mg/mL ', 'HE-p-', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('693', 'M03AC01', 'Pancuronio', 'Líquido parenteral', '2 mg/mL', 'HE -p-', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('694', 'N02BE01', 'Paracetamol', 'Líquido oral -gotas-', '100 mg/mL', '', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('695', 'N02BE01', 'Paracetamol', 'Líquido oral', '120 mg/5 mL', '', '1', '2', '3', 'O', '', '0.28', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('696', 'N02BE01', 'Paracetamol', 'Líquido oral', '150 mg/5mL', '', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('697', 'N02BE01', 'Paracetamol', 'Líquido oral', '160 mg/5mL', '', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('698', 'N02BE01', 'Paracetamol', 'Líquido parenteral', '10 mg/mL', '', '1', '2', '3', 'P', '', '', 'Celeste', 'x', null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('699', 'N02BE01', 'Paracetamol', 'Sólido oral', '500 mg ', '', '1', '2', '3', 'O', '', '0.02', 'Verde', 'x', null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('700', 'N02BE01', 'Paracetamol', 'Sólido rectal', '100 mg', '', '1', '2', '3', 'R', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('701', 'N02BE01', 'Paracetamol', 'Sólido rectal', '300 mg', '', '1', '2', '3', 'R', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('702', 'H05BX02', 'Paricalcitol*', 'Líquido parenteral', '5 mcg/mL', 'E-p-', '', '', '3', 'P', '*Exclusivamente como segunda opción en el manejo de hiperparatiroidismo secundario, cuando existe intolerancia a calcitriol en pacientes con insuficiencia renal crónica grado 5 en hemodiálisis', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('703', 'L03AA13', 'Pegfilgrastim*', 'Líquido parenteral', '10 mg/mL', 'HE-p-', '', '2', '3', 'P', '*Uso exclusivo en lugares donde no se puede garantizar la cadena de frío del filgrastim', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('704', 'L03AB10', 'Peginterferón alfa 2b*', 'Líquido parenteral', '100 mcg ', 'HE', '', '2', '3', 'P', '*Para ser utilizado en combinación con ribavirina para el tratamiento de la hepatitis C', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('705', 'L01BA04', 'Pemetrexed', 'Sólido parenteral', '500 mg', 'HE -p-', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('706', 'M01CC01', 'Penicilamina', 'Sólido oral', '125 mg', '', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('707', 'M01CC01', 'Penicilamina', 'Sólido oral', '250 mg', '', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('708', 'P03AC04', 'Permetrina', 'Líquido cutáneo -champú-', '1 % ', '', '1', '2', '3', 'T', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('709', 'P03AC04', 'Permetrina', 'Semisólido cutáneo', '1 % ', '', '1', '2', '3', 'T', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('710', 'D10AE01', 'Peróxido de Benzoilo', 'Semisólido cutáneo o líquido cutáneo', '10 %', '', '1', '2', '3', 'T', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('711', 'D10AE01', 'Peróxido de Benzoilo', 'Semisólido cutáneo o líquido cutáneo', '5 %', '', '1', '2', '3', 'T', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('712', 'L01XC13', 'Pertuzumab*', 'Líquido parenteral', '30 mg/mL', 'HE', '', '', '3', 'P', '*En combinación con trastuzumab y /o docetaxel para el tratamiento de adultos con cáncer de mama con expresión de HER2 + localmente recidivante irresecable o metastásico, que no han recibido tratamiento previo anti Her 2, ECOG  0-1, función cardíaca norma', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('713', 'J01CR05', 'Piperacilina + tazobactam', 'Sólido parenteral', '4.000 mg + 500 mg', 'HE', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('714', 'J04AK01', 'Pirazinamida', 'Sólido oral ', '500 mg', '-p-', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('715', 'N07AA02', 'Piridostigmina*', 'Sólido oral', '60 mg', 'E -p-', '', '2', '3', 'O', '*Uso exclusivo en pacientes con miastenia gravis', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('716', 'A11HA02', 'Piridoxina -Vitamina B6-', 'Líquido parenteral', '150 mg/mL', '', '1', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('717', 'A11HA02', 'Piridoxina -Vitamina B6-', 'Sólido oral', '100 mg', '', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('718', 'P01BD01', 'Pirimetamina ', 'Sólido oral', '25 mg ', 'E-p-', '', '', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('719', 'C05BB02', 'Polidocanol ', 'Líquido parenteral', '3 %', 'E', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('720', 'A06AD65', 'Polietilenglicol -macrogol- en combinaciones', 'Sólido oral -granulado-', '', '', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('721', 'V03AB04', 'Pralidoxima', 'Líquido parenteral', '50 mg/mL', '-p-', '1', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('722', 'P02BA01', 'Praziquantel', 'Sólido oral', '600 mg', '', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('723', 'S01BA04', 'Prednisolona', 'Líquido oftálmico', '0,12 %', 'E', '1', '2', '3', 'Oc', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('724', 'S01BA04', 'Prednisolona', 'Líquido oftálmico', '1 %', 'E', '1', '2', '3', 'Oc', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('725', 'H02AB06', 'Prednisolona', 'Sólido oral ', '20 mg', '', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('726', 'H02AB06', 'Prednisolona', 'Sólido oral ', '5 mg', '', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('727', 'H02AB07', 'Prednisona', 'Sólido oral ', '20 mg', '', '1', '2', '3', 'O', '', '0.08', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('728', 'H02AB07', 'Prednisona', 'Sólido oral ', '5 mg', '', '1', '2', '3', 'O', '', '0.08', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('729', 'P01BA03', 'Primaquina', 'Sólido oral', '15 mg', '', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('730', 'P01BA03', 'Primaquina', 'Sólido oral', '7,5 mg', '', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('731', 'L01XB01', 'Procarbazina', 'Sólido oral ', '50 mg', 'E-p-', '', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('732', 'G03DA04', 'Progesterona  ', 'Sólido oral ', '100 mg', 'E', '', '2', '3', 'O/V', '', '0.32', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('733', 'N01AX10', 'Propofol', 'Líquido parenteral', '10 mg/mL', 'HE -p-', '', '2', '3', 'P', '', '0.18', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('734', 'N01AX10', 'Propofol', 'Líquido parenteral', '20 mg/mL', 'HE -p-', '', '2', '3', 'P', '', '4', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('735', 'C07AA05', 'Propranolol', 'Líquido parenteral', '1 mg/mL ', 'E', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('736', 'C07AA05', 'Propranolol', 'Sólido oral', '10 mg', 'E', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('737', 'C07AA05', 'Propranolol', 'Sólido oral', '40 mg', 'E', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('738', 'C07AA05', 'Propranolol', 'Sólido oral', '80 mg', 'E', '1', '2', '3', 'O', '', '0.05', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('739', 'V03AB14', 'Protamina ', 'Líquido parenteral', '10 mg/mL -1.000 UH/mL-\n10 mg/mL -1.000 UI/mL-', '', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('740', 'N05AH04', 'Quetiapina', 'Sólido oral', '100 mg', 'E', '', '2', '3', 'O', '', '0.36', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('741', 'N05AH04', 'Quetiapina', 'Sólido oral', '200 mg', 'E', '', '2', '3', 'O', '', '1', 'Amarillo', 'x', null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('742', 'N05AH04', 'Quetiapina', 'Sólido oral', '25 mg', 'E', '', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('743', 'N05AH04', 'Quetiapina', 'Sólido oral', '300 mg', 'E', '', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('744', 'P01BC01', 'Quinina', 'Líquido parenteral', '300 mg/mL', '', '1', '2', '3', 'P', '', '1', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('745', 'P01BC01', 'Quinina', 'Sólido oral ', '300 mg', '', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('746', 'J05AX08', 'Raltegravir', 'Sólido oral ', '400 mg', '-p-', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('747', 'A02BA02', 'Ranitidina', 'Líquido parenteral', '25 mg/mL', 'H', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('748', 'A02BA02', 'Ranitidina', 'Sólido oral', '150 mg ', '', '1', '2', '3', 'O', '', '0.03', 'Amarillo', 'x', null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('749', 'N01AH06', 'Remifentanilo', 'Sólido parenteral', '2 mg', 'HE -p-', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('750', 'N01AH06', 'Remifentanilo', 'Sólido parenteral', '5 mg', 'HE -p-', '', '2', '3', 'P', '', '2.45', 'Rojo', 'x', null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('751', 'A11CA01', 'Retinol -Vitamina A-*', 'Líquido oral', '50.000 UI', '', '1', '2', '3', 'O', '*Tratamiento y profilaxis de la deficiencia de vitamina A.', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('752', 'A11CA01', 'Retinol -Vitamina A-*', 'Sólido oral', '50.000 UI ', '', '1', '2', '3', 'O', '*Tratamiento y profilaxis de la deficiencia de vitamina A.', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('753', 'J05AP01', 'Ribavirina*', 'Sólido oral ', '200 mg', 'HE', '', '2', '3', 'O', '*Tratamiento de la infección por el virus de la hepatitis C.', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('754', 'J05AP01', 'Ribavirina*', 'Sólido oral ', '400 mg', 'HE', '', '2', '3', 'O', '*Tratamiento de la infección por el virus de la hepatitis C.', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('755', 'J05AP01', 'Ribavirina*', 'Sólido oral ', '600 mg', 'HE', '', '2', '3', 'O', '*Tratamiento de la infección por el virus de la hepatitis C.', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('756', 'J04AM02', 'Rifampicina + Isoniazida', 'Sólido oral ', '150 mg + 150 mg', '-p-', '1', '2', '3', 'O', '', '0.42', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('757', 'J04AM02', 'Rifampicina + Isoniazida', 'Sólido oral ', '150 mg + 75 mg', '-p-', '1', '2', '3', 'O', '', '5.84', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('758', 'J04AM02', 'Rifampicina + Isoniazida', 'Sólido oral ', '300 mg + 150 mg', '-p-', '1', '2', '3', 'O', '', '5.84', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('759', 'J04AM02', 'Rifampicina + Isoniazida', 'Sólido oral ', '75 mg + 50 mg', '-p-', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('760', 'J04AM06', 'Rifampicina + Pirazinamida + Etambutol + Isoniazida', 'Sólido oral ', '150 mg + 400 mg + 275 mg + 75 mg', '-p-', '1', '2', '3', 'O', '', '0.42', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('761', 'J04AM05', 'Rifampicina + Pirazinamida + Isoniazida', 'Sólido oral ', '120 mg + 300 mg + 60 mg', '-p-', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('762', 'J04AM05', 'Rifampicina + Pirazinamida + Isoniazida', 'Sólido oral ', '150 mg + 400 mg + 75 mg', '-p-', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('763', 'J04AB02', 'Rifampicina', 'Líquido oral', '20 mg/mL', '-p-', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('764', 'J04AB02', 'Rifampicina', 'Sólido oral ', '300 mg', '-p-', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('765', 'N05AX08', 'Risperidona', 'Líquido oral', '1 mg/mL', 'E', '', '2', '3', 'O', '', '7.8', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('766', 'N05AX08', 'Risperidona', 'Sólido oral', '1 mg', 'E', '', '2', '3', 'O', '', '1', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('767', 'N05AX08', 'Risperidona', 'Sólido oral', '2 mg', 'E', '', '2', '3', 'O', '', '1', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('768', 'N05AX08', 'Risperidona', 'Sólido parenteral', '25 mg', 'E', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('769', 'N05AX08', 'Risperidona', 'Sólido parenteral', '37,5 mg', 'E', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('770', 'J05AE03', 'Ritonavir', 'Sólido oral ', '100 mg', '-p-', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('771', 'L01XC02', 'Rituximab', 'Líquido parenteral', '10 mg/mL', 'HE -p-', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('772', 'L01XC02', 'Rituximab', 'Líquido parenteral', '1400 mg/11,7 mL', 'HE -p-', '', '2', '3', 'SC', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('773', 'B01AF01', 'Rivaroxabán* ', 'Sólido oral', '10 mg', 'HE', '', '2', '3', 'O', '*Anticoagulación  en pacientes en quienes está contraindicado el uso de warfarina o heparinas.', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('774', 'B01AF01', 'Rivaroxabán* ', 'Sólido oral', '15 mg', 'HE', '', '2', '3', 'O', '*Anticoagulación  en pacientes en quienes está contraindicado el uso de warfarina o heparinas.', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('775', 'B01AF01', 'Rivaroxabán* ', 'Sólido oral', '2,5 mg', 'HE', '', '2', '3', 'O', '*Anticoagulación  en pacientes en quienes está contraindicado el uso de warfarina o heparinas.', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('776', 'B01AF01', 'Rivaroxabán* ', 'Sólido oral', '20 mg', 'HE', '', '2', '3', 'O', '*Anticoagulación  en pacientes en quienes está contraindicado el uso de warfarina o heparinas.', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('777', 'M03AC09', 'Rocuronio, bromuro', 'Líquido parenteral', '10 mg/mL', 'HE -p-', '', '2', '3', 'P', '', '6.8', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('778', 'L01XE18', 'Ruxolitinib*', 'Sólido oral', '10 mg', 'E', '', '', '3', 'O', '*Pacientes adultos con mielofibrosis que presenten esplenomegalia y  síntomas constitucionales.', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('779', 'L01XE18', 'Ruxolitinib*', 'Sólido oral', '15 mg', 'E', '', '', '3', 'O', '*Pacientes adultos con mielofibrosis que presenten esplenomegalia y  síntomas constitucionales.', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('780', 'L01XE18', 'Ruxolitinib*', 'Sólido oral', '20 mg', 'E', '', '', '3', 'O', '*Pacientes adultos con mielofibrosis que presenten esplenomegalia y  síntomas constitucionales.', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('781', 'L01XE18', 'Ruxolitinib*', 'Sólido oral', '5 mg', 'E', '', '', '3', 'O', '*Pacientes adultos con mielofibrosis que presenten esplenomegalia y  síntomas constitucionales.', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('782', 'R03AC02', 'Salbutamol', 'Líquido para inhalación', '0,1 mg/dosis', '', '1', '2', '3', 'I ', '', '4.5', 'Verde', 'x', null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('783', 'R03AC02', 'Salbutamol', 'Líquido para nebulización', '5 mg/mL', '', '1', '2', '3', 'I ', '', '5.00', 'Verde', 'x', null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('784', 'B03AD', 'Sales de hierro + Ácido fólico', 'Sólido oral', '60 mg + 400 mcg', '', '1', '2', '3', 'O', '', '1', 'Amarillo', 'x', null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('785', 'A07CA', 'Sales de rehidratación oral\n\n', 'Sólido oral -polvo-', 'Glucosa 13,5 g/L - 20 g/L\nCloruro de Sodio 2,6 g/L - 3,5 g/L\nCloruro de Potasio  1,5 g/L\nCitrato trisódico dihidrato 2,9 g/L\nNota\nSe describen los componentes y concentraciones exactas  de esta formulación, se pueden adherir otros elementos como el zinc, ', '', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('786', 'N04BD01', 'Selegilina', 'Sólido oral', '5 mg', 'E', '', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('787', 'N06AB06', 'Sertralina', 'Sólido oral', '100 mg', 'E -p-', '', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('788', 'N06AB06', 'Sertralina', 'Sólido oral', '50 mg', 'E -p-', '', '2', '3', 'O', '', '0.16', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('789', 'N01AB08', 'Sevoflurano', 'Líquido para inhalación', '1 mg/mL', 'HE -p-', '', '2', '3', 'I', '', '79', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('790', 'G04BE03', 'Sildenafilo*', 'Sólido oral', '100 mg', 'HE', '', '', '3', 'O', '*Uso exclusivo en hipertensión pulmonar. ', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('791', 'G04BE03', 'Sildenafilo*', 'Sólido oral', '25 mg', 'HE', '', '', '3', 'O', '*Uso exclusivo en hipertensión pulmonar. ', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('792', 'G04BE03', 'Sildenafilo*', 'Sólido oral', '50 mg', 'HE', '', '', '3', 'O', '*Uso exclusivo en hipertensión pulmonar. ', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('793', 'C10AA01', 'Simvastatina', 'Sólido oral ', '20 mg', '', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('794', 'C10AA01', 'Simvastatina', 'Sólido oral ', '40 mg', '', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('795', 'L04AA10', 'Sirólimus', 'Sólido oral ', '1 mg', 'E -p-', '', '', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('796', 'J05AP08', 'Sofosbuvir*', 'Sólido oral ', '400 mg', 'HE', '', '2', '3', 'O', '*Tratamiento de hepatitis C', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('797', 'B05DB', 'Soluciones hipertónicas \n-diálisis peritoneal-', 'Líquido parenteral', '1,5 %', 'E', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('798', 'B05DB', 'Soluciones hipertónicas \n-diálisis peritoneal-', 'Líquido parenteral', '2,25 % - 2,5 %', 'E', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('799', 'B05DB', 'Soluciones hipertónicas \n-diálisis peritoneal-', 'Líquido parenteral', '4,25 % - 4,5 %', 'E', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('800', 'H01AC01', 'Somatotropina* ', 'Sólido parenteral/líquido parenteral', '12 mg', 'HE -p-', '', '', '3', 'P', '*Déficit de hormona  de crecimiento. -medicamento sujeto a seguimiento y reporte de resultados-', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('801', 'H01AC01', 'Somatotropina* ', 'Sólido parenteral/líquido parenteral', '5,3 mg', 'HE -p-', '', '', '3', 'P', '*Déficit de hormona  de crecimiento. -medicamento sujeto a seguimiento y reporte de resultados-', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('802', 'H01AC01', 'Somatotropina* ', 'Sólido parenteral/líquido parenteral', '6 mg -5,83 mg/mL-', 'HE -p-', '', '', '3', 'P', '*Déficit de hormona  de crecimiento. -medicamento sujeto a seguimiento y reporte de resultados-', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('803', 'H01AC01', 'Somatotropina* ', 'Sólido parenteral/líquido parenteral', '8 mg', 'HE -p-', '', '', '3', 'P', '*Déficit de hormona  de crecimiento. -medicamento sujeto a seguimiento y reporte de resultados-', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('804', 'L01XE05', 'Sorafenib*', 'Sólido oral', '200 mg', 'HE', '', '', '3', 'O', '*Carcinoma hepatocelular avanzado o metastásico irresecable. Carcinoma  diferenciado de tiroides -papilar/folicular/de células de Hurthle- en progresión, localmente avanzado, resistente al tratamiento de  yodo radioactivo.', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('805', 'J06AA03', 'Suero antiofídico polivalente', 'Líquido parenteral/ sólido parenteral', '', '', '1', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('806', 'V03AB35', 'Sugammadex*', 'Líquido parenteral ', '100 mg/mL', 'E', '', '2', '3', 'P', '*Solo en caso de emergencia para pacientes con obesidad mórbida, pacientes con bloqueo neuromuscular profundo persistente después del intento de reversión neuromuscular con neostigmina.', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('807', 'D06BA01', 'Sulfadiazina de plata', 'Semisólido cutáneo', '1 %', '', '1', '2', '3', 'T', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('808', 'J01EC02', 'Sulfadiazina', 'Sólido oral', '500 mg', 'E-p-', '', '', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('809', 'A07EC01', 'Sulfasalazina', 'Sólido oral', '500 mg', 'E', '', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('810', 'B05XA05', 'Sulfato de Magnesio -Heptahidratado-', 'Líquido parenteral', '0,2', '', '1', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('811', 'A12CB01', 'Sulfato de Zinc*', 'Líquido oral', '2 mg/mL', '', '1', '2', '3', 'O', '*Déficit de zinc por carencia alimentaria. Diarrea aguda en niños menores de 5 años', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('812', 'A12CB01', 'Sulfato de Zinc*', 'Líquido oral', '20 mg/5 mL', '', '1', '2', '3', 'O', '*Déficit de zinc por carencia alimentaria. Diarrea aguda en niños menores de 5 años', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('813', 'A12CB01', 'Sulfato de Zinc*', 'Líquido oral', '5 mg/mL', '', '1', '2', '3', 'O', '*Déficit de zinc por carencia alimentaria. Diarrea aguda en niños menores de 5 años', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('814', 'A12CB01', 'Sulfato de Zinc*', 'Sólido oral -dispersable-', '20 mg', '', '1', '2', '3', 'O', '*Déficit de zinc por carencia alimentaria. Diarrea aguda en niños menores de 5 años', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('815', 'J01CR04', 'Sultamicilina ', 'Sólido oral', '375 mg', '', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('816', 'J01CR04', 'Sultamicilina ', 'Sólido oral', '750 mg', '', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('817', 'L01XE04', 'Sunitinib*', 'Sólido oral ', '12,5 mg', 'E -p-', '', '', '3', 'O', '*Uso exclusivo en pacientes con carcinoma de células claras de riñón estadío avanzado o metastásico con índice de Karnofsky de 60% .ECOG 0-2.', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('818', 'L01XE04', 'Sunitinib*', 'Sólido oral ', '25 mg', 'E -p-', '', '', '3', 'O', '*Uso exclusivo en pacientes con carcinoma de células claras de riñón estadío avanzado o metastásico con índice de Karnofsky de 60% .ECOG 0-2.', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('819', 'L01XE04', 'Sunitinib*', 'Sólido oral ', '50 mg', 'E -p-', '', '', '3', 'O', '*Uso exclusivo en pacientes con carcinoma de células claras de riñón estadío avanzado o metastásico con índice de Karnofsky de 60% .ECOG 0-2.', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('820', 'M03AB01', 'Suxametonio', 'Líquido parenteral', '20 mg/mL', 'HE -p-', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('821', 'L04AD02', 'Tacrolimo -Tacrólimus-*', 'Líquido parenteral', '5 mg/mL', 'HE', '', '2', '3', 'P', '*Tratamiento  para prevención del rechazo al trasplante.', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('822', 'L04AD02', 'Tacrolimo -Tacrólimus-*', 'Sólido oral -polvo-', '0,5 mg/mL', 'HE', '', '2', '3', 'O', '*Tratamiento  para prevención del rechazo al trasplante.', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('823', 'L04AD02', 'Tacrolimo -Tacrólimus-*', 'Sólido oral -polvo-', '1 mg/mL', 'HE', '', '2', '3', 'O', '*Tratamiento  para prevención del rechazo al trasplante.', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('824', 'L04AD02', 'Tacrolimo -Tacrólimus-*', 'Sólido oral', '0,5 mg', 'HE', '', '2', '3', 'O', '*Tratamiento  para prevención del rechazo al trasplante.', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('825', 'L04AD02', 'Tacrolimo -Tacrólimus-*', 'Sólido oral', '1 mg', 'HE', '', '2', '3', 'O', '*Tratamiento  para prevención del rechazo al trasplante.', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('826', 'L04AD02', 'Tacrolimo -Tacrólimus-*', 'Sólido oral', '5 mg', 'HE', '', '2', '3', 'O', '*Tratamiento  para prevención del rechazo al trasplante.', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('827', 'L04AX02', 'Talidomida', 'Sólido oral ', '100 mg', 'E -p-', '', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('828', 'L02BA01', 'Tamoxifeno*', 'Sólido oral ', '10 mg', 'E-p-', '', '2', '3', 'O', '*Uso exclusivo en mujeres con cáncer de mama receptores hormonales positivos', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('829', 'L02BA01', 'Tamoxifeno*', 'Sólido oral ', '20 mg', 'E-p-', '', '2', '3', 'O', '*Uso exclusivo en mujeres con cáncer de mama receptores hormonales positivos', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('830', 'G04CA02', 'Tamsulosina', 'Sólido oral ', '0,4 mg', 'E', '1', '2', '3', 'O', '', '0.37', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('831', 'L01AX03', 'Temozolomida', 'Sólido oral ', '100 mg', 'E -p-', '', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('832', 'L01AX03', 'Temozolomida', 'Sólido oral ', '20 mg', 'E -p-', '', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('833', 'L01AX03', 'Temozolomida', 'Sólido oral ', '250 mg', 'E -p-', '', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('834', 'J05AR06', 'Tenofovir + Emtricitabina + Efavirenz', 'Sólido oral ', '300 mg + 200 mg + 600 mg', '-p-', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('835', 'J05AR03', 'Tenofovir + Emtricitabina', 'Sólido oral ', '300 mg + 200 mg', '-p-', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('836', 'J05AF07', 'Tenofovir disoproxilo', 'Sólido oral ', '300 mg', '-p-', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('837', 'D01AE15', 'Terbinafina', 'Semisólido cutáneo', '1 %', '', '1', '2', '3', 'T', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('838', 'D01BA02', 'Terbinafina', 'Sólido oral ', '250 mg', '', '1', '2', '3', 'O', '', '0.25', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('839', 'H01BA04', 'Terlipresina* ', 'Sólido parenteral/líquido parenteral', '1 mg que equivale a 0,86 mg', 'HE', '', '2', '3', 'P', '*Várices esofágicas sangrantes', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('840', 'G03BA03', 'Testosterona', 'Líquido parenteral', '250 mg/mL', 'E', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('841', 'J06AA02', 'Tetánica antitoxina', 'Líquido parenteral', '', '', '1', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('842', 'H03BB02', 'Tiamazol -Metimazol-', 'Sólido oral ', '5 mg', 'E', '', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('843', 'A11DA01', 'Tiamina -Vitamina B1-', 'Líquido parenteral', '50 mg/mL', '', '1', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('844', 'A11DA01', 'Tiamina -Vitamina B1-', 'Sólido oral', '50 mg', '', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('845', 'B01AC24', 'Ticagrelor*', 'Sólido oral', '60 mg', 'HE', '', '2', '3', 'O', '*Síndrome coronario agudo tanto con elevación  y sin elevación del ST de riesgo alto y resistencia demostrada a clopidogrel', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('846', 'B01AC24', 'Ticagrelor*', 'Sólido oral', '90 mg', 'HE', '', '2', '3', 'O', '*Síndrome coronario agudo tanto con elevación  y sin elevación del ST de riesgo alto y resistencia demostrada a clopidogrel', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('847', 'J01AA12', 'Tigeciclina* ', 'Sólido parenteral', '50 mg', 'HE', '', '2', '3', 'P', '*Infecciones complicadas de piel y tejidos blandos; intrabdominales o neumonía por patógenos sensibles.', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('848', 'S01ED01', 'Timolol', 'Líquido oftálmico', '0,25 %', 'E -p-', '', '2', '3', 'Oc', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('849', 'S01ED01', 'Timolol', 'Líquido oftálmico', '0,5 %', 'E -p-', '', '2', '3', 'Oc', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('850', 'P01AB02', 'Tinidazol', 'Sólido oral', '1.000 mg', '', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('851', 'P01AB02', 'Tinidazol', 'Sólido vaginal', '150 mg', '', '1', '2', '3', 'V', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('852', 'L01BB03', 'Tioguanina', 'Sólido oral ', '40 mg', 'E-p-', '', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('853', 'N01AF03', 'Tiopental sódico', 'Sólido parenteral', '1 g', 'H -p-', '', '2', '3', 'P', '', '5.2', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('854', 'R03BB04', 'Tiotropio bromuro', 'Sólido para inhalación', '22,5 mcg -equivalente a 18 mcg de tiotropio base-', '-p-', '1', '2', '3', 'I ', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('855', 'B01AC17', 'Tirofibán*', 'Líquido parenteral', '0,25 mg/mL', 'HE -p-', '', '', '3', 'P', '*En pacientes sin elevación del segmento ST y con episodio de dolor torácico de hasta 12 horas de evolución', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('856', 'H01AB01', 'Tirotropina Alfa*', 'Sólido parenteral', '0,9 mg', 'HE', '', '', '3', 'P', '*Estimulación pre terapéutica  en combinación con yodo para la ablación de remanentes de tejido tiroideo', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('857', 'J01GB01', 'Tobramicina*', 'Líquido para inhalación', '60 mg/mL', 'HE -p-', '', '2', '3', 'I', '*Uso exclusivo en pacientes con fibrosis quística', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('858', 'J01GB01', 'Tobramicina*', 'Sólido para inhalación', '28 mg', 'HE -p-', '', '2', '3', 'I', '*Uso exclusivo en pacientes con fibrosis quística', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('859', 'S01AA12', 'Tobramicina', 'Líquido oftálmico', '0,3 %', '', '1', '2', '3', 'Oc', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('860', 'S01AA12', 'Tobramicina', 'Semisólido oftálmico', '0,3 %', '', '1', '2', '3', 'Oc', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('861', 'L04AC07', 'Tocilizumab* ', 'Líquido parenteral', '162 mg/0,9 mL', 'E ', '', '2', '3', 'P', '*Para el tratamiento de la artritis reumatoide activa de moderada a grave en pacientes adultos con respuesta inadecuada o intolerancia a un tratamiento previo. Artritis Idiopática juvenil en sus formas sistémicas y poliarticular.', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('862', 'L04AC07', 'Tocilizumab* ', 'Líquido parenteral', '20 mg/mL', 'E ', '', '2', '3', 'P', '*Para el tratamiento de la artritis reumatoide activa de moderada a grave en pacientes adultos con respuesta inadecuada o intolerancia a un tratamiento previo. Artritis Idiopática juvenil en sus formas sistémicas y poliarticular.', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('863', 'M03AX01', 'Toxina botulínica ', 'Sólido parenteral', '100 U', 'HE -p-', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('864', 'M03AX01', 'Toxina botulínica ', 'Sólido parenteral', '500 U', 'HE -p-', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('865', 'J07AM51', 'Toxoide diftérico tetánico -Toxoide diftérico + Toxoide tetánico-', 'Líquido parenteral', '', '', '1', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('866', 'J07AJ52', 'Toxoide diftérico tetánico + Vacuna pertussis -Vacuna triple DPT-', 'Líquido parenteral', '', '', '1', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('867', 'J07AM01', 'Toxoide tetánico', 'Líquido parenteral', '> 40 UI/0,5mL', '', '1', '2', '3', 'P', '', '1', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('868', 'N02AX02', 'Tramadol', 'Líquido oral', '100 mg/mL', '', '1', '2', '3', 'O', '', '3.27', 'Amarillo', 'x', null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('869', 'N02AX02', 'Tramadol', 'Líquido parenteral', '50 mg/mL', 'H', '', '2', '3', 'P', '', '', 'Amarillo', 'x', null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('870', 'N02AX02', 'Tramadol', 'Sólido oral', '50 mg', '', '1', '2', '3', 'O', '', '0.17', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('871', 'L01XC03', 'Trastuzumab*', 'Líquido parenteral ', '120 mg/mL', 'E', '', '2', '3', 'SC', '*Uso exclusivo en pacientes HER 2 Neu positivo +++ -tres cruces- por inmunohistoquímica o Fish positivo', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('872', 'L01XC03', 'Trastuzumab*', 'Sólido parenteral', '440 mg', 'HE -p-', '', '', '3', 'P', '*Uso exclusivo en pacientes HER 2 Neu positivo +++ -tres cruces- por inmunohistoquímica o Fish positivo', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('873', 'C01DA02', 'Trinitrato de glicerilo -Nitroglicerina-', 'Líquido parenteral', '5 mg/mL', 'HE', '', '2', '3', 'P', '', '', 'Verde', 'x', null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('874', 'D03AX12', 'Trolamina*', 'Semisólido cutáneo', '0,0067', '', '', '2', '3', 'T', '*Uso exclusivo en pacientes con quemaduras cutáneas debido a radioterapia. En caso de heridas infectadas deberá tratarse la infección y concomitantemente podrá aplicarse trolamina', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('875', 'S01FA06', 'Tropicamida', 'Líquido oftálmico', '1 %', 'E -p-', '', '2', '3', 'Oc', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('876', 'D02AE01', 'Urea', 'Semisólido cutáneo', '10 %', '', '1', '2', '3', 'T', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('877', 'D02AE01', 'Urea', 'Semisólido cutáneo', '20 %', '', '1', '2', '3', 'T', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('878', 'D02AE01', 'Urea', 'Semisólido cutáneo', '5 %', '', '1', '2', '3', 'T', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('879', 'J07BL01', 'Vacuna antiamarílica', 'Sólido parenteral', '', '', '1', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('880', 'J07BC02', 'Vacuna antihepatitis A', 'Líquido parenteral ', '', '', '1', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('881', 'J07BC01', 'Vacuna antihepatitis B', 'Líquido parenteral ', '', '', '1', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('882', 'J07AH02', 'Vacuna antimeningococo', 'Líquido parenteral/ sólido parenteral', '', '', '1', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('883', 'J07AL02', 'Vacuna antineumococo -polisacárido y conjugado-', 'Líquido parenteral', '', '', '1', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('884', 'J07BF02', 'Vacuna antipoliomielítica', 'Líquido oral', '', '', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('885', 'J07BH01', 'Vacuna antirotavirus', 'Líquido oral', '', '', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('886', 'J07BG01', 'Vacuna antirrábica', 'Líquido parenteral/ sólido parenteral', '', '', '1', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('887', 'J07AN01', 'Vacuna BCG antituberculosa', 'Sólido parenteral', '', '', '1', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('888', 'L03AX03', 'Vacuna BCG*', 'Líquido parenteral/ sólido parenteral', '', 'HE', '', '2', '3', 'Intravesical ', '*Cáncer de vejiga en etapa inicial', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('889', 'J07BB02', 'Vacuna de la Influenza Inactivado y Separado, o Antígeno Superficial', 'Líquido parenteral', '', '', '1', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('890', 'J07CA11', 'Vacuna pentavalente  viral  -Difteria - haemophilus influenzae B - pertussis -  tétanos - hepatitis B -', 'Líquido parenteral/ sólido parenteral', '', '', '1', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('891', 'J07BF03', 'Vacuna Poliomielitis, Inactivado, Virus Entero, Trivalente', 'Líquido parenteral', '', '', '1', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('892', 'J07BF04', 'Vacuna Poliomielitis, Virus Vivo Atenuado, Bivalente -bOPV-', 'Líquido oral', '', '', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('893', 'J07BD53', 'Vacuna Sarampión, Virus Vivo Atenuado Combinado con la Vacuna contra la Rubéola', 'Sólido parenteral', '', '', '1', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('894', 'J07BD52', 'Vacuna triple viral -Parotiditis-Sarampión- Rubéola-', 'Sólido parenteral', '', '', '1', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('895', 'J07BK01', 'Vacuna Varicela, Virus Vivo Atenuado', 'Sólido parenteral', '', '', '1', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('896', 'J05AB14', 'Valganciclovir', 'Sólido oral ', '450 mg', 'E ', '', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('897', 'J01XA01', 'Vancomicina', 'Sólido parenteral', '1.000 mg', 'HE -p-', '', '2', '3', 'P', '', '', 'Verde', 'x', null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('898', 'J01XA01', 'Vancomicina', 'Sólido parenteral', '500 mg', 'HE -p-', '', '2', '3', 'P', '', '4.21', 'Verde', 'x', null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('899', 'L01XE15', 'Vemurafenib* ', 'Sólido oral', '240 mg', 'HE', '', '', '3', 'O', '*Tratamiento de pacientes adultos menores de 70 años de edad,  con melanoma metastásico o irresecable con mutación documentada de  BRAF V600  + detectada por una prueba validada. Karnofsky mayor a 70%. ', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('900', 'L01CA01', 'Vinblastina', 'Líquido parenteral', '1 mg/mL', 'HE-p-', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('901', 'L01CA02', 'Vincristina', 'Líquido parenteral', '1 mg/mL ', 'E-p-', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('902', 'L01CA02', 'Vincristina', 'Sólido parenteral', '1 mg', 'E-p-', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('903', 'L01CA04', 'Vinorelbina* ', 'Líquido parenteral ', '10 mg/mL', 'HE', '', '2', '3', 'P', '*Cáncer de pulmón de células no pequeñas. Cáncer de mama metastásico.', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('904', 'J02AC03', 'Voriconazol', 'Sólido oral*', '200 mg', 'E', '', '2', '3', 'O', '*Uso exclusivo en pacientes que requieren terapia ambulatoria luego de recibir voriconazol parenteral', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('905', 'J02AC03', 'Voriconazol', 'Sólido parenteral', '200 mg', 'E', '', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('906', 'B01AA03', 'Warfarina', 'Sólido oral', '1 mg', 'E', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('907', 'B01AA03', 'Warfarina', 'Sólido oral', '2 mg', 'E', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('908', 'B01AA03', 'Warfarina', 'Sólido oral', '2.5 mg', 'E', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('909', 'B01AA03', 'Warfarina', 'Sólido oral', '5 mg', 'E', '1', '2', '3', 'O', '', '0.3', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('910', 'J05AR01', 'Zidovudina + Lamivudina', 'Sólido oral ', '300 mg + 150 mg', '-p-', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('911', 'J05AF01', 'Zidovudina', 'Líquido oral', '50 mg/5mL', '-p-', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('912', 'J05AF01', 'Zidovudina', 'Líquido parenteral', '10 mg/mL', '-p-', '1', '2', '3', 'P', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('913', 'J05AF01', 'Zidovudina', 'Sólido oral ', '100 mg', '-p-', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('914', 'J05AF01', 'Zidovudina', 'Sólido oral ', '300 mg', '-p-', '1', '2', '3', 'O', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('915', 'D01AA20', 'Zinc + Nistatina', 'Semisólido cutáneo', '', '', '1', '2', '3', 'T', '', '', '', null, null);
INSERT INTO `conf_cuadro_nacional_de_medicamentos_basicos` VALUES ('916', 'D02AB', 'Zinc', 'Semisólido cutáneo', '', '', '1', '2', '3', 'T', '', '', '', null, null);

-- ----------------------------
-- Table structure for conf_cuartos
-- ----------------------------
DROP TABLE IF EXISTS `conf_cuartos`;
CREATE TABLE `conf_cuartos` (
  `id_cuarto` int(255) NOT NULL AUTO_INCREMENT,
  `id_servicio` int(255) DEFAULT NULL,
  `cuarto` varchar(255) DEFAULT NULL,
  `id_tecnico` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_cuarto`),
  KEY `idservicio` (`id_servicio`),
  CONSTRAINT `idservicio` FOREIGN KEY (`id_servicio`) REFERENCES `conf_servicios` (`id_servicio`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=150 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of conf_cuartos
-- ----------------------------
INSERT INTO `conf_cuartos` VALUES ('1', '1', 'Aislamiento Neonatología', null);
INSERT INTO `conf_cuartos` VALUES ('2', '1', 'Básicos Cunas Corrientes', null);
INSERT INTO `conf_cuartos` VALUES ('3', '1', 'Intermedios Cunas Corrientes E Incubadoras', null);
INSERT INTO `conf_cuartos` VALUES ('4', '1', 'Críticos Incubadoras Y Cunas Radiantes', null);
INSERT INTO `conf_cuartos` VALUES ('5', '2', 'Hospitalización Pediatría 1', null);
INSERT INTO `conf_cuartos` VALUES ('6', '2', 'Hospitalización Pediatría 2', null);
INSERT INTO `conf_cuartos` VALUES ('7', '2', 'Hospitalización Pediatría 3', null);
INSERT INTO `conf_cuartos` VALUES ('8', '2', 'Hospitalización Pediatría 4', null);
INSERT INTO `conf_cuartos` VALUES ('9', '2', 'Hospitalización Pediatría 5', null);
INSERT INTO `conf_cuartos` VALUES ('10', '2', 'Hospitalización Pediatría 6', null);
INSERT INTO `conf_cuartos` VALUES ('11', '2', 'Hospitalización Pediatría 7', null);
INSERT INTO `conf_cuartos` VALUES ('12', '2', 'Hospitalización Pediatría 8', null);
INSERT INTO `conf_cuartos` VALUES ('13', '2', 'Aislamiento Pediatría 1', null);
INSERT INTO `conf_cuartos` VALUES ('14', '2', 'Aislamiento Pediatría 2', null);
INSERT INTO `conf_cuartos` VALUES ('15', '2', 'Aislamiento Pediatría 3', null);
INSERT INTO `conf_cuartos` VALUES ('16', '2', 'Aislamiento Pediatría 4', null);
INSERT INTO `conf_cuartos` VALUES ('17', '3', 'Hospitalización Convencional Médico Clínica 1', null);
INSERT INTO `conf_cuartos` VALUES ('18', '3', 'Hospitalización Convencional Médico Clínica 2', null);
INSERT INTO `conf_cuartos` VALUES ('19', '3', 'Hospitalización Convencional Médico Clínica 3', null);
INSERT INTO `conf_cuartos` VALUES ('20', '3', 'Hospitalización Convencional Médico Clínica 4', null);
INSERT INTO `conf_cuartos` VALUES ('21', '3', 'Hospitalización Convencional Médico Clínica 5', null);
INSERT INTO `conf_cuartos` VALUES ('22', '3', 'Hospitalización Convencional Médico Clínica 6', null);
INSERT INTO `conf_cuartos` VALUES ('23', '3', 'Hospitalización Convencional Médico Clínica 7', null);
INSERT INTO `conf_cuartos` VALUES ('24', '3', 'Hospitalización Convencional Médico Clínica 8', null);
INSERT INTO `conf_cuartos` VALUES ('25', '3', 'Hospitalización Convencional Médico Clínica 9', null);
INSERT INTO `conf_cuartos` VALUES ('26', '3', 'Hospitalización Convencional Médico Clínica 10', null);
INSERT INTO `conf_cuartos` VALUES ('27', '3', 'Hospitalización Convencional Médico Clínica 11', null);
INSERT INTO `conf_cuartos` VALUES ('28', '3', 'Hospitalización Convencional Médico Clínica 12', null);
INSERT INTO `conf_cuartos` VALUES ('29', '3', 'Hospitalización Convencional Médico Clínica 13', null);
INSERT INTO `conf_cuartos` VALUES ('30', '3', 'Hospitalización Convencional Médico Clínica 14', null);
INSERT INTO `conf_cuartos` VALUES ('31', '3', 'Hospitalización Convencional Médico Clínica 15', null);
INSERT INTO `conf_cuartos` VALUES ('32', '3', 'Hospitalización Convencional Médico Clínica 16', null);
INSERT INTO `conf_cuartos` VALUES ('33', '3', 'Hospitalización Convencional Médico Clínica 17', null);
INSERT INTO `conf_cuartos` VALUES ('34', '3', 'Hospitalización Convencional Médico Clínica 18', null);
INSERT INTO `conf_cuartos` VALUES ('35', '3', 'Hospitalización Convencional Médico Clínica 19', null);
INSERT INTO `conf_cuartos` VALUES ('36', '3', 'Hospitalización Convencional Médico Clínica 20', null);
INSERT INTO `conf_cuartos` VALUES ('37', '3', 'Hospitalización Convencional Médico Clínica 21', null);
INSERT INTO `conf_cuartos` VALUES ('38', '3', 'Hospitalización Convencional Médico Clínica 22', null);
INSERT INTO `conf_cuartos` VALUES ('39', '3', 'Aislamiento Hospitalización Convencional Médico Clínica Lado Derecho 1', null);
INSERT INTO `conf_cuartos` VALUES ('40', '3', 'Aislamiento Hospitalización Convencional Médico Clínica Lado Derecho 2', null);
INSERT INTO `conf_cuartos` VALUES ('41', '3', 'Aislamiento Hospitalización Convencional Médico Clínica Lado Izquierdo 1', null);
INSERT INTO `conf_cuartos` VALUES ('42', '3', 'Aislamiento Hospitalización Convencional Médico Clínica Lado Izquierdo 2', null);
INSERT INTO `conf_cuartos` VALUES ('43', '3', 'Aislamiento Hospitalización Convencional Médico Clínica Lado Izquierdo 3', null);
INSERT INTO `conf_cuartos` VALUES ('44', '4', 'Hospitalización Convencional Quirúrgica 1', null);
INSERT INTO `conf_cuartos` VALUES ('45', '4', 'Hospitalización Convencional Quirúrgica 2', null);
INSERT INTO `conf_cuartos` VALUES ('46', '4', 'Hospitalización Convencional Quirúrgica 3', null);
INSERT INTO `conf_cuartos` VALUES ('47', '4', 'Hospitalización Convencional Quirúrgica 4', null);
INSERT INTO `conf_cuartos` VALUES ('48', '4', 'Hospitalización Convencional Quirúrgica 5', null);
INSERT INTO `conf_cuartos` VALUES ('49', '4', 'Hospitalización Convencional Quirúrgica 6', null);
INSERT INTO `conf_cuartos` VALUES ('50', '4', 'Hospitalización Convencional Quirúrgica 7', null);
INSERT INTO `conf_cuartos` VALUES ('51', '4', 'Hospitalización Convencional Quirúrgica 8', null);
INSERT INTO `conf_cuartos` VALUES ('52', '4', 'Hospitalización Convencional Quirúrgica 9', null);
INSERT INTO `conf_cuartos` VALUES ('53', '4', 'Hospitalización Convencional Quirúrgica 10', null);
INSERT INTO `conf_cuartos` VALUES ('54', '4', 'Aislamiento Cirugía 1', null);
INSERT INTO `conf_cuartos` VALUES ('55', '4', 'Aislamiento Cirugía 2', null);
INSERT INTO `conf_cuartos` VALUES ('56', '4', 'Aislamiento Cirugía 3', null);
INSERT INTO `conf_cuartos` VALUES ('57', '4', 'Aislamiento Cirugía 4', null);
INSERT INTO `conf_cuartos` VALUES ('58', '5', 'Hospitalización Gineco Obstétrica 1', null);
INSERT INTO `conf_cuartos` VALUES ('59', '5', 'Hospitalización Gineco Obstétrica 2', null);
INSERT INTO `conf_cuartos` VALUES ('60', '5', 'Hospitalización Gineco Obstétrica 3', null);
INSERT INTO `conf_cuartos` VALUES ('61', '5', 'Hospitalización Gineco Obstétrica 4', null);
INSERT INTO `conf_cuartos` VALUES ('62', '5', 'Hospitalización Gineco Obstétrica 5', null);
INSERT INTO `conf_cuartos` VALUES ('63', '5', 'Hospitalización Gineco Obstétrica 6', null);
INSERT INTO `conf_cuartos` VALUES ('64', '5', 'Hospitalización Gineco Obstétrica 7', null);
INSERT INTO `conf_cuartos` VALUES ('65', '5', 'Hospitalización Gineco Obstétrica 8', null);
INSERT INTO `conf_cuartos` VALUES ('66', '5', 'Hospitalización Gineco Obstétrica 9', null);
INSERT INTO `conf_cuartos` VALUES ('67', '5', 'Hospitalización Gineco Obstétrica 10', null);
INSERT INTO `conf_cuartos` VALUES ('68', '5', 'Hospitalización Gineco Obstétrica 11', null);
INSERT INTO `conf_cuartos` VALUES ('69', '5', 'Hospitalización Gineco Obstétrica 12', null);
INSERT INTO `conf_cuartos` VALUES ('70', '5', 'Hospitalización Gineco Obstétrica 13', null);
INSERT INTO `conf_cuartos` VALUES ('71', '5', 'Hospitalización Gineco Obstétrica 14', null);
INSERT INTO `conf_cuartos` VALUES ('72', '5', 'Hospitalización Gineco Obstétrica 15', null);
INSERT INTO `conf_cuartos` VALUES ('73', '5', 'Hospitalización Gineco Obstétrica 16', null);
INSERT INTO `conf_cuartos` VALUES ('74', '5', 'Hospitalización Gineco Obstétrica 17', null);
INSERT INTO `conf_cuartos` VALUES ('75', '5', 'Hospitalización Gineco Obstétrica 18', null);
INSERT INTO `conf_cuartos` VALUES ('76', '5', 'Aislamiento Hospitalización Gineco Obstétrica  Lado Izquierdo', null);
INSERT INTO `conf_cuartos` VALUES ('77', '5', 'Aislamiento Hospitalización Gineco Obstétrica  Lado Derecho 1', null);
INSERT INTO `conf_cuartos` VALUES ('78', '5', 'Aislamiento Hospitalización Gineco Obstétrica  Lado Derecho 2', null);
INSERT INTO `conf_cuartos` VALUES ('79', '6', 'Unidad De Cuidado Intensivos ', null);
INSERT INTO `conf_cuartos` VALUES ('80', '6', 'Unidad De Cuidado Intensivos Aislado', null);
INSERT INTO `conf_cuartos` VALUES ('81', '6', 'Unidad De Cuidado Intermedios ', null);
INSERT INTO `conf_cuartos` VALUES ('82', '6', 'Unidad De Cuidado Intermedios  Aislado', null);
INSERT INTO `conf_cuartos` VALUES ('83', '7', 'Quemados 1', null);
INSERT INTO `conf_cuartos` VALUES ('84', '7', 'Quemados 2', null);
INSERT INTO `conf_cuartos` VALUES ('85', '7', 'Quemados 3', null);
INSERT INTO `conf_cuartos` VALUES ('86', '7', 'Quemados 4', null);
INSERT INTO `conf_cuartos` VALUES ('87', '8', 'Consultorio 1', null);
INSERT INTO `conf_cuartos` VALUES ('88', '8', 'Consultorio 2', null);
INSERT INTO `conf_cuartos` VALUES ('89', '8', 'Consultorio 3', null);
INSERT INTO `conf_cuartos` VALUES ('90', '8', 'Consultorio 4', null);
INSERT INTO `conf_cuartos` VALUES ('91', '8', 'Consultorio 5', null);
INSERT INTO `conf_cuartos` VALUES ('92', '8', 'Consultorio 6', null);
INSERT INTO `conf_cuartos` VALUES ('93', '8', 'Consultorio 7', null);
INSERT INTO `conf_cuartos` VALUES ('94', '8', 'Consultorio 8', null);
INSERT INTO `conf_cuartos` VALUES ('95', '8', 'Consultorio 9', null);
INSERT INTO `conf_cuartos` VALUES ('96', '8', 'Consultorio 10', null);
INSERT INTO `conf_cuartos` VALUES ('97', '8', 'Consultorio 11', null);
INSERT INTO `conf_cuartos` VALUES ('98', '8', 'Consultorio 12', null);
INSERT INTO `conf_cuartos` VALUES ('99', '8', 'Consultorio 13', null);
INSERT INTO `conf_cuartos` VALUES ('100', '8', 'Consultorio 14', null);
INSERT INTO `conf_cuartos` VALUES ('101', '8', 'Consultorio 15', null);
INSERT INTO `conf_cuartos` VALUES ('102', '8', 'Consultorio 16', null);
INSERT INTO `conf_cuartos` VALUES ('103', '8', 'Consultorio 17', null);
INSERT INTO `conf_cuartos` VALUES ('104', '8', 'Consultorio 18', null);
INSERT INTO `conf_cuartos` VALUES ('105', '8', 'Consultorio 19', null);
INSERT INTO `conf_cuartos` VALUES ('106', '8', 'Consultorio 20', null);
INSERT INTO `conf_cuartos` VALUES ('107', '8', 'Consultorio 21', null);
INSERT INTO `conf_cuartos` VALUES ('108', '8', 'Consultorio 22', null);
INSERT INTO `conf_cuartos` VALUES ('109', '8', 'Consultorio 23', null);
INSERT INTO `conf_cuartos` VALUES ('110', '8', 'Consultorio 24', null);
INSERT INTO `conf_cuartos` VALUES ('111', '8', 'Consultorio 25', null);
INSERT INTO `conf_cuartos` VALUES ('112', '8', 'Consultorio 26', null);
INSERT INTO `conf_cuartos` VALUES ('113', '8', 'Consultorio 27', null);
INSERT INTO `conf_cuartos` VALUES ('114', '8', 'Consultorio 28', null);
INSERT INTO `conf_cuartos` VALUES ('115', '8', 'Consultorio 29', null);
INSERT INTO `conf_cuartos` VALUES ('116', '8', 'Consultorio 30', null);
INSERT INTO `conf_cuartos` VALUES ('117', '8', 'Consultorio 31', null);
INSERT INTO `conf_cuartos` VALUES ('118', '8', 'Consultorio 32', null);
INSERT INTO `conf_cuartos` VALUES ('119', '8', 'Consultorio 33', null);
INSERT INTO `conf_cuartos` VALUES ('120', '8', 'Consultorio 34', null);
INSERT INTO `conf_cuartos` VALUES ('121', '8', 'Consultorio 35', null);
INSERT INTO `conf_cuartos` VALUES ('122', '8', 'Consultorio 36', null);
INSERT INTO `conf_cuartos` VALUES ('123', '8', 'Consultorio 37', null);
INSERT INTO `conf_cuartos` VALUES ('124', '8', 'Consultorio 38', null);
INSERT INTO `conf_cuartos` VALUES ('125', '8', 'Consultorio 39', null);
INSERT INTO `conf_cuartos` VALUES ('126', '8', 'Consultorio 40', null);
INSERT INTO `conf_cuartos` VALUES ('127', '8', 'Consultorio 41', null);
INSERT INTO `conf_cuartos` VALUES ('128', '8', 'Consultorio 42', null);
INSERT INTO `conf_cuartos` VALUES ('129', '9', 'Consultorio Traije 1', null);
INSERT INTO `conf_cuartos` VALUES ('130', '9', 'Consultorio Traije 2', null);
INSERT INTO `conf_cuartos` VALUES ('131', '9', 'Consultorio Traije 3', null);
INSERT INTO `conf_cuartos` VALUES ('132', '9', 'Shock Box', null);
INSERT INTO `conf_cuartos` VALUES ('133', '9', 'Polivalente Adultos ', null);
INSERT INTO `conf_cuartos` VALUES ('134', '9', 'Polivalente Pediatricos', null);
INSERT INTO `conf_cuartos` VALUES ('135', '9', 'Sala De Procedimiento ', null);
INSERT INTO `conf_cuartos` VALUES ('136', '9', 'Observacion Adultos', null);
INSERT INTO `conf_cuartos` VALUES ('137', '9', 'Observacion Pediatria', null);
INSERT INTO `conf_cuartos` VALUES ('138', '9', 'Observacion Ginecologia ', null);
INSERT INTO `conf_cuartos` VALUES ('139', '9', 'Box Ginecologia ', null);
INSERT INTO `conf_cuartos` VALUES ('140', '9', 'Box Ginecologia ', null);
INSERT INTO `conf_cuartos` VALUES ('141', '9', 'Box Ginecologia ', null);
INSERT INTO `conf_cuartos` VALUES ('142', '9', 'Aislamiento ', null);
INSERT INTO `conf_cuartos` VALUES ('143', '9', 'Vulnerado', null);
INSERT INTO `conf_cuartos` VALUES ('144', '9', 'Consultorio Vulnerado ', null);
INSERT INTO `conf_cuartos` VALUES ('145', '10', 'Aislado 1', null);
INSERT INTO `conf_cuartos` VALUES ('146', '10', 'Aislado 2', null);
INSERT INTO `conf_cuartos` VALUES ('147', '10', 'Dialisis Renal ', null);
INSERT INTO `conf_cuartos` VALUES ('148', '10', 'Dialisis Peritoneal ', null);
INSERT INTO `conf_cuartos` VALUES ('149', '10', 'Consultorio Nefrologo ', null);

-- ----------------------------
-- Table structure for conf_equipos
-- ----------------------------
DROP TABLE IF EXISTS `conf_equipos`;
CREATE TABLE `conf_equipos` (
  `id_equipo` int(255) NOT NULL AUTO_INCREMENT,
  `equipo` varchar(255) DEFAULT NULL,
  `tamaño` varchar(255) DEFAULT NULL,
  `calibre` varchar(255) DEFAULT NULL,
  `volumen` varchar(255) DEFAULT NULL,
  `id_tecnico` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_equipo`)
) ENGINE=InnoDB AUTO_INCREMENT=267 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of conf_equipos
-- ----------------------------
INSERT INTO `conf_equipos` VALUES ('1', 'AGUJA ESPINAL TIPO QUINCKE', '25G', '90MM', '', null);
INSERT INTO `conf_equipos` VALUES ('2', 'AGUJA ESPINAL PUNTA DE LÁPIZ', '27G ', '88MM', '', null);
INSERT INTO `conf_equipos` VALUES ('3', 'AGUJA HIPODÉRMICA', '18G ', '1 1/2\"', '', null);
INSERT INTO `conf_equipos` VALUES ('4', 'AGUJA HIPODÉRMICA', '30G', '1/2\"', '', null);
INSERT INTO `conf_equipos` VALUES ('5', 'AGUJA HIPODÉRMICA', '23G', '1\"', '', null);
INSERT INTO `conf_equipos` VALUES ('6', 'AGUJA HIPODÉRMICA', '25G', '5/8\"', '', null);
INSERT INTO `conf_equipos` VALUES ('7', 'AGUJA HIPODÉRMICA', '27G', '1 1/2\"', '', null);
INSERT INTO `conf_equipos` VALUES ('8', 'AGUJA PERICRANEAL', '21G', '', '', null);
INSERT INTO `conf_equipos` VALUES ('9', 'AGUJA PERICRANEAL', '23G', '', '', null);
INSERT INTO `conf_equipos` VALUES ('10', 'BISTURÍ', '11', '', '', null);
INSERT INTO `conf_equipos` VALUES ('11', 'BISTURÍ', '15', '', '', null);
INSERT INTO `conf_equipos` VALUES ('12', 'BISTURÍ', '20', '', '', null);
INSERT INTO `conf_equipos` VALUES ('13', 'BISTURÍ', '21', '', '', null);
INSERT INTO `conf_equipos` VALUES ('14', 'BISTURÍ', '22', '', '', null);
INSERT INTO `conf_equipos` VALUES ('15', 'BISTURÍ', '23', '', '', null);
INSERT INTO `conf_equipos` VALUES ('16', 'BISTURÍ', '24', '', '', null);
INSERT INTO `conf_equipos` VALUES ('17', 'BOLSA PARA DRENAJE URINARIO', 'ADULTO', '', '', null);
INSERT INTO `conf_equipos` VALUES ('18', 'BOLSA PARA NUTRICIÓN ENTERAL PARA BOMBA DE INFUSIÓN', '', '', '1000ML', null);
INSERT INTO `conf_equipos` VALUES ('19', 'BOLSA PARA OSTOMÍA ABIERTA UNA PIEZA TRANSPARENTE', 'ADULTO', '', '', null);
INSERT INTO `conf_equipos` VALUES ('20', 'BOLSA PARA RECOLECCIÓN DE ORINA PEDIÁTRICA', 'NIÑO-NIÑA', '', '120ML', null);
INSERT INTO `conf_equipos` VALUES ('21', 'BOLSA RETROSACAL', '', '', '1000ML', null);
INSERT INTO `conf_equipos` VALUES ('22', 'CABESTRILLO DOBLE', 'GRANDE', '', '', null);
INSERT INTO `conf_equipos` VALUES ('23', 'CABESTRILLO DOBLE', 'MEDIANO', '', '', null);
INSERT INTO `conf_equipos` VALUES ('24', 'CABESTRILLO DOBLE', 'PEQUEÑO', '', '', null);
INSERT INTO `conf_equipos` VALUES ('25', 'CABESTRILLO SIMPLE', 'GRANDE', '', '', null);
INSERT INTO `conf_equipos` VALUES ('26', 'CABESTRILLO SIMPLE', 'MEDIANO', '', '', null);
INSERT INTO `conf_equipos` VALUES ('27', 'CABESTRILLO SIMPLE', 'PEQUEÑO', '', '', null);
INSERT INTO `conf_equipos` VALUES ('28', 'CÁNULA DE GUEDEL', '0', '', '', null);
INSERT INTO `conf_equipos` VALUES ('29', 'CÁNULA DE GUEDEL', '1', '', '', null);
INSERT INTO `conf_equipos` VALUES ('30', 'CÁNULA DE GUEDEL', '2', '', '', null);
INSERT INTO `conf_equipos` VALUES ('31', 'CÁNULA DE GUEDEL', '3', '', '', null);
INSERT INTO `conf_equipos` VALUES ('32', 'CÁNULA DE GUEDEL', '4', '', '', null);
INSERT INTO `conf_equipos` VALUES ('33', 'CÁNULA DE GUEDEL', '5', '', '', null);
INSERT INTO `conf_equipos` VALUES ('34', 'CÁNULA DE GUEDEL', '6', '', '', null);
INSERT INTO `conf_equipos` VALUES ('35', 'CÁNULA DE GUEDEL', '7', '', '', null);
INSERT INTO `conf_equipos` VALUES ('36', 'CÁNULA NASAL DE OXÍGENO', 'ADULTO', '', '', null);
INSERT INTO `conf_equipos` VALUES ('37', 'CÁNULA NASAL DE OXÍGENO', 'NEONATAL', '', '', null);
INSERT INTO `conf_equipos` VALUES ('38', 'CÁNULA NASAL DE OXÍGENO', 'PEDIÁTRICO', '', '', null);
INSERT INTO `conf_equipos` VALUES ('39', 'CATÉTER DOBLE J', '', '5FR', '', null);
INSERT INTO `conf_equipos` VALUES ('40', 'CATÉTER DOBLE J', '', '6FR', '', null);
INSERT INTO `conf_equipos` VALUES ('41', 'CATÉTER INTRAVENOSO SIN ALETAS', '14G ', '', '', null);
INSERT INTO `conf_equipos` VALUES ('42', 'CATÉTER INTRAVENOSO SIN ALETAS', '16G ', '', '', null);
INSERT INTO `conf_equipos` VALUES ('43', 'CATÉTER INTRAVENOSO SIN ALETAS', '18G ', '', '', null);
INSERT INTO `conf_equipos` VALUES ('44', 'CATÉTER INTRAVENOSO SIN ALETAS', '20G ', '', '', null);
INSERT INTO `conf_equipos` VALUES ('45', 'CATÉTER INTRAVENOSO SIN ALETAS', '22G ', '', '', null);
INSERT INTO `conf_equipos` VALUES ('46', 'CATÉTER INTRAVENOSO SIN ALETAS', '24G ', '', '', null);
INSERT INTO `conf_equipos` VALUES ('47', 'CATÉTER INTRAVENOSO SIN ALETAS', '26G ', '', '', null);
INSERT INTO `conf_equipos` VALUES ('48', 'CATÉTER PARA ASPIRACIÓN DE SECRECIONES CON SISTEMA CERRADO', '54CM', '14FR', '', null);
INSERT INTO `conf_equipos` VALUES ('49', 'CATÉTER PARA ASPIRACIÓN DE SECRECIONES CON SISTEMA CERRADO', '54CM', '16FR', '', null);
INSERT INTO `conf_equipos` VALUES ('50', 'CATÉTER PARA ASPIRACIÓN DE SECRECIONES CON SISTEMA CERRADO', '54CM', '6FR', '', null);
INSERT INTO `conf_equipos` VALUES ('51', 'CATÉTER PARA ASPIRACIÓN DE SECRECIONES CON SISTEMA CERRADO', '54CM', '5FR', '', null);
INSERT INTO `conf_equipos` VALUES ('52', 'CATÉTER PARA ASPIRACIÓN DE SECRECIONES CON SISTEMA CERRADO', '54CM', '8FR', '', null);
INSERT INTO `conf_equipos` VALUES ('53', 'CATÉTER PARA ASPIRACIÓN DE SECRECIONES', '40CM', '10FR', '', null);
INSERT INTO `conf_equipos` VALUES ('54', 'CATÉTER PARA ASPIRACIÓN DE SECRECIONES', '40CM', '12FR', '', null);
INSERT INTO `conf_equipos` VALUES ('55', 'CATÉTER PARA ASPIRACIÓN DE SECRECIONES', '40CM', '14FR', '', null);
INSERT INTO `conf_equipos` VALUES ('56', 'CATÉTER PARA ASPIRACIÓN DE SECRECIONES', '50CM', '16FR', '', null);
INSERT INTO `conf_equipos` VALUES ('57', 'CATÉTER PARA ASPIRACIÓN DE SECRECIONES', '50CM', '18FR', '', null);
INSERT INTO `conf_equipos` VALUES ('58', 'CATÉTER PARA ASPIRACIÓN DE SECRECIONES', '50CM', '5FR', '', null);
INSERT INTO `conf_equipos` VALUES ('59', 'CATÉTER PARA ASPIRACIÓN DE SECRECIONES', '40CM', '6FR', '', null);
INSERT INTO `conf_equipos` VALUES ('60', 'CATÉTER PARA ASPIRACIÓN DE SECRECIONES', '40CM', '8FR', '', null);
INSERT INTO `conf_equipos` VALUES ('61', 'CATÉTER UMBILICAL', '', '2FR', '', null);
INSERT INTO `conf_equipos` VALUES ('62', 'CATÉTER UMBILICAL', '', '3.5FR', '1LÚMEN', null);
INSERT INTO `conf_equipos` VALUES ('63', 'CATÉTER UMBILICAL', '', '5FR', '', null);
INSERT INTO `conf_equipos` VALUES ('64', 'CATÉTER UMBILICAL', '', '5FR', '3LÚMEN', null);
INSERT INTO `conf_equipos` VALUES ('65', 'CATÉTER URINARIO URETRAL', '', '10FR', 'DOS VÍAS', null);
INSERT INTO `conf_equipos` VALUES ('66', 'CATÉTER URINARIO URETRAL', '', '12FR', 'DOS VÍAS', null);
INSERT INTO `conf_equipos` VALUES ('67', 'CATÉTER URINARIO URETRAL', '', '14FR', 'DOS VÍAS', null);
INSERT INTO `conf_equipos` VALUES ('68', 'CATÉTER URINARIO URETRAL', '', '16FR', 'DOS VÍAS', null);
INSERT INTO `conf_equipos` VALUES ('69', 'CATÉTER URINARIO URETRAL', '', '18FR', 'DOS VÍAS', null);
INSERT INTO `conf_equipos` VALUES ('70', 'CATÉTER URINARIO URETRAL', '', '18FR', 'TRES VÍAS', null);
INSERT INTO `conf_equipos` VALUES ('71', 'CATÉTER URINARIO URETRAL', '', '20FR', 'TRES VÍAS', null);
INSERT INTO `conf_equipos` VALUES ('72', 'CATÉTER URINARIO URETRAL', '', '22FR', 'TRES VÍAS', null);
INSERT INTO `conf_equipos` VALUES ('73', 'CATÉTER URINARIO URETRAL', '', '6FR', 'DOS VÍAS', null);
INSERT INTO `conf_equipos` VALUES ('74', 'CATÉTER URINARIO URETRAL', '', '8FR', 'DOS VÍAS', null);
INSERT INTO `conf_equipos` VALUES ('75', 'CATÉTER VENOSO CENTRAL', '', '5FR', '2LUMEN', null);
INSERT INTO `conf_equipos` VALUES ('76', 'CATÉTER VENOSO CENTRAL', '', '7FR', '2LUMEN', null);
INSERT INTO `conf_equipos` VALUES ('77', 'CATÉTER VENOSO CENTRAL', '', '7FR', '3LUMEN', null);
INSERT INTO `conf_equipos` VALUES ('78', 'CATÉTER VENOSO CENTRAL PERCUTÁNEO CON GUÍA', '25CM', '2FR', '', null);
INSERT INTO `conf_equipos` VALUES ('79', 'CATÉTER VENOSO CENTRAL PERCUTÁNEO', '30CM', '2FR', '2LUMEN', null);
INSERT INTO `conf_equipos` VALUES ('80', 'CERA HEMOSTÁTICA PARA HUESO', '', '', '', null);
INSERT INTO `conf_equipos` VALUES ('81', 'CLIP DE TITANIO CON SOPORTE ADHESIVO ', 'MEDIANO', '', '', null);
INSERT INTO `conf_equipos` VALUES ('82', 'CLIP DE TITANIO CON SOPORTE ADHESIVO ', 'GRANDE', '', '', null);
INSERT INTO `conf_equipos` VALUES ('83', 'COLLAR CERVICAL BLANDO', 'EXTRAGRANDE', '', '', null);
INSERT INTO `conf_equipos` VALUES ('84', 'COLLAR CERVICAL BLANDO', 'GRANDE', '', '', null);
INSERT INTO `conf_equipos` VALUES ('85', 'COLLAR CERVICAL BLANDO', 'MEDIANO', '', '', null);
INSERT INTO `conf_equipos` VALUES ('86', 'COLLAR CERVICAL BLANDO', 'PEQUEÑO', '', '', null);
INSERT INTO `conf_equipos` VALUES ('87', 'COLLAR CERVICAL FILADELFIA', 'GRANDE', '', '', null);
INSERT INTO `conf_equipos` VALUES ('88', 'COLLAR CERVICAL FILADELFIA', 'INFANTIL', '', '', null);
INSERT INTO `conf_equipos` VALUES ('89', 'COLLAR CERVICAL FILADELFIA', 'MEDIANO', '', '', null);
INSERT INTO `conf_equipos` VALUES ('90', 'COLLAR CERVICAL FILADELFIA', 'PEQUEÑO', '', '', null);
INSERT INTO `conf_equipos` VALUES ('91', 'CONDÓN MASCULINO', '', '', '', null);
INSERT INTO `conf_equipos` VALUES ('92', 'DREN DE PENROSE ', '1/4\" X 17\"', '', '', null);
INSERT INTO `conf_equipos` VALUES ('93', 'DREN DE PENROSE', '1\" X 17\"', '', '', null);
INSERT INTO `conf_equipos` VALUES ('94', 'DREN DE PENROSE', '1/2\" X 17\"', '', '', null);
INSERT INTO `conf_equipos` VALUES ('95', 'ELECTRODO', 'ADULTO', '', '', null);
INSERT INTO `conf_equipos` VALUES ('96', 'ELECTRODO', 'NEONATAL', '', '', null);
INSERT INTO `conf_equipos` VALUES ('97', 'ELECTRODO', 'PEDIÁTRICO', '', '', null);
INSERT INTO `conf_equipos` VALUES ('98', 'EQUIPO DE INFUSIÓN PARA BOMBA (ST01)', '', '', '', null);
INSERT INTO `conf_equipos` VALUES ('99', 'EQUIPO DE INFUSIÓN PARA BOMBA FOTOSENSIBLE SEGMENTO DE SILICONA (ON90)', '', '', '', null);
INSERT INTO `conf_equipos` VALUES ('100', 'EQUIPO DE TRANSFUSIÓN SANGUÍNEA PARA BOMBA (TR22)', '', '', '', null);
INSERT INTO `conf_equipos` VALUES ('101', 'EQUIPO DE VENOCLISIS', '150 CM (+/- 30 CM)', '', '', null);
INSERT INTO `conf_equipos` VALUES ('102', 'EQUIPO MICROGOTERO', '', '', '', null);
INSERT INTO `conf_equipos` VALUES ('103', 'EQUIPO MICROGOTERO FOTOSENSIBLE', '', '', '', null);
INSERT INTO `conf_equipos` VALUES ('104', 'EQUIPO MICROGOTERO PARA BOMBA (PA92)', '', '', '', null);
INSERT INTO `conf_equipos` VALUES ('105', 'EQUIPO VENOCLISIS FOTOSENSIBLE', '', '', '', null);
INSERT INTO `conf_equipos` VALUES ('106', 'ESPARADRAPO COMÚN', '30 CM X 9.14 M', '', '', null);
INSERT INTO `conf_equipos` VALUES ('107', 'ESPARADRAPO DE TELA NO TEJIDA', '15 CM X 10 M', '', '', null);
INSERT INTO `conf_equipos` VALUES ('108', 'ESPARADRAPO DE TELA NO TEJIDA', '7.6 CM X 9.1 M', '', '', null);
INSERT INTO `conf_equipos` VALUES ('109', 'EXTENSIÓN', '150 CM', '', '', null);
INSERT INTO `conf_equipos` VALUES ('110', 'FÉRULA', 'NEONATAL', '', '', null);
INSERT INTO `conf_equipos` VALUES ('111', 'GEL LUBRICANTE ', '', '', '', null);
INSERT INTO `conf_equipos` VALUES ('112', 'GUANTES DE EXAMINACIÓN LÁTEX', 'GRANDE', '', '', null);
INSERT INTO `conf_equipos` VALUES ('113', 'GUANTES DE EXAMINACIÓN LÁTEX', 'MEDIANO', '', '', null);
INSERT INTO `conf_equipos` VALUES ('114', 'GUANTES DE EXAMINACIÓN LÁTEX', 'PEQUEÑO', '', '', null);
INSERT INTO `conf_equipos` VALUES ('115', 'GUANTES DE EXAMINACIÓN NITRILO', 'GRANDE', '', '', null);
INSERT INTO `conf_equipos` VALUES ('116', 'GUANTES DE EXAMINACIÓN NITRILO', 'MEDIANO', '', '', null);
INSERT INTO `conf_equipos` VALUES ('117', 'GUANTES DE EXAMINACIÓN NITRILO', 'PEQUEÑO', '', '', null);
INSERT INTO `conf_equipos` VALUES ('118', 'GUANTES QUIRÚRGICOS', '6', '', '', null);
INSERT INTO `conf_equipos` VALUES ('119', 'GUANTES QUIRÚRGICOS', '6.5', '', '', null);
INSERT INTO `conf_equipos` VALUES ('120', 'GUANTES QUIRÚRGICOS', '7', '', '', null);
INSERT INTO `conf_equipos` VALUES ('121', 'GUANTES QUIRÚRGICOS', '7.5', '', '', null);
INSERT INTO `conf_equipos` VALUES ('122', 'GUANTES QUIRÚRGICOS', '8', '', '', null);
INSERT INTO `conf_equipos` VALUES ('123', 'GUANTES QUIRÚRGICOS', '8.5', '', '', null);
INSERT INTO `conf_equipos` VALUES ('124', 'JERINGA ', '21G', '1 1/2\"', '10ML', null);
INSERT INTO `conf_equipos` VALUES ('125', 'JERINGA CON AGUJA', '', '', '20ML', null);
INSERT INTO `conf_equipos` VALUES ('126', 'JERINGA', '21G', '1 1/2\"', '3ML', null);
INSERT INTO `conf_equipos` VALUES ('127', 'JERINGA', '21G', '1 1/2\"', '5ML', null);
INSERT INTO `conf_equipos` VALUES ('128', 'JERINGA', '', '', '50ML', null);
INSERT INTO `conf_equipos` VALUES ('129', 'JERINGA PARA PERFUSOR', '', '', '50ML', null);
INSERT INTO `conf_equipos` VALUES ('130', 'JERINGA', '', '', '60ML', null);
INSERT INTO `conf_equipos` VALUES ('131', 'JERINGA', '31G', '8MM', '1ML', null);
INSERT INTO `conf_equipos` VALUES ('132', 'LÁPIZ DE ELECTROBISTURÍ', '', '', '', null);
INSERT INTO `conf_equipos` VALUES ('133', 'LLAVE DE 3 VÍAS', '', '', '', null);
INSERT INTO `conf_equipos` VALUES ('134', 'MALLA DE POLIPROPILENO', '15CM X 15CM', '', '', null);
INSERT INTO `conf_equipos` VALUES ('135', 'MALLA DE POLIPROPILENO', '7.6CM X 15CM', '', '', null);
INSERT INTO `conf_equipos` VALUES ('136', 'MANGUERA PARA SUCCIÓN', '1/4\" X 1.8M', '', '', null);
INSERT INTO `conf_equipos` VALUES ('137', 'MANGUERA PARA SUCCIÓN', '1/4\" X 3M', '', '', null);
INSERT INTO `conf_equipos` VALUES ('138', 'MANGUERA PARA SUCCIÓN', '1/4\" X 6.4 M', '', '', null);
INSERT INTO `conf_equipos` VALUES ('139', 'MASCARILLA DE OXÍGENO', 'ADULTO', '', '', null);
INSERT INTO `conf_equipos` VALUES ('140', 'MASCARILLA DE OXÍGENO', 'NEONATAL', '', '', null);
INSERT INTO `conf_equipos` VALUES ('141', 'MASCARILLA DE OXÍGENO', 'PEDIÁTRICA', '', '', null);
INSERT INTO `conf_equipos` VALUES ('142', 'MASCARILLA LARÍNGEA', 'ADULTO No 4', '', '', null);
INSERT INTO `conf_equipos` VALUES ('143', 'MASCARILLA LARÍNGEA', 'ADULTO No 5', '', '', null);
INSERT INTO `conf_equipos` VALUES ('144', 'MASCARILLA LARÍNGEA', 'NEONATAL No 1', '', '', null);
INSERT INTO `conf_equipos` VALUES ('145', 'MASCARILLA LARÍNGEA', 'PEDIÁTRICA No 2', '', '', null);
INSERT INTO `conf_equipos` VALUES ('146', 'MASCARILLA LARÍNGEA', 'PEDIÁTRICA No 2.5', '', '', null);
INSERT INTO `conf_equipos` VALUES ('147', 'MASCARILLA LARÍNGEA', 'PEDIÁTRICA No 3', '', '', null);
INSERT INTO `conf_equipos` VALUES ('148', 'MEDIA ANTIEMBÓLICA LIBRE DE LÁTEX', 'GRANDE', '', '', null);
INSERT INTO `conf_equipos` VALUES ('149', 'MEDIA ANTIEMBÓLICA LIBRE DE LÁTEX', 'MEDIANA', '', '', null);
INSERT INTO `conf_equipos` VALUES ('150', 'MICRONEBULIZADOR MANGUERA LISA', 'ADULTO', '', '', null);
INSERT INTO `conf_equipos` VALUES ('151', 'MICRONEBULIZADOR', 'NEONATAL', '', '', null);
INSERT INTO `conf_equipos` VALUES ('152', 'MICRONEBULIZADOR', 'PEDIÁTRICO', '', '', null);
INSERT INTO `conf_equipos` VALUES ('153', 'MONOPERSULFATO DE POTASIO', '', '', '', null);
INSERT INTO `conf_equipos` VALUES ('154', 'PAÑAL DE RECIÉN NACIDO', '3 KG - 6.5 KG', '', '', null);
INSERT INTO `conf_equipos` VALUES ('155', 'PAÑAL MATERNAL POST PARTO', '', '', '', null);
INSERT INTO `conf_equipos` VALUES ('156', 'PINZA UMBILICAL', '', '', '', null);
INSERT INTO `conf_equipos` VALUES ('157', 'SISTEMA DE DRENAJE TORÁCICO', 'TRES CÁMARAS', '', '', null);
INSERT INTO `conf_equipos` VALUES ('158', 'SISTEMA DE DRENAJE TORÁCICO', 'UNA CÁMARA', '', '', null);
INSERT INTO `conf_equipos` VALUES ('159', 'SONDA CON TRAMPA DE MOCO', '', '10FR', '', null);
INSERT INTO `conf_equipos` VALUES ('160', 'SONDA CON TRAMPA DE MOCO', '', '14FR', '', null);
INSERT INTO `conf_equipos` VALUES ('161', 'SONDA DE ALIMENTACIÓN NASO ENTERAL', '110CM - 120CM', '10FR', '', null);
INSERT INTO `conf_equipos` VALUES ('162', 'SONDA DE ALIMENTACIÓN NASO ENTERAL', '110CM - 120CM', '12FR', '', null);
INSERT INTO `conf_equipos` VALUES ('163', 'SONDA DE ALIMENTACIÓN NASO ENTERAL', '', '4FR', '', null);
INSERT INTO `conf_equipos` VALUES ('164', 'SONDA DE ALIMENTACIÓN NASO ENTERAL', '', '5FR', '', null);
INSERT INTO `conf_equipos` VALUES ('165', 'SONDA DE ALIMENTACIÓN NASO ENTERAL', '', '6FR', '', null);
INSERT INTO `conf_equipos` VALUES ('166', 'SONDA DE ALIMENTACIÓN NASO ENTERAL', '110CM - 120CM', '8FR', '', null);
INSERT INTO `conf_equipos` VALUES ('167', 'SONDA NASOGÁSTRICA', '', '10FR', '', null);
INSERT INTO `conf_equipos` VALUES ('168', 'SONDA NASOGÁSTRICA', '85CM', '12FR', '', null);
INSERT INTO `conf_equipos` VALUES ('169', 'SONDA NASOGÁSTRICA', '85CM', '14FR', '', null);
INSERT INTO `conf_equipos` VALUES ('170', 'SONDA NASOGÁSTRICA', '', '16FR', '', null);
INSERT INTO `conf_equipos` VALUES ('171', 'SONDA NASOGÁSTRICA', '', '18FR', '', null);
INSERT INTO `conf_equipos` VALUES ('172', 'SONDA NASOGÁSTRICA', '50CM', '5FR', '', null);
INSERT INTO `conf_equipos` VALUES ('173', 'SONDA NASOGÁSTRICA', '', '6FR', '', null);
INSERT INTO `conf_equipos` VALUES ('174', 'SONDA NASOGÁSTRICA', '85CM', '8FR', '', null);
INSERT INTO `conf_equipos` VALUES ('175', 'SONDA NÉLATON', '', '12FR', '', null);
INSERT INTO `conf_equipos` VALUES ('176', 'SONDA NÉLATON', '', '14FR', '', null);
INSERT INTO `conf_equipos` VALUES ('177', 'SONDA NÉLATON', '', '8FR', '', null);
INSERT INTO `conf_equipos` VALUES ('178', 'SUJETADOR DE CATÉTER UMBILICAL', '', '', '', null);
INSERT INTO `conf_equipos` VALUES ('179', 'SUJETADOR DE SONDA NASOGÁSTRICA', 'NEONATAL', '', '', null);
INSERT INTO `conf_equipos` VALUES ('180', 'SUJETADOR DE SONDA NASOGÁSTRICA', 'PEDIATRICO', '', '', null);
INSERT INTO `conf_equipos` VALUES ('181', 'SUJETADOR DE TUBO ENDOTRAQUEAL', 'ADULTO', '', '', null);
INSERT INTO `conf_equipos` VALUES ('182', 'SUJETADOR DE TUBO ENDOTRAQUEAL', 'NEONATAL TALLA MINI', '', '', null);
INSERT INTO `conf_equipos` VALUES ('183', 'SUJETADOR DE TUBO ENDOTRAQUEAL', 'PEDIATRICO', '', '', null);
INSERT INTO `conf_equipos` VALUES ('184', 'SUTURA CATGUT CRÓMICO No 0 AGUJA REDONDA', '75CM', '37MM', '1/2 CÍRCULO', null);
INSERT INTO `conf_equipos` VALUES ('185', 'SUTURA CATGUT CRÓMICO No 1 AGUJA REDONDA', '75CM', '37MM', '1/2 CÍRCULO', null);
INSERT INTO `conf_equipos` VALUES ('186', 'SUTURA CATGUT CRÓMICO No 2 AGUJA REDONDA', '75CM', '0,26MM', '1/2 CÍRCULO', null);
INSERT INTO `conf_equipos` VALUES ('187', 'SUTURA CATGUT CRÓMICO No 3 AGUJA REDONDA', '70CM', '0,25MM', '1/2 CÍRCULO', null);
INSERT INTO `conf_equipos` VALUES ('188', 'SUTURA CATGUT CRÓMICO No 3 AGUJA REDONDA', '75CM', '0,26MM', '1/2 CÍRCULO', null);
INSERT INTO `conf_equipos` VALUES ('189', 'SUTURA CATGUT CRÓMICO No 4 AGUJA REDONDA', '75CM', '0,26MM', '1/2 CÍRCULO', null);
INSERT INTO `conf_equipos` VALUES ('190', 'SUTURA DE MONOFILAMENTO POLIPROPILENO No 0', '80CM', '35MM', '', null);
INSERT INTO `conf_equipos` VALUES ('191', 'SUTURA DE MONOFILAMENTO POLIPROPILENO No 0 AGUJA REDONDA', '75CM', '36.4MM', '1/2 CÍRCULO', null);
INSERT INTO `conf_equipos` VALUES ('192', 'SUTURA DE MONOFILAMENTO POLIPROPILENO No 1 AGUJA REDONDA', '75CM', '37MM', '1/2 CÍRCULO', null);
INSERT INTO `conf_equipos` VALUES ('193', 'SUTURA DE MONOFILAMENTO POLIPROPILENO No 2 AGUJA REDONDA', '75CM', '36MM', '1/2 CÍRCULO', null);
INSERT INTO `conf_equipos` VALUES ('194', 'SUTURA DE MONOFILAMENTO POLIPROPILENO No 3 AGUJA REDONDA', '75CM', '17MM', '1/2 CÍRCULO', null);
INSERT INTO `conf_equipos` VALUES ('195', 'SUTURA DE NYLON MONOFILAMENTO POLÍMEROS ALIFÁTICOS No 2 AGUJA CORTANTE', '75CM', '24MM', '3/8 CÍRCULO', null);
INSERT INTO `conf_equipos` VALUES ('196', 'SUTURA DE NYLON MONOFILAMENTO POLÍMEROS ALIFÁTICOS No 3 AGUJA CORTANTE', '80CM', '24MM', '3/8 CÍRCULO', null);
INSERT INTO `conf_equipos` VALUES ('197', 'SUTURA DE NYLON MONOFILAMENTO POLÍMEROS ALIFÁTICOS No 4 AGUJA CORTANTE', '75CM', '19MM', '3/8 CÍRCULO', null);
INSERT INTO `conf_equipos` VALUES ('198', 'SUTURA DE NYLON MONOFILAMENTO POLÍMEROS ALIFÁTICOS No 5 AGUJA CORTANTE', '45CM', '17MM', '3/8 CÍRCULO', null);
INSERT INTO `conf_equipos` VALUES ('199', 'SUTURA DE NYLON MONOFILAMENTO POLÍMEROS ALIFÁTICOS No 6 AGUJA CORTANTE', '80CM', '20MM', '3/8 CÍRCULO', null);
INSERT INTO `conf_equipos` VALUES ('200', 'SUTURA DE POLIGLACTINA CON RECUBRIMIENTO ANTIMICROBIANO No 0 AGUJA REDONDA', '70CM', '36.4MM', '1/2 CÍRCULO', null);
INSERT INTO `conf_equipos` VALUES ('201', 'SUTURA DE SEDA TRENZADA No 0 SIN AGUJA', '', '', '', null);
INSERT INTO `conf_equipos` VALUES ('202', 'SUTURA DE SEDA TRENZADA No 1 AGUJA REDONDA', '75CM', '26MM', '1/2 CÍRCULO', null);
INSERT INTO `conf_equipos` VALUES ('203', 'SUTURA DE SEDA TRENZADA No 2 AGUJA CORTANTE', '45CM', '26MM', '3/8 CÍRCULO', null);
INSERT INTO `conf_equipos` VALUES ('204', 'SUTURA SINTÉTICA ABSORBIBLE DE POLIGLICÓLICO SUTURA SINTÉTICA ABSORBIBLE DE POLIGLICÓLICO CÍRCULO', '', '', '', null);
INSERT INTO `conf_equipos` VALUES ('205', 'SUTURA SINTÉTICA ABSORBIBLE DE POLIGLICÓLICO No 2 AGUJA REDONDA', '70CM', '25MM', '1/2 CÍRCULO', null);
INSERT INTO `conf_equipos` VALUES ('206', 'SUTURA SINTÉTICA ABSORBIBLE DE POLIGLICÓLICO No 3 AGUJA REDONDA', '70CM', '26MM', '1/2 CÍRCULO', null);
INSERT INTO `conf_equipos` VALUES ('207', 'SUTURA TRENZADA DE POLIGLACTINA No 1 AGUJA REDONDA', '70CM', '36.4MM', '1/2 CÍRCULO', null);
INSERT INTO `conf_equipos` VALUES ('208', 'SUTURA TRENZADA DE POLIGLACTINA No 2 AGUJA REDONDA', '70CM', '26MM', '1/2 CÍRCULO', null);
INSERT INTO `conf_equipos` VALUES ('209', 'SUTURA TRENZADA DE POLIGLACTINA No 3 AGUJA REDONDA', '70CM', '26MM', '1/2 CÍRCULO', null);
INSERT INTO `conf_equipos` VALUES ('210', 'TIRA REACTIVA PARA MEDICIÓN DE GLUCOSA', '', '', '', null);
INSERT INTO `conf_equipos` VALUES ('211', 'TRAQUEOTOMO I.D.', '', '7.0MM', '', null);
INSERT INTO `conf_equipos` VALUES ('212', 'TRAQUEOTOMO I.D.', '', '7.5MM', '', null);
INSERT INTO `conf_equipos` VALUES ('213', 'TRAQUEOTOMO I.D.', '', '8.0MM', '', null);
INSERT INTO `conf_equipos` VALUES ('214', 'TRAQUEOTOMO I.D.', '', '8.5MM', '', null);
INSERT INTO `conf_equipos` VALUES ('215', 'TRAQUEOTOMO I.D.', '', '6.0MM', '', null);
INSERT INTO `conf_equipos` VALUES ('216', 'TRAQUEOTOMO I.D.', '', '6.5MM', '', null);
INSERT INTO `conf_equipos` VALUES ('217', 'TUBO ENDOTRAQUEAL I.D. SIN BALÓN', '', '2.0MM', '', null);
INSERT INTO `conf_equipos` VALUES ('218', 'TUBO ENDOTRAQUEAL I.D. SIN BALÓN', '', '2.5MM', '', null);
INSERT INTO `conf_equipos` VALUES ('219', 'TUBO ENDOTRAQUEAL I.D. CON BALÓN', '', '3.0MM', '', null);
INSERT INTO `conf_equipos` VALUES ('220', 'TUBO ENDOTRAQUEAL I.D. SIN BALÓN', '', '3.0MM', '', null);
INSERT INTO `conf_equipos` VALUES ('221', 'TUBO ENDOTRAQUEAL I.D. CON BALÓN', '', '3.5MM', '', null);
INSERT INTO `conf_equipos` VALUES ('222', 'TUBO ENDOTRAQUEAL I.D. SIN BALÓN', '', '3.5MM', '', null);
INSERT INTO `conf_equipos` VALUES ('223', 'TUBO ENDOTRAQUEAL I.D. CON BALÓN', '', '4.0MM', '', null);
INSERT INTO `conf_equipos` VALUES ('224', 'TUBO ENDOTRAQUEAL I.D. SIN BALÓN', '', '4.0MM', '', null);
INSERT INTO `conf_equipos` VALUES ('225', 'TUBO ENDOTRAQUEAL I.D. CON BALÓN', '', '4.5MM', '', null);
INSERT INTO `conf_equipos` VALUES ('226', 'TUBO ENDOTRAQUEAL I.D. SIN BALÓN', '', '4.5MM', '', null);
INSERT INTO `conf_equipos` VALUES ('227', 'TUBO ENDOTRAQUEAL I.D. CON BALÓN', '', '5.0MM', '', null);
INSERT INTO `conf_equipos` VALUES ('228', 'TUBO ENDOTRAQUEAL I.D. SIN BALÓN', '', '5.0MM', '', null);
INSERT INTO `conf_equipos` VALUES ('229', 'TUBO ENDOTRAQUEAL I.D. CON BALÓN', '', '5.5MM', '', null);
INSERT INTO `conf_equipos` VALUES ('230', 'TUBO ENDOTRAQUEAL I.D. CON BALÓN', '', '6.0MM', '', null);
INSERT INTO `conf_equipos` VALUES ('231', 'TUBO ENDOTRAQUEAL I.D. CON BALÓN', '', '6.5MM', '', null);
INSERT INTO `conf_equipos` VALUES ('232', 'TUBO ENDOTRAQUEAL I.D. CON BALÓN', '', '7.0MM', '', null);
INSERT INTO `conf_equipos` VALUES ('233', 'TUBO ENDOTRAQUEAL I.D. CON BALÓN', '', '7.5MM', '', null);
INSERT INTO `conf_equipos` VALUES ('234', 'TUBO ENDOTRAQUEAL I.D. CON BALÓN', '', '8.0MM', '', null);
INSERT INTO `conf_equipos` VALUES ('235', 'TUBO ENDOTRAQUEAL I.D. CON BALÓN', '', '8.5MM', '', null);
INSERT INTO `conf_equipos` VALUES ('236', 'TUBO ENDOTRAQUEAL PARA ADMINISTRACIÓN DE SURFACTANTE', '', '2.0MM', '', null);
INSERT INTO `conf_equipos` VALUES ('237', 'TUBO ENDOTRAQUEAL PARA ADMINISTRACIÓN DE SURFACTANTE', '', '2.5MM', '', null);
INSERT INTO `conf_equipos` VALUES ('238', 'TUBO ENDOTRAQUEAL PARA ADMINISTRACIÓN DE SURFACTANTE', '', '3.0MM', '', null);
INSERT INTO `conf_equipos` VALUES ('239', 'TUBO ENDOTRAQUEAL PARA ADMINISTRACIÓN DE SURFACTANTE', '', '3.5MM', '', null);
INSERT INTO `conf_equipos` VALUES ('240', 'TUBO NASAL PARA CPAP DE BURBUJA', '', '', '', null);
INSERT INTO `conf_equipos` VALUES ('241', 'TUBO TORÁCICO CON TROCAR', '', '10FR', '', null);
INSERT INTO `conf_equipos` VALUES ('242', 'TUBO TORÁCICO SIN TROCAR', '', '14FR', '', null);
INSERT INTO `conf_equipos` VALUES ('243', 'TUBO TORÁCICO CON TROCAR', '', '16FR', '', null);
INSERT INTO `conf_equipos` VALUES ('244', 'TUBO TORÁCICO CON TROCAR', '', '18FR', '', null);
INSERT INTO `conf_equipos` VALUES ('245', 'TUBO TORÁCICO SIN TROCAR', '', '18FR', '', null);
INSERT INTO `conf_equipos` VALUES ('246', 'TUBO TORÁCICO CON TROCAR', '', '28FR', '', null);
INSERT INTO `conf_equipos` VALUES ('247', 'TUBO TORÁCICO SIN TROCAR', '', '28FR', '', null);
INSERT INTO `conf_equipos` VALUES ('248', 'TUBO TORÁCICO CON TROCAR', '', '30FR', '', null);
INSERT INTO `conf_equipos` VALUES ('249', 'TUBO TORÁCICO CON TROCAR', '', '32FR', '', null);
INSERT INTO `conf_equipos` VALUES ('250', 'TUBO TORÁCICO SIN TROCAR', '', '32FR', '', null);
INSERT INTO `conf_equipos` VALUES ('251', 'VENDA ADHESIVA ELÁSTICA', '4\" X 4.5 M', '', '', null);
INSERT INTO `conf_equipos` VALUES ('252', 'VENDA ADHESIVA ELÁSTICA', '6\" (15 CM X 4.5 M)', '', '', null);
INSERT INTO `conf_equipos` VALUES ('253', 'VENDA ADHESIVA ELÁSTICA', '8\"', '', '', null);
INSERT INTO `conf_equipos` VALUES ('254', 'VENDA DE ALGODÓN', '4\"', '', '', null);
INSERT INTO `conf_equipos` VALUES ('255', 'VENDA DE ALGODÓN', '6\"', '', '', null);
INSERT INTO `conf_equipos` VALUES ('256', 'VENDA DE ALGODÓN', '8\"', '', '', null);
INSERT INTO `conf_equipos` VALUES ('257', 'VENDA DE GASA', '15 CM/9 M - 10 M', '', '', null);
INSERT INTO `conf_equipos` VALUES ('258', 'VENDA DE GASA', '3 CM/5M', '', '', null);
INSERT INTO `conf_equipos` VALUES ('259', 'VENDA DE GASA', '5 CM/5 M', '', '', null);
INSERT INTO `conf_equipos` VALUES ('260', 'VENDA DE GASA', '8\"/3 M', '', '', null);
INSERT INTO `conf_equipos` VALUES ('261', 'VENDA DE YESO', '4\"', '', '', null);
INSERT INTO `conf_equipos` VALUES ('262', 'VENDA DE YESO', '6\"', '', '', null);
INSERT INTO `conf_equipos` VALUES ('263', 'VENDA DE YESO', '8\"', '', '', null);
INSERT INTO `conf_equipos` VALUES ('264', 'VENDA ELÁSTICA', '4\"', '', '', null);
INSERT INTO `conf_equipos` VALUES ('265', 'VENDA ELÁSTICA', '6\"', '', '', null);
INSERT INTO `conf_equipos` VALUES ('266', 'VENDA ELÁSTICA', '8\"', '', '', null);

-- ----------------------------
-- Table structure for conf_especialidades
-- ----------------------------
DROP TABLE IF EXISTS `conf_especialidades`;
CREATE TABLE `conf_especialidades` (
  `id_especialidad` int(255) NOT NULL AUTO_INCREMENT,
  `especialidad` varchar(255) DEFAULT NULL,
  `id_tecnico` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_especialidad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of conf_especialidades
-- ----------------------------

-- ----------------------------
-- Table structure for conf_genero
-- ----------------------------
DROP TABLE IF EXISTS `conf_genero`;
CREATE TABLE `conf_genero` (
  `id_sexo` int(255) NOT NULL AUTO_INCREMENT,
  `sexo` varchar(20) DEFAULT NULL,
  `id_tecnico` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_sexo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of conf_genero
-- ----------------------------
INSERT INTO `conf_genero` VALUES ('1', 'Femenino', null);
INSERT INTO `conf_genero` VALUES ('2', 'Masculino', null);

-- ----------------------------
-- Table structure for conf_impuestos
-- ----------------------------
DROP TABLE IF EXISTS `conf_impuestos`;
CREATE TABLE `conf_impuestos` (
  `id_impuestos` int(255) NOT NULL AUTO_INCREMENT,
  `nombre_impuesto` varchar(100) DEFAULT NULL,
  `porcentaje_impuesto` decimal(10,2) DEFAULT NULL,
  `id_tecnico` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_impuestos`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of conf_impuestos
-- ----------------------------
INSERT INTO `conf_impuestos` VALUES ('1', 'iva_12%', '12.00', null);
INSERT INTO `conf_impuestos` VALUES ('2', 'iva_0%', '0.00', null);

-- ----------------------------
-- Table structure for conf_nacionalidad
-- ----------------------------
DROP TABLE IF EXISTS `conf_nacionalidad`;
CREATE TABLE `conf_nacionalidad` (
  `id_nacionalidad` int(11) NOT NULL AUTO_INCREMENT,
  `pais` varchar(80) DEFAULT NULL,
  `gentilicio` varchar(80) DEFAULT NULL,
  `iso` char(3) DEFAULT NULL,
  `id_tecnico` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_nacionalidad`)
) ENGINE=InnoDB AUTO_INCREMENT=202 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of conf_nacionalidad
-- ----------------------------
INSERT INTO `conf_nacionalidad` VALUES ('1', 'Afganistán', 'AFGANA', 'AFG', null);
INSERT INTO `conf_nacionalidad` VALUES ('2', 'Albania', 'ALBANESA', 'ALB', null);
INSERT INTO `conf_nacionalidad` VALUES ('3', 'Alemania', 'ALEMANA', 'DEU', null);
INSERT INTO `conf_nacionalidad` VALUES ('4', 'Andorra', 'ANDORRANA', 'AND', null);
INSERT INTO `conf_nacionalidad` VALUES ('5', 'Angola', 'ANGOLEÑA', 'AGO', null);
INSERT INTO `conf_nacionalidad` VALUES ('6', 'AntiguayBarbuda', 'ANTIGUANA', 'ATG', null);
INSERT INTO `conf_nacionalidad` VALUES ('7', 'ArabiaSaudita', 'SAUDÍ', 'SAU', null);
INSERT INTO `conf_nacionalidad` VALUES ('8', 'Argelia', 'ARGELINA', 'DZA', null);
INSERT INTO `conf_nacionalidad` VALUES ('9', 'Argentina', 'ARGENTINA', 'ARG', null);
INSERT INTO `conf_nacionalidad` VALUES ('10', 'Armenia', 'ARMENIA', 'ARM', null);
INSERT INTO `conf_nacionalidad` VALUES ('11', 'Aruba', 'ARUBEÑA', 'ABW', null);
INSERT INTO `conf_nacionalidad` VALUES ('12', 'Australia', 'AUSTRALIANA', 'AUS', null);
INSERT INTO `conf_nacionalidad` VALUES ('13', 'Austria', 'AUSTRIACA', 'AUT', null);
INSERT INTO `conf_nacionalidad` VALUES ('14', 'Azerbaiyán', 'AZERBAIYANA', 'AZE', null);
INSERT INTO `conf_nacionalidad` VALUES ('15', 'Bahamas', 'BAHAMEÑA', 'BHS', null);
INSERT INTO `conf_nacionalidad` VALUES ('16', 'Bangladés', 'BANGLADESÍ', 'BGD', null);
INSERT INTO `conf_nacionalidad` VALUES ('17', 'Barbados', 'BARBADENSE', 'BRB', null);
INSERT INTO `conf_nacionalidad` VALUES ('18', 'Baréin', 'BAREINÍ', 'BHR', null);
INSERT INTO `conf_nacionalidad` VALUES ('19', 'Bélgica', 'BELGA', 'BEL', null);
INSERT INTO `conf_nacionalidad` VALUES ('20', 'Belice', 'BELICEÑA', 'BLZ', null);
INSERT INTO `conf_nacionalidad` VALUES ('21', 'Benín', 'BENINÉSA', 'BEN', null);
INSERT INTO `conf_nacionalidad` VALUES ('22', 'Bielorrusia', 'BIELORRUSA', 'BLR', null);
INSERT INTO `conf_nacionalidad` VALUES ('23', 'Birmania', 'BIRMANA', 'MMR', null);
INSERT INTO `conf_nacionalidad` VALUES ('24', 'Bolivia', 'BOLIVIANA', 'BOL', null);
INSERT INTO `conf_nacionalidad` VALUES ('25', 'BosniayHerzegovina', 'BOSNIA', 'BIH', null);
INSERT INTO `conf_nacionalidad` VALUES ('26', 'Botsuana', 'BOTSUANA', 'BWA', null);
INSERT INTO `conf_nacionalidad` VALUES ('27', 'Brasil', 'BRASILEÑA', 'BRA', null);
INSERT INTO `conf_nacionalidad` VALUES ('28', 'Brunéi', 'BRUNEANA', 'BRN', null);
INSERT INTO `conf_nacionalidad` VALUES ('29', 'Bulgaria', 'BÚLGARA', 'BGR', null);
INSERT INTO `conf_nacionalidad` VALUES ('30', 'BurkinaFaso', 'BURKINÉS', 'BFA', null);
INSERT INTO `conf_nacionalidad` VALUES ('31', 'Burundi', 'BURUNDÉSA', 'BDI', null);
INSERT INTO `conf_nacionalidad` VALUES ('32', 'Bután', 'BUTANÉSA', 'BTN', null);
INSERT INTO `conf_nacionalidad` VALUES ('33', 'CaboVerde', 'CABOVERDIANA', 'CPV', null);
INSERT INTO `conf_nacionalidad` VALUES ('34', 'Camboya', 'CAMBOYANA', 'KHM', null);
INSERT INTO `conf_nacionalidad` VALUES ('35', 'Camerún', 'CAMERUNESA', 'CMR', null);
INSERT INTO `conf_nacionalidad` VALUES ('36', 'Canadá', 'CANADIENSE', 'CAN', null);
INSERT INTO `conf_nacionalidad` VALUES ('37', 'Catar', 'CATARÍ', 'QAT', null);
INSERT INTO `conf_nacionalidad` VALUES ('38', 'Chad', 'CHADIANA', 'TCD', null);
INSERT INTO `conf_nacionalidad` VALUES ('39', 'Chile', 'CHILENA', 'CHL', null);
INSERT INTO `conf_nacionalidad` VALUES ('40', 'China', 'CHINA', 'CHN', null);
INSERT INTO `conf_nacionalidad` VALUES ('41', 'Chipre', 'CHIPRIOTA', 'CYP', null);
INSERT INTO `conf_nacionalidad` VALUES ('42', 'CiudaddelVaticano', 'VATICANA', 'VAT', null);
INSERT INTO `conf_nacionalidad` VALUES ('43', 'Colombia', 'COLOMBIANA', 'COL', null);
INSERT INTO `conf_nacionalidad` VALUES ('44', 'Comoras', 'COMORENSE', 'COM', null);
INSERT INTO `conf_nacionalidad` VALUES ('45', 'CoreadelNorte', 'NORCOREANA', 'PRK', null);
INSERT INTO `conf_nacionalidad` VALUES ('46', 'CoreadelSur', 'SURCOREANA', 'KOR', null);
INSERT INTO `conf_nacionalidad` VALUES ('47', 'CostadeMarfil', 'MARFILEÑA', 'CIV', null);
INSERT INTO `conf_nacionalidad` VALUES ('48', 'CostaRica', 'COSTARRICENSE', 'CRI', null);
INSERT INTO `conf_nacionalidad` VALUES ('49', 'Croacia', 'CROATA', 'HRV', null);
INSERT INTO `conf_nacionalidad` VALUES ('50', 'Cuba', 'CUBANA', 'CUB', null);
INSERT INTO `conf_nacionalidad` VALUES ('51', 'Dinamarca', 'DANÉSA', 'DNK', null);
INSERT INTO `conf_nacionalidad` VALUES ('52', 'Dominica', 'DOMINIQUÉS', 'DMA', null);
INSERT INTO `conf_nacionalidad` VALUES ('53', 'Ecuador', 'ECUATORIANA', 'ECU', null);
INSERT INTO `conf_nacionalidad` VALUES ('54', 'Egipto', 'EGIPCIA', 'EGY', null);
INSERT INTO `conf_nacionalidad` VALUES ('55', 'ElSalvador', 'SALVADOREÑA', 'SLV', null);
INSERT INTO `conf_nacionalidad` VALUES ('56', 'EmiratosÁrabesUnidos', 'EMIRATÍ', 'ARE', null);
INSERT INTO `conf_nacionalidad` VALUES ('57', 'Eritrea', 'ERITREA', 'ERI', null);
INSERT INTO `conf_nacionalidad` VALUES ('58', 'Eslovaquia', 'ESLOVACA', 'SVK', null);
INSERT INTO `conf_nacionalidad` VALUES ('59', 'Eslovenia', 'ESLOVENA', 'SVN', null);
INSERT INTO `conf_nacionalidad` VALUES ('60', 'España', 'ESPAÑOLA', 'ESP', null);
INSERT INTO `conf_nacionalidad` VALUES ('61', 'EstadosUnidos', 'ESTADOUNIDENSE', 'USA', null);
INSERT INTO `conf_nacionalidad` VALUES ('62', 'Estonia', 'ESTONIA', 'EST', null);
INSERT INTO `conf_nacionalidad` VALUES ('63', 'Etiopía', 'ETÍOPE', 'ETH', null);
INSERT INTO `conf_nacionalidad` VALUES ('64', 'Filipinas', 'FILIPINA', 'PHL', null);
INSERT INTO `conf_nacionalidad` VALUES ('65', 'Finlandia', 'FINLANDÉSA', 'FIN', null);
INSERT INTO `conf_nacionalidad` VALUES ('66', 'Fiyi', 'FIYIANA', 'FJI', null);
INSERT INTO `conf_nacionalidad` VALUES ('67', 'Francia', 'FRANCÉSA', 'FRA', null);
INSERT INTO `conf_nacionalidad` VALUES ('68', 'Gabón', 'GABONÉSA', 'GAB', null);
INSERT INTO `conf_nacionalidad` VALUES ('69', 'Gambia', 'GAMBIANA', 'GMB', null);
INSERT INTO `conf_nacionalidad` VALUES ('70', 'Georgia', 'GEORGIANA', 'GEO', null);
INSERT INTO `conf_nacionalidad` VALUES ('71', 'Gibraltar', 'GIBRALTAREÑA', 'GIB', null);
INSERT INTO `conf_nacionalidad` VALUES ('72', 'Ghana', 'GHANÉSA', 'GHA', null);
INSERT INTO `conf_nacionalidad` VALUES ('73', 'Granada', 'GRANADINA', 'GRD', null);
INSERT INTO `conf_nacionalidad` VALUES ('74', 'Grecia', 'GRIEGA', 'GRC', null);
INSERT INTO `conf_nacionalidad` VALUES ('75', 'Groenlandia', 'GROENLANDÉSA', 'GRL', null);
INSERT INTO `conf_nacionalidad` VALUES ('76', 'Guatemala', 'GUATEMALTECA', 'GTM', null);
INSERT INTO `conf_nacionalidad` VALUES ('77', 'Guineaecuatorial', 'ECUATOGUINEANA', 'GNQ', null);
INSERT INTO `conf_nacionalidad` VALUES ('78', 'Guinea', 'GUINEANA', 'GIN', null);
INSERT INTO `conf_nacionalidad` VALUES ('79', 'Guinea-Bisáu', 'GUINEANA', 'GNB', null);
INSERT INTO `conf_nacionalidad` VALUES ('80', 'Guyana', 'GUYANESA', 'GUY', null);
INSERT INTO `conf_nacionalidad` VALUES ('81', 'Haití', 'HAITIANA', 'HTI', null);
INSERT INTO `conf_nacionalidad` VALUES ('82', 'Honduras', 'HONDUREÑA', 'HND', null);
INSERT INTO `conf_nacionalidad` VALUES ('83', 'Hungría', 'HÚNGARA', 'HUN', null);
INSERT INTO `conf_nacionalidad` VALUES ('84', 'India', 'HINDÚ', 'IND', null);
INSERT INTO `conf_nacionalidad` VALUES ('85', 'Indonesia', 'INDONESIA', 'IDN', null);
INSERT INTO `conf_nacionalidad` VALUES ('86', 'Irak', 'IRAQUÍ', 'IRQ', null);
INSERT INTO `conf_nacionalidad` VALUES ('87', 'Irán', 'IRANÍ', 'IRN', null);
INSERT INTO `conf_nacionalidad` VALUES ('88', 'Irlanda', 'IRLANDÉSA', 'IRL', null);
INSERT INTO `conf_nacionalidad` VALUES ('89', 'Islandia', 'ISLANDÉSA', 'ISL', null);
INSERT INTO `conf_nacionalidad` VALUES ('90', 'IslasCook', 'COOKIANA', 'COK', null);
INSERT INTO `conf_nacionalidad` VALUES ('91', 'IslasMarshall', 'MARSHALÉSA', 'MHL', null);
INSERT INTO `conf_nacionalidad` VALUES ('92', 'IslasSalomón', 'SALOMONENSE', 'SLB', null);
INSERT INTO `conf_nacionalidad` VALUES ('93', 'Israel', 'ISRAELÍ', 'ISR', null);
INSERT INTO `conf_nacionalidad` VALUES ('94', 'Italia', 'ITALIANA', 'ITA', null);
INSERT INTO `conf_nacionalidad` VALUES ('95', 'Jamaica', 'JAMAIQUINA', 'JAM', null);
INSERT INTO `conf_nacionalidad` VALUES ('96', 'Japón', 'JAPONÉSA', 'JPN', null);
INSERT INTO `conf_nacionalidad` VALUES ('97', 'Jordania', 'JORDANA', 'JOR', null);
INSERT INTO `conf_nacionalidad` VALUES ('98', 'Kazajistán', 'KAZAJA', 'KAZ', null);
INSERT INTO `conf_nacionalidad` VALUES ('99', 'Kenia', 'KENIATA', 'KEN', null);
INSERT INTO `conf_nacionalidad` VALUES ('100', 'Kirguistán', 'KIRGUISA', 'KGZ', null);
INSERT INTO `conf_nacionalidad` VALUES ('101', 'Kiribati', 'KIRIBATIANA', 'KIR', null);
INSERT INTO `conf_nacionalidad` VALUES ('102', 'Kuwait', 'KUWAITÍ', 'KWT', null);
INSERT INTO `conf_nacionalidad` VALUES ('103', 'Laos', 'LAOSIANA', 'LAO', null);
INSERT INTO `conf_nacionalidad` VALUES ('104', 'Lesoto', 'LESOTENSE', 'LSO', null);
INSERT INTO `conf_nacionalidad` VALUES ('105', 'Letonia', 'LETÓNA', 'LVA', null);
INSERT INTO `conf_nacionalidad` VALUES ('106', 'Líbano', 'LIBANÉSA', 'LBN', null);
INSERT INTO `conf_nacionalidad` VALUES ('107', 'Liberia', 'LIBERIANA', 'LBR', null);
INSERT INTO `conf_nacionalidad` VALUES ('108', 'Libia', 'LIBIA', 'LBY', null);
INSERT INTO `conf_nacionalidad` VALUES ('109', 'Liechtenstein', 'LIECHTENSTEINIANA', 'LIE', null);
INSERT INTO `conf_nacionalidad` VALUES ('110', 'Lituania', 'LITUANA', 'LTU', null);
INSERT INTO `conf_nacionalidad` VALUES ('111', 'Luxemburgo', 'LUXEMBURGUÉSA', 'LUX', null);
INSERT INTO `conf_nacionalidad` VALUES ('112', 'Madagascar', 'MALGACHE', 'MDG', null);
INSERT INTO `conf_nacionalidad` VALUES ('113', 'Malasia', 'MALASIA', 'MYS', null);
INSERT INTO `conf_nacionalidad` VALUES ('114', 'Malaui', 'MALAUÍ', 'MWI', null);
INSERT INTO `conf_nacionalidad` VALUES ('115', 'Maldivas', 'MALDIVA', 'MDV', null);
INSERT INTO `conf_nacionalidad` VALUES ('116', 'Malí', 'MALIENSE', 'MLI', null);
INSERT INTO `conf_nacionalidad` VALUES ('117', 'Malta', 'MALTÉSA', 'MLT', null);
INSERT INTO `conf_nacionalidad` VALUES ('118', 'Marruecos', 'MARROQUÍ', 'MAR', null);
INSERT INTO `conf_nacionalidad` VALUES ('119', 'Martinica', 'MARTINIQUÉS', 'MTQ', null);
INSERT INTO `conf_nacionalidad` VALUES ('120', 'Mauricio', 'MAURICIANA', 'MUS', null);
INSERT INTO `conf_nacionalidad` VALUES ('121', 'Mauritania', 'MAURITANA', 'MRT', null);
INSERT INTO `conf_nacionalidad` VALUES ('122', 'México', 'MEXICANA', 'MEX', null);
INSERT INTO `conf_nacionalidad` VALUES ('123', 'Micronesia', 'MICRONESIA', 'FSM', null);
INSERT INTO `conf_nacionalidad` VALUES ('124', 'Moldavia', 'MOLDAVA', 'MDA', null);
INSERT INTO `conf_nacionalidad` VALUES ('125', 'Mónaco', 'MONEGASCA', 'MCO', null);
INSERT INTO `conf_nacionalidad` VALUES ('126', 'Mongolia', 'MONGOLA', 'MNG', null);
INSERT INTO `conf_nacionalidad` VALUES ('127', 'Montenegro', 'MONTENEGRINA', 'MNE', null);
INSERT INTO `conf_nacionalidad` VALUES ('128', 'Mozambique', 'MOZAMBIQUEÑA', 'MOZ', null);
INSERT INTO `conf_nacionalidad` VALUES ('129', 'Namibia', 'NAMIBIA', 'NAM', null);
INSERT INTO `conf_nacionalidad` VALUES ('130', 'Nauru', 'NAURUANA', 'NRU', null);
INSERT INTO `conf_nacionalidad` VALUES ('131', 'Nepal', 'NEPALÍ', 'NPL', null);
INSERT INTO `conf_nacionalidad` VALUES ('132', 'Nicaragua', 'NICARAGÜENSE', 'NIC', null);
INSERT INTO `conf_nacionalidad` VALUES ('133', 'Níger', 'NIGERINA', 'NER', null);
INSERT INTO `conf_nacionalidad` VALUES ('134', 'Nigeria', 'NIGERIANA', 'NGA', null);
INSERT INTO `conf_nacionalidad` VALUES ('135', 'Noruega', 'NORUEGA', 'NOR', null);
INSERT INTO `conf_nacionalidad` VALUES ('136', 'NuevaZelanda', 'NEOZELANDÉSA', 'NZL', null);
INSERT INTO `conf_nacionalidad` VALUES ('137', 'Omán', 'OMANÍ', 'OMN', null);
INSERT INTO `conf_nacionalidad` VALUES ('138', 'PaísesBajos', 'NEERLANDÉSA', 'NLD', null);
INSERT INTO `conf_nacionalidad` VALUES ('139', 'Pakistán', 'PAKISTANÍ', 'PAK', null);
INSERT INTO `conf_nacionalidad` VALUES ('140', 'Palaos', 'PALAUANA', 'PLW', null);
INSERT INTO `conf_nacionalidad` VALUES ('141', 'Palestina', 'PALESTINA', 'PSE', null);
INSERT INTO `conf_nacionalidad` VALUES ('142', 'Panamá', 'PANAMEÑA', 'PAN', null);
INSERT INTO `conf_nacionalidad` VALUES ('143', 'PapúaNuevaGuinea', 'PAPÚ', 'PNG', null);
INSERT INTO `conf_nacionalidad` VALUES ('144', 'Paraguay', 'PARAGUAYA', 'PRY', null);
INSERT INTO `conf_nacionalidad` VALUES ('145', 'Perú', 'PERUANA', 'PER', null);
INSERT INTO `conf_nacionalidad` VALUES ('146', 'Polonia', 'POLACA', 'POL', null);
INSERT INTO `conf_nacionalidad` VALUES ('147', 'Portugal', 'PORTUGUÉSA', 'PRT', null);
INSERT INTO `conf_nacionalidad` VALUES ('148', 'PuertoRico', 'PUERTORRIQUEÑA', 'PRI', null);
INSERT INTO `conf_nacionalidad` VALUES ('149', 'ReinoUnido', 'BRITÁNICA', 'GBR', null);
INSERT INTO `conf_nacionalidad` VALUES ('150', 'RepúblicaCentroafricana', 'CENTROAFRICANA', 'CAF', null);
INSERT INTO `conf_nacionalidad` VALUES ('151', 'RepúblicaCheca', 'CHECA', 'CZE', null);
INSERT INTO `conf_nacionalidad` VALUES ('152', 'RepúblicadeMacedonia', 'MACEDONIA', 'MKD', null);
INSERT INTO `conf_nacionalidad` VALUES ('153', 'RepúblicadelCongo', 'CONGOLEÑA', 'COG', null);
INSERT INTO `conf_nacionalidad` VALUES ('154', 'RepúblicaDemocráticadelCongo', 'CONGOLEÑA', 'COD', null);
INSERT INTO `conf_nacionalidad` VALUES ('155', 'RepúblicaDominicana', 'DOMINICANA', 'DOM', null);
INSERT INTO `conf_nacionalidad` VALUES ('156', 'RepúblicaSudafricana', 'SUDAFRICANA', 'ZAF', null);
INSERT INTO `conf_nacionalidad` VALUES ('157', 'Ruanda', 'RUANDÉSA', 'RWA', null);
INSERT INTO `conf_nacionalidad` VALUES ('158', 'Rumanía', 'RUMANA', 'ROU', null);
INSERT INTO `conf_nacionalidad` VALUES ('159', 'Rusia', 'RUSA', 'RUS', null);
INSERT INTO `conf_nacionalidad` VALUES ('160', 'Samoa', 'SAMOANA', 'WSM', null);
INSERT INTO `conf_nacionalidad` VALUES ('161', 'SanCristóbalyNieves', 'CRISTOBALEÑA', 'KNA', null);
INSERT INTO `conf_nacionalidad` VALUES ('162', 'SanMarino', 'SANMARINENSE', 'SMR', null);
INSERT INTO `conf_nacionalidad` VALUES ('163', 'SanVicenteylasGranadinas', 'SANVICENTINA', 'VCT', null);
INSERT INTO `conf_nacionalidad` VALUES ('164', 'SantaLucía', 'SANTALUCENSE', 'LCA', null);
INSERT INTO `conf_nacionalidad` VALUES ('165', 'SantoToméyPríncipe', 'SANTOTOMENSE', 'STP', null);
INSERT INTO `conf_nacionalidad` VALUES ('166', 'Senegal', 'SENEGALÉSA', 'SEN', null);
INSERT INTO `conf_nacionalidad` VALUES ('167', 'Serbia', 'SERBIA', 'SRB', null);
INSERT INTO `conf_nacionalidad` VALUES ('168', 'Seychelles', 'SEYCHELLENSE', 'SYC', null);
INSERT INTO `conf_nacionalidad` VALUES ('169', 'SierraLeona', 'SIERRALEONÉSA', 'SLE', null);
INSERT INTO `conf_nacionalidad` VALUES ('170', 'Singapur', 'SINGAPURENSE', 'SGP', null);
INSERT INTO `conf_nacionalidad` VALUES ('171', 'Siria', 'SIRIA', 'SYR', null);
INSERT INTO `conf_nacionalidad` VALUES ('172', 'Somalia', 'SOMALÍ', 'SOM', null);
INSERT INTO `conf_nacionalidad` VALUES ('173', 'SriLanka', 'CEILANÉSA', 'LKA', null);
INSERT INTO `conf_nacionalidad` VALUES ('174', 'Suazilandia', 'SUAZI', 'SWZ', null);
INSERT INTO `conf_nacionalidad` VALUES ('175', 'SudándelSur', 'SURSUDANÉSA', 'SSD', null);
INSERT INTO `conf_nacionalidad` VALUES ('176', 'Sudán', 'SUDANÉSA', 'SDN', null);
INSERT INTO `conf_nacionalidad` VALUES ('177', 'Suecia', 'SUECA', 'SWE', null);
INSERT INTO `conf_nacionalidad` VALUES ('178', 'Suiza', 'SUIZA', 'CHE', null);
INSERT INTO `conf_nacionalidad` VALUES ('179', 'Surinam', 'SURINAMESA', 'SUR', null);
INSERT INTO `conf_nacionalidad` VALUES ('180', 'Tailandia', 'TAILANDÉSA', 'THA', null);
INSERT INTO `conf_nacionalidad` VALUES ('181', 'Tanzania', 'TANZANA', 'TZA', null);
INSERT INTO `conf_nacionalidad` VALUES ('182', 'Tayikistán', 'TAYIKA', 'TJK', null);
INSERT INTO `conf_nacionalidad` VALUES ('183', 'TimorOriental', 'TIMORENSE', 'TLS', null);
INSERT INTO `conf_nacionalidad` VALUES ('184', 'Togo', 'TOGOLÉSA', 'TGO', null);
INSERT INTO `conf_nacionalidad` VALUES ('185', 'Tonga', 'TONGANA', 'TON', null);
INSERT INTO `conf_nacionalidad` VALUES ('186', 'TrinidadyTobago', 'TRINITENSE', 'TTO', null);
INSERT INTO `conf_nacionalidad` VALUES ('187', 'Túnez', 'TUNECINA', 'TUN', null);
INSERT INTO `conf_nacionalidad` VALUES ('188', 'Turkmenistán', 'TURCOMANA', 'TKM', null);
INSERT INTO `conf_nacionalidad` VALUES ('189', 'Turquía', 'TURCA', 'TUR', null);
INSERT INTO `conf_nacionalidad` VALUES ('190', 'Tuvalu', 'TUVALUANA', 'TUV', null);
INSERT INTO `conf_nacionalidad` VALUES ('191', 'Ucrania', 'UCRANIANA', 'UKR', null);
INSERT INTO `conf_nacionalidad` VALUES ('192', 'Uganda', 'UGANDÉSA', 'UGA', null);
INSERT INTO `conf_nacionalidad` VALUES ('193', 'Uruguay', 'URUGUAYA', 'URY', null);
INSERT INTO `conf_nacionalidad` VALUES ('194', 'Uzbekistán', 'UZBEKA', 'UZB', null);
INSERT INTO `conf_nacionalidad` VALUES ('195', 'Vanuatu', 'VANUATUENSE', 'VUT', null);
INSERT INTO `conf_nacionalidad` VALUES ('196', 'Venezuela', 'VENEZOLANA', 'VEN', null);
INSERT INTO `conf_nacionalidad` VALUES ('197', 'Vietnam', 'VIETNAMITA', 'VNM', null);
INSERT INTO `conf_nacionalidad` VALUES ('198', 'Yemen', 'YEMENÍ', 'YEM', null);
INSERT INTO `conf_nacionalidad` VALUES ('199', 'Yibuti', 'YIBUTIANA', 'DJI', null);
INSERT INTO `conf_nacionalidad` VALUES ('200', 'Zambia', 'ZAMBIANA', 'ZMB', null);
INSERT INTO `conf_nacionalidad` VALUES ('201', 'Zimbabue', 'ZIMBABUENSE', 'ZWE', null);

-- ----------------------------
-- Table structure for conf_paises
-- ----------------------------
DROP TABLE IF EXISTS `conf_paises`;
CREATE TABLE `conf_paises` (
  `id_pais` int(11) NOT NULL AUTO_INCREMENT,
  `iso` char(2) DEFAULT NULL,
  `nombre` varchar(80) DEFAULT NULL,
  `id_tecnico` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_pais`)
) ENGINE=InnoDB AUTO_INCREMENT=241 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of conf_paises
-- ----------------------------
INSERT INTO `conf_paises` VALUES ('1', 'AF', 'Afganistán', null);
INSERT INTO `conf_paises` VALUES ('2', 'AX', 'Islas Gland', null);
INSERT INTO `conf_paises` VALUES ('3', 'AL', 'Albania', null);
INSERT INTO `conf_paises` VALUES ('4', 'DE', 'Alemania', null);
INSERT INTO `conf_paises` VALUES ('5', 'AD', 'Andorra', null);
INSERT INTO `conf_paises` VALUES ('6', 'AO', 'Angola', null);
INSERT INTO `conf_paises` VALUES ('7', 'AI', 'Anguilla', null);
INSERT INTO `conf_paises` VALUES ('8', 'AQ', 'Antártida', null);
INSERT INTO `conf_paises` VALUES ('9', 'AG', 'Antigua y Barbuda', null);
INSERT INTO `conf_paises` VALUES ('10', 'AN', 'Antillas Holandesas', null);
INSERT INTO `conf_paises` VALUES ('11', 'SA', 'Arabia Saudí', null);
INSERT INTO `conf_paises` VALUES ('12', 'DZ', 'Argelia', null);
INSERT INTO `conf_paises` VALUES ('13', 'AR', 'Argentina', null);
INSERT INTO `conf_paises` VALUES ('14', 'AM', 'Armenia', null);
INSERT INTO `conf_paises` VALUES ('15', 'AW', 'Aruba', null);
INSERT INTO `conf_paises` VALUES ('16', 'AU', 'Australia', null);
INSERT INTO `conf_paises` VALUES ('17', 'AT', 'Austria', null);
INSERT INTO `conf_paises` VALUES ('18', 'AZ', 'Azerbaiyán', null);
INSERT INTO `conf_paises` VALUES ('19', 'BS', 'Bahamas', null);
INSERT INTO `conf_paises` VALUES ('20', 'BH', 'Bahréin', null);
INSERT INTO `conf_paises` VALUES ('21', 'BD', 'Bangladesh', null);
INSERT INTO `conf_paises` VALUES ('22', 'BB', 'Barbados', null);
INSERT INTO `conf_paises` VALUES ('23', 'BY', 'Bielorrusia', null);
INSERT INTO `conf_paises` VALUES ('24', 'BE', 'Bélgica', null);
INSERT INTO `conf_paises` VALUES ('25', 'BZ', 'Belice', null);
INSERT INTO `conf_paises` VALUES ('26', 'BJ', 'Benin', null);
INSERT INTO `conf_paises` VALUES ('27', 'BM', 'Bermudas', null);
INSERT INTO `conf_paises` VALUES ('28', 'BT', 'Bhután', null);
INSERT INTO `conf_paises` VALUES ('29', 'BO', 'Bolivia', null);
INSERT INTO `conf_paises` VALUES ('30', 'BA', 'Bosnia y Herzegovina', null);
INSERT INTO `conf_paises` VALUES ('31', 'BW', 'Botsuana', null);
INSERT INTO `conf_paises` VALUES ('32', 'BV', 'Isla Bouvet', null);
INSERT INTO `conf_paises` VALUES ('33', 'BR', 'Brasil', null);
INSERT INTO `conf_paises` VALUES ('34', 'BN', 'Brunéi', null);
INSERT INTO `conf_paises` VALUES ('35', 'BG', 'Bulgaria', null);
INSERT INTO `conf_paises` VALUES ('36', 'BF', 'Burkina Faso', null);
INSERT INTO `conf_paises` VALUES ('37', 'BI', 'Burundi', null);
INSERT INTO `conf_paises` VALUES ('38', 'CV', 'Cabo Verde', null);
INSERT INTO `conf_paises` VALUES ('39', 'KY', 'Islas Caimán', null);
INSERT INTO `conf_paises` VALUES ('40', 'KH', 'Camboya', null);
INSERT INTO `conf_paises` VALUES ('41', 'CM', 'Camerún', null);
INSERT INTO `conf_paises` VALUES ('42', 'CA', 'Canadá', null);
INSERT INTO `conf_paises` VALUES ('43', 'CF', 'República Centroafricana', null);
INSERT INTO `conf_paises` VALUES ('44', 'TD', 'Chad', null);
INSERT INTO `conf_paises` VALUES ('45', 'CZ', 'República Checa', null);
INSERT INTO `conf_paises` VALUES ('46', 'CL', 'Chile', null);
INSERT INTO `conf_paises` VALUES ('47', 'CN', 'China', null);
INSERT INTO `conf_paises` VALUES ('48', 'CY', 'Chipre', null);
INSERT INTO `conf_paises` VALUES ('49', 'CX', 'Isla de Navidad', null);
INSERT INTO `conf_paises` VALUES ('50', 'VA', 'Ciudad del Vaticano', null);
INSERT INTO `conf_paises` VALUES ('51', 'CC', 'Islas Cocos', null);
INSERT INTO `conf_paises` VALUES ('52', 'CO', 'Colombia', null);
INSERT INTO `conf_paises` VALUES ('53', 'KM', 'Comoras', null);
INSERT INTO `conf_paises` VALUES ('54', 'CD', 'República Democrática del Congo', null);
INSERT INTO `conf_paises` VALUES ('55', 'CG', 'Congo', null);
INSERT INTO `conf_paises` VALUES ('56', 'CK', 'Islas Cook', null);
INSERT INTO `conf_paises` VALUES ('57', 'KP', 'Corea del Norte', null);
INSERT INTO `conf_paises` VALUES ('58', 'KR', 'Corea del Sur', null);
INSERT INTO `conf_paises` VALUES ('59', 'CI', 'Costa de Marfil', null);
INSERT INTO `conf_paises` VALUES ('60', 'CR', 'Costa Rica', null);
INSERT INTO `conf_paises` VALUES ('61', 'HR', 'Croacia', null);
INSERT INTO `conf_paises` VALUES ('62', 'CU', 'Cuba', null);
INSERT INTO `conf_paises` VALUES ('63', 'DK', 'Dinamarca', null);
INSERT INTO `conf_paises` VALUES ('64', 'DM', 'Dominica', null);
INSERT INTO `conf_paises` VALUES ('65', 'DO', 'República Dominicana', null);
INSERT INTO `conf_paises` VALUES ('66', 'EC', 'Ecuador', null);
INSERT INTO `conf_paises` VALUES ('67', 'EG', 'Egipto', null);
INSERT INTO `conf_paises` VALUES ('68', 'SV', 'El Salvador', null);
INSERT INTO `conf_paises` VALUES ('69', 'AE', 'Emiratos Árabes Unidos', null);
INSERT INTO `conf_paises` VALUES ('70', 'ER', 'Eritrea', null);
INSERT INTO `conf_paises` VALUES ('71', 'SK', 'Eslovaquia', null);
INSERT INTO `conf_paises` VALUES ('72', 'SI', 'Eslovenia', null);
INSERT INTO `conf_paises` VALUES ('73', 'ES', 'España', null);
INSERT INTO `conf_paises` VALUES ('74', 'UM', 'Islas ultramarinas de Estados Unidos', null);
INSERT INTO `conf_paises` VALUES ('75', 'US', 'Estados Unidos', null);
INSERT INTO `conf_paises` VALUES ('76', 'EE', 'Estonia', null);
INSERT INTO `conf_paises` VALUES ('77', 'ET', 'Etiopía', null);
INSERT INTO `conf_paises` VALUES ('78', 'FO', 'Islas Feroe', null);
INSERT INTO `conf_paises` VALUES ('79', 'PH', 'Filipinas', null);
INSERT INTO `conf_paises` VALUES ('80', 'FI', 'Finlandia', null);
INSERT INTO `conf_paises` VALUES ('81', 'FJ', 'Fiyi', null);
INSERT INTO `conf_paises` VALUES ('82', 'FR', 'Francia', null);
INSERT INTO `conf_paises` VALUES ('83', 'GA', 'Gabón', null);
INSERT INTO `conf_paises` VALUES ('84', 'GM', 'Gambia', null);
INSERT INTO `conf_paises` VALUES ('85', 'GE', 'Georgia', null);
INSERT INTO `conf_paises` VALUES ('86', 'GS', 'Islas Georgias del Sur y Sandwich del Sur', null);
INSERT INTO `conf_paises` VALUES ('87', 'GH', 'Ghana', null);
INSERT INTO `conf_paises` VALUES ('88', 'GI', 'Gibraltar', null);
INSERT INTO `conf_paises` VALUES ('89', 'GD', 'Granada', null);
INSERT INTO `conf_paises` VALUES ('90', 'GR', 'Grecia', null);
INSERT INTO `conf_paises` VALUES ('91', 'GL', 'Groenlandia', null);
INSERT INTO `conf_paises` VALUES ('92', 'GP', 'Guadalupe', null);
INSERT INTO `conf_paises` VALUES ('93', 'GU', 'Guam', null);
INSERT INTO `conf_paises` VALUES ('94', 'GT', 'Guatemala', null);
INSERT INTO `conf_paises` VALUES ('95', 'GF', 'Guayana Francesa', null);
INSERT INTO `conf_paises` VALUES ('96', 'GN', 'Guinea', null);
INSERT INTO `conf_paises` VALUES ('97', 'GQ', 'Guinea Ecuatorial', null);
INSERT INTO `conf_paises` VALUES ('98', 'GW', 'Guinea-Bissau', null);
INSERT INTO `conf_paises` VALUES ('99', 'GY', 'Guyana', null);
INSERT INTO `conf_paises` VALUES ('100', 'HT', 'Haití', null);
INSERT INTO `conf_paises` VALUES ('101', 'HM', 'Islas Heard y McDonald', null);
INSERT INTO `conf_paises` VALUES ('102', 'HN', 'Honduras', null);
INSERT INTO `conf_paises` VALUES ('103', 'HK', 'Hong Kong', null);
INSERT INTO `conf_paises` VALUES ('104', 'HU', 'Hungría', null);
INSERT INTO `conf_paises` VALUES ('105', 'IN', 'India', null);
INSERT INTO `conf_paises` VALUES ('106', 'ID', 'Indonesia', null);
INSERT INTO `conf_paises` VALUES ('107', 'IR', 'Irán', null);
INSERT INTO `conf_paises` VALUES ('108', 'IQ', 'Iraq', null);
INSERT INTO `conf_paises` VALUES ('109', 'IE', 'Irlanda', null);
INSERT INTO `conf_paises` VALUES ('110', 'IS', 'Islandia', null);
INSERT INTO `conf_paises` VALUES ('111', 'IL', 'Israel', null);
INSERT INTO `conf_paises` VALUES ('112', 'IT', 'Italia', null);
INSERT INTO `conf_paises` VALUES ('113', 'JM', 'Jamaica', null);
INSERT INTO `conf_paises` VALUES ('114', 'JP', 'Japón', null);
INSERT INTO `conf_paises` VALUES ('115', 'JO', 'Jordania', null);
INSERT INTO `conf_paises` VALUES ('116', 'KZ', 'Kazajstán', null);
INSERT INTO `conf_paises` VALUES ('117', 'KE', 'Kenia', null);
INSERT INTO `conf_paises` VALUES ('118', 'KG', 'Kirguistán', null);
INSERT INTO `conf_paises` VALUES ('119', 'KI', 'Kiribati', null);
INSERT INTO `conf_paises` VALUES ('120', 'KW', 'Kuwait', null);
INSERT INTO `conf_paises` VALUES ('121', 'LA', 'Laos', null);
INSERT INTO `conf_paises` VALUES ('122', 'LS', 'Lesotho', null);
INSERT INTO `conf_paises` VALUES ('123', 'LV', 'Letonia', null);
INSERT INTO `conf_paises` VALUES ('124', 'LB', 'Líbano', null);
INSERT INTO `conf_paises` VALUES ('125', 'LR', 'Liberia', null);
INSERT INTO `conf_paises` VALUES ('126', 'LY', 'Libia', null);
INSERT INTO `conf_paises` VALUES ('127', 'LI', 'Liechtenstein', null);
INSERT INTO `conf_paises` VALUES ('128', 'LT', 'Lituania', null);
INSERT INTO `conf_paises` VALUES ('129', 'LU', 'Luxemburgo', null);
INSERT INTO `conf_paises` VALUES ('130', 'MO', 'Macao', null);
INSERT INTO `conf_paises` VALUES ('131', 'MK', 'ARY Macedonia', null);
INSERT INTO `conf_paises` VALUES ('132', 'MG', 'Madagascar', null);
INSERT INTO `conf_paises` VALUES ('133', 'MY', 'Malasia', null);
INSERT INTO `conf_paises` VALUES ('134', 'MW', 'Malawi', null);
INSERT INTO `conf_paises` VALUES ('135', 'MV', 'Maldivas', null);
INSERT INTO `conf_paises` VALUES ('136', 'ML', 'Malí', null);
INSERT INTO `conf_paises` VALUES ('137', 'MT', 'Malta', null);
INSERT INTO `conf_paises` VALUES ('138', 'FK', 'Islas Malvinas', null);
INSERT INTO `conf_paises` VALUES ('139', 'MP', 'Islas Marianas del Norte', null);
INSERT INTO `conf_paises` VALUES ('140', 'MA', 'Marruecos', null);
INSERT INTO `conf_paises` VALUES ('141', 'MH', 'Islas Marshall', null);
INSERT INTO `conf_paises` VALUES ('142', 'MQ', 'Martinica', null);
INSERT INTO `conf_paises` VALUES ('143', 'MU', 'Mauricio', null);
INSERT INTO `conf_paises` VALUES ('144', 'MR', 'Mauritania', null);
INSERT INTO `conf_paises` VALUES ('145', 'YT', 'Mayotte', null);
INSERT INTO `conf_paises` VALUES ('146', 'MX', 'México', null);
INSERT INTO `conf_paises` VALUES ('147', 'FM', 'Micronesia', null);
INSERT INTO `conf_paises` VALUES ('148', 'MD', 'Moldavia', null);
INSERT INTO `conf_paises` VALUES ('149', 'MC', 'Mónaco', null);
INSERT INTO `conf_paises` VALUES ('150', 'MN', 'Mongolia', null);
INSERT INTO `conf_paises` VALUES ('151', 'MS', 'Montserrat', null);
INSERT INTO `conf_paises` VALUES ('152', 'MZ', 'Mozambique', null);
INSERT INTO `conf_paises` VALUES ('153', 'MM', 'Myanmar', null);
INSERT INTO `conf_paises` VALUES ('154', 'NA', 'Namibia', null);
INSERT INTO `conf_paises` VALUES ('155', 'NR', 'Nauru', null);
INSERT INTO `conf_paises` VALUES ('156', 'NP', 'Nepal', null);
INSERT INTO `conf_paises` VALUES ('157', 'NI', 'Nicaragua', null);
INSERT INTO `conf_paises` VALUES ('158', 'NE', 'Níger', null);
INSERT INTO `conf_paises` VALUES ('159', 'NG', 'Nigeria', null);
INSERT INTO `conf_paises` VALUES ('160', 'NU', 'Niue', null);
INSERT INTO `conf_paises` VALUES ('161', 'NF', 'Isla Norfolk', null);
INSERT INTO `conf_paises` VALUES ('162', 'NO', 'Noruega', null);
INSERT INTO `conf_paises` VALUES ('163', 'NC', 'Nueva Caledonia', null);
INSERT INTO `conf_paises` VALUES ('164', 'NZ', 'Nueva Zelanda', null);
INSERT INTO `conf_paises` VALUES ('165', 'OM', 'Omán', null);
INSERT INTO `conf_paises` VALUES ('166', 'NL', 'Países Bajos', null);
INSERT INTO `conf_paises` VALUES ('167', 'PK', 'Pakistán', null);
INSERT INTO `conf_paises` VALUES ('168', 'PW', 'Palau', null);
INSERT INTO `conf_paises` VALUES ('169', 'PS', 'Palestina', null);
INSERT INTO `conf_paises` VALUES ('170', 'PA', 'Panamá', null);
INSERT INTO `conf_paises` VALUES ('171', 'PG', 'Papúa Nueva Guinea', null);
INSERT INTO `conf_paises` VALUES ('172', 'PY', 'Paraguay', null);
INSERT INTO `conf_paises` VALUES ('173', 'PE', 'Perú', null);
INSERT INTO `conf_paises` VALUES ('174', 'PN', 'Islas Pitcairn', null);
INSERT INTO `conf_paises` VALUES ('175', 'PF', 'Polinesia Francesa', null);
INSERT INTO `conf_paises` VALUES ('176', 'PL', 'Polonia', null);
INSERT INTO `conf_paises` VALUES ('177', 'PT', 'Portugal', null);
INSERT INTO `conf_paises` VALUES ('178', 'PR', 'Puerto Rico', null);
INSERT INTO `conf_paises` VALUES ('179', 'QA', 'Qatar', null);
INSERT INTO `conf_paises` VALUES ('180', 'GB', 'Reino Unido', null);
INSERT INTO `conf_paises` VALUES ('181', 'RE', 'Reunión', null);
INSERT INTO `conf_paises` VALUES ('182', 'RW', 'Ruanda', null);
INSERT INTO `conf_paises` VALUES ('183', 'RO', 'Rumania', null);
INSERT INTO `conf_paises` VALUES ('184', 'RU', 'Rusia', null);
INSERT INTO `conf_paises` VALUES ('185', 'EH', 'Sahara Occidental', null);
INSERT INTO `conf_paises` VALUES ('186', 'SB', 'Islas Salomón', null);
INSERT INTO `conf_paises` VALUES ('187', 'WS', 'Samoa', null);
INSERT INTO `conf_paises` VALUES ('188', 'AS', 'Samoa Americana', null);
INSERT INTO `conf_paises` VALUES ('189', 'KN', 'San Cristóbal y Nevis', null);
INSERT INTO `conf_paises` VALUES ('190', 'SM', 'San Marino', null);
INSERT INTO `conf_paises` VALUES ('191', 'PM', 'San Pedro y Miquelón', null);
INSERT INTO `conf_paises` VALUES ('192', 'VC', 'San Vicente y las Granadinas', null);
INSERT INTO `conf_paises` VALUES ('193', 'SH', 'Santa Helena', null);
INSERT INTO `conf_paises` VALUES ('194', 'LC', 'Santa Lucía', null);
INSERT INTO `conf_paises` VALUES ('195', 'ST', 'Santo Tomé y Príncipe', null);
INSERT INTO `conf_paises` VALUES ('196', 'SN', 'Senegal', null);
INSERT INTO `conf_paises` VALUES ('197', 'CS', 'Serbia y Montenegro', null);
INSERT INTO `conf_paises` VALUES ('198', 'SC', 'Seychelles', null);
INSERT INTO `conf_paises` VALUES ('199', 'SL', 'Sierra Leona', null);
INSERT INTO `conf_paises` VALUES ('200', 'SG', 'Singapur', null);
INSERT INTO `conf_paises` VALUES ('201', 'SY', 'Siria', null);
INSERT INTO `conf_paises` VALUES ('202', 'SO', 'Somalia', null);
INSERT INTO `conf_paises` VALUES ('203', 'LK', 'Sri Lanka', null);
INSERT INTO `conf_paises` VALUES ('204', 'SZ', 'Suazilandia', null);
INSERT INTO `conf_paises` VALUES ('205', 'ZA', 'Sudáfrica', null);
INSERT INTO `conf_paises` VALUES ('206', 'SD', 'Sudán', null);
INSERT INTO `conf_paises` VALUES ('207', 'SE', 'Suecia', null);
INSERT INTO `conf_paises` VALUES ('208', 'CH', 'Suiza', null);
INSERT INTO `conf_paises` VALUES ('209', 'SR', 'Surinam', null);
INSERT INTO `conf_paises` VALUES ('210', 'SJ', 'Svalbard y Jan Mayen', null);
INSERT INTO `conf_paises` VALUES ('211', 'TH', 'Tailandia', null);
INSERT INTO `conf_paises` VALUES ('212', 'TW', 'Taiwán', null);
INSERT INTO `conf_paises` VALUES ('213', 'TZ', 'Tanzania', null);
INSERT INTO `conf_paises` VALUES ('214', 'TJ', 'Tayikistán', null);
INSERT INTO `conf_paises` VALUES ('215', 'IO', 'Territorio Británico del Océano Índico', null);
INSERT INTO `conf_paises` VALUES ('216', 'TF', 'Territorios Australes Franceses', null);
INSERT INTO `conf_paises` VALUES ('217', 'TL', 'Timor Oriental', null);
INSERT INTO `conf_paises` VALUES ('218', 'TG', 'Togo', null);
INSERT INTO `conf_paises` VALUES ('219', 'TK', 'Tokelau', null);
INSERT INTO `conf_paises` VALUES ('220', 'TO', 'Tonga', null);
INSERT INTO `conf_paises` VALUES ('221', 'TT', 'Trinidad y Tobago', null);
INSERT INTO `conf_paises` VALUES ('222', 'TN', 'Túnez', null);
INSERT INTO `conf_paises` VALUES ('223', 'TC', 'Islas Turcas y Caicos', null);
INSERT INTO `conf_paises` VALUES ('224', 'TM', 'Turkmenistán', null);
INSERT INTO `conf_paises` VALUES ('225', 'TR', 'Turquía', null);
INSERT INTO `conf_paises` VALUES ('226', 'TV', 'Tuvalu', null);
INSERT INTO `conf_paises` VALUES ('227', 'UA', 'Ucrania', null);
INSERT INTO `conf_paises` VALUES ('228', 'UG', 'Uganda', null);
INSERT INTO `conf_paises` VALUES ('229', 'UY', 'Uruguay', null);
INSERT INTO `conf_paises` VALUES ('230', 'UZ', 'Uzbekistán', null);
INSERT INTO `conf_paises` VALUES ('231', 'VU', 'Vanuatu', null);
INSERT INTO `conf_paises` VALUES ('232', 'VE', 'Venezuela', null);
INSERT INTO `conf_paises` VALUES ('233', 'VN', 'Vietnam', null);
INSERT INTO `conf_paises` VALUES ('234', 'VG', 'Islas Vírgenes Británicas', null);
INSERT INTO `conf_paises` VALUES ('235', 'VI', 'Islas Vírgenes de los Estados Unidos', null);
INSERT INTO `conf_paises` VALUES ('236', 'WF', 'Wallis y Futuna', null);
INSERT INTO `conf_paises` VALUES ('237', 'YE', 'Yemen', null);
INSERT INTO `conf_paises` VALUES ('238', 'DJ', 'Yibuti', null);
INSERT INTO `conf_paises` VALUES ('239', 'ZM', 'Zambia', null);
INSERT INTO `conf_paises` VALUES ('240', 'ZW', 'Zimbabue', null);

-- ----------------------------
-- Table structure for conf_parroquias
-- ----------------------------
DROP TABLE IF EXISTS `conf_parroquias`;
CREATE TABLE `conf_parroquias` (
  `id_parroquia` int(255) NOT NULL AUTO_INCREMENT,
  `parroquia` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `id_canton` int(255) NOT NULL,
  `id_tecnico` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id_parroquia`),
  KEY `FK_parroquia__canton_id` (`id_canton`),
  CONSTRAINT `FK_parroquia_canton_id` FOREIGN KEY (`id_canton`) REFERENCES `conf_cantones` (`id_canton`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1400 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of conf_parroquias
-- ----------------------------
INSERT INTO `conf_parroquias` VALUES ('1', 'Bellavista', '1', null);
INSERT INTO `conf_parroquias` VALUES ('2', 'Cañaribamba', '1', null);
INSERT INTO `conf_parroquias` VALUES ('3', 'El Batán', '1', null);
INSERT INTO `conf_parroquias` VALUES ('4', 'El Sagrario', '1', null);
INSERT INTO `conf_parroquias` VALUES ('5', 'El Vecino', '1', null);
INSERT INTO `conf_parroquias` VALUES ('6', 'Gil Ramírez Dávalos', '1', null);
INSERT INTO `conf_parroquias` VALUES ('7', 'Huaynacápac', '1', null);
INSERT INTO `conf_parroquias` VALUES ('8', 'Machángara', '1', null);
INSERT INTO `conf_parroquias` VALUES ('9', 'Monay', '1', null);
INSERT INTO `conf_parroquias` VALUES ('10', 'San Blas', '1', null);
INSERT INTO `conf_parroquias` VALUES ('11', 'San Sebastián', '1', null);
INSERT INTO `conf_parroquias` VALUES ('12', 'Sucre', '1', null);
INSERT INTO `conf_parroquias` VALUES ('13', 'Totoracocha', '1', null);
INSERT INTO `conf_parroquias` VALUES ('14', 'Yanuncay', '1', null);
INSERT INTO `conf_parroquias` VALUES ('15', 'Hermano Miguel', '1', null);
INSERT INTO `conf_parroquias` VALUES ('16', 'Cuenca', '1', null);
INSERT INTO `conf_parroquias` VALUES ('17', 'Baños', '1', null);
INSERT INTO `conf_parroquias` VALUES ('18', 'Cumbe', '1', null);
INSERT INTO `conf_parroquias` VALUES ('19', 'Chaucha', '1', null);
INSERT INTO `conf_parroquias` VALUES ('20', 'Checa (Jidcay)', '1', null);
INSERT INTO `conf_parroquias` VALUES ('21', 'Chiquintad', '1', null);
INSERT INTO `conf_parroquias` VALUES ('22', 'Llacao', '1', null);
INSERT INTO `conf_parroquias` VALUES ('23', 'Molleturo', '1', null);
INSERT INTO `conf_parroquias` VALUES ('24', 'Nulti', '1', null);
INSERT INTO `conf_parroquias` VALUES ('25', 'Octavio Cordero Palacios (Santa Rosa)', '1', null);
INSERT INTO `conf_parroquias` VALUES ('26', 'Paccha', '1', null);
INSERT INTO `conf_parroquias` VALUES ('27', 'Quingeo', '1', null);
INSERT INTO `conf_parroquias` VALUES ('28', 'Ricaurte', '1', null);
INSERT INTO `conf_parroquias` VALUES ('29', 'San Joaquín', '1', null);
INSERT INTO `conf_parroquias` VALUES ('30', 'Santa Ana', '1', null);
INSERT INTO `conf_parroquias` VALUES ('31', 'Sayausí', '1', null);
INSERT INTO `conf_parroquias` VALUES ('32', 'Sidcay', '1', null);
INSERT INTO `conf_parroquias` VALUES ('33', 'Sinincay', '1', null);
INSERT INTO `conf_parroquias` VALUES ('34', 'Tarqui', '1', null);
INSERT INTO `conf_parroquias` VALUES ('35', 'Turi', '1', null);
INSERT INTO `conf_parroquias` VALUES ('36', 'Valle', '1', null);
INSERT INTO `conf_parroquias` VALUES ('37', 'Victoria del Portete (Irquis)', '1', null);
INSERT INTO `conf_parroquias` VALUES ('38', 'Girón', '2', null);
INSERT INTO `conf_parroquias` VALUES ('39', 'Asunción', '2', null);
INSERT INTO `conf_parroquias` VALUES ('40', 'San Gerardo', '2', null);
INSERT INTO `conf_parroquias` VALUES ('41', 'Gualaceo', '3', null);
INSERT INTO `conf_parroquias` VALUES ('42', 'Chordeleg', '3', null);
INSERT INTO `conf_parroquias` VALUES ('43', 'Daniel Córdova Toral (El Oriente)', '3', null);
INSERT INTO `conf_parroquias` VALUES ('44', 'Jadán', '3', null);
INSERT INTO `conf_parroquias` VALUES ('45', 'Mariano Moreno', '3', null);
INSERT INTO `conf_parroquias` VALUES ('46', 'Principal', '3', null);
INSERT INTO `conf_parroquias` VALUES ('47', 'Remigio Crespo Toral (Gúlag)', '3', null);
INSERT INTO `conf_parroquias` VALUES ('48', 'San Juan', '3', null);
INSERT INTO `conf_parroquias` VALUES ('49', 'Zhidmad', '3', null);
INSERT INTO `conf_parroquias` VALUES ('50', 'Luis Cordero Vega', '3', null);
INSERT INTO `conf_parroquias` VALUES ('51', 'Simón Bolívar (Cab. En Gañanzol)', '3', null);
INSERT INTO `conf_parroquias` VALUES ('52', 'Nabón', '4', null);
INSERT INTO `conf_parroquias` VALUES ('53', 'Cochapata', '4', null);
INSERT INTO `conf_parroquias` VALUES ('54', 'El Progreso (Cab.En Zhota)', '4', null);
INSERT INTO `conf_parroquias` VALUES ('55', 'Las Nieves (Chaya)', '4', null);
INSERT INTO `conf_parroquias` VALUES ('56', 'Oña', '4', null);
INSERT INTO `conf_parroquias` VALUES ('57', 'Paute', '5', null);
INSERT INTO `conf_parroquias` VALUES ('58', 'Amaluza', '5', null);
INSERT INTO `conf_parroquias` VALUES ('59', 'Bulán (José Víctor Izquierdo)', '5', null);
INSERT INTO `conf_parroquias` VALUES ('60', 'Chicán (Guillermo Ortega)', '5', null);
INSERT INTO `conf_parroquias` VALUES ('61', 'El Cabo', '5', null);
INSERT INTO `conf_parroquias` VALUES ('62', 'Guachapala', '5', null);
INSERT INTO `conf_parroquias` VALUES ('63', 'Guarainag', '5', null);
INSERT INTO `conf_parroquias` VALUES ('64', 'Palmas', '5', null);
INSERT INTO `conf_parroquias` VALUES ('65', 'Pan', '5', null);
INSERT INTO `conf_parroquias` VALUES ('66', 'San Cristóbal (Carlos Ordóñez Lazo)', '5', null);
INSERT INTO `conf_parroquias` VALUES ('67', 'Sevilla de Oro', '5', null);
INSERT INTO `conf_parroquias` VALUES ('68', 'Tomebamba', '5', null);
INSERT INTO `conf_parroquias` VALUES ('69', 'Dug Dug', '5', null);
INSERT INTO `conf_parroquias` VALUES ('70', 'Pucará', '6', null);
INSERT INTO `conf_parroquias` VALUES ('71', 'Camilo Ponce Enríquez (Cab. En Río 7 de Mollepongo)', '6', null);
INSERT INTO `conf_parroquias` VALUES ('72', 'San Rafael de Sharug', '6', null);
INSERT INTO `conf_parroquias` VALUES ('73', 'San Fernando', '7', null);
INSERT INTO `conf_parroquias` VALUES ('74', 'Chumblín', '7', null);
INSERT INTO `conf_parroquias` VALUES ('75', 'Santa Isabel (Chaguarurco)', '8', null);
INSERT INTO `conf_parroquias` VALUES ('76', 'Abdón Calderón (La Unión)', '8', null);
INSERT INTO `conf_parroquias` VALUES ('77', 'El Carmen de Pijilí', '8', null);
INSERT INTO `conf_parroquias` VALUES ('78', 'Zhaglli (Shaglli)', '8', null);
INSERT INTO `conf_parroquias` VALUES ('79', 'San Salvador de Cañaribamba', '8', null);
INSERT INTO `conf_parroquias` VALUES ('80', 'Sigsig', '9', null);
INSERT INTO `conf_parroquias` VALUES ('81', 'Cuchil (Cutchil)', '9', null);
INSERT INTO `conf_parroquias` VALUES ('82', 'Gima', '9', null);
INSERT INTO `conf_parroquias` VALUES ('83', 'Guel', '9', null);
INSERT INTO `conf_parroquias` VALUES ('84', 'Ludo', '9', null);
INSERT INTO `conf_parroquias` VALUES ('85', 'San Bartolomé', '9', null);
INSERT INTO `conf_parroquias` VALUES ('86', 'San José de Raranga', '9', null);
INSERT INTO `conf_parroquias` VALUES ('87', 'San Felipe de Oña Cabecera Cantonal', '10', null);
INSERT INTO `conf_parroquias` VALUES ('88', 'Susudel', '10', null);
INSERT INTO `conf_parroquias` VALUES ('89', 'Chordeleg', '11', null);
INSERT INTO `conf_parroquias` VALUES ('90', 'Principal', '11', null);
INSERT INTO `conf_parroquias` VALUES ('91', 'La Unión', '11', null);
INSERT INTO `conf_parroquias` VALUES ('92', 'Luis Galarza Orellana (Cab.En Delegsol)', '11', null);
INSERT INTO `conf_parroquias` VALUES ('93', 'San Martín de Puzhio', '11', null);
INSERT INTO `conf_parroquias` VALUES ('94', 'El Pan', '12', null);
INSERT INTO `conf_parroquias` VALUES ('95', 'Amaluza', '12', null);
INSERT INTO `conf_parroquias` VALUES ('96', 'Palmas', '12', null);
INSERT INTO `conf_parroquias` VALUES ('97', 'San Vicente', '12', null);
INSERT INTO `conf_parroquias` VALUES ('98', 'Sevilla de Oro', '13', null);
INSERT INTO `conf_parroquias` VALUES ('99', 'Amaluza', '13', null);
INSERT INTO `conf_parroquias` VALUES ('100', 'Palmas', '13', null);
INSERT INTO `conf_parroquias` VALUES ('101', 'Guachapala', '14', null);
INSERT INTO `conf_parroquias` VALUES ('102', 'Camilo Ponce Enríquez', '15', null);
INSERT INTO `conf_parroquias` VALUES ('103', 'El Carmen de Pijilí', '15', null);
INSERT INTO `conf_parroquias` VALUES ('104', 'Ángel Polibio Cháves', '16', null);
INSERT INTO `conf_parroquias` VALUES ('105', 'Gabriel Ignacio Veintimilla', '16', null);
INSERT INTO `conf_parroquias` VALUES ('106', 'Guanujo', '16', null);
INSERT INTO `conf_parroquias` VALUES ('107', 'Guaranda', '16', null);
INSERT INTO `conf_parroquias` VALUES ('108', 'Facundo Vela', '16', null);
INSERT INTO `conf_parroquias` VALUES ('109', 'Guanujo', '16', null);
INSERT INTO `conf_parroquias` VALUES ('110', 'Julio E. Moreno (Catanahuán Grande)', '16', null);
INSERT INTO `conf_parroquias` VALUES ('111', 'Las Naves', '16', null);
INSERT INTO `conf_parroquias` VALUES ('112', 'Salinas', '16', null);
INSERT INTO `conf_parroquias` VALUES ('113', 'San Lorenzo', '16', null);
INSERT INTO `conf_parroquias` VALUES ('114', 'San Simón (Yacoto)', '16', null);
INSERT INTO `conf_parroquias` VALUES ('115', 'Santa Fé (Santa Fé)', '16', null);
INSERT INTO `conf_parroquias` VALUES ('116', 'Simiátug', '16', null);
INSERT INTO `conf_parroquias` VALUES ('117', 'San Luis de Pambil', '16', null);
INSERT INTO `conf_parroquias` VALUES ('118', 'Chillanes', '17', null);
INSERT INTO `conf_parroquias` VALUES ('119', 'San José del Tambo (Tambopamba)', '17', null);
INSERT INTO `conf_parroquias` VALUES ('120', 'San José de Chimbo', '18', null);
INSERT INTO `conf_parroquias` VALUES ('121', 'Asunción (Asancoto)', '18', null);
INSERT INTO `conf_parroquias` VALUES ('122', 'Caluma', '18', null);
INSERT INTO `conf_parroquias` VALUES ('123', 'Magdalena (Chapacoto)', '18', null);
INSERT INTO `conf_parroquias` VALUES ('124', 'San Sebastián', '18', null);
INSERT INTO `conf_parroquias` VALUES ('125', 'Telimbela', '18', null);
INSERT INTO `conf_parroquias` VALUES ('126', 'Echeandía', '19', null);
INSERT INTO `conf_parroquias` VALUES ('127', 'San Miguel', '20', null);
INSERT INTO `conf_parroquias` VALUES ('128', 'Balsapamba', '20', null);
INSERT INTO `conf_parroquias` VALUES ('129', 'Bilován', '20', null);
INSERT INTO `conf_parroquias` VALUES ('130', 'Régulo de Mora', '20', null);
INSERT INTO `conf_parroquias` VALUES ('131', 'San Pablo (San Pablo de Atenas)', '20', null);
INSERT INTO `conf_parroquias` VALUES ('132', 'Santiago', '20', null);
INSERT INTO `conf_parroquias` VALUES ('133', 'San Vicente', '20', null);
INSERT INTO `conf_parroquias` VALUES ('134', 'Caluma', '21', null);
INSERT INTO `conf_parroquias` VALUES ('135', 'Las Mercedes', '22', null);
INSERT INTO `conf_parroquias` VALUES ('136', 'Las Naves', '22', null);
INSERT INTO `conf_parroquias` VALUES ('137', 'Las Naves', '22', null);
INSERT INTO `conf_parroquias` VALUES ('138', 'Aurelio Bayas Martínez', '23', null);
INSERT INTO `conf_parroquias` VALUES ('139', 'Azogues', '23', null);
INSERT INTO `conf_parroquias` VALUES ('140', 'Borrero', '23', null);
INSERT INTO `conf_parroquias` VALUES ('141', 'San Francisco', '23', null);
INSERT INTO `conf_parroquias` VALUES ('142', 'Azogues', '23', null);
INSERT INTO `conf_parroquias` VALUES ('143', 'Cojitambo', '23', null);
INSERT INTO `conf_parroquias` VALUES ('144', 'Déleg', '23', null);
INSERT INTO `conf_parroquias` VALUES ('145', 'Guapán', '23', null);
INSERT INTO `conf_parroquias` VALUES ('146', 'Javier Loyola (Chuquipata)', '23', null);
INSERT INTO `conf_parroquias` VALUES ('147', 'Luis Cordero', '23', null);
INSERT INTO `conf_parroquias` VALUES ('148', 'Pindilig', '23', null);
INSERT INTO `conf_parroquias` VALUES ('149', 'Rivera', '23', null);
INSERT INTO `conf_parroquias` VALUES ('150', 'San Miguel', '23', null);
INSERT INTO `conf_parroquias` VALUES ('151', 'Solano', '23', null);
INSERT INTO `conf_parroquias` VALUES ('152', 'Taday', '23', null);
INSERT INTO `conf_parroquias` VALUES ('153', 'Biblián', '24', null);
INSERT INTO `conf_parroquias` VALUES ('154', 'Nazón (Cab. En Pampa de Domínguez)', '24', null);
INSERT INTO `conf_parroquias` VALUES ('155', 'San Francisco de Sageo', '24', null);
INSERT INTO `conf_parroquias` VALUES ('156', 'Turupamba', '24', null);
INSERT INTO `conf_parroquias` VALUES ('157', 'Jerusalén', '24', null);
INSERT INTO `conf_parroquias` VALUES ('158', 'Cañar', '25', null);
INSERT INTO `conf_parroquias` VALUES ('159', 'Chontamarca', '25', null);
INSERT INTO `conf_parroquias` VALUES ('160', 'Chorocopte', '25', null);
INSERT INTO `conf_parroquias` VALUES ('161', 'General Morales (Socarte)', '25', null);
INSERT INTO `conf_parroquias` VALUES ('162', 'Gualleturo', '25', null);
INSERT INTO `conf_parroquias` VALUES ('163', 'Honorato Vásquez (Tambo Viejo)', '25', null);
INSERT INTO `conf_parroquias` VALUES ('164', 'Ingapirca', '25', null);
INSERT INTO `conf_parroquias` VALUES ('165', 'Juncal', '25', null);
INSERT INTO `conf_parroquias` VALUES ('166', 'San Antonio', '25', null);
INSERT INTO `conf_parroquias` VALUES ('167', 'Suscal', '25', null);
INSERT INTO `conf_parroquias` VALUES ('168', 'Tambo', '25', null);
INSERT INTO `conf_parroquias` VALUES ('169', 'Zhud', '25', null);
INSERT INTO `conf_parroquias` VALUES ('170', 'Ventura', '25', null);
INSERT INTO `conf_parroquias` VALUES ('171', 'Ducur', '25', null);
INSERT INTO `conf_parroquias` VALUES ('172', 'La Troncal', '26', null);
INSERT INTO `conf_parroquias` VALUES ('173', 'Manuel J. Calle', '26', null);
INSERT INTO `conf_parroquias` VALUES ('174', 'Pancho Negro', '26', null);
INSERT INTO `conf_parroquias` VALUES ('175', 'El Tambo', '27', null);
INSERT INTO `conf_parroquias` VALUES ('176', 'Déleg', '28', null);
INSERT INTO `conf_parroquias` VALUES ('177', 'Solano', '28', null);
INSERT INTO `conf_parroquias` VALUES ('178', 'Suscal', '29', null);
INSERT INTO `conf_parroquias` VALUES ('179', 'González Suárez', '30', null);
INSERT INTO `conf_parroquias` VALUES ('180', 'Tulcán', '30', null);
INSERT INTO `conf_parroquias` VALUES ('181', 'Tulcán', '30', null);
INSERT INTO `conf_parroquias` VALUES ('182', 'El Carmelo (El Pun)', '30', null);
INSERT INTO `conf_parroquias` VALUES ('183', 'Huaca', '30', null);
INSERT INTO `conf_parroquias` VALUES ('184', 'Julio Andrade (Orejuela)', '30', null);
INSERT INTO `conf_parroquias` VALUES ('185', 'Maldonado', '30', null);
INSERT INTO `conf_parroquias` VALUES ('186', 'Pioter', '30', null);
INSERT INTO `conf_parroquias` VALUES ('187', 'Tobar Donoso (La Bocana de Camumbí)', '30', null);
INSERT INTO `conf_parroquias` VALUES ('188', 'Tufiño', '30', null);
INSERT INTO `conf_parroquias` VALUES ('189', 'Urbina (Taya)', '30', null);
INSERT INTO `conf_parroquias` VALUES ('190', 'El Chical', '30', null);
INSERT INTO `conf_parroquias` VALUES ('191', 'Mariscal Sucre', '30', null);
INSERT INTO `conf_parroquias` VALUES ('192', 'Santa Martha de Cuba', '30', null);
INSERT INTO `conf_parroquias` VALUES ('193', 'Bolívar', '31', null);
INSERT INTO `conf_parroquias` VALUES ('194', 'García Moreno', '31', null);
INSERT INTO `conf_parroquias` VALUES ('195', 'Los Andes', '31', null);
INSERT INTO `conf_parroquias` VALUES ('196', 'Monte Olivo', '31', null);
INSERT INTO `conf_parroquias` VALUES ('197', 'San Vicente de Pusir', '31', null);
INSERT INTO `conf_parroquias` VALUES ('198', 'San Rafael', '31', null);
INSERT INTO `conf_parroquias` VALUES ('199', 'El Ángel', '32', null);
INSERT INTO `conf_parroquias` VALUES ('200', '27 de Septiembre', '32', null);
INSERT INTO `conf_parroquias` VALUES ('201', 'El Angel', '32', null);
INSERT INTO `conf_parroquias` VALUES ('202', 'El Goaltal', '32', null);
INSERT INTO `conf_parroquias` VALUES ('203', 'La Libertad (Alizo)', '32', null);
INSERT INTO `conf_parroquias` VALUES ('204', 'San Isidro', '32', null);
INSERT INTO `conf_parroquias` VALUES ('205', 'Mira (Chontahuasi)', '33', null);
INSERT INTO `conf_parroquias` VALUES ('206', 'Concepción', '33', null);
INSERT INTO `conf_parroquias` VALUES ('207', 'Jijón Y Caamaño (Cab. En Río Blanco)', '33', null);
INSERT INTO `conf_parroquias` VALUES ('208', 'Juan Montalvo (San Ignacio de Quil)', '33', null);
INSERT INTO `conf_parroquias` VALUES ('209', 'González Suárez', '34', null);
INSERT INTO `conf_parroquias` VALUES ('210', 'San José', '34', null);
INSERT INTO `conf_parroquias` VALUES ('211', 'San Gabriel', '34', null);
INSERT INTO `conf_parroquias` VALUES ('212', 'Cristóbal Colón', '34', null);
INSERT INTO `conf_parroquias` VALUES ('213', 'Chitán de Navarrete', '34', null);
INSERT INTO `conf_parroquias` VALUES ('214', 'Fernández Salvador', '34', null);
INSERT INTO `conf_parroquias` VALUES ('215', 'La Paz', '34', null);
INSERT INTO `conf_parroquias` VALUES ('216', 'Piartal', '34', null);
INSERT INTO `conf_parroquias` VALUES ('217', 'Huaca', '35', null);
INSERT INTO `conf_parroquias` VALUES ('218', 'Mariscal Sucre', '35', null);
INSERT INTO `conf_parroquias` VALUES ('219', 'Eloy Alfaro (San Felipe)', '36', null);
INSERT INTO `conf_parroquias` VALUES ('220', 'Ignacio Flores (Parque Flores)', '36', null);
INSERT INTO `conf_parroquias` VALUES ('221', 'Juan Montalvo (San Sebastián)', '36', null);
INSERT INTO `conf_parroquias` VALUES ('222', 'La Matriz', '36', null);
INSERT INTO `conf_parroquias` VALUES ('223', 'San Buenaventura', '36', null);
INSERT INTO `conf_parroquias` VALUES ('224', 'Latacunga', '36', null);
INSERT INTO `conf_parroquias` VALUES ('225', 'Alaques (Aláquez)', '36', null);
INSERT INTO `conf_parroquias` VALUES ('226', 'Belisario Quevedo (Guanailín)', '36', null);
INSERT INTO `conf_parroquias` VALUES ('227', 'Guaitacama (Guaytacama)', '36', null);
INSERT INTO `conf_parroquias` VALUES ('228', 'Joseguango Bajo', '36', null);
INSERT INTO `conf_parroquias` VALUES ('229', 'Las Pampas', '36', null);
INSERT INTO `conf_parroquias` VALUES ('230', 'Mulaló', '36', null);
INSERT INTO `conf_parroquias` VALUES ('231', '11 de Noviembre (Ilinchisi)', '36', null);
INSERT INTO `conf_parroquias` VALUES ('232', 'Poaló', '36', null);
INSERT INTO `conf_parroquias` VALUES ('233', 'San Juan de Pastocalle', '36', null);
INSERT INTO `conf_parroquias` VALUES ('234', 'Sigchos', '36', null);
INSERT INTO `conf_parroquias` VALUES ('235', 'Tanicuchí', '36', null);
INSERT INTO `conf_parroquias` VALUES ('236', 'Toacaso', '36', null);
INSERT INTO `conf_parroquias` VALUES ('237', 'Palo Quemado', '36', null);
INSERT INTO `conf_parroquias` VALUES ('238', 'El Carmen', '37', null);
INSERT INTO `conf_parroquias` VALUES ('239', 'La Maná', '37', null);
INSERT INTO `conf_parroquias` VALUES ('240', 'El Triunfo', '37', null);
INSERT INTO `conf_parroquias` VALUES ('241', 'La Maná', '37', null);
INSERT INTO `conf_parroquias` VALUES ('242', 'Guasaganda (Cab.En Guasaganda', '37', null);
INSERT INTO `conf_parroquias` VALUES ('243', 'Pucayacu', '37', null);
INSERT INTO `conf_parroquias` VALUES ('244', 'El Corazón', '38', null);
INSERT INTO `conf_parroquias` VALUES ('245', 'Moraspungo', '38', null);
INSERT INTO `conf_parroquias` VALUES ('246', 'Pinllopata', '38', null);
INSERT INTO `conf_parroquias` VALUES ('247', 'Ramón Campaña', '38', null);
INSERT INTO `conf_parroquias` VALUES ('248', 'Pujilí', '39', null);
INSERT INTO `conf_parroquias` VALUES ('249', 'Angamarca', '39', null);
INSERT INTO `conf_parroquias` VALUES ('250', 'Chucchilán (Chugchilán)', '39', null);
INSERT INTO `conf_parroquias` VALUES ('251', 'Guangaje', '39', null);
INSERT INTO `conf_parroquias` VALUES ('252', 'Isinlibí (Isinliví)', '39', null);
INSERT INTO `conf_parroquias` VALUES ('253', 'La Victoria', '39', null);
INSERT INTO `conf_parroquias` VALUES ('254', 'Pilaló', '39', null);
INSERT INTO `conf_parroquias` VALUES ('255', 'Tingo', '39', null);
INSERT INTO `conf_parroquias` VALUES ('256', 'Zumbahua', '39', null);
INSERT INTO `conf_parroquias` VALUES ('257', 'San Miguel', '40', null);
INSERT INTO `conf_parroquias` VALUES ('258', 'Antonio José Holguín (Santa Lucía)', '40', null);
INSERT INTO `conf_parroquias` VALUES ('259', 'Cusubamba', '40', null);
INSERT INTO `conf_parroquias` VALUES ('260', 'Mulalillo', '40', null);
INSERT INTO `conf_parroquias` VALUES ('261', 'Mulliquindil (Santa Ana)', '40', null);
INSERT INTO `conf_parroquias` VALUES ('262', 'Pansaleo', '40', null);
INSERT INTO `conf_parroquias` VALUES ('263', 'Saquisilí', '41', null);
INSERT INTO `conf_parroquias` VALUES ('264', 'Canchagua', '41', null);
INSERT INTO `conf_parroquias` VALUES ('265', 'Chantilín', '41', null);
INSERT INTO `conf_parroquias` VALUES ('266', 'Cochapamba', '41', null);
INSERT INTO `conf_parroquias` VALUES ('267', 'Sigchos', '42', null);
INSERT INTO `conf_parroquias` VALUES ('268', 'Chugchillán', '42', null);
INSERT INTO `conf_parroquias` VALUES ('269', 'Isinliví', '42', null);
INSERT INTO `conf_parroquias` VALUES ('270', 'Las Pampas', '42', null);
INSERT INTO `conf_parroquias` VALUES ('271', 'Palo Quemado', '42', null);
INSERT INTO `conf_parroquias` VALUES ('272', 'Lizarzaburu', '43', null);
INSERT INTO `conf_parroquias` VALUES ('273', 'Maldonado', '43', null);
INSERT INTO `conf_parroquias` VALUES ('274', 'Velasco', '43', null);
INSERT INTO `conf_parroquias` VALUES ('275', 'Veloz', '43', null);
INSERT INTO `conf_parroquias` VALUES ('276', 'Yaruquíes', '43', null);
INSERT INTO `conf_parroquias` VALUES ('277', 'Riobamba', '43', null);
INSERT INTO `conf_parroquias` VALUES ('278', 'Cacha (Cab. En Machángara)', '43', null);
INSERT INTO `conf_parroquias` VALUES ('279', 'Calpi', '43', null);
INSERT INTO `conf_parroquias` VALUES ('280', 'Cubijíes', '43', null);
INSERT INTO `conf_parroquias` VALUES ('281', 'Flores', '43', null);
INSERT INTO `conf_parroquias` VALUES ('282', 'Licán', '43', null);
INSERT INTO `conf_parroquias` VALUES ('283', 'Licto', '43', null);
INSERT INTO `conf_parroquias` VALUES ('284', 'Pungalá', '43', null);
INSERT INTO `conf_parroquias` VALUES ('285', 'Punín', '43', null);
INSERT INTO `conf_parroquias` VALUES ('286', 'Quimiag', '43', null);
INSERT INTO `conf_parroquias` VALUES ('287', 'San Juan', '43', null);
INSERT INTO `conf_parroquias` VALUES ('288', 'San Luis', '43', null);
INSERT INTO `conf_parroquias` VALUES ('289', 'Alausí', '44', null);
INSERT INTO `conf_parroquias` VALUES ('290', 'Achupallas', '44', null);
INSERT INTO `conf_parroquias` VALUES ('291', 'Cumandá', '44', null);
INSERT INTO `conf_parroquias` VALUES ('292', 'Guasuntos', '44', null);
INSERT INTO `conf_parroquias` VALUES ('293', 'Huigra', '44', null);
INSERT INTO `conf_parroquias` VALUES ('294', 'Multitud', '44', null);
INSERT INTO `conf_parroquias` VALUES ('295', 'Pistishí (Nariz del Diablo)', '44', null);
INSERT INTO `conf_parroquias` VALUES ('296', 'Pumallacta', '44', null);
INSERT INTO `conf_parroquias` VALUES ('297', 'Sevilla', '44', null);
INSERT INTO `conf_parroquias` VALUES ('298', 'Sibambe', '44', null);
INSERT INTO `conf_parroquias` VALUES ('299', 'Tixán', '44', null);
INSERT INTO `conf_parroquias` VALUES ('300', 'Cajabamba', '45', null);
INSERT INTO `conf_parroquias` VALUES ('301', 'Sicalpa', '45', null);
INSERT INTO `conf_parroquias` VALUES ('302', 'Villa La Unión (Cajabamba)', '45', null);
INSERT INTO `conf_parroquias` VALUES ('303', 'Cañi', '45', null);
INSERT INTO `conf_parroquias` VALUES ('304', 'Columbe', '45', null);
INSERT INTO `conf_parroquias` VALUES ('305', 'Juan de Velasco (Pangor)', '45', null);
INSERT INTO `conf_parroquias` VALUES ('306', 'Santiago de Quito (Cab. En San Antonio de Quito)', '45', null);
INSERT INTO `conf_parroquias` VALUES ('307', 'Chambo', '46', null);
INSERT INTO `conf_parroquias` VALUES ('308', 'Chunchi', '47', null);
INSERT INTO `conf_parroquias` VALUES ('309', 'Capzol', '47', null);
INSERT INTO `conf_parroquias` VALUES ('310', 'Compud', '47', null);
INSERT INTO `conf_parroquias` VALUES ('311', 'Gonzol', '47', null);
INSERT INTO `conf_parroquias` VALUES ('312', 'Llagos', '47', null);
INSERT INTO `conf_parroquias` VALUES ('313', 'Guamote', '48', null);
INSERT INTO `conf_parroquias` VALUES ('314', 'Cebadas', '48', null);
INSERT INTO `conf_parroquias` VALUES ('315', 'Palmira', '48', null);
INSERT INTO `conf_parroquias` VALUES ('316', 'El Rosario', '49', null);
INSERT INTO `conf_parroquias` VALUES ('317', 'La Matriz', '49', null);
INSERT INTO `conf_parroquias` VALUES ('318', 'Guano', '49', null);
INSERT INTO `conf_parroquias` VALUES ('319', 'Guanando', '49', null);
INSERT INTO `conf_parroquias` VALUES ('320', 'Ilapo', '49', null);
INSERT INTO `conf_parroquias` VALUES ('321', 'La Providencia', '49', null);
INSERT INTO `conf_parroquias` VALUES ('322', 'San Andrés', '49', null);
INSERT INTO `conf_parroquias` VALUES ('323', 'San Gerardo de Pacaicaguán', '49', null);
INSERT INTO `conf_parroquias` VALUES ('324', 'San Isidro de Patulú', '49', null);
INSERT INTO `conf_parroquias` VALUES ('325', 'San José del Chazo', '49', null);
INSERT INTO `conf_parroquias` VALUES ('326', 'Santa Fé de Galán', '49', null);
INSERT INTO `conf_parroquias` VALUES ('327', 'Valparaíso', '49', null);
INSERT INTO `conf_parroquias` VALUES ('328', 'Pallatanga', '50', null);
INSERT INTO `conf_parroquias` VALUES ('329', 'Penipe', '51', null);
INSERT INTO `conf_parroquias` VALUES ('330', 'El Altar', '51', null);
INSERT INTO `conf_parroquias` VALUES ('331', 'Matus', '51', null);
INSERT INTO `conf_parroquias` VALUES ('332', 'Puela', '51', null);
INSERT INTO `conf_parroquias` VALUES ('333', 'San Antonio de Bayushig', '51', null);
INSERT INTO `conf_parroquias` VALUES ('334', 'La Candelaria', '51', null);
INSERT INTO `conf_parroquias` VALUES ('335', 'Bilbao (Cab.En Quilluyacu)', '51', null);
INSERT INTO `conf_parroquias` VALUES ('336', 'Cumandá', '52', null);
INSERT INTO `conf_parroquias` VALUES ('337', 'La Providencia', '53', null);
INSERT INTO `conf_parroquias` VALUES ('338', 'Machala', '53', null);
INSERT INTO `conf_parroquias` VALUES ('339', 'Puerto Bolívar', '53', null);
INSERT INTO `conf_parroquias` VALUES ('340', 'Nueve de Mayo', '53', null);
INSERT INTO `conf_parroquias` VALUES ('341', 'El Cambio', '53', null);
INSERT INTO `conf_parroquias` VALUES ('342', 'Machala', '53', null);
INSERT INTO `conf_parroquias` VALUES ('343', 'El Cambio', '53', null);
INSERT INTO `conf_parroquias` VALUES ('344', 'El Retiro', '53', null);
INSERT INTO `conf_parroquias` VALUES ('345', 'Arenillas', '54', null);
INSERT INTO `conf_parroquias` VALUES ('346', 'Chacras', '54', null);
INSERT INTO `conf_parroquias` VALUES ('347', 'La Libertad', '54', null);
INSERT INTO `conf_parroquias` VALUES ('348', 'Las Lajas (Cab. En La Victoria)', '54', null);
INSERT INTO `conf_parroquias` VALUES ('349', 'Palmales', '54', null);
INSERT INTO `conf_parroquias` VALUES ('350', 'Carcabón', '54', null);
INSERT INTO `conf_parroquias` VALUES ('351', 'Paccha', '55', null);
INSERT INTO `conf_parroquias` VALUES ('352', 'Ayapamba', '55', null);
INSERT INTO `conf_parroquias` VALUES ('353', 'Cordoncillo', '55', null);
INSERT INTO `conf_parroquias` VALUES ('354', 'Milagro', '55', null);
INSERT INTO `conf_parroquias` VALUES ('355', 'San José', '55', null);
INSERT INTO `conf_parroquias` VALUES ('356', 'San Juan de Cerro Azul', '55', null);
INSERT INTO `conf_parroquias` VALUES ('357', 'Balsas', '56', null);
INSERT INTO `conf_parroquias` VALUES ('358', 'Bellamaría', '56', null);
INSERT INTO `conf_parroquias` VALUES ('359', 'Chilla', '57', null);
INSERT INTO `conf_parroquias` VALUES ('360', 'El Guabo', '58', null);
INSERT INTO `conf_parroquias` VALUES ('361', 'Barbones (Sucre)', '58', null);
INSERT INTO `conf_parroquias` VALUES ('362', 'La Iberia', '58', null);
INSERT INTO `conf_parroquias` VALUES ('363', 'Tendales (Cab.En Puerto Tendales)', '58', null);
INSERT INTO `conf_parroquias` VALUES ('364', 'Río Bonito', '58', null);
INSERT INTO `conf_parroquias` VALUES ('365', 'Ecuador', '59', null);
INSERT INTO `conf_parroquias` VALUES ('366', 'El Paraíso', '59', null);
INSERT INTO `conf_parroquias` VALUES ('367', 'Hualtaco', '59', null);
INSERT INTO `conf_parroquias` VALUES ('368', 'Milton Reyes', '59', null);
INSERT INTO `conf_parroquias` VALUES ('369', 'Unión Lojana', '59', null);
INSERT INTO `conf_parroquias` VALUES ('370', 'Huaquillas', '59', null);
INSERT INTO `conf_parroquias` VALUES ('371', 'Marcabelí', '60', null);
INSERT INTO `conf_parroquias` VALUES ('372', 'El Ingenio', '60', null);
INSERT INTO `conf_parroquias` VALUES ('373', 'Bolívar', '61', null);
INSERT INTO `conf_parroquias` VALUES ('374', 'Loma de Franco', '61', null);
INSERT INTO `conf_parroquias` VALUES ('375', 'Ochoa León (Matriz)', '61', null);
INSERT INTO `conf_parroquias` VALUES ('376', 'Tres Cerritos', '61', null);
INSERT INTO `conf_parroquias` VALUES ('377', 'Pasaje', '61', null);
INSERT INTO `conf_parroquias` VALUES ('378', 'Buenavista', '61', null);
INSERT INTO `conf_parroquias` VALUES ('379', 'Casacay', '61', null);
INSERT INTO `conf_parroquias` VALUES ('380', 'La Peaña', '61', null);
INSERT INTO `conf_parroquias` VALUES ('381', 'Progreso', '61', null);
INSERT INTO `conf_parroquias` VALUES ('382', 'Uzhcurrumi', '61', null);
INSERT INTO `conf_parroquias` VALUES ('383', 'Cañaquemada', '61', null);
INSERT INTO `conf_parroquias` VALUES ('384', 'La Matriz', '62', null);
INSERT INTO `conf_parroquias` VALUES ('385', 'La Susaya', '62', null);
INSERT INTO `conf_parroquias` VALUES ('386', 'Piñas Grande', '62', null);
INSERT INTO `conf_parroquias` VALUES ('387', 'Piñas', '62', null);
INSERT INTO `conf_parroquias` VALUES ('388', 'Capiro (Cab. En La Capilla de Capiro)', '62', null);
INSERT INTO `conf_parroquias` VALUES ('389', 'La Bocana', '62', null);
INSERT INTO `conf_parroquias` VALUES ('390', 'Moromoro (Cab. En El Vado)', '62', null);
INSERT INTO `conf_parroquias` VALUES ('391', 'Piedras', '62', null);
INSERT INTO `conf_parroquias` VALUES ('392', 'San Roque (Ambrosio Maldonado)', '62', null);
INSERT INTO `conf_parroquias` VALUES ('393', 'Saracay', '62', null);
INSERT INTO `conf_parroquias` VALUES ('394', 'Portovelo', '63', null);
INSERT INTO `conf_parroquias` VALUES ('395', 'Curtincapa', '63', null);
INSERT INTO `conf_parroquias` VALUES ('396', 'Morales', '63', null);
INSERT INTO `conf_parroquias` VALUES ('397', 'Salatí', '63', null);
INSERT INTO `conf_parroquias` VALUES ('398', 'Santa Rosa', '64', null);
INSERT INTO `conf_parroquias` VALUES ('399', 'Puerto Jelí', '64', null);
INSERT INTO `conf_parroquias` VALUES ('400', 'Balneario Jambelí (Satélite)', '64', null);
INSERT INTO `conf_parroquias` VALUES ('401', 'Jumón (Satélite)', '64', null);
INSERT INTO `conf_parroquias` VALUES ('402', 'Nuevo Santa Rosa', '64', null);
INSERT INTO `conf_parroquias` VALUES ('403', 'Santa Rosa', '64', null);
INSERT INTO `conf_parroquias` VALUES ('404', 'Bellavista', '64', null);
INSERT INTO `conf_parroquias` VALUES ('405', 'Jambelí', '64', null);
INSERT INTO `conf_parroquias` VALUES ('406', 'La Avanzada', '64', null);
INSERT INTO `conf_parroquias` VALUES ('407', 'San Antonio', '64', null);
INSERT INTO `conf_parroquias` VALUES ('408', 'Torata', '64', null);
INSERT INTO `conf_parroquias` VALUES ('409', 'Victoria', '64', null);
INSERT INTO `conf_parroquias` VALUES ('410', 'Bellamaría', '64', null);
INSERT INTO `conf_parroquias` VALUES ('411', 'Zaruma', '65', null);
INSERT INTO `conf_parroquias` VALUES ('412', 'Abañín', '65', null);
INSERT INTO `conf_parroquias` VALUES ('413', 'Arcapamba', '65', null);
INSERT INTO `conf_parroquias` VALUES ('414', 'Guanazán', '65', null);
INSERT INTO `conf_parroquias` VALUES ('415', 'Guizhaguiña', '65', null);
INSERT INTO `conf_parroquias` VALUES ('416', 'Huertas', '65', null);
INSERT INTO `conf_parroquias` VALUES ('417', 'Malvas', '65', null);
INSERT INTO `conf_parroquias` VALUES ('418', 'Muluncay Grande', '65', null);
INSERT INTO `conf_parroquias` VALUES ('419', 'Sinsao', '65', null);
INSERT INTO `conf_parroquias` VALUES ('420', 'Salvias', '65', null);
INSERT INTO `conf_parroquias` VALUES ('421', 'La Victoria', '66', null);
INSERT INTO `conf_parroquias` VALUES ('422', 'Platanillos', '66', null);
INSERT INTO `conf_parroquias` VALUES ('423', 'Valle Hermoso', '66', null);
INSERT INTO `conf_parroquias` VALUES ('424', 'La Victoria', '66', null);
INSERT INTO `conf_parroquias` VALUES ('425', 'La Libertad', '66', null);
INSERT INTO `conf_parroquias` VALUES ('426', 'El Paraíso', '66', null);
INSERT INTO `conf_parroquias` VALUES ('427', 'San Isidro', '66', null);
INSERT INTO `conf_parroquias` VALUES ('428', 'Bartolomé Ruiz (César Franco Carrión)', '67', null);
INSERT INTO `conf_parroquias` VALUES ('429', '5 de Agosto', '67', null);
INSERT INTO `conf_parroquias` VALUES ('430', 'Esmeraldas', '67', null);
INSERT INTO `conf_parroquias` VALUES ('431', 'Luis Tello (Las Palmas)', '67', null);
INSERT INTO `conf_parroquias` VALUES ('432', 'Simón Plata Torres', '67', null);
INSERT INTO `conf_parroquias` VALUES ('433', 'Esmeraldas', '67', null);
INSERT INTO `conf_parroquias` VALUES ('434', 'Atacames', '67', null);
INSERT INTO `conf_parroquias` VALUES ('435', 'Camarones (Cab. En San Vicente)', '67', null);
INSERT INTO `conf_parroquias` VALUES ('436', 'Crnel. Carlos Concha Torres (Cab.En Huele)', '67', null);
INSERT INTO `conf_parroquias` VALUES ('437', 'Chinca', '67', null);
INSERT INTO `conf_parroquias` VALUES ('438', 'Chontaduro', '67', null);
INSERT INTO `conf_parroquias` VALUES ('439', 'Chumundé', '67', null);
INSERT INTO `conf_parroquias` VALUES ('440', 'Lagarto', '67', null);
INSERT INTO `conf_parroquias` VALUES ('441', 'La Unión', '67', null);
INSERT INTO `conf_parroquias` VALUES ('442', 'Majua', '67', null);
INSERT INTO `conf_parroquias` VALUES ('443', 'Montalvo (Cab. En Horqueta)', '67', null);
INSERT INTO `conf_parroquias` VALUES ('444', 'Río Verde', '67', null);
INSERT INTO `conf_parroquias` VALUES ('445', 'Rocafuerte', '67', null);
INSERT INTO `conf_parroquias` VALUES ('446', 'San Mateo', '67', null);
INSERT INTO `conf_parroquias` VALUES ('447', 'Súa (Cab. En La Bocana)', '67', null);
INSERT INTO `conf_parroquias` VALUES ('448', 'Tabiazo', '67', null);
INSERT INTO `conf_parroquias` VALUES ('449', 'Tachina', '67', null);
INSERT INTO `conf_parroquias` VALUES ('450', 'Tonchigüe', '67', null);
INSERT INTO `conf_parroquias` VALUES ('451', 'Vuelta Larga', '67', null);
INSERT INTO `conf_parroquias` VALUES ('452', 'Valdez (Limones)', '68', null);
INSERT INTO `conf_parroquias` VALUES ('453', 'Anchayacu', '68', null);
INSERT INTO `conf_parroquias` VALUES ('454', 'Atahualpa (Cab. En Camarones)', '68', null);
INSERT INTO `conf_parroquias` VALUES ('455', 'Borbón', '68', null);
INSERT INTO `conf_parroquias` VALUES ('456', 'La Tola', '68', null);
INSERT INTO `conf_parroquias` VALUES ('457', 'Luis Vargas Torres (Cab. En Playa de Oro)', '68', null);
INSERT INTO `conf_parroquias` VALUES ('458', 'Maldonado', '68', null);
INSERT INTO `conf_parroquias` VALUES ('459', 'Pampanal de Bolívar', '68', null);
INSERT INTO `conf_parroquias` VALUES ('460', 'San Francisco de Onzole', '68', null);
INSERT INTO `conf_parroquias` VALUES ('461', 'Santo Domingo de Onzole', '68', null);
INSERT INTO `conf_parroquias` VALUES ('462', 'Selva Alegre', '68', null);
INSERT INTO `conf_parroquias` VALUES ('463', 'Telembí', '68', null);
INSERT INTO `conf_parroquias` VALUES ('464', 'Colón Eloy del María', '68', null);
INSERT INTO `conf_parroquias` VALUES ('465', 'San José de Cayapas', '68', null);
INSERT INTO `conf_parroquias` VALUES ('466', 'Timbiré', '68', null);
INSERT INTO `conf_parroquias` VALUES ('467', 'Muisne', '69', null);
INSERT INTO `conf_parroquias` VALUES ('468', 'Bolívar', '69', null);
INSERT INTO `conf_parroquias` VALUES ('469', 'Daule', '69', null);
INSERT INTO `conf_parroquias` VALUES ('470', 'Galera', '69', null);
INSERT INTO `conf_parroquias` VALUES ('471', 'Quingue (Olmedo Perdomo Franco)', '69', null);
INSERT INTO `conf_parroquias` VALUES ('472', 'Salima', '69', null);
INSERT INTO `conf_parroquias` VALUES ('473', 'San Francisco', '69', null);
INSERT INTO `conf_parroquias` VALUES ('474', 'San Gregorio', '69', null);
INSERT INTO `conf_parroquias` VALUES ('475', 'San José de Chamanga (Cab.En Chamanga)', '69', null);
INSERT INTO `conf_parroquias` VALUES ('476', 'Rosa Zárate (Quinindé)', '70', null);
INSERT INTO `conf_parroquias` VALUES ('477', 'Cube', '70', null);
INSERT INTO `conf_parroquias` VALUES ('478', 'Chura (Chancama) (Cab. En El Yerbero)', '70', null);
INSERT INTO `conf_parroquias` VALUES ('479', 'Malimpia', '70', null);
INSERT INTO `conf_parroquias` VALUES ('480', 'Viche', '70', null);
INSERT INTO `conf_parroquias` VALUES ('481', 'La Unión', '70', null);
INSERT INTO `conf_parroquias` VALUES ('482', 'San Lorenzo', '71', null);
INSERT INTO `conf_parroquias` VALUES ('483', 'Alto Tambo (Cab. En Guadual)', '71', null);
INSERT INTO `conf_parroquias` VALUES ('484', 'Ancón (Pichangal) (Cab. En Palma Real)', '71', null);
INSERT INTO `conf_parroquias` VALUES ('485', 'Calderón', '71', null);
INSERT INTO `conf_parroquias` VALUES ('486', 'Carondelet', '71', null);
INSERT INTO `conf_parroquias` VALUES ('487', '5 de Junio (Cab. En Uimbi)', '71', null);
INSERT INTO `conf_parroquias` VALUES ('488', 'Concepción', '71', null);
INSERT INTO `conf_parroquias` VALUES ('489', 'Mataje (Cab. En Santander)', '71', null);
INSERT INTO `conf_parroquias` VALUES ('490', 'San Javier de Cachaví (Cab. En San Javier)', '71', null);
INSERT INTO `conf_parroquias` VALUES ('491', 'Santa Rita', '71', null);
INSERT INTO `conf_parroquias` VALUES ('492', 'Tambillo', '71', null);
INSERT INTO `conf_parroquias` VALUES ('493', 'Tululbí (Cab. En Ricaurte)', '71', null);
INSERT INTO `conf_parroquias` VALUES ('494', 'Urbina', '71', null);
INSERT INTO `conf_parroquias` VALUES ('495', 'Atacames', '72', null);
INSERT INTO `conf_parroquias` VALUES ('496', 'La Unión', '72', null);
INSERT INTO `conf_parroquias` VALUES ('497', 'Súa (Cab. En La Bocana)', '72', null);
INSERT INTO `conf_parroquias` VALUES ('498', 'Tonchigüe', '72', null);
INSERT INTO `conf_parroquias` VALUES ('499', 'Tonsupa', '72', null);
INSERT INTO `conf_parroquias` VALUES ('500', 'Rioverde', '73', null);
INSERT INTO `conf_parroquias` VALUES ('501', 'Chontaduro', '73', null);
INSERT INTO `conf_parroquias` VALUES ('502', 'Chumundé', '73', null);
INSERT INTO `conf_parroquias` VALUES ('503', 'Lagarto', '73', null);
INSERT INTO `conf_parroquias` VALUES ('504', 'Montalvo (Cab. En Horqueta)', '73', null);
INSERT INTO `conf_parroquias` VALUES ('505', 'Rocafuerte', '73', null);
INSERT INTO `conf_parroquias` VALUES ('506', 'La Concordia', '74', null);
INSERT INTO `conf_parroquias` VALUES ('507', 'Monterrey', '74', null);
INSERT INTO `conf_parroquias` VALUES ('508', 'La Villegas', '74', null);
INSERT INTO `conf_parroquias` VALUES ('509', 'Plan Piloto', '74', null);
INSERT INTO `conf_parroquias` VALUES ('510', 'Ayacucho', '75', null);
INSERT INTO `conf_parroquias` VALUES ('511', 'Bolívar (Sagrario)', '75', null);
INSERT INTO `conf_parroquias` VALUES ('512', 'Carbo (Concepción)', '75', null);
INSERT INTO `conf_parroquias` VALUES ('513', 'Febres Cordero', '75', null);
INSERT INTO `conf_parroquias` VALUES ('514', 'García Moreno', '75', null);
INSERT INTO `conf_parroquias` VALUES ('515', 'Letamendi', '75', null);
INSERT INTO `conf_parroquias` VALUES ('516', 'Nueve de Octubre', '75', null);
INSERT INTO `conf_parroquias` VALUES ('517', 'Olmedo (San Alejo)', '75', null);
INSERT INTO `conf_parroquias` VALUES ('518', 'Roca', '75', null);
INSERT INTO `conf_parroquias` VALUES ('519', 'Rocafuerte', '75', null);
INSERT INTO `conf_parroquias` VALUES ('520', 'Sucre', '75', null);
INSERT INTO `conf_parroquias` VALUES ('521', 'Tarqui', '75', null);
INSERT INTO `conf_parroquias` VALUES ('522', 'Urdaneta', '75', null);
INSERT INTO `conf_parroquias` VALUES ('523', 'Ximena', '75', null);
INSERT INTO `conf_parroquias` VALUES ('524', 'Pascuales', '75', null);
INSERT INTO `conf_parroquias` VALUES ('525', 'Guayaquil', '75', null);
INSERT INTO `conf_parroquias` VALUES ('526', 'Chongón', '75', null);
INSERT INTO `conf_parroquias` VALUES ('527', 'Juan Gómez Rendón (Progreso)', '75', null);
INSERT INTO `conf_parroquias` VALUES ('528', 'Morro', '75', null);
INSERT INTO `conf_parroquias` VALUES ('529', 'Pascuales', '75', null);
INSERT INTO `conf_parroquias` VALUES ('530', 'Playas (Gral. Villamil)', '75', null);
INSERT INTO `conf_parroquias` VALUES ('531', 'Posorja', '75', null);
INSERT INTO `conf_parroquias` VALUES ('532', 'Puná', '75', null);
INSERT INTO `conf_parroquias` VALUES ('533', 'Tenguel', '75', null);
INSERT INTO `conf_parroquias` VALUES ('534', 'Alfredo Baquerizo Moreno (Juján)', '76', null);
INSERT INTO `conf_parroquias` VALUES ('535', 'Balao', '77', null);
INSERT INTO `conf_parroquias` VALUES ('536', 'Balzar', '78', null);
INSERT INTO `conf_parroquias` VALUES ('537', 'Colimes', '79', null);
INSERT INTO `conf_parroquias` VALUES ('538', 'San Jacinto', '79', null);
INSERT INTO `conf_parroquias` VALUES ('539', 'Daule', '80', null);
INSERT INTO `conf_parroquias` VALUES ('540', 'La Aurora (Satélite)', '80', null);
INSERT INTO `conf_parroquias` VALUES ('541', 'Banife', '80', null);
INSERT INTO `conf_parroquias` VALUES ('542', 'Emiliano Caicedo Marcos', '80', null);
INSERT INTO `conf_parroquias` VALUES ('543', 'Magro', '80', null);
INSERT INTO `conf_parroquias` VALUES ('544', 'Padre Juan Bautista Aguirre', '80', null);
INSERT INTO `conf_parroquias` VALUES ('545', 'Santa Clara', '80', null);
INSERT INTO `conf_parroquias` VALUES ('546', 'Vicente Piedrahita', '80', null);
INSERT INTO `conf_parroquias` VALUES ('547', 'Daule', '80', null);
INSERT INTO `conf_parroquias` VALUES ('548', 'Isidro Ayora (Soledad)', '80', null);
INSERT INTO `conf_parroquias` VALUES ('549', 'Juan Bautista Aguirre (Los Tintos)', '80', null);
INSERT INTO `conf_parroquias` VALUES ('550', 'Laurel', '80', null);
INSERT INTO `conf_parroquias` VALUES ('551', 'Limonal', '80', null);
INSERT INTO `conf_parroquias` VALUES ('552', 'Lomas de Sargentillo', '80', null);
INSERT INTO `conf_parroquias` VALUES ('553', 'Los Lojas (Enrique Baquerizo Moreno)', '80', null);
INSERT INTO `conf_parroquias` VALUES ('554', 'Piedrahita (Nobol)', '80', null);
INSERT INTO `conf_parroquias` VALUES ('555', 'Eloy Alfaro (Durán)', '81', null);
INSERT INTO `conf_parroquias` VALUES ('556', 'El Recreo', '81', null);
INSERT INTO `conf_parroquias` VALUES ('557', 'Eloy Alfaro (Durán)', '81', null);
INSERT INTO `conf_parroquias` VALUES ('558', 'Velasco Ibarra (El Empalme)', '82', null);
INSERT INTO `conf_parroquias` VALUES ('559', 'Guayas (Pueblo Nuevo)', '82', null);
INSERT INTO `conf_parroquias` VALUES ('560', 'El Rosario', '82', null);
INSERT INTO `conf_parroquias` VALUES ('561', 'El Triunfo', '83', null);
INSERT INTO `conf_parroquias` VALUES ('562', 'Milagro', '84', null);
INSERT INTO `conf_parroquias` VALUES ('563', 'Chobo', '84', null);
INSERT INTO `conf_parroquias` VALUES ('564', 'General Elizalde (Bucay)', '84', null);
INSERT INTO `conf_parroquias` VALUES ('565', 'Mariscal Sucre (Huaques)', '84', null);
INSERT INTO `conf_parroquias` VALUES ('566', 'Roberto Astudillo (Cab. En Cruce de Venecia)', '84', null);
INSERT INTO `conf_parroquias` VALUES ('567', 'Naranjal', '85', null);
INSERT INTO `conf_parroquias` VALUES ('568', 'Jesús María', '85', null);
INSERT INTO `conf_parroquias` VALUES ('569', 'San Carlos', '85', null);
INSERT INTO `conf_parroquias` VALUES ('570', 'Santa Rosa de Flandes', '85', null);
INSERT INTO `conf_parroquias` VALUES ('571', 'Taura', '85', null);
INSERT INTO `conf_parroquias` VALUES ('572', 'Naranjito', '86', null);
INSERT INTO `conf_parroquias` VALUES ('573', 'Palestina', '87', null);
INSERT INTO `conf_parroquias` VALUES ('574', 'Pedro Carbo', '88', null);
INSERT INTO `conf_parroquias` VALUES ('575', 'Valle de La Virgen', '88', null);
INSERT INTO `conf_parroquias` VALUES ('576', 'Sabanilla', '88', null);
INSERT INTO `conf_parroquias` VALUES ('577', 'Samborondón', '89', null);
INSERT INTO `conf_parroquias` VALUES ('578', 'La Puntilla (Satélite)', '89', null);
INSERT INTO `conf_parroquias` VALUES ('579', 'Samborondón', '89', null);
INSERT INTO `conf_parroquias` VALUES ('580', 'Tarifa', '89', null);
INSERT INTO `conf_parroquias` VALUES ('581', 'Santa Lucía', '90', null);
INSERT INTO `conf_parroquias` VALUES ('582', 'Bocana', '91', null);
INSERT INTO `conf_parroquias` VALUES ('583', 'Candilejos', '91', null);
INSERT INTO `conf_parroquias` VALUES ('584', 'Central', '91', null);
INSERT INTO `conf_parroquias` VALUES ('585', 'Paraíso', '91', null);
INSERT INTO `conf_parroquias` VALUES ('586', 'San Mateo', '91', null);
INSERT INTO `conf_parroquias` VALUES ('587', 'El Salitre (Las Ramas)', '91', null);
INSERT INTO `conf_parroquias` VALUES ('588', 'Gral. Vernaza (Dos Esteros)', '91', null);
INSERT INTO `conf_parroquias` VALUES ('589', 'La Victoria (Ñauza)', '91', null);
INSERT INTO `conf_parroquias` VALUES ('590', 'Junquillal', '91', null);
INSERT INTO `conf_parroquias` VALUES ('591', 'San Jacinto de Yaguachi', '92', null);
INSERT INTO `conf_parroquias` VALUES ('592', 'Crnel. Lorenzo de Garaicoa (Pedregal)', '92', null);
INSERT INTO `conf_parroquias` VALUES ('593', 'Crnel. Marcelino Maridueña (San Carlos)', '92', null);
INSERT INTO `conf_parroquias` VALUES ('594', 'Gral. Pedro J. Montero (Boliche)', '92', null);
INSERT INTO `conf_parroquias` VALUES ('595', 'Simón Bolívar', '92', null);
INSERT INTO `conf_parroquias` VALUES ('596', 'Yaguachi Viejo (Cone)', '92', null);
INSERT INTO `conf_parroquias` VALUES ('597', 'Virgen de Fátima', '92', null);
INSERT INTO `conf_parroquias` VALUES ('598', 'General Villamil (Playas)', '93', null);
INSERT INTO `conf_parroquias` VALUES ('599', 'Simón Bolívar', '94', null);
INSERT INTO `conf_parroquias` VALUES ('600', 'Crnel.Lorenzo de Garaicoa (Pedregal)', '94', null);
INSERT INTO `conf_parroquias` VALUES ('601', 'Coronel Marcelino Maridueña (San Carlos)', '95', null);
INSERT INTO `conf_parroquias` VALUES ('602', 'Lomas de Sargentillo', '96', null);
INSERT INTO `conf_parroquias` VALUES ('603', 'Isidro Ayora (Soledad)', '96', null);
INSERT INTO `conf_parroquias` VALUES ('604', 'Narcisa de Jesús', '97', null);
INSERT INTO `conf_parroquias` VALUES ('605', 'General Antonio Elizalde (Bucay)', '98', null);
INSERT INTO `conf_parroquias` VALUES ('606', 'Isidro Ayora', '99', null);
INSERT INTO `conf_parroquias` VALUES ('607', 'Caranqui', '100', null);
INSERT INTO `conf_parroquias` VALUES ('608', 'Guayaquil de Alpachaca', '100', null);
INSERT INTO `conf_parroquias` VALUES ('609', 'Sagrario', '100', null);
INSERT INTO `conf_parroquias` VALUES ('610', 'San Francisco', '100', null);
INSERT INTO `conf_parroquias` VALUES ('611', 'La Dolorosa del Priorato', '100', null);
INSERT INTO `conf_parroquias` VALUES ('612', 'San Miguel de Ibarra', '100', null);
INSERT INTO `conf_parroquias` VALUES ('613', 'Ambuquí', '100', null);
INSERT INTO `conf_parroquias` VALUES ('614', 'Angochagua', '100', null);
INSERT INTO `conf_parroquias` VALUES ('615', 'Carolina', '100', null);
INSERT INTO `conf_parroquias` VALUES ('616', 'La Esperanza', '100', null);
INSERT INTO `conf_parroquias` VALUES ('617', 'Lita', '100', null);
INSERT INTO `conf_parroquias` VALUES ('618', 'Salinas', '100', null);
INSERT INTO `conf_parroquias` VALUES ('619', 'San Antonio', '100', null);
INSERT INTO `conf_parroquias` VALUES ('620', 'Andrade Marín (Lourdes)', '101', null);
INSERT INTO `conf_parroquias` VALUES ('621', 'Atuntaqui', '101', null);
INSERT INTO `conf_parroquias` VALUES ('622', 'Atuntaqui', '101', null);
INSERT INTO `conf_parroquias` VALUES ('623', 'Imbaya (San Luis de Cobuendo)', '101', null);
INSERT INTO `conf_parroquias` VALUES ('624', 'San Francisco de Natabuela', '101', null);
INSERT INTO `conf_parroquias` VALUES ('625', 'San José de Chaltura', '101', null);
INSERT INTO `conf_parroquias` VALUES ('626', 'San Roque', '101', null);
INSERT INTO `conf_parroquias` VALUES ('627', 'Sagrario', '102', null);
INSERT INTO `conf_parroquias` VALUES ('628', 'San Francisco', '102', null);
INSERT INTO `conf_parroquias` VALUES ('629', 'Cotacachi', '102', null);
INSERT INTO `conf_parroquias` VALUES ('630', 'Apuela', '102', null);
INSERT INTO `conf_parroquias` VALUES ('631', 'García Moreno (Llurimagua)', '102', null);
INSERT INTO `conf_parroquias` VALUES ('632', 'Imantag', '102', null);
INSERT INTO `conf_parroquias` VALUES ('633', 'Peñaherrera', '102', null);
INSERT INTO `conf_parroquias` VALUES ('634', 'Plaza Gutiérrez (Calvario)', '102', null);
INSERT INTO `conf_parroquias` VALUES ('635', 'Quiroga', '102', null);
INSERT INTO `conf_parroquias` VALUES ('636', '6 de Julio de Cuellaje (Cab. En Cuellaje)', '102', null);
INSERT INTO `conf_parroquias` VALUES ('637', 'Vacas Galindo (El Churo) (Cab.En San Miguel Alto', '102', null);
INSERT INTO `conf_parroquias` VALUES ('638', 'Jordán', '103', null);
INSERT INTO `conf_parroquias` VALUES ('639', 'San Luis', '103', null);
INSERT INTO `conf_parroquias` VALUES ('640', 'Otavalo', '103', null);
INSERT INTO `conf_parroquias` VALUES ('641', 'Dr. Miguel Egas Cabezas (Peguche)', '103', null);
INSERT INTO `conf_parroquias` VALUES ('642', 'Eugenio Espejo (Calpaquí)', '103', null);
INSERT INTO `conf_parroquias` VALUES ('643', 'González Suárez', '103', null);
INSERT INTO `conf_parroquias` VALUES ('644', 'Pataquí', '103', null);
INSERT INTO `conf_parroquias` VALUES ('645', 'San José de Quichinche', '103', null);
INSERT INTO `conf_parroquias` VALUES ('646', 'San Juan de Ilumán', '103', null);
INSERT INTO `conf_parroquias` VALUES ('647', 'San Pablo', '103', null);
INSERT INTO `conf_parroquias` VALUES ('648', 'San Rafael', '103', null);
INSERT INTO `conf_parroquias` VALUES ('649', 'Selva Alegre (Cab.En San Miguel de Pamplona)', '103', null);
INSERT INTO `conf_parroquias` VALUES ('650', 'Pimampiro', '104', null);
INSERT INTO `conf_parroquias` VALUES ('651', 'Chugá', '104', null);
INSERT INTO `conf_parroquias` VALUES ('652', 'Mariano Acosta', '104', null);
INSERT INTO `conf_parroquias` VALUES ('653', 'San Francisco de Sigsipamba', '104', null);
INSERT INTO `conf_parroquias` VALUES ('654', 'Urcuquí Cabecera Cantonal', '105', null);
INSERT INTO `conf_parroquias` VALUES ('655', 'Cahuasquí', '105', null);
INSERT INTO `conf_parroquias` VALUES ('656', 'La Merced de Buenos Aires', '105', null);
INSERT INTO `conf_parroquias` VALUES ('657', 'Pablo Arenas', '105', null);
INSERT INTO `conf_parroquias` VALUES ('658', 'San Blas', '105', null);
INSERT INTO `conf_parroquias` VALUES ('659', 'Tumbabiro', '105', null);
INSERT INTO `conf_parroquias` VALUES ('660', 'El Sagrario', '106', null);
INSERT INTO `conf_parroquias` VALUES ('661', 'San Sebastián', '106', null);
INSERT INTO `conf_parroquias` VALUES ('662', 'Sucre', '106', null);
INSERT INTO `conf_parroquias` VALUES ('663', 'Valle', '106', null);
INSERT INTO `conf_parroquias` VALUES ('664', 'Loja', '106', null);
INSERT INTO `conf_parroquias` VALUES ('665', 'Chantaco', '106', null);
INSERT INTO `conf_parroquias` VALUES ('666', 'Chuquiribamba', '106', null);
INSERT INTO `conf_parroquias` VALUES ('667', 'El Cisne', '106', null);
INSERT INTO `conf_parroquias` VALUES ('668', 'Gualel', '106', null);
INSERT INTO `conf_parroquias` VALUES ('669', 'Jimbilla', '106', null);
INSERT INTO `conf_parroquias` VALUES ('670', 'Malacatos (Valladolid)', '106', null);
INSERT INTO `conf_parroquias` VALUES ('671', 'San Lucas', '106', null);
INSERT INTO `conf_parroquias` VALUES ('672', 'San Pedro de Vilcabamba', '106', null);
INSERT INTO `conf_parroquias` VALUES ('673', 'Santiago', '106', null);
INSERT INTO `conf_parroquias` VALUES ('674', 'Taquil (Miguel Riofrío)', '106', null);
INSERT INTO `conf_parroquias` VALUES ('675', 'Vilcabamba (Victoria)', '106', null);
INSERT INTO `conf_parroquias` VALUES ('676', 'Yangana (Arsenio Castillo)', '106', null);
INSERT INTO `conf_parroquias` VALUES ('677', 'Quinara', '106', null);
INSERT INTO `conf_parroquias` VALUES ('678', 'Cariamanga', '107', null);
INSERT INTO `conf_parroquias` VALUES ('679', 'Chile', '107', null);
INSERT INTO `conf_parroquias` VALUES ('680', 'San Vicente', '107', null);
INSERT INTO `conf_parroquias` VALUES ('681', 'Cariamanga', '107', null);
INSERT INTO `conf_parroquias` VALUES ('682', 'Colaisaca', '107', null);
INSERT INTO `conf_parroquias` VALUES ('683', 'El Lucero', '107', null);
INSERT INTO `conf_parroquias` VALUES ('684', 'Utuana', '107', null);
INSERT INTO `conf_parroquias` VALUES ('685', 'Sanguillín', '107', null);
INSERT INTO `conf_parroquias` VALUES ('686', 'Catamayo', '108', null);
INSERT INTO `conf_parroquias` VALUES ('687', 'San José', '108', null);
INSERT INTO `conf_parroquias` VALUES ('688', 'Catamayo (La Toma)', '108', null);
INSERT INTO `conf_parroquias` VALUES ('689', 'El Tambo', '108', null);
INSERT INTO `conf_parroquias` VALUES ('690', 'Guayquichuma', '108', null);
INSERT INTO `conf_parroquias` VALUES ('691', 'San Pedro de La Bendita', '108', null);
INSERT INTO `conf_parroquias` VALUES ('692', 'Zambi', '108', null);
INSERT INTO `conf_parroquias` VALUES ('693', 'Celica', '109', null);
INSERT INTO `conf_parroquias` VALUES ('694', 'Cruzpamba (Cab. En Carlos Bustamante)', '109', null);
INSERT INTO `conf_parroquias` VALUES ('695', 'Chaquinal', '109', null);
INSERT INTO `conf_parroquias` VALUES ('696', '12 de Diciembre (Cab. En Achiotes)', '109', null);
INSERT INTO `conf_parroquias` VALUES ('697', 'Pindal (Federico Páez)', '109', null);
INSERT INTO `conf_parroquias` VALUES ('698', 'Pozul (San Juan de Pozul)', '109', null);
INSERT INTO `conf_parroquias` VALUES ('699', 'Sabanilla', '109', null);
INSERT INTO `conf_parroquias` VALUES ('700', 'Tnte. Maximiliano Rodríguez Loaiza', '109', null);
INSERT INTO `conf_parroquias` VALUES ('701', 'Chaguarpamba', '110', null);
INSERT INTO `conf_parroquias` VALUES ('702', 'Buenavista', '110', null);
INSERT INTO `conf_parroquias` VALUES ('703', 'El Rosario', '110', null);
INSERT INTO `conf_parroquias` VALUES ('704', 'Santa Rufina', '110', null);
INSERT INTO `conf_parroquias` VALUES ('705', 'Amarillos', '110', null);
INSERT INTO `conf_parroquias` VALUES ('706', 'Amaluza', '111', null);
INSERT INTO `conf_parroquias` VALUES ('707', 'Bellavista', '111', null);
INSERT INTO `conf_parroquias` VALUES ('708', 'Jimbura', '111', null);
INSERT INTO `conf_parroquias` VALUES ('709', 'Santa Teresita', '111', null);
INSERT INTO `conf_parroquias` VALUES ('710', '27 de Abril (Cab. En La Naranja)', '111', null);
INSERT INTO `conf_parroquias` VALUES ('711', 'El Ingenio', '111', null);
INSERT INTO `conf_parroquias` VALUES ('712', 'El Airo', '111', null);
INSERT INTO `conf_parroquias` VALUES ('713', 'Gonzanamá', '112', null);
INSERT INTO `conf_parroquias` VALUES ('714', 'Changaimina (La Libertad)', '112', null);
INSERT INTO `conf_parroquias` VALUES ('715', 'Fundochamba', '112', null);
INSERT INTO `conf_parroquias` VALUES ('716', 'Nambacola', '112', null);
INSERT INTO `conf_parroquias` VALUES ('717', 'Purunuma (Eguiguren)', '112', null);
INSERT INTO `conf_parroquias` VALUES ('718', 'Quilanga (La Paz)', '112', null);
INSERT INTO `conf_parroquias` VALUES ('719', 'Sacapalca', '112', null);
INSERT INTO `conf_parroquias` VALUES ('720', 'San Antonio de Las Aradas (Cab. En Las Aradas)', '112', null);
INSERT INTO `conf_parroquias` VALUES ('721', 'General Eloy Alfaro (San Sebastián)', '113', null);
INSERT INTO `conf_parroquias` VALUES ('722', 'Macará (Manuel Enrique Rengel Suquilanda)', '113', null);
INSERT INTO `conf_parroquias` VALUES ('723', 'Macará', '113', null);
INSERT INTO `conf_parroquias` VALUES ('724', 'Larama', '113', null);
INSERT INTO `conf_parroquias` VALUES ('725', 'La Victoria', '113', null);
INSERT INTO `conf_parroquias` VALUES ('726', 'Sabiango (La Capilla)', '113', null);
INSERT INTO `conf_parroquias` VALUES ('727', 'Catacocha', '114', null);
INSERT INTO `conf_parroquias` VALUES ('728', 'Lourdes', '114', null);
INSERT INTO `conf_parroquias` VALUES ('729', 'Catacocha', '114', null);
INSERT INTO `conf_parroquias` VALUES ('730', 'Cangonamá', '114', null);
INSERT INTO `conf_parroquias` VALUES ('731', 'Guachanamá', '114', null);
INSERT INTO `conf_parroquias` VALUES ('732', 'La Tingue', '114', null);
INSERT INTO `conf_parroquias` VALUES ('733', 'Lauro Guerrero', '114', null);
INSERT INTO `conf_parroquias` VALUES ('734', 'Olmedo (Santa Bárbara)', '114', null);
INSERT INTO `conf_parroquias` VALUES ('735', 'Orianga', '114', null);
INSERT INTO `conf_parroquias` VALUES ('736', 'San Antonio', '114', null);
INSERT INTO `conf_parroquias` VALUES ('737', 'Casanga', '114', null);
INSERT INTO `conf_parroquias` VALUES ('738', 'Yamana', '114', null);
INSERT INTO `conf_parroquias` VALUES ('739', 'Alamor', '115', null);
INSERT INTO `conf_parroquias` VALUES ('740', 'Ciano', '115', null);
INSERT INTO `conf_parroquias` VALUES ('741', 'El Arenal', '115', null);
INSERT INTO `conf_parroquias` VALUES ('742', 'El Limo (Mariana de Jesús)', '115', null);
INSERT INTO `conf_parroquias` VALUES ('743', 'Mercadillo', '115', null);
INSERT INTO `conf_parroquias` VALUES ('744', 'Vicentino', '115', null);
INSERT INTO `conf_parroquias` VALUES ('745', 'Saraguro', '116', null);
INSERT INTO `conf_parroquias` VALUES ('746', 'El Paraíso de Celén', '116', null);
INSERT INTO `conf_parroquias` VALUES ('747', 'El Tablón', '116', null);
INSERT INTO `conf_parroquias` VALUES ('748', 'Lluzhapa', '116', null);
INSERT INTO `conf_parroquias` VALUES ('749', 'Manú', '116', null);
INSERT INTO `conf_parroquias` VALUES ('750', 'San Antonio de Qumbe (Cumbe)', '116', null);
INSERT INTO `conf_parroquias` VALUES ('751', 'San Pablo de Tenta', '116', null);
INSERT INTO `conf_parroquias` VALUES ('752', 'San Sebastián de Yúluc', '116', null);
INSERT INTO `conf_parroquias` VALUES ('753', 'Selva Alegre', '116', null);
INSERT INTO `conf_parroquias` VALUES ('754', 'Urdaneta (Paquishapa)', '116', null);
INSERT INTO `conf_parroquias` VALUES ('755', 'Sumaypamba', '116', null);
INSERT INTO `conf_parroquias` VALUES ('756', 'Sozoranga', '117', null);
INSERT INTO `conf_parroquias` VALUES ('757', 'Nueva Fátima', '117', null);
INSERT INTO `conf_parroquias` VALUES ('758', 'Tacamoros', '117', null);
INSERT INTO `conf_parroquias` VALUES ('759', 'Zapotillo', '118', null);
INSERT INTO `conf_parroquias` VALUES ('760', 'Mangahurco (Cazaderos)', '118', null);
INSERT INTO `conf_parroquias` VALUES ('761', 'Garzareal', '118', null);
INSERT INTO `conf_parroquias` VALUES ('762', 'Limones', '118', null);
INSERT INTO `conf_parroquias` VALUES ('763', 'Paletillas', '118', null);
INSERT INTO `conf_parroquias` VALUES ('764', 'Bolaspamba', '118', null);
INSERT INTO `conf_parroquias` VALUES ('765', 'Pindal', '119', null);
INSERT INTO `conf_parroquias` VALUES ('766', 'Chaquinal', '119', null);
INSERT INTO `conf_parroquias` VALUES ('767', '12 de Diciembre (Cab.En Achiotes)', '119', null);
INSERT INTO `conf_parroquias` VALUES ('768', 'Milagros', '119', null);
INSERT INTO `conf_parroquias` VALUES ('769', 'Quilanga', '120', null);
INSERT INTO `conf_parroquias` VALUES ('770', 'Fundochamba', '120', null);
INSERT INTO `conf_parroquias` VALUES ('771', 'San Antonio de Las Aradas (Cab. En Las Aradas)', '120', null);
INSERT INTO `conf_parroquias` VALUES ('772', 'Olmedo', '121', null);
INSERT INTO `conf_parroquias` VALUES ('773', 'La Tingue', '121', null);
INSERT INTO `conf_parroquias` VALUES ('774', 'Clemente Baquerizo', '122', null);
INSERT INTO `conf_parroquias` VALUES ('775', 'Dr. Camilo Ponce', '122', null);
INSERT INTO `conf_parroquias` VALUES ('776', 'Barreiro', '122', null);
INSERT INTO `conf_parroquias` VALUES ('777', 'El Salto', '122', null);
INSERT INTO `conf_parroquias` VALUES ('778', 'Babahoyo', '122', null);
INSERT INTO `conf_parroquias` VALUES ('779', 'Barreiro (Santa Rita)', '122', null);
INSERT INTO `conf_parroquias` VALUES ('780', 'Caracol', '122', null);
INSERT INTO `conf_parroquias` VALUES ('781', 'Febres Cordero (Las Juntas)', '122', null);
INSERT INTO `conf_parroquias` VALUES ('782', 'Pimocha', '122', null);
INSERT INTO `conf_parroquias` VALUES ('783', 'La Unión', '122', null);
INSERT INTO `conf_parroquias` VALUES ('784', 'Baba', '123', null);
INSERT INTO `conf_parroquias` VALUES ('785', 'Guare', '123', null);
INSERT INTO `conf_parroquias` VALUES ('786', 'Isla de Bejucal', '123', null);
INSERT INTO `conf_parroquias` VALUES ('787', 'Montalvo', '124', null);
INSERT INTO `conf_parroquias` VALUES ('788', 'Puebloviejo', '125', null);
INSERT INTO `conf_parroquias` VALUES ('789', 'Puerto Pechiche', '125', null);
INSERT INTO `conf_parroquias` VALUES ('790', 'San Juan', '125', null);
INSERT INTO `conf_parroquias` VALUES ('791', 'Quevedo', '126', null);
INSERT INTO `conf_parroquias` VALUES ('792', 'San Camilo', '126', null);
INSERT INTO `conf_parroquias` VALUES ('793', 'San José', '126', null);
INSERT INTO `conf_parroquias` VALUES ('794', 'Guayacán', '126', null);
INSERT INTO `conf_parroquias` VALUES ('795', 'Nicolás Infante Díaz', '126', null);
INSERT INTO `conf_parroquias` VALUES ('796', 'San Cristóbal', '126', null);
INSERT INTO `conf_parroquias` VALUES ('797', 'Siete de Octubre', '126', null);
INSERT INTO `conf_parroquias` VALUES ('798', '24 de Mayo', '126', null);
INSERT INTO `conf_parroquias` VALUES ('799', 'Venus del Río Quevedo', '126', null);
INSERT INTO `conf_parroquias` VALUES ('800', 'Viva Alfaro', '126', null);
INSERT INTO `conf_parroquias` VALUES ('801', 'Quevedo', '126', null);
INSERT INTO `conf_parroquias` VALUES ('802', 'Buena Fé', '126', null);
INSERT INTO `conf_parroquias` VALUES ('803', 'Mocache', '126', null);
INSERT INTO `conf_parroquias` VALUES ('804', 'San Carlos', '126', null);
INSERT INTO `conf_parroquias` VALUES ('805', 'Valencia', '126', null);
INSERT INTO `conf_parroquias` VALUES ('806', 'La Esperanza', '126', null);
INSERT INTO `conf_parroquias` VALUES ('807', 'Catarama', '127', null);
INSERT INTO `conf_parroquias` VALUES ('808', 'Ricaurte', '127', null);
INSERT INTO `conf_parroquias` VALUES ('809', '10 de Noviembre', '128', null);
INSERT INTO `conf_parroquias` VALUES ('810', 'Ventanas', '128', null);
INSERT INTO `conf_parroquias` VALUES ('811', 'Quinsaloma', '128', null);
INSERT INTO `conf_parroquias` VALUES ('812', 'Zapotal', '128', null);
INSERT INTO `conf_parroquias` VALUES ('813', 'Chacarita', '128', null);
INSERT INTO `conf_parroquias` VALUES ('814', 'Los Ángeles', '128', null);
INSERT INTO `conf_parroquias` VALUES ('815', 'Vinces', '129', null);
INSERT INTO `conf_parroquias` VALUES ('816', 'Antonio Sotomayor (Cab. En Playas de Vinces)', '129', null);
INSERT INTO `conf_parroquias` VALUES ('817', 'Palenque', '129', null);
INSERT INTO `conf_parroquias` VALUES ('818', 'Palenque', '130', null);
INSERT INTO `conf_parroquias` VALUES ('819', 'San Jacinto de Buena Fé', '131', null);
INSERT INTO `conf_parroquias` VALUES ('820', '7 de Agosto', '131', null);
INSERT INTO `conf_parroquias` VALUES ('821', '11 de Octubre', '131', null);
INSERT INTO `conf_parroquias` VALUES ('822', 'San Jacinto de Buena Fé', '131', null);
INSERT INTO `conf_parroquias` VALUES ('823', 'Patricia Pilar', '131', null);
INSERT INTO `conf_parroquias` VALUES ('824', 'Valencia', '132', null);
INSERT INTO `conf_parroquias` VALUES ('825', 'Mocache', '133', null);
INSERT INTO `conf_parroquias` VALUES ('826', 'Quinsaloma', '134', null);
INSERT INTO `conf_parroquias` VALUES ('827', 'Portoviejo', '135', null);
INSERT INTO `conf_parroquias` VALUES ('828', '12 de Marzo', '135', null);
INSERT INTO `conf_parroquias` VALUES ('829', 'Colón', '135', null);
INSERT INTO `conf_parroquias` VALUES ('830', 'Picoazá', '135', null);
INSERT INTO `conf_parroquias` VALUES ('831', 'San Pablo', '135', null);
INSERT INTO `conf_parroquias` VALUES ('832', 'Andrés de Vera', '135', null);
INSERT INTO `conf_parroquias` VALUES ('833', 'Francisco Pacheco', '135', null);
INSERT INTO `conf_parroquias` VALUES ('834', '18 de Octubre', '135', null);
INSERT INTO `conf_parroquias` VALUES ('835', 'Simón Bolívar', '135', null);
INSERT INTO `conf_parroquias` VALUES ('836', 'Portoviejo', '135', null);
INSERT INTO `conf_parroquias` VALUES ('837', 'Abdón Calderón (San Francisco)', '135', null);
INSERT INTO `conf_parroquias` VALUES ('838', 'Alhajuela (Bajo Grande)', '135', null);
INSERT INTO `conf_parroquias` VALUES ('839', 'Crucita', '135', null);
INSERT INTO `conf_parroquias` VALUES ('840', 'Pueblo Nuevo', '135', null);
INSERT INTO `conf_parroquias` VALUES ('841', 'Riochico (Río Chico)', '135', null);
INSERT INTO `conf_parroquias` VALUES ('842', 'San Plácido', '135', null);
INSERT INTO `conf_parroquias` VALUES ('843', 'Chirijos', '135', null);
INSERT INTO `conf_parroquias` VALUES ('844', 'Calceta', '136', null);
INSERT INTO `conf_parroquias` VALUES ('845', 'Membrillo', '136', null);
INSERT INTO `conf_parroquias` VALUES ('846', 'Quiroga', '136', null);
INSERT INTO `conf_parroquias` VALUES ('847', 'Chone', '137', null);
INSERT INTO `conf_parroquias` VALUES ('848', 'Santa Rita', '137', null);
INSERT INTO `conf_parroquias` VALUES ('849', 'Chone', '137', null);
INSERT INTO `conf_parroquias` VALUES ('850', 'Boyacá', '137', null);
INSERT INTO `conf_parroquias` VALUES ('851', 'Canuto', '137', null);
INSERT INTO `conf_parroquias` VALUES ('852', 'Convento', '137', null);
INSERT INTO `conf_parroquias` VALUES ('853', 'Chibunga', '137', null);
INSERT INTO `conf_parroquias` VALUES ('854', 'Eloy Alfaro', '137', null);
INSERT INTO `conf_parroquias` VALUES ('855', 'Ricaurte', '137', null);
INSERT INTO `conf_parroquias` VALUES ('856', 'San Antonio', '137', null);
INSERT INTO `conf_parroquias` VALUES ('857', 'El Carmen', '138', null);
INSERT INTO `conf_parroquias` VALUES ('858', '4 de Diciembre', '138', null);
INSERT INTO `conf_parroquias` VALUES ('859', 'El Carmen', '138', null);
INSERT INTO `conf_parroquias` VALUES ('860', 'Wilfrido Loor Moreira (Maicito)', '138', null);
INSERT INTO `conf_parroquias` VALUES ('861', 'San Pedro de Suma', '138', null);
INSERT INTO `conf_parroquias` VALUES ('862', 'Flavio Alfaro', '139', null);
INSERT INTO `conf_parroquias` VALUES ('863', 'San Francisco de Novillo (Cab. En', '139', null);
INSERT INTO `conf_parroquias` VALUES ('864', 'Zapallo', '139', null);
INSERT INTO `conf_parroquias` VALUES ('865', 'Dr. Miguel Morán Lucio', '140', null);
INSERT INTO `conf_parroquias` VALUES ('866', 'Manuel Inocencio Parrales Y Guale', '140', null);
INSERT INTO `conf_parroquias` VALUES ('867', 'San Lorenzo de Jipijapa', '140', null);
INSERT INTO `conf_parroquias` VALUES ('868', 'Jipijapa', '140', null);
INSERT INTO `conf_parroquias` VALUES ('869', 'América', '140', null);
INSERT INTO `conf_parroquias` VALUES ('870', 'El Anegado (Cab. En Eloy Alfaro)', '140', null);
INSERT INTO `conf_parroquias` VALUES ('871', 'Julcuy', '140', null);
INSERT INTO `conf_parroquias` VALUES ('872', 'La Unión', '140', null);
INSERT INTO `conf_parroquias` VALUES ('873', 'Machalilla', '140', null);
INSERT INTO `conf_parroquias` VALUES ('874', 'Membrillal', '140', null);
INSERT INTO `conf_parroquias` VALUES ('875', 'Pedro Pablo Gómez', '140', null);
INSERT INTO `conf_parroquias` VALUES ('876', 'Puerto de Cayo', '140', null);
INSERT INTO `conf_parroquias` VALUES ('877', 'Puerto López', '140', null);
INSERT INTO `conf_parroquias` VALUES ('878', 'Junín', '141', null);
INSERT INTO `conf_parroquias` VALUES ('879', 'Los Esteros', '142', null);
INSERT INTO `conf_parroquias` VALUES ('880', 'Manta', '142', null);
INSERT INTO `conf_parroquias` VALUES ('881', 'San Mateo', '142', null);
INSERT INTO `conf_parroquias` VALUES ('882', 'Tarqui', '142', null);
INSERT INTO `conf_parroquias` VALUES ('883', 'Eloy Alfaro', '142', null);
INSERT INTO `conf_parroquias` VALUES ('884', 'Manta', '142', null);
INSERT INTO `conf_parroquias` VALUES ('885', 'San Lorenzo', '142', null);
INSERT INTO `conf_parroquias` VALUES ('886', 'Santa Marianita (Boca de Pacoche)', '142', null);
INSERT INTO `conf_parroquias` VALUES ('887', 'Anibal San Andrés', '143', null);
INSERT INTO `conf_parroquias` VALUES ('888', 'Montecristi', '143', null);
INSERT INTO `conf_parroquias` VALUES ('889', 'El Colorado', '143', null);
INSERT INTO `conf_parroquias` VALUES ('890', 'General Eloy Alfaro', '143', null);
INSERT INTO `conf_parroquias` VALUES ('891', 'Leonidas Proaño', '143', null);
INSERT INTO `conf_parroquias` VALUES ('892', 'Montecristi', '143', null);
INSERT INTO `conf_parroquias` VALUES ('893', 'Jaramijó', '143', null);
INSERT INTO `conf_parroquias` VALUES ('894', 'La Pila', '143', null);
INSERT INTO `conf_parroquias` VALUES ('895', 'Paján', '144', null);
INSERT INTO `conf_parroquias` VALUES ('896', 'Campozano (La Palma de Paján)', '144', null);
INSERT INTO `conf_parroquias` VALUES ('897', 'Cascol', '144', null);
INSERT INTO `conf_parroquias` VALUES ('898', 'Guale', '144', null);
INSERT INTO `conf_parroquias` VALUES ('899', 'Lascano', '144', null);
INSERT INTO `conf_parroquias` VALUES ('900', 'Pichincha', '145', null);
INSERT INTO `conf_parroquias` VALUES ('901', 'Barraganete', '145', null);
INSERT INTO `conf_parroquias` VALUES ('902', 'San Sebastián', '145', null);
INSERT INTO `conf_parroquias` VALUES ('903', 'Rocafuerte', '146', null);
INSERT INTO `conf_parroquias` VALUES ('904', 'Santa Ana', '147', null);
INSERT INTO `conf_parroquias` VALUES ('905', 'Lodana', '147', null);
INSERT INTO `conf_parroquias` VALUES ('906', 'Santa Ana de Vuelta Larga', '147', null);
INSERT INTO `conf_parroquias` VALUES ('907', 'Ayacucho', '147', null);
INSERT INTO `conf_parroquias` VALUES ('908', 'Honorato Vásquez (Cab. En Vásquez)', '147', null);
INSERT INTO `conf_parroquias` VALUES ('909', 'La Unión', '147', null);
INSERT INTO `conf_parroquias` VALUES ('910', 'Olmedo', '147', null);
INSERT INTO `conf_parroquias` VALUES ('911', 'San Pablo (Cab. En Pueblo Nuevo)', '147', null);
INSERT INTO `conf_parroquias` VALUES ('912', 'Bahía de Caráquez', '148', null);
INSERT INTO `conf_parroquias` VALUES ('913', 'Leonidas Plaza Gutiérrez', '148', null);
INSERT INTO `conf_parroquias` VALUES ('914', 'Bahía de Caráquez', '148', null);
INSERT INTO `conf_parroquias` VALUES ('915', 'Canoa', '148', null);
INSERT INTO `conf_parroquias` VALUES ('916', 'Cojimíes', '148', null);
INSERT INTO `conf_parroquias` VALUES ('917', 'Charapotó', '148', null);
INSERT INTO `conf_parroquias` VALUES ('918', '10 de Agosto', '148', null);
INSERT INTO `conf_parroquias` VALUES ('919', 'Jama', '148', null);
INSERT INTO `conf_parroquias` VALUES ('920', 'Pedernales', '148', null);
INSERT INTO `conf_parroquias` VALUES ('921', 'San Isidro', '148', null);
INSERT INTO `conf_parroquias` VALUES ('922', 'San Vicente', '148', null);
INSERT INTO `conf_parroquias` VALUES ('923', 'Tosagua', '149', null);
INSERT INTO `conf_parroquias` VALUES ('924', 'Bachillero', '149', null);
INSERT INTO `conf_parroquias` VALUES ('925', 'Angel Pedro Giler (La Estancilla)', '149', null);
INSERT INTO `conf_parroquias` VALUES ('926', 'Sucre', '150', null);
INSERT INTO `conf_parroquias` VALUES ('927', 'Bellavista', '150', null);
INSERT INTO `conf_parroquias` VALUES ('928', 'Noboa', '150', null);
INSERT INTO `conf_parroquias` VALUES ('929', 'Arq. Sixto Durán Ballén', '150', null);
INSERT INTO `conf_parroquias` VALUES ('930', 'Pedernales', '151', null);
INSERT INTO `conf_parroquias` VALUES ('931', 'Cojimíes', '151', null);
INSERT INTO `conf_parroquias` VALUES ('932', '10 de Agosto', '151', null);
INSERT INTO `conf_parroquias` VALUES ('933', 'Atahualpa', '151', null);
INSERT INTO `conf_parroquias` VALUES ('934', 'Olmedo', '152', null);
INSERT INTO `conf_parroquias` VALUES ('935', 'Puerto López', '153', null);
INSERT INTO `conf_parroquias` VALUES ('936', 'Machalilla', '153', null);
INSERT INTO `conf_parroquias` VALUES ('937', 'Salango', '153', null);
INSERT INTO `conf_parroquias` VALUES ('938', 'Jama', '154', null);
INSERT INTO `conf_parroquias` VALUES ('939', 'Jaramijó', '155', null);
INSERT INTO `conf_parroquias` VALUES ('940', 'San Vicente', '156', null);
INSERT INTO `conf_parroquias` VALUES ('941', 'Canoa', '156', null);
INSERT INTO `conf_parroquias` VALUES ('942', 'Macas', '157', null);
INSERT INTO `conf_parroquias` VALUES ('943', 'Alshi (Cab. En 9 de Octubre)', '157', null);
INSERT INTO `conf_parroquias` VALUES ('944', 'Chiguaza', '157', null);
INSERT INTO `conf_parroquias` VALUES ('945', 'General Proaño', '157', null);
INSERT INTO `conf_parroquias` VALUES ('946', 'Huasaga (Cab.En Wampuik)', '157', null);
INSERT INTO `conf_parroquias` VALUES ('947', 'Macuma', '157', null);
INSERT INTO `conf_parroquias` VALUES ('948', 'San Isidro', '157', null);
INSERT INTO `conf_parroquias` VALUES ('949', 'Sevilla Don Bosco', '157', null);
INSERT INTO `conf_parroquias` VALUES ('950', 'Sinaí', '157', null);
INSERT INTO `conf_parroquias` VALUES ('951', 'Taisha', '157', null);
INSERT INTO `conf_parroquias` VALUES ('952', 'Zuña (Zúñac)', '157', null);
INSERT INTO `conf_parroquias` VALUES ('953', 'Tuutinentza', '157', null);
INSERT INTO `conf_parroquias` VALUES ('954', 'Cuchaentza', '157', null);
INSERT INTO `conf_parroquias` VALUES ('955', 'San José de Morona', '157', null);
INSERT INTO `conf_parroquias` VALUES ('956', 'Río Blanco', '157', null);
INSERT INTO `conf_parroquias` VALUES ('957', 'Gualaquiza', '158', null);
INSERT INTO `conf_parroquias` VALUES ('958', 'Mercedes Molina', '158', null);
INSERT INTO `conf_parroquias` VALUES ('959', 'Gualaquiza', '158', null);
INSERT INTO `conf_parroquias` VALUES ('960', 'Amazonas (Rosario de Cuyes)', '158', null);
INSERT INTO `conf_parroquias` VALUES ('961', 'Bermejos', '158', null);
INSERT INTO `conf_parroquias` VALUES ('962', 'Bomboiza', '158', null);
INSERT INTO `conf_parroquias` VALUES ('963', 'Chigüinda', '158', null);
INSERT INTO `conf_parroquias` VALUES ('964', 'El Rosario', '158', null);
INSERT INTO `conf_parroquias` VALUES ('965', 'Nueva Tarqui', '158', null);
INSERT INTO `conf_parroquias` VALUES ('966', 'San Miguel de Cuyes', '158', null);
INSERT INTO `conf_parroquias` VALUES ('967', 'El Ideal', '158', null);
INSERT INTO `conf_parroquias` VALUES ('968', 'General Leonidas Plaza Gutiérrez (Limón)', '159', null);
INSERT INTO `conf_parroquias` VALUES ('969', 'Indanza', '159', null);
INSERT INTO `conf_parroquias` VALUES ('970', 'Pan de Azúcar', '159', null);
INSERT INTO `conf_parroquias` VALUES ('971', 'San Antonio (Cab. En San Antonio Centro', '159', null);
INSERT INTO `conf_parroquias` VALUES ('972', 'San Carlos de Limón (San Carlos del', '159', null);
INSERT INTO `conf_parroquias` VALUES ('973', 'San Juan Bosco', '159', null);
INSERT INTO `conf_parroquias` VALUES ('974', 'San Miguel de Conchay', '159', null);
INSERT INTO `conf_parroquias` VALUES ('975', 'Santa Susana de Chiviaza (Cab. En Chiviaza)', '159', null);
INSERT INTO `conf_parroquias` VALUES ('976', 'Yunganza (Cab. En El Rosario)', '159', null);
INSERT INTO `conf_parroquias` VALUES ('977', 'Palora (Metzera)', '160', null);
INSERT INTO `conf_parroquias` VALUES ('978', 'Arapicos', '160', null);
INSERT INTO `conf_parroquias` VALUES ('979', 'Cumandá (Cab. En Colonia Agrícola Sevilla del Oro)', '160', null);
INSERT INTO `conf_parroquias` VALUES ('980', 'Huamboya', '160', null);
INSERT INTO `conf_parroquias` VALUES ('981', 'Sangay (Cab. En Nayamanaca)', '160', null);
INSERT INTO `conf_parroquias` VALUES ('982', 'Santiago de Méndez', '161', null);
INSERT INTO `conf_parroquias` VALUES ('983', 'Copal', '161', null);
INSERT INTO `conf_parroquias` VALUES ('984', 'Chupianza', '161', null);
INSERT INTO `conf_parroquias` VALUES ('985', 'Patuca', '161', null);
INSERT INTO `conf_parroquias` VALUES ('986', 'San Luis de El Acho (Cab. En El Acho)', '161', null);
INSERT INTO `conf_parroquias` VALUES ('987', 'Santiago', '161', null);
INSERT INTO `conf_parroquias` VALUES ('988', 'Tayuza', '161', null);
INSERT INTO `conf_parroquias` VALUES ('989', 'San Francisco de Chinimbimi', '161', null);
INSERT INTO `conf_parroquias` VALUES ('990', 'Sucúa', '162', null);
INSERT INTO `conf_parroquias` VALUES ('991', 'Asunción', '162', null);
INSERT INTO `conf_parroquias` VALUES ('992', 'Huambi', '162', null);
INSERT INTO `conf_parroquias` VALUES ('993', 'Logroño', '162', null);
INSERT INTO `conf_parroquias` VALUES ('994', 'Yaupi', '162', null);
INSERT INTO `conf_parroquias` VALUES ('995', 'Santa Marianita de Jesús', '162', null);
INSERT INTO `conf_parroquias` VALUES ('996', 'Huamboya', '163', null);
INSERT INTO `conf_parroquias` VALUES ('997', 'Chiguaza', '163', null);
INSERT INTO `conf_parroquias` VALUES ('998', 'Pablo Sexto', '163', null);
INSERT INTO `conf_parroquias` VALUES ('999', 'San Juan Bosco', '164', null);
INSERT INTO `conf_parroquias` VALUES ('1000', 'Pan de Azúcar', '164', null);
INSERT INTO `conf_parroquias` VALUES ('1001', 'San Carlos de Limón', '164', null);
INSERT INTO `conf_parroquias` VALUES ('1002', 'San Jacinto de Wakambeis', '164', null);
INSERT INTO `conf_parroquias` VALUES ('1003', 'Santiago de Pananza', '164', null);
INSERT INTO `conf_parroquias` VALUES ('1004', 'Taisha', '165', null);
INSERT INTO `conf_parroquias` VALUES ('1005', 'Huasaga (Cab. En Wampuik)', '165', null);
INSERT INTO `conf_parroquias` VALUES ('1006', 'Macuma', '165', null);
INSERT INTO `conf_parroquias` VALUES ('1007', 'Tuutinentza', '165', null);
INSERT INTO `conf_parroquias` VALUES ('1008', 'Pumpuentsa', '165', null);
INSERT INTO `conf_parroquias` VALUES ('1009', 'Logroño', '166', null);
INSERT INTO `conf_parroquias` VALUES ('1010', 'Yaupi', '166', null);
INSERT INTO `conf_parroquias` VALUES ('1011', 'Shimpis', '166', null);
INSERT INTO `conf_parroquias` VALUES ('1012', 'Pablo Sexto', '167', null);
INSERT INTO `conf_parroquias` VALUES ('1013', 'Santiago', '168', null);
INSERT INTO `conf_parroquias` VALUES ('1014', 'San José de Morona', '168', null);
INSERT INTO `conf_parroquias` VALUES ('1015', 'Tena', '169', null);
INSERT INTO `conf_parroquias` VALUES ('1016', 'Ahuano', '169', null);
INSERT INTO `conf_parroquias` VALUES ('1017', 'Carlos Julio Arosemena Tola (Zatza-Yacu)', '169', null);
INSERT INTO `conf_parroquias` VALUES ('1018', 'Chontapunta', '169', null);
INSERT INTO `conf_parroquias` VALUES ('1019', 'Pano', '169', null);
INSERT INTO `conf_parroquias` VALUES ('1020', 'Puerto Misahualli', '169', null);
INSERT INTO `conf_parroquias` VALUES ('1021', 'Puerto Napo', '169', null);
INSERT INTO `conf_parroquias` VALUES ('1022', 'Tálag', '169', null);
INSERT INTO `conf_parroquias` VALUES ('1023', 'San Juan de Muyuna', '169', null);
INSERT INTO `conf_parroquias` VALUES ('1024', 'Archidona', '170', null);
INSERT INTO `conf_parroquias` VALUES ('1025', 'Avila', '170', null);
INSERT INTO `conf_parroquias` VALUES ('1026', 'Cotundo', '170', null);
INSERT INTO `conf_parroquias` VALUES ('1027', 'Loreto', '170', null);
INSERT INTO `conf_parroquias` VALUES ('1028', 'San Pablo de Ushpayacu', '170', null);
INSERT INTO `conf_parroquias` VALUES ('1029', 'Puerto Murialdo', '170', null);
INSERT INTO `conf_parroquias` VALUES ('1030', 'El Chaco', '171', null);
INSERT INTO `conf_parroquias` VALUES ('1031', 'Gonzalo Díaz de Pineda (El Bombón)', '171', null);
INSERT INTO `conf_parroquias` VALUES ('1032', 'Linares', '171', null);
INSERT INTO `conf_parroquias` VALUES ('1033', 'Oyacachi', '171', null);
INSERT INTO `conf_parroquias` VALUES ('1034', 'Santa Rosa', '171', null);
INSERT INTO `conf_parroquias` VALUES ('1035', 'Sardinas', '171', null);
INSERT INTO `conf_parroquias` VALUES ('1036', 'Baeza', '172', null);
INSERT INTO `conf_parroquias` VALUES ('1037', 'Cosanga', '172', null);
INSERT INTO `conf_parroquias` VALUES ('1038', 'Cuyuja', '172', null);
INSERT INTO `conf_parroquias` VALUES ('1039', 'Papallacta', '172', null);
INSERT INTO `conf_parroquias` VALUES ('1040', 'San Francisco de Borja (Virgilio Dávila)', '172', null);
INSERT INTO `conf_parroquias` VALUES ('1041', 'San José del Payamino', '172', null);
INSERT INTO `conf_parroquias` VALUES ('1042', 'Sumaco', '172', null);
INSERT INTO `conf_parroquias` VALUES ('1043', 'Carlos Julio Arosemena Tola', '173', null);
INSERT INTO `conf_parroquias` VALUES ('1044', 'Puyo', '174', null);
INSERT INTO `conf_parroquias` VALUES ('1045', 'Arajuno', '174', null);
INSERT INTO `conf_parroquias` VALUES ('1046', 'Canelos', '174', null);
INSERT INTO `conf_parroquias` VALUES ('1047', 'Curaray', '174', null);
INSERT INTO `conf_parroquias` VALUES ('1048', 'Diez de Agosto', '174', null);
INSERT INTO `conf_parroquias` VALUES ('1049', 'Fátima', '174', null);
INSERT INTO `conf_parroquias` VALUES ('1050', 'Montalvo (Andoas)', '174', null);
INSERT INTO `conf_parroquias` VALUES ('1051', 'Pomona', '174', null);
INSERT INTO `conf_parroquias` VALUES ('1052', 'Río Corrientes', '174', null);
INSERT INTO `conf_parroquias` VALUES ('1053', 'Río Tigre', '174', null);
INSERT INTO `conf_parroquias` VALUES ('1054', 'Santa Clara', '174', null);
INSERT INTO `conf_parroquias` VALUES ('1055', 'Sarayacu', '174', null);
INSERT INTO `conf_parroquias` VALUES ('1056', 'Simón Bolívar (Cab. En Mushullacta)', '174', null);
INSERT INTO `conf_parroquias` VALUES ('1057', 'Tarqui', '174', null);
INSERT INTO `conf_parroquias` VALUES ('1058', 'Teniente Hugo Ortiz', '174', null);
INSERT INTO `conf_parroquias` VALUES ('1059', 'Veracruz (Indillama) (Cab. En Indillama)', '174', null);
INSERT INTO `conf_parroquias` VALUES ('1060', 'El Triunfo', '174', null);
INSERT INTO `conf_parroquias` VALUES ('1061', 'Mera', '175', null);
INSERT INTO `conf_parroquias` VALUES ('1062', 'Madre Tierra', '175', null);
INSERT INTO `conf_parroquias` VALUES ('1063', 'Shell', '175', null);
INSERT INTO `conf_parroquias` VALUES ('1064', 'Santa Clara', '176', null);
INSERT INTO `conf_parroquias` VALUES ('1065', 'San José', '176', null);
INSERT INTO `conf_parroquias` VALUES ('1066', 'Arajuno', '177', null);
INSERT INTO `conf_parroquias` VALUES ('1067', 'Curaray', '177', null);
INSERT INTO `conf_parroquias` VALUES ('1068', 'Belisario Quevedo', '178', null);
INSERT INTO `conf_parroquias` VALUES ('1069', 'Carcelén', '178', null);
INSERT INTO `conf_parroquias` VALUES ('1070', 'Centro Histórico', '178', null);
INSERT INTO `conf_parroquias` VALUES ('1071', 'Cochapamba', '178', null);
INSERT INTO `conf_parroquias` VALUES ('1072', 'Comité del Pueblo', '178', null);
INSERT INTO `conf_parroquias` VALUES ('1073', 'Cotocollao', '178', null);
INSERT INTO `conf_parroquias` VALUES ('1074', 'Chilibulo', '178', null);
INSERT INTO `conf_parroquias` VALUES ('1075', 'Chillogallo', '178', null);
INSERT INTO `conf_parroquias` VALUES ('1076', 'Chimbacalle', '178', null);
INSERT INTO `conf_parroquias` VALUES ('1077', 'El Condado', '178', null);
INSERT INTO `conf_parroquias` VALUES ('1078', 'Guamaní', '178', null);
INSERT INTO `conf_parroquias` VALUES ('1079', 'Iñaquito', '178', null);
INSERT INTO `conf_parroquias` VALUES ('1080', 'Itchimbía', '178', null);
INSERT INTO `conf_parroquias` VALUES ('1081', 'Jipijapa', '178', null);
INSERT INTO `conf_parroquias` VALUES ('1082', 'Kennedy', '178', null);
INSERT INTO `conf_parroquias` VALUES ('1083', 'La Argelia', '178', null);
INSERT INTO `conf_parroquias` VALUES ('1084', 'La Concepción', '178', null);
INSERT INTO `conf_parroquias` VALUES ('1085', 'La Ecuatoriana', '178', null);
INSERT INTO `conf_parroquias` VALUES ('1086', 'La Ferroviaria', '178', null);
INSERT INTO `conf_parroquias` VALUES ('1087', 'La Libertad', '178', null);
INSERT INTO `conf_parroquias` VALUES ('1088', 'La Magdalena', '178', null);
INSERT INTO `conf_parroquias` VALUES ('1089', 'La Mena', '178', null);
INSERT INTO `conf_parroquias` VALUES ('1090', 'Mariscal Sucre', '178', null);
INSERT INTO `conf_parroquias` VALUES ('1091', 'Ponceano', '178', null);
INSERT INTO `conf_parroquias` VALUES ('1092', 'Puengasí', '178', null);
INSERT INTO `conf_parroquias` VALUES ('1093', 'Quitumbe', '178', null);
INSERT INTO `conf_parroquias` VALUES ('1094', 'Rumipamba', '178', null);
INSERT INTO `conf_parroquias` VALUES ('1095', 'San Bartolo', '178', null);
INSERT INTO `conf_parroquias` VALUES ('1096', 'San Isidro del Inca', '178', null);
INSERT INTO `conf_parroquias` VALUES ('1097', 'San Juan', '178', null);
INSERT INTO `conf_parroquias` VALUES ('1098', 'Solanda', '178', null);
INSERT INTO `conf_parroquias` VALUES ('1099', 'Turubamba', '178', null);
INSERT INTO `conf_parroquias` VALUES ('1100', 'Quito Distrito Metropolitano', '178', null);
INSERT INTO `conf_parroquias` VALUES ('1101', 'Alangasí', '178', null);
INSERT INTO `conf_parroquias` VALUES ('1102', 'Amaguaña', '178', null);
INSERT INTO `conf_parroquias` VALUES ('1103', 'Atahualpa', '178', null);
INSERT INTO `conf_parroquias` VALUES ('1104', 'Calacalí', '178', null);
INSERT INTO `conf_parroquias` VALUES ('1105', 'Calderón', '178', null);
INSERT INTO `conf_parroquias` VALUES ('1106', 'Conocoto', '178', null);
INSERT INTO `conf_parroquias` VALUES ('1107', 'Cumbayá', '178', null);
INSERT INTO `conf_parroquias` VALUES ('1108', 'Chavezpamba', '178', null);
INSERT INTO `conf_parroquias` VALUES ('1109', 'Checa', '178', null);
INSERT INTO `conf_parroquias` VALUES ('1110', 'El Quinche', '178', null);
INSERT INTO `conf_parroquias` VALUES ('1111', 'Gualea', '178', null);
INSERT INTO `conf_parroquias` VALUES ('1112', 'Guangopolo', '178', null);
INSERT INTO `conf_parroquias` VALUES ('1113', 'Guayllabamba', '178', null);
INSERT INTO `conf_parroquias` VALUES ('1114', 'La Merced', '178', null);
INSERT INTO `conf_parroquias` VALUES ('1115', 'Llano Chico', '178', null);
INSERT INTO `conf_parroquias` VALUES ('1116', 'Lloa', '178', null);
INSERT INTO `conf_parroquias` VALUES ('1117', 'Mindo', '178', null);
INSERT INTO `conf_parroquias` VALUES ('1118', 'Nanegal', '178', null);
INSERT INTO `conf_parroquias` VALUES ('1119', 'Nanegalito', '178', null);
INSERT INTO `conf_parroquias` VALUES ('1120', 'Nayón', '178', null);
INSERT INTO `conf_parroquias` VALUES ('1121', 'Nono', '178', null);
INSERT INTO `conf_parroquias` VALUES ('1122', 'Pacto', '178', null);
INSERT INTO `conf_parroquias` VALUES ('1123', 'Pedro Vicente Maldonado', '178', null);
INSERT INTO `conf_parroquias` VALUES ('1124', 'Perucho', '178', null);
INSERT INTO `conf_parroquias` VALUES ('1125', 'Pifo', '178', null);
INSERT INTO `conf_parroquias` VALUES ('1126', 'Píntag', '178', null);
INSERT INTO `conf_parroquias` VALUES ('1127', 'Pomasqui', '178', null);
INSERT INTO `conf_parroquias` VALUES ('1128', 'Puéllaro', '178', null);
INSERT INTO `conf_parroquias` VALUES ('1129', 'Puembo', '178', null);
INSERT INTO `conf_parroquias` VALUES ('1130', 'San Antonio', '178', null);
INSERT INTO `conf_parroquias` VALUES ('1131', 'San José de Minas', '178', null);
INSERT INTO `conf_parroquias` VALUES ('1132', 'San Miguel de Los Bancos', '178', null);
INSERT INTO `conf_parroquias` VALUES ('1133', 'Tababela', '178', null);
INSERT INTO `conf_parroquias` VALUES ('1134', 'Tumbaco', '178', null);
INSERT INTO `conf_parroquias` VALUES ('1135', 'Yaruquí', '178', null);
INSERT INTO `conf_parroquias` VALUES ('1136', 'Zambiza', '178', null);
INSERT INTO `conf_parroquias` VALUES ('1137', 'Puerto Quito', '178', null);
INSERT INTO `conf_parroquias` VALUES ('1138', 'Ayora', '179', null);
INSERT INTO `conf_parroquias` VALUES ('1139', 'Cayambe', '179', null);
INSERT INTO `conf_parroquias` VALUES ('1140', 'Juan Montalvo', '179', null);
INSERT INTO `conf_parroquias` VALUES ('1141', 'Cayambe', '179', null);
INSERT INTO `conf_parroquias` VALUES ('1142', 'Ascázubi', '179', null);
INSERT INTO `conf_parroquias` VALUES ('1143', 'Cangahua', '179', null);
INSERT INTO `conf_parroquias` VALUES ('1144', 'Olmedo (Pesillo)', '179', null);
INSERT INTO `conf_parroquias` VALUES ('1145', 'Otón', '179', null);
INSERT INTO `conf_parroquias` VALUES ('1146', 'Santa Rosa de Cuzubamba', '179', null);
INSERT INTO `conf_parroquias` VALUES ('1147', 'Machachi', '180', null);
INSERT INTO `conf_parroquias` VALUES ('1148', 'Alóag', '180', null);
INSERT INTO `conf_parroquias` VALUES ('1149', 'Aloasí', '180', null);
INSERT INTO `conf_parroquias` VALUES ('1150', 'Cutuglahua', '180', null);
INSERT INTO `conf_parroquias` VALUES ('1151', 'El Chaupi', '180', null);
INSERT INTO `conf_parroquias` VALUES ('1152', 'Manuel Cornejo Astorga (Tandapi)', '180', null);
INSERT INTO `conf_parroquias` VALUES ('1153', 'Tambillo', '180', null);
INSERT INTO `conf_parroquias` VALUES ('1154', 'Uyumbicho', '180', null);
INSERT INTO `conf_parroquias` VALUES ('1155', 'Tabacundo', '181', null);
INSERT INTO `conf_parroquias` VALUES ('1156', 'La Esperanza', '181', null);
INSERT INTO `conf_parroquias` VALUES ('1157', 'Malchinguí', '181', null);
INSERT INTO `conf_parroquias` VALUES ('1158', 'Tocachi', '181', null);
INSERT INTO `conf_parroquias` VALUES ('1159', 'Tupigachi', '181', null);
INSERT INTO `conf_parroquias` VALUES ('1160', 'Sangolquí', '182', null);
INSERT INTO `conf_parroquias` VALUES ('1161', 'San Pedro de Taboada', '182', null);
INSERT INTO `conf_parroquias` VALUES ('1162', 'San Rafael', '182', null);
INSERT INTO `conf_parroquias` VALUES ('1163', 'Sangolqui', '182', null);
INSERT INTO `conf_parroquias` VALUES ('1164', 'Cotogchoa', '182', null);
INSERT INTO `conf_parroquias` VALUES ('1165', 'Rumipamba', '182', null);
INSERT INTO `conf_parroquias` VALUES ('1166', 'San Miguel de Los Bancos', '183', null);
INSERT INTO `conf_parroquias` VALUES ('1167', 'Mindo', '183', null);
INSERT INTO `conf_parroquias` VALUES ('1168', 'Pedro Vicente Maldonado', '183', null);
INSERT INTO `conf_parroquias` VALUES ('1169', 'Puerto Quito', '183', null);
INSERT INTO `conf_parroquias` VALUES ('1170', 'Pedro Vicente Maldonado', '184', null);
INSERT INTO `conf_parroquias` VALUES ('1171', 'Puerto Quito', '185', null);
INSERT INTO `conf_parroquias` VALUES ('1172', 'Atocha – Ficoa', '186', null);
INSERT INTO `conf_parroquias` VALUES ('1173', 'Celiano Monge', '186', null);
INSERT INTO `conf_parroquias` VALUES ('1174', 'Huachi Chico', '186', null);
INSERT INTO `conf_parroquias` VALUES ('1175', 'Huachi Loreto', '186', null);
INSERT INTO `conf_parroquias` VALUES ('1176', 'La Merced', '186', null);
INSERT INTO `conf_parroquias` VALUES ('1177', 'La Península', '186', null);
INSERT INTO `conf_parroquias` VALUES ('1178', 'Matriz', '186', null);
INSERT INTO `conf_parroquias` VALUES ('1179', 'Pishilata', '186', null);
INSERT INTO `conf_parroquias` VALUES ('1180', 'San Francisco', '186', null);
INSERT INTO `conf_parroquias` VALUES ('1181', 'Ambato', '186', null);
INSERT INTO `conf_parroquias` VALUES ('1182', 'Ambatillo', '186', null);
INSERT INTO `conf_parroquias` VALUES ('1183', 'Atahualpa (Chisalata)', '186', null);
INSERT INTO `conf_parroquias` VALUES ('1184', 'Augusto N. Martínez (Mundugleo)', '186', null);
INSERT INTO `conf_parroquias` VALUES ('1185', 'Constantino Fernández (Cab. En Cullitahua)', '186', null);
INSERT INTO `conf_parroquias` VALUES ('1186', 'Huachi Grande', '186', null);
INSERT INTO `conf_parroquias` VALUES ('1187', 'Izamba', '186', null);
INSERT INTO `conf_parroquias` VALUES ('1188', 'Juan Benigno Vela', '186', null);
INSERT INTO `conf_parroquias` VALUES ('1189', 'Montalvo', '186', null);
INSERT INTO `conf_parroquias` VALUES ('1190', 'Pasa', '186', null);
INSERT INTO `conf_parroquias` VALUES ('1191', 'Picaigua', '186', null);
INSERT INTO `conf_parroquias` VALUES ('1192', 'Pilagüín (Pilahüín)', '186', null);
INSERT INTO `conf_parroquias` VALUES ('1193', 'Quisapincha (Quizapincha)', '186', null);
INSERT INTO `conf_parroquias` VALUES ('1194', 'San Bartolomé de Pinllog', '186', null);
INSERT INTO `conf_parroquias` VALUES ('1195', 'San Fernando (Pasa San Fernando)', '186', null);
INSERT INTO `conf_parroquias` VALUES ('1196', 'Santa Rosa', '186', null);
INSERT INTO `conf_parroquias` VALUES ('1197', 'Totoras', '186', null);
INSERT INTO `conf_parroquias` VALUES ('1198', 'Cunchibamba', '186', null);
INSERT INTO `conf_parroquias` VALUES ('1199', 'Unamuncho', '186', null);
INSERT INTO `conf_parroquias` VALUES ('1200', 'Baños de Agua Santa', '187', null);
INSERT INTO `conf_parroquias` VALUES ('1201', 'Lligua', '187', null);
INSERT INTO `conf_parroquias` VALUES ('1202', 'Río Negro', '187', null);
INSERT INTO `conf_parroquias` VALUES ('1203', 'Río Verde', '187', null);
INSERT INTO `conf_parroquias` VALUES ('1204', 'Ulba', '187', null);
INSERT INTO `conf_parroquias` VALUES ('1205', 'Cevallos', '188', null);
INSERT INTO `conf_parroquias` VALUES ('1206', 'Mocha', '189', null);
INSERT INTO `conf_parroquias` VALUES ('1207', 'Pinguilí', '189', null);
INSERT INTO `conf_parroquias` VALUES ('1208', 'Patate', '190', null);
INSERT INTO `conf_parroquias` VALUES ('1209', 'El Triunfo', '190', null);
INSERT INTO `conf_parroquias` VALUES ('1210', 'Los Andes (Cab. En Poatug)', '190', null);
INSERT INTO `conf_parroquias` VALUES ('1211', 'Sucre (Cab. En Sucre-Patate Urcu)', '190', null);
INSERT INTO `conf_parroquias` VALUES ('1212', 'Quero', '191', null);
INSERT INTO `conf_parroquias` VALUES ('1213', 'Rumipamba', '191', null);
INSERT INTO `conf_parroquias` VALUES ('1214', 'Yanayacu - Mochapata (Cab. En Yanayacu)', '191', null);
INSERT INTO `conf_parroquias` VALUES ('1215', 'Pelileo', '192', null);
INSERT INTO `conf_parroquias` VALUES ('1216', 'Pelileo Grande', '192', null);
INSERT INTO `conf_parroquias` VALUES ('1217', 'Pelileo', '192', null);
INSERT INTO `conf_parroquias` VALUES ('1218', 'Benítez (Pachanlica)', '192', null);
INSERT INTO `conf_parroquias` VALUES ('1219', 'Bolívar', '192', null);
INSERT INTO `conf_parroquias` VALUES ('1220', 'Cotaló', '192', null);
INSERT INTO `conf_parroquias` VALUES ('1221', 'Chiquicha (Cab. En Chiquicha Grande)', '192', null);
INSERT INTO `conf_parroquias` VALUES ('1222', 'El Rosario (Rumichaca)', '192', null);
INSERT INTO `conf_parroquias` VALUES ('1223', 'García Moreno (Chumaqui)', '192', null);
INSERT INTO `conf_parroquias` VALUES ('1224', 'Guambaló (Huambaló)', '192', null);
INSERT INTO `conf_parroquias` VALUES ('1225', 'Salasaca', '192', null);
INSERT INTO `conf_parroquias` VALUES ('1226', 'Ciudad Nueva', '193', null);
INSERT INTO `conf_parroquias` VALUES ('1227', 'Píllaro', '193', null);
INSERT INTO `conf_parroquias` VALUES ('1228', 'Píllaro', '193', null);
INSERT INTO `conf_parroquias` VALUES ('1229', 'Baquerizo Moreno', '193', null);
INSERT INTO `conf_parroquias` VALUES ('1230', 'Emilio María Terán (Rumipamba)', '193', null);
INSERT INTO `conf_parroquias` VALUES ('1231', 'Marcos Espinel (Chacata)', '193', null);
INSERT INTO `conf_parroquias` VALUES ('1232', 'Presidente Urbina (Chagrapamba -Patzucul)', '193', null);
INSERT INTO `conf_parroquias` VALUES ('1233', 'San Andrés', '193', null);
INSERT INTO `conf_parroquias` VALUES ('1234', 'San José de Poaló', '193', null);
INSERT INTO `conf_parroquias` VALUES ('1235', 'San Miguelito', '193', null);
INSERT INTO `conf_parroquias` VALUES ('1236', 'Tisaleo', '194', null);
INSERT INTO `conf_parroquias` VALUES ('1237', 'Quinchicoto', '194', null);
INSERT INTO `conf_parroquias` VALUES ('1238', 'El Limón', '195', null);
INSERT INTO `conf_parroquias` VALUES ('1239', 'Zamora', '195', null);
INSERT INTO `conf_parroquias` VALUES ('1240', 'Zamora', '195', null);
INSERT INTO `conf_parroquias` VALUES ('1241', 'Cumbaratza', '195', null);
INSERT INTO `conf_parroquias` VALUES ('1242', 'Guadalupe', '195', null);
INSERT INTO `conf_parroquias` VALUES ('1243', 'Imbana (La Victoria de Imbana)', '195', null);
INSERT INTO `conf_parroquias` VALUES ('1244', 'Paquisha', '195', null);
INSERT INTO `conf_parroquias` VALUES ('1245', 'Sabanilla', '195', null);
INSERT INTO `conf_parroquias` VALUES ('1246', 'Timbara', '195', null);
INSERT INTO `conf_parroquias` VALUES ('1247', 'Zumbi', '195', null);
INSERT INTO `conf_parroquias` VALUES ('1248', 'San Carlos de Las Minas', '195', null);
INSERT INTO `conf_parroquias` VALUES ('1249', 'Zumba', '196', null);
INSERT INTO `conf_parroquias` VALUES ('1250', 'Chito', '196', null);
INSERT INTO `conf_parroquias` VALUES ('1251', 'El Chorro', '196', null);
INSERT INTO `conf_parroquias` VALUES ('1252', 'El Porvenir del Carmen', '196', null);
INSERT INTO `conf_parroquias` VALUES ('1253', 'La Chonta', '196', null);
INSERT INTO `conf_parroquias` VALUES ('1254', 'Palanda', '196', null);
INSERT INTO `conf_parroquias` VALUES ('1255', 'Pucapamba', '196', null);
INSERT INTO `conf_parroquias` VALUES ('1256', 'San Francisco del Vergel', '196', null);
INSERT INTO `conf_parroquias` VALUES ('1257', 'Valladolid', '196', null);
INSERT INTO `conf_parroquias` VALUES ('1258', 'San Andrés', '196', null);
INSERT INTO `conf_parroquias` VALUES ('1259', 'Guayzimi', '197', null);
INSERT INTO `conf_parroquias` VALUES ('1260', 'Zurmi', '197', null);
INSERT INTO `conf_parroquias` VALUES ('1261', 'Nuevo Paraíso', '197', null);
INSERT INTO `conf_parroquias` VALUES ('1262', '28 de Mayo (San José de Yacuambi)', '198', null);
INSERT INTO `conf_parroquias` VALUES ('1263', 'La Paz', '198', null);
INSERT INTO `conf_parroquias` VALUES ('1264', 'Tutupali', '198', null);
INSERT INTO `conf_parroquias` VALUES ('1265', 'Yantzaza (Yanzatza)', '199', null);
INSERT INTO `conf_parroquias` VALUES ('1266', 'Chicaña', '199', null);
INSERT INTO `conf_parroquias` VALUES ('1267', 'El Pangui', '199', null);
INSERT INTO `conf_parroquias` VALUES ('1268', 'Los Encuentros', '199', null);
INSERT INTO `conf_parroquias` VALUES ('1269', 'El Pangui', '200', null);
INSERT INTO `conf_parroquias` VALUES ('1270', 'El Guisme', '200', null);
INSERT INTO `conf_parroquias` VALUES ('1271', 'Pachicutza', '200', null);
INSERT INTO `conf_parroquias` VALUES ('1272', 'Tundayme', '200', null);
INSERT INTO `conf_parroquias` VALUES ('1273', 'Zumbi', '201', null);
INSERT INTO `conf_parroquias` VALUES ('1274', 'Paquisha', '201', null);
INSERT INTO `conf_parroquias` VALUES ('1275', 'Triunfo-Dorado', '201', null);
INSERT INTO `conf_parroquias` VALUES ('1276', 'Panguintza', '201', null);
INSERT INTO `conf_parroquias` VALUES ('1277', 'Palanda', '202', null);
INSERT INTO `conf_parroquias` VALUES ('1278', 'El Porvenir del Carmen', '202', null);
INSERT INTO `conf_parroquias` VALUES ('1279', 'San Francisco del Vergel', '202', null);
INSERT INTO `conf_parroquias` VALUES ('1280', 'Valladolid', '202', null);
INSERT INTO `conf_parroquias` VALUES ('1281', 'La Canela', '202', null);
INSERT INTO `conf_parroquias` VALUES ('1282', 'Paquisha', '203', null);
INSERT INTO `conf_parroquias` VALUES ('1283', 'Bellavista', '203', null);
INSERT INTO `conf_parroquias` VALUES ('1284', 'Nuevo Quito', '203', null);
INSERT INTO `conf_parroquias` VALUES ('1285', 'Puerto Baquerizo Moreno', '204', null);
INSERT INTO `conf_parroquias` VALUES ('1286', 'El Progreso', '204', null);
INSERT INTO `conf_parroquias` VALUES ('1287', 'Isla Santa María (Floreana) (Cab. En Pto. Velasco Ibarra)', '204', null);
INSERT INTO `conf_parroquias` VALUES ('1288', 'Puerto Villamil', '205', null);
INSERT INTO `conf_parroquias` VALUES ('1289', 'Tomás de Berlanga (Santo Tomás)', '205', null);
INSERT INTO `conf_parroquias` VALUES ('1290', 'Puerto Ayora', '206', null);
INSERT INTO `conf_parroquias` VALUES ('1291', 'Bellavista', '206', null);
INSERT INTO `conf_parroquias` VALUES ('1292', 'Santa Rosa (Incluye La Isla Baltra)', '206', null);
INSERT INTO `conf_parroquias` VALUES ('1293', 'Nueva Loja', '207', null);
INSERT INTO `conf_parroquias` VALUES ('1294', 'Cuyabeno', '207', null);
INSERT INTO `conf_parroquias` VALUES ('1295', 'Dureno', '207', null);
INSERT INTO `conf_parroquias` VALUES ('1296', 'General Farfán', '207', null);
INSERT INTO `conf_parroquias` VALUES ('1297', 'Tarapoa', '207', null);
INSERT INTO `conf_parroquias` VALUES ('1298', 'El Eno', '207', null);
INSERT INTO `conf_parroquias` VALUES ('1299', 'Pacayacu', '207', null);
INSERT INTO `conf_parroquias` VALUES ('1300', 'Jambelí', '207', null);
INSERT INTO `conf_parroquias` VALUES ('1301', 'Santa Cecilia', '207', null);
INSERT INTO `conf_parroquias` VALUES ('1302', 'Aguas Negras', '207', null);
INSERT INTO `conf_parroquias` VALUES ('1303', 'El Dorado de Cascales', '208', null);
INSERT INTO `conf_parroquias` VALUES ('1304', 'El Reventador', '208', null);
INSERT INTO `conf_parroquias` VALUES ('1305', 'Gonzalo Pizarro', '208', null);
INSERT INTO `conf_parroquias` VALUES ('1306', 'Lumbaquí', '208', null);
INSERT INTO `conf_parroquias` VALUES ('1307', 'Puerto Libre', '208', null);
INSERT INTO `conf_parroquias` VALUES ('1308', 'Santa Rosa de Sucumbíos', '208', null);
INSERT INTO `conf_parroquias` VALUES ('1309', 'Puerto El Carmen del Putumayo', '209', null);
INSERT INTO `conf_parroquias` VALUES ('1310', 'Palma Roja', '209', null);
INSERT INTO `conf_parroquias` VALUES ('1311', 'Puerto Bolívar (Puerto Montúfar)', '209', null);
INSERT INTO `conf_parroquias` VALUES ('1312', 'Puerto Rodríguez', '209', null);
INSERT INTO `conf_parroquias` VALUES ('1313', 'Santa Elena', '209', null);
INSERT INTO `conf_parroquias` VALUES ('1314', 'Shushufindi', '210', null);
INSERT INTO `conf_parroquias` VALUES ('1315', 'Limoncocha', '210', null);
INSERT INTO `conf_parroquias` VALUES ('1316', 'Pañacocha', '210', null);
INSERT INTO `conf_parroquias` VALUES ('1317', 'San Roque (Cab. En San Vicente)', '210', null);
INSERT INTO `conf_parroquias` VALUES ('1318', 'San Pedro de Los Cofanes', '210', null);
INSERT INTO `conf_parroquias` VALUES ('1319', 'Siete de Julio', '210', null);
INSERT INTO `conf_parroquias` VALUES ('1320', 'La Bonita', '211', null);
INSERT INTO `conf_parroquias` VALUES ('1321', 'El Playón de San Francisco', '211', null);
INSERT INTO `conf_parroquias` VALUES ('1322', 'La Sofía', '211', null);
INSERT INTO `conf_parroquias` VALUES ('1323', 'Rosa Florida', '211', null);
INSERT INTO `conf_parroquias` VALUES ('1324', 'Santa Bárbara', '211', null);
INSERT INTO `conf_parroquias` VALUES ('1325', 'El Dorado de Cascales', '212', null);
INSERT INTO `conf_parroquias` VALUES ('1326', 'Santa Rosa de Sucumbíos', '212', null);
INSERT INTO `conf_parroquias` VALUES ('1327', 'Sevilla', '212', null);
INSERT INTO `conf_parroquias` VALUES ('1328', 'Tarapoa', '213', null);
INSERT INTO `conf_parroquias` VALUES ('1329', 'Cuyabeno', '213', null);
INSERT INTO `conf_parroquias` VALUES ('1330', 'Aguas Negras', '213', null);
INSERT INTO `conf_parroquias` VALUES ('1331', 'Puerto Francisco de Orellana (El Coca)', '214', null);
INSERT INTO `conf_parroquias` VALUES ('1332', 'Dayuma', '214', null);
INSERT INTO `conf_parroquias` VALUES ('1333', 'Taracoa (Nueva Esperanza: Yuca)', '214', null);
INSERT INTO `conf_parroquias` VALUES ('1334', 'Alejandro Labaka', '214', null);
INSERT INTO `conf_parroquias` VALUES ('1335', 'El Dorado', '214', null);
INSERT INTO `conf_parroquias` VALUES ('1336', 'El Edén', '214', null);
INSERT INTO `conf_parroquias` VALUES ('1337', 'García Moreno', '214', null);
INSERT INTO `conf_parroquias` VALUES ('1338', 'Inés Arango (Cab. En Western)', '214', null);
INSERT INTO `conf_parroquias` VALUES ('1339', 'La Belleza', '214', null);
INSERT INTO `conf_parroquias` VALUES ('1340', 'Nuevo Paraíso (Cab. En Unión', '214', null);
INSERT INTO `conf_parroquias` VALUES ('1341', 'San José de Guayusa', '214', null);
INSERT INTO `conf_parroquias` VALUES ('1342', 'San Luis de Armenia', '214', null);
INSERT INTO `conf_parroquias` VALUES ('1343', 'Tipitini', '215', null);
INSERT INTO `conf_parroquias` VALUES ('1344', 'Nuevo Rocafuerte', '215', null);
INSERT INTO `conf_parroquias` VALUES ('1345', 'Capitán Augusto Rivadeneyra', '215', null);
INSERT INTO `conf_parroquias` VALUES ('1346', 'Cononaco', '215', null);
INSERT INTO `conf_parroquias` VALUES ('1347', 'Santa María de Huiririma', '215', null);
INSERT INTO `conf_parroquias` VALUES ('1348', 'Tiputini', '215', null);
INSERT INTO `conf_parroquias` VALUES ('1349', 'Yasuní', '215', null);
INSERT INTO `conf_parroquias` VALUES ('1350', 'La Joya de Los Sachas', '216', null);
INSERT INTO `conf_parroquias` VALUES ('1351', 'Enokanqui', '216', null);
INSERT INTO `conf_parroquias` VALUES ('1352', 'Pompeya', '216', null);
INSERT INTO `conf_parroquias` VALUES ('1353', 'San Carlos', '216', null);
INSERT INTO `conf_parroquias` VALUES ('1354', 'San Sebastián del Coca', '216', null);
INSERT INTO `conf_parroquias` VALUES ('1355', 'Lago San Pedro', '216', null);
INSERT INTO `conf_parroquias` VALUES ('1356', 'Rumipamba', '216', null);
INSERT INTO `conf_parroquias` VALUES ('1357', 'Tres de Noviembre', '216', null);
INSERT INTO `conf_parroquias` VALUES ('1358', 'Unión Milagreña', '216', null);
INSERT INTO `conf_parroquias` VALUES ('1359', 'Loreto', '217', null);
INSERT INTO `conf_parroquias` VALUES ('1360', 'Avila (Cab. En Huiruno)', '217', null);
INSERT INTO `conf_parroquias` VALUES ('1361', 'Puerto Murialdo', '217', null);
INSERT INTO `conf_parroquias` VALUES ('1362', 'San José de Payamino', '217', null);
INSERT INTO `conf_parroquias` VALUES ('1363', 'San José de Dahuano', '217', null);
INSERT INTO `conf_parroquias` VALUES ('1364', 'San Vicente de Huaticocha', '217', null);
INSERT INTO `conf_parroquias` VALUES ('1365', 'Abraham Calazacón', '218', null);
INSERT INTO `conf_parroquias` VALUES ('1366', 'Bombolí', '218', null);
INSERT INTO `conf_parroquias` VALUES ('1367', 'Chiguilpe', '218', null);
INSERT INTO `conf_parroquias` VALUES ('1368', 'Río Toachi', '218', null);
INSERT INTO `conf_parroquias` VALUES ('1369', 'Río Verde', '218', null);
INSERT INTO `conf_parroquias` VALUES ('1370', 'Santo Domingo de Los Colorados', '218', null);
INSERT INTO `conf_parroquias` VALUES ('1371', 'Zaracay', '218', null);
INSERT INTO `conf_parroquias` VALUES ('1372', 'Santo Domingo de Los Colorados', '218', null);
INSERT INTO `conf_parroquias` VALUES ('1373', 'Alluriquín', '218', null);
INSERT INTO `conf_parroquias` VALUES ('1374', 'Puerto Limón', '218', null);
INSERT INTO `conf_parroquias` VALUES ('1375', 'Luz de América', '218', null);
INSERT INTO `conf_parroquias` VALUES ('1376', 'San Jacinto del Búa', '218', null);
INSERT INTO `conf_parroquias` VALUES ('1377', 'Valle Hermoso', '218', null);
INSERT INTO `conf_parroquias` VALUES ('1378', 'El Esfuerzo', '218', null);
INSERT INTO `conf_parroquias` VALUES ('1379', 'Santa María del Toachi', '218', null);
INSERT INTO `conf_parroquias` VALUES ('1380', 'Ballenita', '219', null);
INSERT INTO `conf_parroquias` VALUES ('1381', 'Santa Elena', '219', null);
INSERT INTO `conf_parroquias` VALUES ('1382', 'Santa Elena', '219', null);
INSERT INTO `conf_parroquias` VALUES ('1383', 'Atahualpa', '219', null);
INSERT INTO `conf_parroquias` VALUES ('1384', 'Colonche', '219', null);
INSERT INTO `conf_parroquias` VALUES ('1385', 'Chanduy', '219', null);
INSERT INTO `conf_parroquias` VALUES ('1386', 'Manglaralto', '219', null);
INSERT INTO `conf_parroquias` VALUES ('1387', 'Simón Bolívar (Julio Moreno)', '219', null);
INSERT INTO `conf_parroquias` VALUES ('1388', 'San José de Ancón', '219', null);
INSERT INTO `conf_parroquias` VALUES ('1389', 'La Libertad', '220', null);
INSERT INTO `conf_parroquias` VALUES ('1390', 'Carlos Espinoza Larrea', '221', null);
INSERT INTO `conf_parroquias` VALUES ('1391', 'Gral. Alberto Enríquez Gallo', '221', null);
INSERT INTO `conf_parroquias` VALUES ('1392', 'Vicente Rocafuerte', '221', null);
INSERT INTO `conf_parroquias` VALUES ('1393', 'Santa Rosa', '221', null);
INSERT INTO `conf_parroquias` VALUES ('1394', 'Salinas', '221', null);
INSERT INTO `conf_parroquias` VALUES ('1395', 'Anconcito', '221', null);
INSERT INTO `conf_parroquias` VALUES ('1396', 'José Luis Tamayo (Muey)', '221', null);
INSERT INTO `conf_parroquias` VALUES ('1397', 'Las Golondrinas', '222', null);
INSERT INTO `conf_parroquias` VALUES ('1398', 'Manga del Cura', '222', null);
INSERT INTO `conf_parroquias` VALUES ('1399', 'El Piedrero', '222', null);

-- ----------------------------
-- Table structure for conf_provincias
-- ----------------------------
DROP TABLE IF EXISTS `conf_provincias`;
CREATE TABLE `conf_provincias` (
  `id_provincia` int(255) NOT NULL AUTO_INCREMENT,
  `provincia` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `id_tecnico` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  PRIMARY KEY (`id_provincia`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of conf_provincias
-- ----------------------------
INSERT INTO `conf_provincias` VALUES ('1', 'Azuay', null);
INSERT INTO `conf_provincias` VALUES ('2', 'Bolívar', null);
INSERT INTO `conf_provincias` VALUES ('3', 'Cañar', null);
INSERT INTO `conf_provincias` VALUES ('4', 'Carchi', null);
INSERT INTO `conf_provincias` VALUES ('5', 'Cotopaxi', null);
INSERT INTO `conf_provincias` VALUES ('6', 'Chimborazo', null);
INSERT INTO `conf_provincias` VALUES ('7', 'El Oro', null);
INSERT INTO `conf_provincias` VALUES ('8', 'Esmeraldas', null);
INSERT INTO `conf_provincias` VALUES ('9', 'Guayas', null);
INSERT INTO `conf_provincias` VALUES ('10', 'Imbabura', null);
INSERT INTO `conf_provincias` VALUES ('11', 'Loja', null);
INSERT INTO `conf_provincias` VALUES ('12', 'Los Rios', null);
INSERT INTO `conf_provincias` VALUES ('13', 'Manabi', null);
INSERT INTO `conf_provincias` VALUES ('14', 'Morona Santiago', null);
INSERT INTO `conf_provincias` VALUES ('15', 'Napo', null);
INSERT INTO `conf_provincias` VALUES ('16', 'Pastaza', null);
INSERT INTO `conf_provincias` VALUES ('17', 'Pichincha', null);
INSERT INTO `conf_provincias` VALUES ('18', 'Tungurahua', null);
INSERT INTO `conf_provincias` VALUES ('19', 'Zamora Chinchipe', null);
INSERT INTO `conf_provincias` VALUES ('20', 'Galápagos', null);
INSERT INTO `conf_provincias` VALUES ('21', 'Sucumbíos', null);
INSERT INTO `conf_provincias` VALUES ('22', 'Orellana', null);
INSERT INTO `conf_provincias` VALUES ('23', 'Santo Domingo de Los Tsáchilas', null);
INSERT INTO `conf_provincias` VALUES ('24', 'Santa Elena', null);
INSERT INTO `conf_provincias` VALUES ('25', 'Zonas No Delimitadas', null);

-- ----------------------------
-- Table structure for conf_receta_recetarios
-- ----------------------------
DROP TABLE IF EXISTS `conf_receta_recetarios`;
CREATE TABLE `conf_receta_recetarios` (
  `id_recetario` int(255) NOT NULL AUTO_INCREMENT,
  `id_prescriptor` int(255) DEFAULT NULL,
  `fecha_emision` date DEFAULT NULL,
  `fecha_caducidad` date DEFAULT NULL,
  `inicia` int(255) DEFAULT NULL,
  `termina` int(255) DEFAULT NULL,
  `id_tecnico` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_recetario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of conf_receta_recetarios
-- ----------------------------

-- ----------------------------
-- Table structure for conf_servicios
-- ----------------------------
DROP TABLE IF EXISTS `conf_servicios`;
CREATE TABLE `conf_servicios` (
  `id_servicio` int(255) NOT NULL AUTO_INCREMENT,
  `Servicios` varchar(255) DEFAULT NULL,
  `id_tecnico` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_servicio`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of conf_servicios
-- ----------------------------
INSERT INTO `conf_servicios` VALUES ('1', 'NEONATOLOGIA', null);
INSERT INTO `conf_servicios` VALUES ('2', 'PEDIATRIA', null);
INSERT INTO `conf_servicios` VALUES ('3', 'CLINICA', null);
INSERT INTO `conf_servicios` VALUES ('4', 'CIRUGIA', null);
INSERT INTO `conf_servicios` VALUES ('5', 'GINECOLOGIA', null);
INSERT INTO `conf_servicios` VALUES ('6', 'UNIDAD DE CUIDADO INTENSIVOS ', null);
INSERT INTO `conf_servicios` VALUES ('7', 'QUEMADOS', null);
INSERT INTO `conf_servicios` VALUES ('8', 'CONSULTA EXTERNA ', null);
INSERT INTO `conf_servicios` VALUES ('9', 'EMERGENCIA ', null);
INSERT INTO `conf_servicios` VALUES ('10', 'DIALISIS ', null);

-- ----------------------------
-- Table structure for conf_sn
-- ----------------------------
DROP TABLE IF EXISTS `conf_sn`;
CREATE TABLE `conf_sn` (
  `id_sn` int(255) NOT NULL AUTO_INCREMENT,
  `opcion` varchar(20) DEFAULT NULL,
  `id_tecnico` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_sn`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of conf_sn
-- ----------------------------
INSERT INTO `conf_sn` VALUES ('1', 'Si', null);
INSERT INTO `conf_sn` VALUES ('2', 'No', null);

-- ----------------------------
-- Table structure for conf_tipo_persona_juridica
-- ----------------------------
DROP TABLE IF EXISTS `conf_tipo_persona_juridica`;
CREATE TABLE `conf_tipo_persona_juridica` (
  `id_persona` int(255) NOT NULL AUTO_INCREMENT,
  `persona` varchar(255) DEFAULT NULL,
  `id_tecnico` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_persona`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of conf_tipo_persona_juridica
-- ----------------------------
INSERT INTO `conf_tipo_persona_juridica` VALUES ('1', 'Natural', null);
INSERT INTO `conf_tipo_persona_juridica` VALUES ('2', 'Jurídica', null);

-- ----------------------------
-- Table structure for decimal
-- ----------------------------
DROP TABLE IF EXISTS `decimal`;
CREATE TABLE `decimal` (
  `valor` decimal(10,5) DEFAULT NULL,
  `cantidad` int(10) DEFAULT NULL,
  `total` decimal(10,5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of decimal
-- ----------------------------
INSERT INTO `decimal` VALUES ('0.21852', '1050', '229.44600');
INSERT INTO `decimal` VALUES ('3.75000', '45', '168.75000');
INSERT INTO `decimal` VALUES ('1.04500', '400', '418.00000');

-- ----------------------------
-- Table structure for entregas_recetas
-- ----------------------------
DROP TABLE IF EXISTS `entregas_recetas`;
CREATE TABLE `entregas_recetas` (
  `id_entrega` int(255) NOT NULL AUTO_INCREMENT,
  `id_receta` int(255) DEFAULT NULL,
  `id_paciente` int(255) DEFAULT NULL,
  `fecha_emision` datetime DEFAULT NULL,
  `fecha_recepcion` datetime DEFAULT NULL,
  `subtotal_grava_iva` decimal(20,2) DEFAULT NULL,
  `subtotal_iva_0_medicinas` decimal(20,2) DEFAULT NULL,
  `subtotal_iva_0_equipos` decimal(20,2) DEFAULT NULL,
  `subtotal_no_objeto_iva` decimal(20,2) DEFAULT NULL,
  `subtotal_excento_iva` decimal(20,2) DEFAULT NULL,
  `subtotal_sin_impuestos` decimal(20,2) DEFAULT NULL,
  `total_descuento_grava_iva` decimal(20,2) DEFAULT NULL,
  `total_descuento_iva_0_medicinas` decimal(20,2) DEFAULT NULL,
  `total_descuento_iva_0_equipos` decimal(20,2) DEFAULT NULL,
  `total_descuento_excento_iva` decimal(20,2) DEFAULT NULL,
  `total_descuento_sin_impuestos` decimal(20,2) DEFAULT NULL,
  `iva_gravado` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `iva` decimal(20,2) DEFAULT NULL,
  `ice` decimal(20,2) DEFAULT NULL,
  `irbpnr` decimal(20,2) DEFAULT NULL,
  `valor_total` decimal(20,2) DEFAULT NULL,
  `donación` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `observaciones` text COLLATE utf8_unicode_ci,
  `id_farmaceuta` int(255) NOT NULL,
  PRIMARY KEY (`id_entrega`),
  KEY `idrec` (`id_receta`),
  KEY `idfarma` (`id_farmaceuta`),
  KEY `idpacient` (`id_paciente`),
  CONSTRAINT `idfarma` FOREIGN KEY (`id_farmaceuta`) REFERENCES `u_farmaceuticos` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `idpacient` FOREIGN KEY (`id_paciente`) REFERENCES `u_pacientes` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `idrec` FOREIGN KEY (`id_receta`) REFERENCES `recetas_medico` (`id_receta_medico`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of entregas_recetas
-- ----------------------------

-- ----------------------------
-- Table structure for entregas_recetas_equipos
-- ----------------------------
DROP TABLE IF EXISTS `entregas_recetas_equipos`;
CREATE TABLE `entregas_recetas_equipos` (
  `id_entrega_receta_equipo` int(255) NOT NULL AUTO_INCREMENT,
  `id_entrega_receta` int(255) DEFAULT NULL,
  `id_stock_farmacia_equipo` int(255) DEFAULT NULL,
  `código_barras` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_producto` int(255) DEFAULT NULL,
  `descripción` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cantidad` int(20) DEFAULT NULL,
  `precio_unitario` decimal(20,2) DEFAULT NULL,
  `descuento` decimal(20,2) DEFAULT NULL,
  `precio_total` decimal(20,2) DEFAULT NULL,
  `fecha_fabricación` date DEFAULT NULL,
  `fecha_caducidad` date DEFAULT NULL,
  `donación` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `observaciones` text COLLATE utf8_unicode_ci,
  `almacenado` decimal(20,2) DEFAULT NULL,
  `no_almacenado` decimal(20,2) DEFAULT NULL,
  `id_farmaceuta` int(255) NOT NULL,
  PRIMARY KEY (`id_entrega_receta_equipo`) USING BTREE,
  KEY `idae` (`id_entrega_receta`),
  KEY `idsteq` (`id_stock_farmacia_equipo`),
  CONSTRAINT `entregas_recetas_equipos_ibfk_1` FOREIGN KEY (`id_entrega_receta`) REFERENCES `entregas_recetas` (`id_entrega`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `entregas_recetas_equipos_ibfk_2` FOREIGN KEY (`id_stock_farmacia_equipo`) REFERENCES `stock_farmacia_equipos` (`id_stock_farmacia_equipo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of entregas_recetas_equipos
-- ----------------------------

-- ----------------------------
-- Table structure for entregas_recetas_medicamentos
-- ----------------------------
DROP TABLE IF EXISTS `entregas_recetas_medicamentos`;
CREATE TABLE `entregas_recetas_medicamentos` (
  `id_entrega_receta_medicamento` int(255) NOT NULL AUTO_INCREMENT,
  `id_entrega_receta` int(255) DEFAULT NULL,
  `id_stock_farmacia_medicamentos` int(255) DEFAULT NULL,
  `código_barras` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `código_cnmb` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `descripción` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `forma_farmaceutica` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `concentración` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_producto` int(255) DEFAULT NULL,
  `fecha_fabricación` date DEFAULT NULL,
  `fecha_caducidad` date DEFAULT NULL,
  `cantidad` decimal(20,2) DEFAULT NULL,
  `precio_unitario` decimal(20,2) DEFAULT NULL,
  `descuento` decimal(20,2) DEFAULT NULL,
  `precio_total` decimal(20,2) DEFAULT NULL,
  `donación` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `observaciones` text COLLATE utf8_unicode_ci,
  `almacenado` decimal(20,2) DEFAULT NULL,
  `no_almacenado` decimal(20,2) DEFAULT NULL,
  `id_farmaceuta` int(255) NOT NULL,
  PRIMARY KEY (`id_entrega_receta_medicamento`) USING BTREE,
  KEY `fac_prov_med` (`id_entrega_receta`),
  KEY `idstockmed` (`id_stock_farmacia_medicamentos`),
  CONSTRAINT `entregas_recetas_medicamentos_ibfk_1` FOREIGN KEY (`id_entrega_receta`) REFERENCES `entregas_recetas` (`id_entrega`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `entregas_recetas_medicamentos_ibfk_2` FOREIGN KEY (`id_stock_farmacia_medicamentos`) REFERENCES `stock_farmacia_medicamentos` (`id_stock_farmacia_medicamentos`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of entregas_recetas_medicamentos
-- ----------------------------

-- ----------------------------
-- Table structure for facturas_proveedor
-- ----------------------------
DROP TABLE IF EXISTS `facturas_proveedor`;
CREATE TABLE `facturas_proveedor` (
  `id_factura_proveedor` int(255) NOT NULL AUTO_INCREMENT,
  `id_u_proveedor` int(255) DEFAULT NULL,
  `factura_número` int(255) DEFAULT NULL,
  `fecha_emisión` date DEFAULT NULL,
  `fecha_recepción` datetime DEFAULT NULL,
  `subtotal_grava_iva` decimal(20,2) DEFAULT NULL,
  `subtotal_iva_0_medicinas` decimal(20,2) DEFAULT NULL,
  `subtotal_iva_0_equipos` decimal(20,2) DEFAULT NULL,
  `subtotal_no_objeto_iva` decimal(20,2) DEFAULT NULL,
  `subtotal_excento_iva` decimal(20,2) DEFAULT NULL,
  `subtotal_sin_impuestos` decimal(20,2) DEFAULT NULL,
  `total_descuento_grava_iva` decimal(20,2) DEFAULT NULL,
  `total_descuento_iva_0_medicinas` decimal(20,2) DEFAULT NULL,
  `total_descuento_iva_0_equipos` decimal(20,2) DEFAULT NULL,
  `total_descuento_excento_iva` decimal(20,2) DEFAULT NULL,
  `total_descuento_sin_impuestos` decimal(20,2) DEFAULT NULL,
  `iva_gravado` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `iva` decimal(20,2) DEFAULT NULL,
  `ice` decimal(20,2) DEFAULT NULL,
  `irbpnr` decimal(20,2) DEFAULT NULL,
  `valor_total` decimal(20,2) DEFAULT NULL,
  `donación` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reingreso` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `observaciones` text COLLATE utf8_unicode_ci,
  `id_u_almacenista` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_factura_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of facturas_proveedor
-- ----------------------------
INSERT INTO `facturas_proveedor` VALUES ('9', '11', '12', null, null, '1.00', '3.00', '4.00', null, null, null, null, null, null, null, null, '', null, null, null, null, '', '', '', '');
INSERT INTO `facturas_proveedor` VALUES ('10', '11', null, null, null, null, null, '100.00', null, null, null, null, null, null, null, null, null, null, null, null, null, '', '', '', 'admin');

-- ----------------------------
-- Table structure for facturas_proveedor_equipos
-- ----------------------------
DROP TABLE IF EXISTS `facturas_proveedor_equipos`;
CREATE TABLE `facturas_proveedor_equipos` (
  `id_factura_proveedor_equipo` int(255) NOT NULL AUTO_INCREMENT,
  `id_factura_proveedor` int(255) DEFAULT NULL,
  `código_barras` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_producto` int(255) DEFAULT NULL,
  `descripción` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tamaño` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `calibre` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `volumen` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `cantidad` int(20) DEFAULT NULL,
  `precio_unitario` decimal(20,2) DEFAULT NULL,
  `descuento` decimal(20,2) DEFAULT NULL,
  `precio_total` decimal(20,2) DEFAULT NULL,
  `fecha_fabricación` date DEFAULT NULL,
  `fecha_caducidad` date DEFAULT NULL,
  `donación` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reingreso` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `observaciones` text COLLATE utf8_unicode_ci,
  `almacenado` decimal(20,2) DEFAULT NULL,
  `no_almacenado` decimal(20,2) DEFAULT NULL,
  `id_u_almacenista` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_factura_proveedor_equipo`),
  KEY `id_factura_proveedor` (`id_factura_proveedor`),
  CONSTRAINT `fpe` FOREIGN KEY (`id_factura_proveedor`) REFERENCES `facturas_proveedor` (`id_factura_proveedor`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of facturas_proveedor_equipos
-- ----------------------------
INSERT INTO `facturas_proveedor_equipos` VALUES ('19', null, '', '1', '1', '', '', '', '1', '1.00', null, null, null, null, '', '', '', null, null, '');
INSERT INTO `facturas_proveedor_equipos` VALUES ('20', '9', '', null, 'a', '', '', '', '1', '1.00', null, null, null, null, '', '', '', null, null, '');
INSERT INTO `facturas_proveedor_equipos` VALUES ('21', '9', '', '1', 'AGUJA ESPINAL TIPO QUINCKE', '25G', '', '', '1', '1.00', null, null, null, null, '', '', '', null, null, 'admin');
INSERT INTO `facturas_proveedor_equipos` VALUES ('22', '9', '', '4', 'AGUJA HIPODÉRMICA', '30G', '1/2\"', '', '1', '2.00', null, null, null, null, '', '', '', null, null, 'admin');
INSERT INTO `facturas_proveedor_equipos` VALUES ('23', '10', '', '8', 'AGUJA PERICRANEAL', '21G', '', '', '25', '4.00', null, null, null, null, '', '', '', '25.00', '0.00', 'admin');

-- ----------------------------
-- Table structure for facturas_proveedor_general
-- ----------------------------
DROP TABLE IF EXISTS `facturas_proveedor_general`;
CREATE TABLE `facturas_proveedor_general` (
  `id_factura_proveedor_general` int(255) NOT NULL AUTO_INCREMENT,
  `id_factura_proveedor` int(255) DEFAULT NULL,
  `código_barras` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_producto` int(255) DEFAULT NULL,
  `descripción` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cantidad` decimal(20,2) DEFAULT NULL,
  `precio_unitario` decimal(20,2) DEFAULT NULL,
  `descuento` decimal(20,2) DEFAULT NULL,
  `precio_total` decimal(20,2) DEFAULT NULL,
  `fecha_fabricación` date DEFAULT NULL,
  `fecha_caducidad` date DEFAULT NULL,
  `donación` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reingreso` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `observaciones` text COLLATE utf8_unicode_ci,
  `almacenado` decimal(20,2) DEFAULT NULL,
  `no_almacenado` decimal(20,2) DEFAULT NULL,
  `id_u_almacenista` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_factura_proveedor_general`) USING BTREE,
  KEY `fac_prov_equ` (`id_factura_proveedor`),
  CONSTRAINT `facturas_proveedor_general_ibfk_1` FOREIGN KEY (`id_factura_proveedor`) REFERENCES `facturas_proveedor` (`id_factura_proveedor`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of facturas_proveedor_general
-- ----------------------------
INSERT INTO `facturas_proveedor_general` VALUES ('2', '9', '', null, '', '1.00', '1.00', null, null, null, null, '', '', '', null, null, '');

-- ----------------------------
-- Table structure for facturas_proveedor_medicamentos
-- ----------------------------
DROP TABLE IF EXISTS `facturas_proveedor_medicamentos`;
CREATE TABLE `facturas_proveedor_medicamentos` (
  `id_factura_proveedor_medicamentos` int(255) NOT NULL AUTO_INCREMENT,
  `id_factura_proveedor` int(255) DEFAULT NULL,
  `código_barras` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `código_cnmb` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `descripción` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `forma_farmaceutica` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `concentración` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_producto` int(255) DEFAULT NULL,
  `fecha_fabricación` date DEFAULT NULL,
  `fecha_caducidad` date DEFAULT NULL,
  `cantidad` decimal(20,2) DEFAULT NULL,
  `precio_unitario` decimal(20,2) DEFAULT NULL,
  `descuento` decimal(20,2) DEFAULT NULL,
  `precio_total` decimal(20,2) DEFAULT NULL,
  `almacenado` decimal(20,2) DEFAULT NULL,
  `no_almacenado` decimal(20,2) DEFAULT NULL,
  `donación` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reingreso` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `observaciones` text COLLATE utf8_unicode_ci,
  `id_u_almacenista` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_factura_proveedor_medicamentos`),
  KEY `fac_prov_med` (`id_factura_proveedor`),
  CONSTRAINT `fac_prov_med` FOREIGN KEY (`id_factura_proveedor`) REFERENCES `facturas_proveedor` (`id_factura_proveedor`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of facturas_proveedor_medicamentos
-- ----------------------------
INSERT INTO `facturas_proveedor_medicamentos` VALUES ('3', '9', '', '', '', '', '', null, null, null, '1.00', '1.00', null, null, null, null, '', '', '', '');
INSERT INTO `facturas_proveedor_medicamentos` VALUES ('4', '9', '', '', 'Acetilcisteína', 'Líquido para inhalación', '100 mg/mL', '5', null, null, '2.00', '1.00', null, null, '2.00', '0.00', '', '', '', 'admin');

-- ----------------------------
-- Table structure for hoja1
-- ----------------------------
DROP TABLE IF EXISTS `hoja1`;
CREATE TABLE `hoja1` (
  `CODIGO` varchar(255) DEFAULT NULL,
  `NOMBRE` varchar(255) DEFAULT NULL,
  `PRESENTACIÓN` varchar(255) DEFAULT NULL,
  `SINONIMO` varchar(255) DEFAULT NULL,
  `LOTE` varchar(255) DEFAULT NULL,
  `PROVEEDOR` varchar(255) DEFAULT NULL,
  `REGISTRO SANITARIO` varchar(255) DEFAULT NULL,
  `FECHA ELABORACION` varchar(255) DEFAULT NULL,
  `FECHA CADUCIDAD` varchar(255) DEFAULT NULL,
  `STOCK` varchar(255) DEFAULT NULL,
  `PRECIO UNITARIO` varchar(255) DEFAULT NULL,
  `VALOR TOTAL` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hoja1
-- ----------------------------
INSERT INTO `hoja1` VALUES ('S01EC01TAB232X0', 'ACETAZOLAMIDA TABLETA 250 MG NR', 'CAJA X 30 TABLETAS', '', '19I20T02', 'KRONOS LABORATORIOS C. LTDA.', 'GBN-0645-05-05', '30/8/2019', '30/9/2021', '1050', '0,21852', '229,446');
INSERT INTO `hoja1` VALUES ('J05AB01SUS209G0', 'ACICLOVIR SUSPENSIÓN  200 MG/5 ML FRASCO X 100 ML', 'FRASCO 120ML', '', '0001-20', 'INDEUREC S.A.', '00399-1-MAN-07-06', '1/1/2020', '30/1/2023', '45', '3,75', '168,75');
INSERT INTO `hoja1` VALUES ('L04AA06TAR173X0', 'ÁCIDO MICOFENÓLICO TABLETA RECUBIERTA 500 MG NR', 'CAJA X 20', '', '1011739', 'MEDIFARMA S.A.', '2675-MEE-0417', '1/1/2019', '30/1/2021', '400', '1,045', '418');
INSERT INTO `hoja1` VALUES ('B02AA02SOY112A5', 'ÁCIDO TRANEXÁMICO SOLUCIÓN INYECTABLE  100 MG/ML AMPOLLA X 5 ML', 'CAJA X 50 AMPOLLAS /5ML', '', '193212096', 'REYOUNG PHARMACEUTICAL CO. LTD.', '2644-MEE-04-17', '30/7/2019', '31/7/2022', '5660', '0,32', '1811,2');
INSERT INTO `hoja1` VALUES ('B02AA02TAB339X0', 'ÁCIDO TRANEXÁMICO TABLETA  500 MG NR', 'CAJA X 10 TABLETAS', '', '200021', 'ROPSOHN LABORATORIOS LTDA.', '0087-MAE-05-11', '30/1/2020', '31/12/2021', '3030', '0,67', '2030,1');
INSERT INTO `hoja1` VALUES ('N03AG01TAR339X0', 'ÁCIDO VALPROICO TABLETA RECUBIERTA 500 MG NR', 'CAJA X 30 TABLETAS', '', '07687QA', 'ABBOTT LABORATORIES ARGENTINA S.A.', '25.194.06.03', '30/6/2019', '31/5/2022', '12740', '0,13', '1656,2');
INSERT INTO `hoja1` VALUES ('D10AD03GEL024X0', 'ADAPALENO GEL  0,1 % NR', 'TUBO X 30G', '', '10183067', 'GLENMARK PHARMACEUTICALS LTD.', '28988-08-09', '30/12/2018', '30/11/2021', '626', '3,5', '2191');
INSERT INTO `hoja1` VALUES ('P02CA03SUS116F4', 'ALBENDAZOL SUSPENSIÓN 100 MG/5 ML FRASCO X 20 ML', 'FRASCO X 20ML', '', '860719S', 'LABORATORIOS G.M. SUCESORES DEL DR. JULIO GONZALEZ MOSQUERA', '02691-MAC-06-03', '30/3/2019', '31/3/2022', '579', '0,2079', '120,3741');
INSERT INTO `hoja1` VALUES ('P02CA03SUS116F4', 'ALBENDAZOL SUSPENSIÓN 100 MG/5 ML FRASCO X 20 ML', 'FRASCO X 20ML', '', '118340', 'LABORATORIOS G.M. SUCESORES DEL DR. JULIO GONZALEZ MOSQUERA', '02691-MAC-06-03', '1/8/2019', '30/3/2022', '5376', '0,2079', '1117,6704');
INSERT INTO `hoja1` VALUES ('P02CA03TAM296X0', 'ALBENDAZOL TABLETA MASTICABLE 400 MG NR', 'CAJA X 30 TABLETAS', '', '248V', 'LABORATORIOS ROCNARF S.A.', '02557-MAC-04-03', '30/1/2020', '31/1/2022', '210', '0,18', '37,8');
INSERT INTO `hoja1` VALUES ('M04AA01TAB265X0', 'ALOPURINOL TABLETA 300 MG NR', 'CAJA X 30 TABLETA', '', '180508', 'PROPHAR S.A', '1285-MAC-1-04-11', '1/5/2018', '30/5/2021', '16530', '0,037', '611,61');
INSERT INTO `hoja1` VALUES ('M04AA01TAB265X0', 'ALOPURINOL TABLETA 300 MG NR', 'CAJA X 30 TABLETA', '', '181217', 'PROPHAR S.A', '1285-MAC-1-04-11', '1/12/2018', '31/12/2021', '150', '0,037', '5,55');
INSERT INTO `hoja1` VALUES ('C01BD01SOY334A3', 'AMIODARONA SOLUCIÓN INYECTABLE  50 MG/ML AMPOLLA X 3 ML', 'CAJA X 6 AMPOLLAS /3ML', '', '191173J', 'ACROMAX LABORATORIO QUIMICO FARMACEUTICO S.A.', '5743-MAN-03-10', '30/10/2019', '31/10/2022', '18', '0,47', '8,46');
INSERT INTO `hoja1` VALUES ('C01BD01TAB205X0', 'AMIODARONA TABLETA  200 MG NR', 'CAJA X 30 TABLETA', '', '0197-20', 'INDEUREC S.A.', 'GN-2060913', '28/2/2020', '28/2/2023', '1890', '0,33047', '624,5883');
INSERT INTO `hoja1` VALUES ('N06AA09TAB222X0', 'AMITRIPTILINA TABLETA 25 MG NR', 'CAJA X 50 TABLETAS', '', '1730119', 'PSICOFARMA S.A.', '26-484-06-058', '30/1/2019', '31/1/2023', '23400', '0,1', '2340');
INSERT INTO `hoja1` VALUES ('J01CA04CAP339X0', 'AMOXICILINA CÁPSULA 500 MG NR', 'CAJA X 100 CÁPSULAS', '', '011018', 'CAPLIN POINT LABORATORIES LTDA', '429-MEE-0914', '1/10/2018', '30/9/2021', '31100', '0,02712', '843,432');
INSERT INTO `hoja1` VALUES ('J01CA04CAP339X0', 'AMOXICILINA CÁPSULA 500 MG NR', 'CAJA X 100 CÁPSULAS', '', '041018', 'CAPLIN POINT LABORATORIES LTDA', '429-MEE-0914', '1/10/2018', '30/9/2021', '19500', '0,02712', '528,84');
INSERT INTO `hoja1` VALUES ('J01CR02POS229G0', 'AMOXICILINA E INHIBIDORES DE LA ENZIMA POLVO PARA SUSPENSIÓN 250 + 62,5 MG/5 ML FRASCO X 100 ML', 'CAJA X 1 FRASCO 100ML', 'Amoxicilina + Ácido clavulánico', '1052399', 'LABORATORIOS NATURALES Y GENERICOS S. A. C.', 'GBE-1371-08-10', '30/5/2019', '31/5/2021', '133', '1,35', '179,55');
INSERT INTO `hoja1` VALUES ('J01CR02POI069X0', 'AMOXICILINA E INHIBIDORES DE LA ENZIMA POLVO PARA INYECCIÓN  1 000 MG + 200 MG  NR', 'CAJA X 10 FRASCO 10', 'Amoxicilina + Ácido clavulánico', '0620004', 'BETAPHARMA S.A.', '2631-MEN-0420', '1/6/2020', '30/6/2022', '27020', '0,0799', '2158,898');
INSERT INTO `hoja1` VALUES ('J01CR02TAR337X0', 'AMOXICILINA E INHIBIDORES DE LA ENZIMA TABLETA RECUBIERTA 500 + 125 MG NR', 'CAJA X 80 TABLETAS', 'Amoxicilina + Ácido clavulánico', 'KG3595', 'LEK PHARMACEUTICALS', 'H6910913', '1/12/2019', '30/12/2021', '9920', '0,0799', '792,608');
INSERT INTO `hoja1` VALUES ('J01CA04POS238G0', 'AMOXICILINA POLVO PARA SUSPENSIÓN 250 MG/5 ML FRASCO X 100 ML', 'FRASCO X 100 ML', '', '0419934', 'BETAPHARMA S.A.', '03669-MAN-06-05', '30/4/2019', '30/4/2022', '365', '2,22', '810,3');
INSERT INTO `hoja1` VALUES ('J01CA04POS238G0', 'AMOXICILINA POLVO PARA SUSPENSIÓN 250 MG/5 ML FRASCO X 100 ML', 'FRASCO X 100 ML', '', '0519956', 'BETAPHARMA S.A.', '03669-MAN-06-05', '30/5/2019', '31/5/2022', '160', '2,22', '355,2');
INSERT INTO `hoja1` VALUES ('J01CR01POI123X0', 'AMPICILINA E INHIBIDORES DE LA ENZIMA POLVO PARA INYECCIÓN 1 000 MG + 500 MG NR', 'CAJA X 10  FRASCO', '', '1019161', 'BETAPHARMA S.A.', '03491-MAN-03-05', '1/10/2019', '30/10/2021', '500', '0,44', '220');
INSERT INTO `hoja1` VALUES ('J01CR01POI123X0', 'AMPICILINA E INHIBIDORES DE LA ENZIMA POLVO PARA INYECCIÓN 1 000 MG + 500 MG NR', 'CAJA X 10  FRASCO', '', '1020178', 'BETAPHARMA S.A.', '03491-MAN-03-05', '1/10/2020', '30/10/2022', '4010', '0,44', '1764,4');
INSERT INTO `hoja1` VALUES ('J01CA01POI121X0', 'AMPICILINA POLVO PARA INYECCIÓN 500 MG NR', 'CAJA X 50 AMPOLLAS', '', '193012020', 'REYOUNG PHARMACEUTICAL CO. LTD.', '2114-MEE-0516', '1/6/2019', '30/6/2022', '2000', '0,11', '220');
INSERT INTO `hoja1` VALUES ('J01CA01POI121X0', 'AMPICILINA POLVO PARA INYECCIÓN 1 000 MG NR', 'CAJA X 50 AMPOLLAS', '', '193012002', 'REYOUNG PHARMACEUTICAL CO. LTD.', '2124-MEE-0516', '1/2/2019', '28/2/2022', '5000', '0,165', '825');
INSERT INTO `hoja1` VALUES ('C07AB03TAB329X0', 'ATENOLOL TABLETA  50 MG NR', 'CAJA X 100 TABLETAS', '', 'A0049', 'AUROCHEM LABORATORIES (I) PVT. LTD', '2715-MEE-0517', '1/1/2020', '30/12/2022', '3000', '0,0135', '40,5');
INSERT INTO `hoja1` VALUES ('A03BA01SOY081A0', 'ATROPINA SOLUCIÓN INYECTABLE  1 MG/ML AMPOLLA X 1 ML', 'CAJA X100AMPOLLAS /1ML', '', '19.08.2692', 'LABORATORIO BIOSANO S.A', '25-450-11-03', '30/8/2019', '31/8/2021', '1600', '0,3', '480');
INSERT INTO `hoja1` VALUES ('A03BA01SOY081A0', 'ATROPINA SOLUCIÓN INYECTABLE  1 MG/ML AMPOLLA X 1 ML', 'CAJA X100AMPOLLAS /1ML', '', '75ND0755', 'LABORATORIO SANDERSON S.A.', '20-971-1-12-03', '1/4/2019', '30/4/2022', '1100', '0,3', '330');
INSERT INTO `hoja1` VALUES ('J01FA10TAB339X0', 'AZITROMICINA TABLETA  500 MG NR', 'CAJA X 4 TABLETAS', '', '810V', 'LABORATORIOS ROCNARF S.A.', 'GBN1870513', '1/6/2020', '30/6/2022', '1252', '0,0448', '56,0896');
INSERT INTO `hoja1` VALUES ('J01CE08POI138X0', 'BENCILPENICILINA BENZATÍNICA POLVO PARA INYECCIÓN 1 200 000 UI NR', 'CAJA X 50 AMPOLLAS', '', '193012003', 'REYOUNG PHARMACEUTICAL CO. LTD.', '2309-MEE-0716', '1/2/2019', '28/2/2022', '150', '0,169', '25,35');
INSERT INTO `hoja1` VALUES ('J01CE08POI219X0', 'BENCILPENICILINA BENZATÍNICA POLVO PARA INYECCIÓN 2 4000 000 UI NR', 'CAJA X 50 AMPOLLAS', '', '183012012', 'REYOUNG PHARMACEUTICAL CO. LTD.', '2122-MEE-0516', '30/4/2018', '30/4/2021', '450', '0,33', '148,5');
INSERT INTO `hoja1` VALUES ('J01CE08POI367X0', 'BENCILPENICILINA BENZATÍNICA POLVO PARA INYECCIÓN 600 000 UI NR', 'CAJA X 50 AMPOLLAS', '', '193012005', 'REYOUNG PHARMACEUTICAL CO. LTD.', '2011-MEE-0416', '1/2/2019', '28/2/2022', '250', '0,17', '42,5');
INSERT INTO `hoja1` VALUES ('J01CE01POI352X0', 'BENCILPENICILINA POLVO PARA INYECCIÓN 5 000 000 UI NR', 'CAJA X 10 AMPOLLAS', '', '1119060', 'BETAPHARMA S.A.', 'GBN-0662-05-05', '30/11/2019', '30/11/2021', '300', '0,45', '135');
INSERT INTO `hoja1` VALUES ('N04AA02TAB178X0', 'BIPERIDENO TABLETA 2 MG NR', 'CAJA X 100 TABLETAS', '', '2020290', 'LABORATORIOS AC FARMA S.A.', '2072-MEE-0518', '28/2/2020', '28/2/2022', '5300', '0,06', '318');
INSERT INTO `hoja1` VALUES ('N01BB51SOY053A4', 'BUPIVACAÍNA, COMBINACIONES  SOLUCIÓN INYECTABLE 0,75 % AMPOLLA X 4 ML', 'CAJA X 24 AMPOLLAS/4ML', 'Bupivacaína hiperbárica', '00017', 'ROPSOHN LABORATORIOS LTDA.', '03388-MAE-12-04', '1/1/2020', '30/12/2022', '480', '2,53', '1214,4');
INSERT INTO `hoja1` VALUES ('A03BB01SOY200A0', 'BUTILESCOPOLAMINA SOLUCIÓN INYECTABLE  20 MG/ML AMPOLLA X 1 ML', 'CAJA X 100  AMPOLLAS/1ML', '', '75MF0924', 'LABORATORIO SANDERSON S.A.', '27-767-07-07', '30/7/2018', '30/6/2022', '2100', '0,295', '619,5');
INSERT INTO `hoja1` VALUES ('A03BB01SOY200A0', 'BUTILESCOPOLAMINA SOLUCIÓN INYECTABLE  20 MG/ML AMPOLLA X 1 ML', 'CAJA X 100  AMPOLLAS/1ML', '', '75ML2122', 'LABORATORIO SANDERSON S.A.', '27-767-07-07', '30/11/2018', '30/11/2022', '6100', '0,295', '1799,5');
INSERT INTO `hoja1` VALUES ('A03BB01SOY200A0', 'BUTILESCOPOLAMINA SOLUCIÓN INYECTABLE  20 MG/ML AMPOLLA X 1 ML', 'CAJA X 100  AMPOLLAS/1ML', '', '75ML2123', 'LABORATORIO SANDERSON S.A.', '27-767-07-07', '30/11/2018', '30/11/2022', '200', '0,295', '59');
INSERT INTO `hoja1` VALUES ('N04BC06TAB048X0', 'CABERGOLINA TABLETA 0,5 MG NR', 'CAJA X 20 TABLETAS', '', '061801', 'QUALIPHARM LABORATORIO FARMACEUTICO S.A.', '360000312', '30/6/2018', '30/6/2021', '482', '3,33', '1605,06');
INSERT INTO `hoja1` VALUES ('N04BC06TAB048X0', 'CABERGOLINA TABLETA 0,5 MG NR', 'CAJA X 4 TABLETAS', '', '0239-20', 'INDEUREC S.A.', '534-MEN-0915', '30/3/2020', '31/3/2023', '332', '3,33', '1105,56');
INSERT INTO `hoja1` VALUES ('D05AX52UNG325T3', 'CALCIPOTRIOL, COMBINACIONES  UNGÜENTO 50 MCG + 0,5 MG/G TUBO X 30 G', 'TUBO X 30G', '', 'H929', 'AUROCHEM LABORATORIES (I) PVT. LTD', '2157-MEE-0516', '30/8/2019', '31/7/2021', '1891', '7', '13237');
INSERT INTO `hoja1` VALUES ('A11CC04CAP047X0', 'CALCITRIOL CÁPSULA  0,5 MCG NR', 'CAJA X 30 CÁPSULAS BLANDAS', '', '19ST1107', 'FARMACID S.A.', '797-MEN-0516', '30/11/2019', '30/11/2021', '5130', '0,2', '1026');
INSERT INTO `hoja1` VALUES ('A11CC04CAP047X0', 'CALCITRIOL CÁPSULA  0,5 MCG NR', 'CAJA X 30 CÁPSULAS BLANDAS', '', '1257153', 'PROCAPS S.A.', 'H7141013', '30/6/2019', '30/6/2021', '1650', '0,2', '330');
INSERT INTO `hoja1` VALUES ('N03AF01SUS116X0', 'CARBAMAZEPINA SUSPENSIÓN  100 MG/5 ML NR', '', '', '20FI0301', 'FARMACID S.A.', '04434-MAN-10-06', '1/3/2020', '31/3/2023', '480', '0,5', '240');
INSERT INTO `hoja1` VALUES ('N03AF01TAB205X0', 'CARBAMAZEPINA TABLETA 200 MG NR', 'CAJA X 20 TABLETAS', '', '19DK0804R', 'FARMACID S.A.', '01157-MAC-1-04-11', '30/8/2021', '30/8/2021', '26610', '0,08', '2128,8');
INSERT INTO `hoja1` VALUES ('N03AF01TAB205X0', 'CARBAMAZEPINA TABLETA 200 MG NR', 'CAJA X 20 TABLETAS', '', '191131', 'PROPHAR S.A', '01157-MAC-1-04-11', '1/11/2019', '30/11/2023', '10400', '0,08', '832');
INSERT INTO `hoja1` VALUES ('N03AF01TAB205X0', 'CARBAMAZEPINA TABLETA 200 MG NR', 'CAJA X 20 TABLETAS', '', '190407', 'PROPHAR S.A', '01157-MAC-1-04-11', '1/4/2019', '30/4/2023', '4680', '0,08', '374,4');
INSERT INTO `hoja1` VALUES ('N03AF01TAR296X0', 'CARBAMAZEPINA TABLETA RECUBIERTA 400 MG NR', 'CAJA X 20 TABLETAS', '', '200201', 'PROPHAR S.A', '01270-MAC-1-02-12', '1/2/2020', '29/2/2024', '3860', '0,11', '424,6');
INSERT INTO `hoja1` VALUES ('B05BA03SOY088N1', 'CARBOHIDRATOS (DEXTROSA EN AGUA) SOLUCIÓN INYECTABLE  10% FRASCO/FUNDA X 1000 ML', 'CAJA X 16 BOLOS', '', '1900334', 'LABORATORIOS INDUSTRIALES FARMACEUTICOS ECUATORIANOS LIFE C.A.', 'GBN-0917-09-06', '01-30/2019', '31/1/2023', '128', '0,99', '126,72');
INSERT INTO `hoja1` VALUES ('B05BA03SOY335U4', 'CARBOHIDRATOS (DEXTROSA EN AGUA) SOLUCIÓN INYECTABLE  50% FUNDA X 500  ML', 'CAJA X 40 BOLOS', '', 'SB18LL5', 'LABORATORIOS BAXTER S.A CALI-COLOMBIA', '21-254-1-04-04', '1/12/2018', '31/12/2020', '150', '1,75', '262,5');
INSERT INTO `hoja1` VALUES ('B05BA03SOY335U4', 'CARBOHIDRATOS (DEXTROSA EN AGUA) SOLUCIÓN INYECTABLE  50% FUNDA X 500  ML', 'CAJA X 40 BOLOS', '', 'SB19KF0', 'LABORATORIOS BAXTER S.A CALI-COLOMBIA', '21-254-1-04-04', '1/11/2019', '30/11/2021', '480', '1,75', '840');
INSERT INTO `hoja1` VALUES ('B05BA03SOY310N1', 'CARBOHIDRATOS (DEXTROSA EN AGUA) SOLUCIÓN INYECTABLE  5% FRASCO/FUNDA X 1000 ML', 'CAJA X 16 BOLOS', '', '1803893', 'LABORATORIOS INDUSTRIALES FARMACEUTICOS ECUATORIANOS LIFE C.A.', 'GBN-0917-09-06', '1/7/2020', '31/7/2022', '1952', '0,7154', '1396,4608');
INSERT INTO `hoja1` VALUES ('B05BA03SOY310N1', 'CARBOHIDRATOS (DEXTROSA EN AGUA) SOLUCIÓN INYECTABLE  5% FRASCO/FUNDA X 1000 ML', 'CAJA X 16 BOLOS', '', '180655', 'LABORATORIOS INDUSTRIALES FARMACEUTICOS ECUATORIANOS LIFE C.A.', 'GBN-0917-09-06', '1/12/2019', '31/12/2022', '592', '0,7154', '423,5168');
INSERT INTO `hoja1` VALUES ('B05BA03SOY310N1', 'CARBOHIDRATOS (DEXTROSA EN AGUA) SOLUCIÓN INYECTABLE  5% FRASCO/FUNDA X 1000 ML', 'CAJA X 16 BOLOS', '', '2000592', 'LABORATORIOS INDUSTRIALES FARMACEUTICOS ECUATORIANOS LIFE C.A.', 'GBN-0917-09-06', '1/2/2020', '28/2/2024', '1680', '0,7154', '1201,872');
INSERT INTO `hoja1` VALUES ('B05BA03SOY310N1', 'CARBOHIDRATOS (DEXTROSA EN AGUA) SOLUCIÓN INYECTABLE  5% FRASCO/FUNDA X 1000 ML', 'CAJA X 16 BOLOS', '', '1806556', 'LABORATORIOS INDUSTRIALES FARMACEUTICOS ECUATORIANOS LIFE C.A.', 'GBN-0917-09-06', '1/12/2019', '30/12/2022', '3504', '0,7154', '2506,7616');
INSERT INTO `hoja1` VALUES ('B05BA03SOY310N3', 'CARBOHIDRATOS (DEXTROSA EN AGUA) SOLUCIÓN INYECTABLE  5% FRASCO/FUNDA X 500 ML', 'CAJA X 40 BOLOS', '', '2000097', 'LABORATORIOS INDUSTRIALES FARMACEUTICOS ECUATORIANOS LIFE C.A.', 'GBN-0917-09-06', '1/1/2018', '1/1/2023', '800', '1,21', '968');
INSERT INTO `hoja1` VALUES ('B05BA03SOY310N3', 'CARBOHIDRATOS (DEXTROSA EN AGUA) SOLUCIÓN INYECTABLE  5% FRASCO/FUNDA X 500 ML', 'CAJA X 40 BOLOS', '', '2000098', 'LABORATORIOS INDUSTRIALES FARMACEUTICOS ECUATORIANOS LIFE C.A.', 'GBN-0917-09-06', '1/1/2018', '1/1/2023', '1732', '1,21', '2095,72');
INSERT INTO `hoja1` VALUES ('B05BA03SOY310N3', 'CARBOHIDRATOS (DEXTROSA EN AGUA) SOLUCIÓN INYECTABLE  5% FRASCO/FUNDA X 500 ML', 'CAJA X 40 BOLOS', '', '2001554', 'LABORATORIOS INDUSTRIALES FARMACEUTICOS ECUATORIANOS LIFE C.A.', 'GBN-0917-09-06', '1/5/2019', '30/5/2023', '3600', '1,21', '4356');
INSERT INTO `hoja1` VALUES ('B05BA03SOY310N3', 'CARBOHIDRATOS (DEXTROSA EN AGUA) SOLUCIÓN INYECTABLE  5% FRASCO/FUNDA X 500 ML', 'CAJA X 40 BOLOS', '', '2001556', 'LABORATORIOS INDUSTRIALES FARMACEUTICOS ECUATORIANOS LIFE C.A.', 'GBN-0917-09-06', '1/5/2019', '30/5/2023', '1712', '1,21', '2071,52');
INSERT INTO `hoja1` VALUES ('A07BA01POL000X0', 'CARBÓN MEDICINAL POLVO  ND NR', 'FUNDA X 50G', '', 'GAMA-2019011701', 'HANGZHOU NATURE TECHNOLOGY CO., LTD.', '', '1/7/2019', '17/1/2022', '14', '1,29', '18,06');
INSERT INTO `hoja1` VALUES ('C07AG02TAB357X0', 'CARVEDILOL TABLETA  6,25 MG NR', 'CAJA X 100 TABLETAS', '', '1041349', 'LABORATORIOS AC FARMA S.A.', '2098-MEE-0516', '30/4/2019', '30/4/2022', '17000', '0,022', '374');
INSERT INTO `hoja1` VALUES ('C07AG02TAB357X0', 'CARVEDILOL TABLETA  6,25 MG NR', 'CAJA X 100 TABLETAS', '', '2030220', 'LABORATORIOS AC FARMA S.A.', '2098-MEE-0516', '30/3/2020', '31/3/2023', '2900', '0,022', '63,8');
INSERT INTO `hoja1` VALUES ('J01DB01CAP339X0', 'CEFALEXINA CÁPSULA 500 MG NR', 'CAJA X 100 CÁPSULAS', '', '0220629', 'BETAPHARMA S.A.', 'GBN-0755-06-05', '1/2/2020', '28/2/2022', '6600', '0,042', '277,2');
INSERT INTO `hoja1` VALUES ('J01DB01POS238X0', 'CEFALEXINA POLVO PARA SUSPENSIÓN  250 MG/5 ML NR', 'FRASCO 60ML', '', '093V', 'LABORATORIOS ROCNARF S.A.', 'GB-0036-2-0911', '30/12/2019', '30/6/2021', '107', '1,8', '192,6');
INSERT INTO `hoja1` VALUES ('J01DD02POI121X0', 'CEFTAZIDIMA POLVO PARA INYECCIÓN 1 000 MG NR', 'CAJA X 10 AMPOLLAS', '', '200601', 'HUNAN KELUN PHARMACEUTICA CO. LTD', '2258-MEE0616', '17/6/2020', '16/6/2022', '1500', '1,0241', '1536,15');
INSERT INTO `hoja1` VALUES ('J01DD04POI121X0', 'CEFTRIAXONA POLVO PARA INYECCIÓN 1 000 MG NR', 'CAJA X 10 FRASCO', '', '0520083', 'BETAPHARMA S.A.', 'GBN-0580-03-50', '1/5/2020', '30/5/2022', '5000', '1,21', '6050');
INSERT INTO `hoja1` VALUES ('J01MA02TAB339X0', 'CIPROFLOXACINO TABLETA 500 MG NR', 'CAJA X 100', '', '030319', 'CSPC OUYI PHARMACEUTICAL CO, LTD.', '3108-MEE-117', '30/3/2019', '28/2/2022', '8100', '0,027', '218,7');
INSERT INTO `hoja1` VALUES ('J01MA02TAR339X0', 'CIPROFLOXACINO TABLETA RECUBIERTA 500 MG NR', 'CAJA X 30 TABLETAS', '', '19BL0705', 'FARMACID S.A.', '02069-MAC-07-02', '30/7/2019', '31/7/2022', '390', '0,027', '10,53');
INSERT INTO `hoja1` VALUES ('J01MA02SOY183G0', 'CIPROFLOXACINO SOLUCIÓN INYECTABLE  2 MG/ML FRASCO X 100 ML', 'FRASCO X 100ML', '', 'CP219202', 'CAPLIN POINT LABORATORIES LTDA', '2415-MEE-0916', '1/3/2019', '28/2/2021', '250', '3,17', '792,5');
INSERT INTO `hoja1` VALUES ('J01MA02SOY183G0', 'CIPROFLOXACINO SOLUCIÓN INYECTABLE  2 MG/ML FRASCO X 100 ML', 'FRASCO X 100ML', '', '73C9DO182', 'CAPLIN POINT LABORATORIES LTDA', '1044-MEE-0915', '1/4/2019', '30/4/2021', '792', '3,17', '2510,64');
INSERT INTO `hoja1` VALUES ('J01FF01SOY160A4', 'CLINDAMICINA SOLUCIÓN INYECTABLE 150 MG/ML AMPOLLA X 4 ML', 'CAJA X 10 MPOLLAS MG/4MG', '', 'P200635', 'VITALIS', 'GBE-0574-03-05', '1/3/2020', '31/3/2022', '4310', '0,3753', '1617,543');
INSERT INTO `hoja1` VALUES ('J01FF01SOY160A4', 'CLINDAMICINA SOLUCIÓN INYECTABLE 150 MG/ML AMPOLLA X 4 ML', 'CAJA X 10 MPOLLAS MG/4MG', '', 'P200029', 'VITALIS', 'GBE-0574-03-05', '1/1/2020', '31/1/2022', '15', '0,3753', '5,6295');
INSERT INTO `hoja1` VALUES ('G03GB02TAB329X0', 'CLOMIFENO TABLETA 50 MG NR', 'CAJA X 10 TABLETAS', '', '8A3149', 'LABORATORIOS SYNTHESIS LTDA. & CIA. S.C.A.', '760-MEE-0215', '30/5/2018', '31/5/2021', '1370', '0,25', '342,5');
INSERT INTO `hoja1` VALUES ('G03GB02TAB329X0', 'CLOMIFENO TABLETA 50 MG NR', 'CAJA X 10 TABLETAS', '', '0A2149', 'LABORATORIOS SYNTHESIS LTDA. & CIA. S.C.A.', '760-MEE-0215', '1/5/2018', '30/5/2021', '1200', '0,25', '300');
INSERT INTO `hoja1` VALUES ('B01AC04TAR380X0', 'CLOPIDOGREL TABLETA RECUBIERTA  75 MG NR', 'CAJA X 30 TABLETAS RECUBIERTAS', '', '19SL1120', 'FARMACID S.A.', '875-MEN-0616', '30/11/2019', '30/11/2021', '8490', '0,023', '195,27');
INSERT INTO `hoja1` VALUES ('A01AB03SOB031X0', 'CLORHEXIDINA SOLUCIÓN BUCAL  0,12 % NR', 'FRASCO  300ML', '', '19EE01002', 'FARMACID S.A.', '303--MEN-0315', '1/1/2019', '31/1/2021', '176', '4,21933', '742,60208');
INSERT INTO `hoja1` VALUES ('D08AC02SOT185X0', 'CLORHEXIDINA SOLUCIÓN TÓPICA 2% NR', 'JABONOSO FRASCO X 250ML', '', 'LJ190306', 'LABORATORIOS LIRA S.A.', '1178-MEN-0717', '1/3/2019', '31/3/2021', '700', '4,8', '3360');
INSERT INTO `hoja1` VALUES ('D08AC02SOT185X0', 'CLORHEXIDINA SOLUCIÓN TÓPICA 2% NR', 'JABONOSO FRASCO X 250ML', '', 'LJ190416', 'LABORATORIOS LIRA S.A.', '1178-MEN-0717', '1/3/2019', '31/3/2021', '3600', '4,8', '17280');
INSERT INTO `hoja1` VALUES ('D08AC02SOT185X0', 'CLORHEXIDINA SOLUCIÓN TÓPICA 2% NR', 'ACUOSO FRASCO X 500ML', '', 'LA190513', 'LABORATORIOS LIRA S.A.', '6128-MAN-06-11', '19/5/2019', '31/5/2021', '480', '4,8', '2304');
INSERT INTO `hoja1` VALUES ('D08AC02SOT185X0', 'CLORHEXIDINA SOLUCIÓN TÓPICA 2% NR', 'ACUOSO FRASCO X 500ML', '', 'LA190410', 'LABORATORIOS LIRA S.A.', '6128-MAN-06-11', '19/3/2019', '30/3/2021', '720', '4,8', '3456');
INSERT INTO `hoja1` VALUES ('D08AC02SOT185X0', 'CLORHEXIDINA SOLUCIÓN TÓPICA 2% NR', 'ACUOSO FRASCO X 500ML', '', 'LA190304', 'LABORATORIOS LIRA S.A.', '6128-MAN-06-11', '19/3/2021', '30/3/2021', '3588', '4,8', '17222,4');
INSERT INTO `hoja1` VALUES ('D08AC02SOT284X0', 'CLORHEXIDINA SOLUCIÓN TÓPICA 4% NR', 'FRASCO 500ML', '', '1806410', 'LABORATORIOS INDUSTRIALES FARMACEUTICOS ECUATORIANOS LIFE C.A.', '631-MEN-0116', '30/12/2017', '31/12/2021', '840', '7', '5880');
INSERT INTO `hoja1` VALUES ('D08AC02SOT284X0', 'CLORHEXIDINA SOLUCIÓN TÓPICA 4% NR', 'FRASCO 500ML', '', '1901395', 'LABORATORIOS INDUSTRIALES FARMACEUTICOS ECUATORIANOS LIFE C.A.', '631-MEN-0116', '1/4/2017', '30/4/2022', '1490', '7', '10430');
INSERT INTO `hoja1` VALUES ('N05AA01SOY224A2', 'CLORPROMAZINA SOLUCIÓN INYECTABLE 25 MG/2 ML AMPOLLA X 2 ML', 'CAJA /2ML', '', '75LF1092', 'LABORATORIO SANDERSON S.A.', 'GBE-00088-01-02-05', '4/7/2017', '30/6/2021', '200', '0,25', '50');
INSERT INTO `hoja1` VALUES ('C03BA04TAB329X0', 'CLORTALIDONA TABLETA  50 MG NR', 'CAJA X 30 TABLETAS', '', '191208', 'PROPHAR S.A', '01202-MAC-1-04-11', '24/12/2019', '31/12/2022', '18450', '0,08', '1476');
INSERT INTO `hoja1` VALUES ('B05XA01SOY177A1', 'CLORURO DE POTASIO SOLUCIÓN INYECTABLE  2 MEQ/ML (20 %) AMPOLLA X 10 ML', 'CAJA X 40 VÍALES', '', '90157', 'HOSPIMEDIKKA CIA. LTDA.', '03136-MAE-06-04', '1/3/2019', '28/2/2022', '1160', '0,35', '406');
INSERT INTO `hoja1` VALUES ('B05CB01SOY056U4', 'CLORURO DE SODIO SOLUCIÓN INYECTABLE  0,9 % FUNDA X 500  ML', 'CAJA X 25 VÍALES', '', '20001556', 'LABORATORIOS INDUSTRIALES FARMACEUTICOS ECUATORIANOS LIFE C.A.', 'GBN-0977-09-08', '1/5/2019', '30/1/2023', '1955', '0,66', '1290,3');
INSERT INTO `hoja1` VALUES ('B05XA03SOY251A1', 'CLORURO DE SODIO SOLUCIÓN INYECTABLE  3,4 MEQ/ML (20%) AMPOLLA X 10 ML', '', '', '20000763', 'LABORATORIOS INDUSTRIALES FARMACEUTICOS ECUATORIANOS LIFE C.A.', '02384-MAC-01-03', '1/4/2020', '30/4/2025', '920', '0,46', '423,2');
INSERT INTO `hoja1` VALUES ('B05XA03SOY251A1', 'CLORURO DE SODIO SOLUCIÓN INYECTABLE  3,4 MEQ/ML (20%) AMPOLLA X 10 ML', '', '', '20000764', 'LABORATORIOS INDUSTRIALES FARMACEUTICOS ECUATORIANOS LIFE C.A.', '02384-MAC-01-03', '1/4/2020', '30/4/2025', '380', '0,46', '174,8');
INSERT INTO `hoja1` VALUES ('G01AF02CRV066T5', 'CLOTRIMAZOL CREMA VAGINAL 1% TUBO X 40 G + APLICADORES', 'TUBO X 40G', '', '9GC4878A', 'LABORATORIOS GENERICOS FARMACEUTICOS ECUATORIANOS S.A. GENFAR ECUADOR', '02022-MAC-06-02', '30/9/2019', '30/9/2022', '964', '0,9265', '893,146');
INSERT INTO `hoja1` VALUES ('G01AF02CRV066T5', 'CLOTRIMAZOL CREMA VAGINAL 1% TUBO X 40 G + APLICADORES', 'TUBO X 40G', '', '0GC0592A', 'LABORATORIOS GENERICOS FARMACEUTICOS ECUATORIANOS S.A. GENFAR ECUADOR', '02022-MAC-06-02', '28/2/2020', '31/1/2023', '2444', '0,9265', '2264,366');
INSERT INTO `hoja1` VALUES ('G01AF02CRV185T2', 'CLOTRIMAZOL CREMA VAGINAL 2% TUBO X 20 G + APLICADORES', 'TUBO X20G', '', 'E8027', 'CURETECH SKINCARE. PLOT NO.33&34, PHASE IV, BHATOLI KALAN, BADDI', '2299-MEE-0716', '28/2/2018', '31/1/2021', '480', '0,3663', '175,824');
INSERT INTO `hoja1` VALUES ('B05CB10SOY000U5', 'COMBINACIONES SOLUCIÓN INYECTABLE  ND FUNDA X 1000 ML', 'CAJA X 16 BOLOS', 'Lactato de ringer', '2001204', 'LABORATORIOS INDUSTRIALES FARMACEUTICOS ECUATORIANOS LIFE C.A.', '', '30/4/2020', '30/4/2024', '1792', '0,7146', '1280,5632');
INSERT INTO `hoja1` VALUES ('B05CB10SOY000U5', 'COMBINACIONES SOLUCIÓN INYECTABLE  ND FUNDA X 1000 ML', 'CAJA X 16 BOLOS', 'Lactato de ringer', '2001632', 'LABORATORIOS INDUSTRIALES FARMACEUTICOS ECUATORIANOS LIFE C.A.', '', '30/5/2020', '30/5/2024', '912', '0,7146', '651,7152');
INSERT INTO `hoja1` VALUES ('B05CB10SOY000U5', 'COMBINACIONES SOLUCIÓN INYECTABLE  ND FUNDA X 1000 ML', 'CAJA X 16 BOLOS', 'Lactato de ringer', '2001203', 'LABORATORIOS INDUSTRIALES FARMACEUTICOS ECUATORIANOS LIFE C.A.', '', '30/4/2020', '30/4/2024', '1648', '0,7146', '1177,6608');
INSERT INTO `hoja1` VALUES ('B05CB10SOY000U5', 'COMBINACIONES SOLUCIÓN INYECTABLE  ND FUNDA X 1000 ML', 'CAJA X 16 BOLOS', 'Lactato de ringer', '2001633', 'LABORATORIOS INDUSTRIALES FARMACEUTICOS ECUATORIANOS LIFE C.A.', '', '30/5/2020', '30/4/2024', '2291', '0,7146', '1637,1486');
INSERT INTO `hoja1` VALUES ('J04BA02TAB105X0', 'DAPSONA TABLETA 100 MG NR', 'CAJA X 50 TABLETAS', '', '0001', 'LABORATORIO LAZAR ECUADOR S.A. LAZARECSA', 'GBE-1314-10-09', '30/9/2018', '30/9/2021', '250', '0,26332', '65,83');
INSERT INTO `hoja1` VALUES ('', 'DEXAMETASONA Y ANTIINFECCIOSOS UNGUENTO OFTALMICO 0.1%+0.3% NR', 'CREMA 3,5G', '', '00170', 'LABORATORIO ROEMMERS S.A', '25,567,02,04', '25/11/2019', '30/11/2021', '150', '5,35', '802,5');
INSERT INTO `hoja1` VALUES ('S01CA01SUF025F0', 'DEXAMETASONA Y ANTIINFECCIOSOS SUSPENSIÓN OFTÁLMICA 0,1 % + 0,3 % FRASCO X 5 ML', 'GOTASX 5ML', '', '00346', 'LABORATORIOS POEN S.A.', '23,709-1-05-11', '10/12/2019', '30/12/2021', '197', '5,33', '1050,01');
INSERT INTO `hoja1` VALUES ('S01CA01SUF025F0', 'DEXAMETASONA Y ANTIINFECCIOSOS SUSPENSIÓN OFTÁLMICA 0,1 % + 0,3 % FRASCO X 5 ML', 'GOTASX 5ML', '', '00336', 'LABORATORIOS POEN S.A.', '23,709-1-05-11', '1/7/2019', '30/7/2021', '240', '5,33', '1279,2');
INSERT INTO `hoja1` VALUES ('N05BA01SOY320A2', 'DIAZEPAM SOLUCIÓN INYECTABLE 5 MG/ML AMPOLLA X 2 ML', 'CAJA X 100 AMPOLLAS', '', '17.08.1288', 'LABORATORIO BIOSANO S.A', 'GBE-00123-1-03-07', '1/8/2017', '31/8/2021', '700', '0,3122', '218,54');
INSERT INTO `hoja1` VALUES ('N05BA01SOY320A2', 'DIAZEPAM SOLUCIÓN INYECTABLE 5 MG/ML AMPOLLA X 2 ML', 'CAJA X 100 AMPOLLAS', '', '18.01.1437', 'LABORATORIO BIOSANO S.A', 'GBE-00123-1-03-07', '30/1/2018', '31/1/2022', '1600', '0,3122', '499,52');
INSERT INTO `hoja1` VALUES ('J01CF01CAP339X0', 'DICLOXACILINA CÁPSULA 500 MG NR', 'CAJA X 50  CÁPSULAS', '', 'DCL5111908', 'WEXFORD LABORATORIES PVT. LTD', '362040912', '30/11/2019', '30/11/2022', '3400', '0,12', '408');
INSERT INTO `hoja1` VALUES ('C01AA05SOY038A2', 'DIGOXINA SOLUCIÓN INYECTABLE  0,25 MG/ML AMPOLLA X 2 ML', 'CAJA X 1 FRASCO DE 60ML', '', 'N-13570', 'CARITAS HEALTHCARE PVT. LTDA', '1444-MEE-1015', '1/4/2019', '31/3/2022', '50', '3,95', '197,5');
INSERT INTO `hoja1` VALUES ('N07CA00TAB329X0', 'DIMENHIDRINATO TABLETA 50 MG NR', 'CAJA X 100 TABLETAS', '', '1806324', 'LABORATORIOS ECAR S.A.', '03174-MAE-07-04', '30/6/2018', '30/6/2021', '8300', '0,01881', '156,123');
INSERT INTO `hoja1` VALUES ('N07CA00TAB329X0', 'DIMENHIDRINATO TABLETA 50 MG NR', 'CAJA X 100 TABLETAS', '', '2001038', 'LABORATORIOS ECAR S.A.', '03174-MAE-07-04', '30/12/2019', '31/12/2022', '4700', '0,01881', '88,407');
INSERT INTO `hoja1` VALUES ('C01CA07SOY334A5', 'DOBUTAMINA SOLUCIÓN INYECTABLE  50 MG/ML AMPOLLA X 5 ML', 'CAJA X 100 AMPOLLAS', '', '75OE0870', 'LABORATORIO SANDERSON S.A.', 'GBE-0538-02-05', '30/7/2018', '31/5/2021', '930', '1,143996', '1063,91628');
INSERT INTO `hoja1` VALUES ('C01CA07SOY334A5', 'DOBUTAMINA SOLUCIÓN INYECTABLE  50 MG/ML AMPOLLA X 5 ML', 'CAJA X 100 AMPOLLAS', '', '75NF1030', 'LABORATORIO SANDERSON S.A.', 'GBE-0538-02-05', '12/6/2019', '30/6/2022', '320', '1,144', '366,08');
INSERT INTO `hoja1` VALUES ('B05BB02SOY322U5', 'ELECTROLITOS CON CARBOHIDRATOS SOLUCIÓN INYECTABLE  5% + 0,9 % FUNDA X 1000 ML', 'CAJA X 16 BOLOS', 'DEXTROSA EN SOLUCIÓN SALINA', '1900235', 'LABORATORIOS INDUSTRIALES FARMACEUTICOS ECUATORIANOS LIFE C.A.', '02267-MAN', '1/1/2018', '30/1/2022', '1014', '1,11', '1125,54');
INSERT INTO `hoja1` VALUES ('B05BB02SOY322U5', 'ELECTROLITOS CON CARBOHIDRATOS SOLUCIÓN INYECTABLE  5% + 0,9 % FUNDA X 1000 ML', 'CAJA X 16 BOLOS', 'DEXTROSA EN SOLUCIÓN SALINA', '1900435', 'LABORATORIOS INDUSTRIALES FARMACEUTICOS ECUATORIANOS LIFE C.A.', '02267-MAN', '1/1/2018', '30/1/2023', '1924', '1,11', '2135,64');
INSERT INTO `hoja1` VALUES ('B05BB02SOY322U5', 'ELECTROLITOS CON CARBOHIDRATOS SOLUCIÓN INYECTABLE  5% + 0,9 % FUNDA X 1000 ML', 'CAJA X 16 BOLOS', 'DEXTROSA EN SOLUCIÓN SALINA', '1900216', 'LABORATORIOS INDUSTRIALES FARMACEUTICOS ECUATORIANOS LIFE C.A.', '02267-MAN', '1/1/2018', '31/1/2022', '1184', '1,11', '1314,24');
INSERT INTO `hoja1` VALUES ('J05AR06TAR268X0', 'EMTRICITABINA, TENOFOVIR DISOPROXIL Y EFAVIRENZ TABLETA RECUBIERTA 200 MG + 300 MG + 600 MG NR', 'CAJA X 30 TABLETAS', 'TRES MARIA', 'BED8929A', 'MACLEODS PHARMACEUTICALS LTD.', 'JGSFVV6F89QB', '1/4/2019', '30/3/2021', '1200', '0,203', '243,6');
INSERT INTO `hoja1` VALUES ('J05AR06TAR268X0', 'EMTRICITABINA, TENOFOVIR DISOPROXIL Y EFAVIRENZ TABLETA RECUBIERTA 200 MG + 300 MG + 600 MG NR', 'CAJA X 30 TABLETAS', '', 'BED8830A', 'MACLEODS PHARMACEUTICALS LTD.', 'JGSFVV6F89QB', '30/4/2019', '30/3/2021', '3720', '0,203', '755,16');
INSERT INTO `hoja1` VALUES ('C09AA02SOY082A2', 'ENALAPRIL SOLUCIÓN INYECTABLE 1,25 MG/ML AMPOLLA X 2 ML', 'CAJA X 1 AMPOLLA /2ML', '', '00141', 'ROEMMERS S.A.', '29062-10-09', '30/8/2019', '31/8/2022', '750', '5,9399', '4454,925');
INSERT INTO `hoja1` VALUES ('C09AA02SOY082A2', 'ENALAPRIL SOLUCIÓN INYECTABLE 1,25 MG/ML AMPOLLA X 2 ML', 'CAJA X 1 AMPOLLA /2ML', '', '145', 'ROEMMERS S.A.', '29062-10-09', '1/12/2019', '30/12/2022', '184', '5,9399', '1092,9416');
INSERT INTO `hoja1` VALUES ('C09AA02TAB194X0', 'ENALAPRIL TABLETA 20 MG NR', 'CAJA X 20 TABLETAS', '', '200204', 'PROPHAR S.A', '02173-MAC-09-02', '26/2/2020', '28/2/2023', '11640', '0,08', '931,2');
INSERT INTO `hoja1` VALUES ('C09AA02TAB314X0', 'ENALAPRIL TABLETA 5 MG NR', 'CAJA X 50 TABLETAS', '', '0A0514B', 'TECNOQUIMICAS S.A.', '02083-MAC-07-02', '24/1/2020', '31/1/2023', '13300', '0,0187', '248,71');
INSERT INTO `hoja1` VALUES ('C01CA24SOY081A0', 'EPINEFRINA SOLUCIÓN INYECTABLE  1 MG/ML AMPOLLA X 1 ML', 'CAJA X 100 AMPOLLAS /1ML', '', '75NI1839', 'LABORATORIO SANDERSON S.A.', 'GBE-0090-1-05-05', '30/9/2019', '30/9/2021', '2900', '0,22', '638');
INSERT INTO `hoja1` VALUES ('R03AA01SOI455W0', 'EPINEFRINA SOLUCIÓN PARA INHALACIÓN  22,5 MG/ML (2,25 %) VIAL X 0,5 ML', 'CAJA X 30 AMPOLLAS /0,5ML', '', '926561', 'NEPHRON PHARMACEUTICALS CORPORATION', '29609-02-11', '28/2/2020', '28/2/2021', '270', '3,5', '945');
INSERT INTO `hoja1` VALUES ('C03DA01TAB105X0', 'ESPIRONOLACTONA TABLETA  100 MG NR', 'CAJA X 10 TABLETAS', '', '180787G', 'ACROMAX LABORATORIO QUIMICO FARMACEUTICO S.A.', 'GBN-1524-04-11', '30/7/2018', '31/7/2021', '23490', '0,16999', '3993,0651');
INSERT INTO `hoja1` VALUES ('C03DA01TAB222X0', 'ESPIRONOLACTONA TABLETA  25 MG NR', 'CAJA X 100 TABLETAS', '', '1030139', 'LABORATORIOS AC FARMA S.A.', '2666-MEE-0317', '30/3/2019', '31/3/2022', '5400', '0,02', '108');
INSERT INTO `hoja1` VALUES ('G03CA04CRV080X0', 'ESTRIOL CREMA VAGINAL  1 MG/G (0,1 %) NR', 'TUBO X 15G', '', '1051059', 'LABORATORIOS AC FARMA S.A.', '2092-MEE-0516', '1/3/2019', '30/5/2022', '378', '2,49', '941,22');
INSERT INTO `hoja1` VALUES ('G03CA04CRV080X0', 'ESTRIOL CREMA VAGINAL  1 MG/G (0,1 %) NR', 'TUBO X 15G', '', '1031039', 'LABORATORIOS AC FARMA S.A.', '2092-MEE-0516', '30/3/2019', '31/3/2022', '1344', '2,49', '3346,56');
INSERT INTO `hoja1` VALUES ('G03CA04CRV080X0', 'ESTRIOL CREMA VAGINAL  1 MG/G (0,1 %) NR', 'TUBO X 15G', '', '1120569', 'LABORATORIOS AC FARMA S.A.', '2092-MEE-0516', '30/12/2019', '31/12/2022', '349', '2,49', '869,01');
INSERT INTO `hoja1` VALUES ('L04AB01SOY329X0', 'ETANERCEPT SOLUCIÓN INYECTABLE 50 MG NR', 'CAJA X 1 VÍAL', '', '0F1603', 'PFIZER IRELAND PHARMACEUTICALS GRANGE CASTLE DUBLIN, IRLANDA', '140-MBE-0619', '1/7/2019', '30/6/2022', '8', '249,8573', '1998,8584');
INSERT INTO `hoja1` VALUES ('G03AC08IMP373X0', 'LEVONOGESTREL SÓLIDO PARENTERAL (IMPLANTE SUBDÉRMICO ) 150 MG  2 VARILLAS DE 75MG CAJ X IMPLNTES(S) DE 75MG C/U+ TROCAR', 'CAJA X 10 ', '', 'TU02D0E', 'BAYER S.A.', '', '1/6/2019', '30/6/2024', '100', '16,56', '1656');
INSERT INTO `hoja1` VALUES ('G03AC08IMP373X0', 'ETONOGESTREL IMPLANTE 68 MG NR', 'CAJA X 1', '', 'R031547', 'MERCK SHARP & DOHME INTER AMERICAN CORPORATION', '29951-07-11', '16/7/2018', '31/7/2023', '102', '16,56', '1689,12');
INSERT INTO `hoja1` VALUES ('N03AB02SOY334A5', 'FENITOÍNA SOLUCIÓN INYECTABLE 50 MG/ML AMPOLLA X 5 ML', 'CAJA X 10/5ML', '', 'P200637', 'LABVITALIS S.A.', 'GBE831012', '30/4/2020', '30/4/2022', '15', '0,98', '14,7');
INSERT INTO `hoja1` VALUES ('N03AB02SUS142G1', 'FENITOÍNA SUSPENSIÓN 125 MG/5 ML FRASCO X 120 ML', 'FRASCO', '', 'CH7770', 'PFIZER CIA. LTDA.', '30156-03-12', '30/7/2019', '30/6/2021', '182', '3,5', '637');
INSERT INTO `hoja1` VALUES ('B02BA01SOY097A0', 'FITOMENADIONA SOLUCIÓN INYECTABLE  10 MG/ML AMPOLLA X 1 ML', 'CAJA X 10 AMPOLLAS ', '', '1802266411', 'CISEN PHARMACEUTICAL CO., LTD', '2044-MEE-0416', '27/2/2018', '28/2/2021', '1340', '0,066012', '88,45608');
INSERT INTO `hoja1` VALUES ('B02BA01SOY097A0', 'FITOMENADIONA SOLUCIÓN INYECTABLE  10 MG/ML AMPOLLA X 1 ML', 'CAJA X 100 AMPOLLAS', '', '19.07.2688', 'LABORATORIO BIOSANO S.A', 'GBE-00405-02-04', '30/7/2019', '31/7/2022', '200', '0,066012', '13,2024');
INSERT INTO `hoja1` VALUES ('J02AC01TAB158X0', 'FLUCONAZOL TABLETA 150 MG NR', 'CAJA X 100', '', 'C9029', 'AUROCHEM LABORATORIES (I) PVT. LTD', '2702-MEE-0517', '1/3/2019', '28/2/2022', '1500', '0,0354', '53,1');
INSERT INTO `hoja1` VALUES ('V03AB25SOY027A5', 'FLUMAZENIL SOLUCIÓN INYECTABLE 0,1 MG/ML AMPOLLA X 5 ML', 'CAJA X 5 AMPOLLAS/5ML', '', '750C0326', 'LABORATORIO SANDERSON S.A.', 'GBE-118-05-08', '10/6/2019', '31/3/2022', '60', '2,9', '174');
INSERT INTO `hoja1` VALUES ('L02BB01TAB232X0', 'FLUTAMIDA TABLETA 250 MG NR', 'CAJA X 30 TABLETAS', '', '03714', 'ASOFARMA DE MEXICO S.A.', '29592-1-01-11', '30/12/2019', '31/12/2022', '27900', '1,05', '29295');
INSERT INTO `hoja1` VALUES ('A07CA00POL000X0', 'FORMULACIONES DE SALES DE REHIDRATACIÓN ORAL POLVO  ND NR', 'CAJA X 30 SOBRES', '', '12819', 'LABORATORIOS CHALVER DE COLOMBIA S.A', '1377-MEE-0915', '30/7/2019', '31/7/2021', '900', '0,28', '252');
INSERT INTO `hoja1` VALUES ('FMSE', 'FORMULA MATERNIZADA SEGUNDA ETAPA', 'TARRO X 400G ', '', '500125', 'ASPEN MÉXICO, S. DE R.L. DE C.V.', '110143E-MAN', '', '25/8/2021', '11', '5,74363', '63,17993');
INSERT INTO `hoja1` VALUES ('FMTE', 'FORMULA MATERNIZADA TERCERA ETAPA', 'TARRO X 400G ', '', '803648', 'ASPEN MÉXICO, S. DE R.L. DE C.V.', '7969-ALE-0718', '', '11/2/2021', '171', '5,74366', '982,16586');
INSERT INTO `hoja1` VALUES ('R07AA02SUT210X0', 'FOSFOLÍPIDOS NATURALES SUSPENSIÓN ESTÉRIL INTRATRAQUEAL 200 MG/8 ML NR', 'FRASCO  25 ML/8ML', '', '1128514', 'ABBVIE DEUTSCHLAND GMBH & CO. KG', '12-MEE-0814', '1/2/2020', '31/7/2021', '9', '193,2871', '1739,5839');
INSERT INTO `hoja1` VALUES ('R07AA02SUT210X0', 'FOSFOLÍPIDOS NATURALES SUSPENSIÓN ESTÉRIL INTRATRAQUEAL 200 MG/8 ML NR', 'FRASCO  25 ML/8ML', '', '1132290', 'ABBVIE DEUTSCHLAND GMBH & CO. KG', '12-MEE-0814', '1/4/2020', '30/9/2021', '102', '193,2871', '19715,2842');
INSERT INTO `hoja1` VALUES ('C03CA01TAB290X0', 'FUROSEMIDA TABLETA  40 MG NR', 'CAJA X 252 TABLETAS', '', '8H2029', 'TECNOQUIMICAS S.A.', '00427-1-MAC-11-05', '30/6/2018', '30/6/2022', '53424', '0,0094', '502,1856');
INSERT INTO `hoja1` VALUES ('C03CA01TAB290X0', 'FUROSEMIDA TABLETA  40 MG NR', 'CAJA X 252 TABLETAS', '', '8R3530', 'TECNOQUIMICAS S.A.', '00427-1-MAC-11-05', '30/11/2018', '30/11/2022', '21672', '0,0094', '203,7168');
INSERT INTO `hoja1` VALUES ('N03AX12CAP265X0', 'GABAPENTINA CÁPSULA  300 MG NR', 'CAJA X 30 CÁPSULAS', '', '9R3820B', 'TECNOQUIMICAS S.A.', '03592-MAE-05-05', '30/11/2019', '30/11/2022', '5130', '0,22', '1128,6');
INSERT INTO `hoja1` VALUES ('B05AA06SOY445N3', 'GELATINA, AGENTES CON SOLUCIÓN INYECTABLE  3,5% FRASCO/FUNDA X 500 ML', 'FRASCO X 500ML', '', '73P9B0183', 'FRESENIUS KABI S.A', '29822-05-11', '1/2/2019', '30/02/2021', '510', '10,9', '5559');
INSERT INTO `hoja1` VALUES ('C10AB04TAB365X0', 'GEMFIBROZILO TABLETA 600 MG NR', 'CAJA X 30 TABLETAS', '', 'K190947', 'ECUAQUIMICA ECUATORIANA DE PRODUCTOS QUIMICOS C.A.', '24292-1-02-12', '30/11/2019', '30/11/2022', '390', '0,12', '46,8');
INSERT INTO `hoja1` VALUES ('A12AA03SOY088A1', 'GLUCONATO DE CALCIO SOLUCIÓN INYECTABLE  10% AMPOLLA X 10 ML', 'CAJA X 10 /1MG', '', '181206', 'HEBEI TIACHENG PHARMACEUTICAL COL., LTDA.', '2755-MEE-0517', '1/12/2018', '30/12/2020', '50', '0,15', '7,5');
INSERT INTO `hoja1` VALUES ('A12AA03SOY088A1', 'GLUCONATO DE CALCIO SOLUCIÓN INYECTABLE  10% AMPOLLA X 10 ML', '', '', '190307', 'HEBEI BAIMEI LATEX PRODUCTS CO., LTD.', '2755-MEE-0517', '1/3/2017', '31/3/2021', '1200', '0,15', '180');
INSERT INTO `hoja1` VALUES ('N05AD01SOY334A0', 'HALOPERIDOL SOLUCIÓN INYECTABLE 50 MG/ML AMPOLLA X 1 ML', 'CAJA X 1 AMPOLLA /1ML', '', '180918H', 'ACROMAX LABORATORIO QUIMICO FARMACEUTICO S.A.', '5681-MAN-01-10', '30/8/2018', '31/8/2021', '1051', '0,17', '178,67');
INSERT INTO `hoja1` VALUES ('', 'HIDROCORTISONA CREMA ', 'TUBO X 5MG-15MG', '', 'D808', 'AUROCHEM LABORATORIES (I) PVT. LTD', '3097-MEE-1117', '1/4/2018', '30/3/2021', '545', '0,8', '436');
INSERT INTO `hoja1` VALUES ('B03AD00TAM361X0', 'HIERRO EN COMBINACIÓN CON ÁCIDO FÓLICO TABLETA MASTICABLE  60 MG + 400 MCG NR', '', 'Sales de hierro + Ácido fólico', '1020045', 'QUALIPHARM LABORATORIO FARMACEUTICO S.A.', '43-MEN-0314', '1/10/2020', '30/10/2023', '12000', '0,08', '960');
INSERT INTO `hoja1` VALUES ('M01AE01SUS209X0', 'IBUPROFENO SUSPENSIÓN  200 MG/5 ML NR', 'CAJA X 20 TABLETAS', '', '20B30S08', 'KRONOS LABORATORIOS C. LTDA.', '435-MEE-0715', '1/2/2020', '28/2/2023', '394', '1,7', '669,8');
INSERT INTO `hoja1` VALUES ('M01AE01TAB296X0', 'IBUPROFENO TABLETA 400 MG NR', 'CAJA X 100 TABLETAS', '', 'M010519', 'CAPLIN POINT LABORATORIES LTDA', '527-MEE-1114', '30/5/2019', '30/4/2022', '3900', '0,03', '117');
INSERT INTO `hoja1` VALUES ('J06BB01SOY230X0', 'INMUNOGLOBULINA ANTI-D (RH) SOLUCIÓN INYECTABLE 250 MCG NR', 'CAJA X 1 AMP/2ML', '', 'D17201B', 'RRPGOLDEN INTEGRA IMPORTADORA S.A', '146-MBE-1119', '1/3/2020', '30/8/2022', '15', '205', '3075');
INSERT INTO `hoja1` VALUES ('J06BB05SOY479X0', 'INMUNOGLOBULINA ANTIRRÁBICA SOLUCIÓN INYECTABLE  300 UI/ML NR', 'CAJA X 1 AMPOLLA 2ML/300UI', '', 'P10034786', 'CSL BEHRING PANAMA S.A.', '', '30/5/2019', '30/5/2021', '10', '40,2', '402');
INSERT INTO `hoja1` VALUES ('J06BB02SOY240X0', 'INMUNOGLOBULINA ANTITETÁNICA SOLUCIÓN INYECTABLE  250 UI NR', 'CAJA X 1 AMPOLLA 2ML/250UI', '', '081T18038', 'GREEN CROSS', '', '12/12/2018', '11/2/2022', '8', '9,5', '76');
INSERT INTO `hoja1` VALUES ('A10AB01SOY118F1', 'INSULINA (HUMANA) SOLUCIÓN INYECTABLE  100 UI/ML FRASCO X 10 ML', 'CAJA X 1 FRASCO 10ML/1ML', 'Insulina de acción rápida', 'KT6W992', 'NOVO NORDISK A/S', '107-MBE-0617', '1/3/2020', '30/8/2022', '730', '2,67', '1949,1');
INSERT INTO `hoja1` VALUES ('A10AC01SOY118F1', 'INSULINA (HUMANA) SOLUCIÓN INYECTABLE  100 UI/ML FRASCO X 10 ML', 'FRASCO 10ML', 'Insulina de acción intermedia', 'KT6W993', 'NOVO NORDISK A/S', '107-MBE-0617', '1/2/2020', '30/7/2022', '730', '2,67', '1949,1');
INSERT INTO `hoja1` VALUES ('A10AB01SOY118F1', 'INSULINA (HUMANA) SOLUCIÓN INYECTABLE  100 UI/ML FRASCO X 10 ML', 'CAJA X 1 FRASCO 10ML/1ML', 'Insulina de acción rápida', 'JT6L541', 'NOVO NORDISK A/S', '107-MBE-0617', '30/12/2018', '31/5/2021', '80', '2,67', '213,6');
INSERT INTO `hoja1` VALUES ('A10AC01SOY118F1', 'INSULINA (HUMANA) SOLUCIÓN INYECTABLE  100 UI/ML FRASCO X 10 ML', 'FRASCO 10ML', 'Insulina de acción intermedia', 'JT6L935', 'NOVO NORDISK A/S', '100-MBE-0517', '30/1/2019', '30/6/2021', '285', '2,67', '760,95');
INSERT INTO `hoja1` VALUES ('R03BB01AER010F1', 'IPRATROPIO, BROMURO DE AEROSOL 0,02 MG/DOSIS FRASCO X 10 ML', 'CAJA X FRASCO 20ML', '', '20137', 'GINSBERG ECUADOR S.A.', '786-MEN-0416', '1/3/2020', '30/3/2022', '10', '5', '50');
INSERT INTO `hoja1` VALUES ('J02AC02CAP105X0', 'ITRACONAZOL CÁPSULA 100 MG NR', 'CAJA X 4 CÁPSULAS', '', '191005', 'PROPHAR S.A', 'GBNE10912', '30/10/2019', '31/10/2022', '476', '0,07', '33,32');
INSERT INTO `hoja1` VALUES ('A06AD11SOL371X0', 'LACTULOSA SOLUCIÓN ORAL  65% NR', 'FRASCO 100ML', '', '160118', 'CAPLIN POINT LABORATORIES LTDA', '2173-MEE-0516', '1/1/2018', '31/12/2020', '972', '1,45', '1409,4');
INSERT INTO `hoja1` VALUES ('A06AD11SOL371X0', 'LACTULOSA SOLUCIÓN ORAL  65% NR', 'FRASCO 10ML', '', '010719', 'CAPLIN POINT LABORATORIES LTDA', '2173-MEE-0516', '30/6/2018', '30/6/2022', '777', '1,45', '1126,65');
INSERT INTO `hoja1` VALUES ('S01XA20SOF000X0', 'LÁGRIMAS ARTIFICIALES Y OTROS PREPARADOS INERTES SOLUCIÓN OFTÁLMICA  ND NR', 'GOTERO 15ML', '', '19FF1257', 'FARMACID S.A.', '05032K-MAN-01-08', '30/12/2019', '31/12/2021', '325', '0,931', '302,575');
INSERT INTO `hoja1` VALUES ('J01MA12TAR339X0', 'LEVOFLOXACINO TABLETA RECUBIERTA 500 MG NR', 'CAJA X 10 TABLETAS', '', '012019-1', 'LABORATORIOS JAIME GUTIERREZ', '71-MEN-0414', '30/1/2019', '31/1/2021', '1140', '0,081', '92,34');
INSERT INTO `hoja1` VALUES ('G03AA07TAR156X0', 'LEVONORGESTREL Y ESTRÓGENO TABLETA RECUBIERTA 150 MCG + 30 MCG NR', 'Levonorgestrel + Etinilestradiol', '', 'KT034KT', 'BAYER S.A.', '', '30/1/2019', '30/9/2021', '21', '0,3', '6,3');
INSERT INTO `hoja1` VALUES ('G03AC03TAB536X0', 'LEVONORGESTREL  TABLETA  0,030 MG NR', 'CAJA X 35 TABLETAS', '', 'KT02C2T', 'BAYER S.A.', '', '1/6/2018', '30/6/2023', '138', '0,3', '41,4');
INSERT INTO `hoja1` VALUES ('G03AC03TAB536X0', 'LEVONORGESTREL  TABLETA  0,030 MG NR', 'CAJA X 35 TABLETAS', '', 'KT02KC2', 'BAYER S.A.', '', '1/6/2018', '30/6/2023', '54', '0,3', '16,2');
INSERT INTO `hoja1` VALUES ('H03AA01TAB016X0', 'LEVOTIROXINA SÓDICA TABLETA 0,05 MG NR', 'CAJA X 50 TABLETAS', '', 'M94564', 'MERCK S.A.', '25,895-08-04', '30/8/2019', '31/7/2021', '4750', '0,02', '95');
INSERT INTO `hoja1` VALUES ('H03AA01TAB016X0', 'LEVOTIROXINA SÓDICA TABLETA 0,05 MG NR', 'CAJA X 50 TABLETAS', '', 'M94565', 'MERCK S.A.', '25,895-08-04', '1/10/2019', '30/9/2021', '11550', '0,02', '231');
INSERT INTO `hoja1` VALUES ('H03AA01TAB029X0', 'LEVOTIROXINA SÓDICA TABLETA 0,100 MG (100 MCG) NR', 'CAJA X 50 TABLETAS', '', 'M92333', 'MERCK S.A.', '25-894-08-04', '30/4/2019', '31/3/2021', '13500', '0,03', '405');
INSERT INTO `hoja1` VALUES ('J05AR10SOL387X0', 'LOPINAVIR + RITONAVIR SOLUCIÓN ORAL  80 MG + 20 MG/ML NR', 'FRASCO 160ML', '', '1132284', 'ABBVIE S.A.S.', '562-MEE-1214', '1/6/2020', '1/6/2022', '115', '44,24', '5087,6');
INSERT INTO `hoja1` VALUES ('R06AX13JBE318X0', 'LORATADINA JARABE 5 MG/5 ML NR', 'FRASCO 100ML', '', '1269996', 'PROCAPS S.A.', '03429-MAE-02-05', '30/10/2019', '31/10/2022', '250', '1,3', '325');
INSERT INTO `hoja1` VALUES ('R06AX13TAB091X0', 'LORATADINA TABLETA 10 MG NR', 'CAJA X 40 TABLETAS', '', '20OB0101', 'FARMACID S.A.', '105MEN-0614', '30/1/2020', '31/1/2022', '9240', '0,009', '83,16');
INSERT INTO `hoja1` VALUES ('B05BC01SOY202U4', 'MANITOL SOLUCIÓN INYECTABLE  20% FUNDA X 500  ML', 'FUNDA X 500ML', '', 'SB19F09', 'LABORATORIOS BAXTER S.A CALI-COLOMBIA', '20-972-1-01-04', '1/1/2019', '30/1/2021', '15', '4,15', '62,25');
INSERT INTO `hoja1` VALUES ('L01BB02TAB329X0', 'MERCAPTOPURINA TABLETA 50 MG NR', 'CAJA X 100 TABLETAS', '', 'E938804', 'KOREA UNITED PHARM INC.', '27,718-06-07', '25/4/2018', '24/4/2021', '300', '0,15', '45');
INSERT INTO `hoja1` VALUES ('L01BB02TAB329X0', 'MERCAPTOPURINA TABLETA 50 MG NR', 'CAJA X 100 TABLETAS', '', 'E938814', 'KOREA UNITED PHARM INC.', '27,718-06-07', '21/11/2019', '20/11/2021', '800', '0,15', '120');
INSERT INTO `hoja1` VALUES ('A10BD02TAB338X0', 'METFORMINA Y SULFONAMIDAS TABLETA  500 MG + 2,5 MG NR', 'CAJA X 30 TABLETA', '', '181316L', 'ACROMAX LABORATORIO QUIMICO FARMACEUTICO S.A.', '27,942-MAN-03-08', '1/12/2018', '30/12/2021', '19860', '0,18', '3574,8');
INSERT INTO `hoja1` VALUES ('A10BD02TAB338X0', 'METFORMINA Y SULFONAMIDAS TABLETA  500 MG + 2,5 MG NR', 'CAJA X 30 TABLETA', '', '1813762', 'ACROMAX LABORATORIO QUIMICO FARMACEUTICO S.A.', '27,942-MAN-03-08', '30/12/2018', '31/12/2021', '15810', '0,18', '2845,8');
INSERT INTO `hoja1` VALUES ('A10BD02TAB338X0', 'METFORMINA Y SULFONAMIDAS TABLETA  500 MG + 2,5 MG NR', 'CAJA X 30 TABLETA', '', '181317L', 'ACROMAX LABORATORIO QUIMICO FARMACEUTICO S.A.', '27,942-MAN-03-08', '30/12/2018', '31/12/2021', '33810', '0,18', '6085,8');
INSERT INTO `hoja1` VALUES ('A10BD02TAB283X0', 'METFORMINA Y SULFONAMIDAS TABLETA  500 MG + 5 MG NR', 'CAJA X 30 TABLETAS', '', '19UD1127', 'FARMACID S.A.', '850-MEN-0616', '30/11/2019', '30/11/2021', '54270', '0,0088', '477,576');
INSERT INTO `hoja1` VALUES ('A03FA01TAB091X0', 'METOCLOPRAMIDA TABLETA  10 MG NR', 'CAJA X 100 TABLETAS', '', '2000416', 'LABORATORIOS INDUSTRIALES FARMACEUTICOS ECUATORIANOS LIFE C.A.', '02836-MAN-10-03', '1/1/2020', '31/1/2023', '8700', '0,025', '217,5');
INSERT INTO `hoja1` VALUES ('A03FA01TAB091X0', 'METOCLOPRAMIDA TABLETA  10 MG NR', 'CAJA X 100 TABLETAS', '', '200767', 'LABORATORIOS INDUSTRIALES FARMACEUTICOS ECUATORIANOS LIFE C.A.', '02836-MAN-10-03', '1/1/2020', '30/1/2023', '2000', '0,025', '50');
INSERT INTO `hoja1` VALUES ('A03FA01TAB091X0', 'METOCLOPRAMIDA TABLETA  10 MG NR', 'CAJA X 24TABLETAS', '', '00036', 'LABORATORIOS INDUSTRIALES FARMACEUTICOS ECUATORIANOS LIFE C.A.', '24-133-1-09-11', '1/2/2018', '28/2/2022', '408', '0,025', '10,2');
INSERT INTO `hoja1` VALUES ('L01BA01SOY226A6', 'METOTREXATO SOLUCIÓN INYECTABLE 25 MG/ML AMPOLLA X 20 ML', 'CAJA X 50 AMPOLLAS /2ML', '', 'MX-2001', 'PROTECH BIOSYSTEMS PVT. LTD.', '2741-MEE-0517', '17/1/2020', '16/1/2022', '25', '5,41408', '135,352');
INSERT INTO `hoja1` VALUES ('L01BA01TAB060X0', 'METOTREXATO TABLETA 2,5 MG NR', 'CAJA X 100', '', 'MTT1928AC', 'CELON LABORATORIES PVT. LTD.', '1155-MEE-0715', '28/2/2019', '30/1/2021', '9700', '0,0375', '363,75');
INSERT INTO `hoja1` VALUES ('G01AF01OVU339X0', 'METRONIDAZOL ÓVULO 500 MG NR', 'CAJA X 12 SUPOSITORIOS', '', '380V', 'LABORATORIOS ROCNARF S.A.', '300-MEN-0315', '28/2/2020', '28/2/2022', '108', '0,28', '30,24');
INSERT INTO `hoja1` VALUES ('P01AB01TAB339X0', 'METRONIDAZOL TABLETA 500 MG NR', 'CAJA X 30 TABLETAS', '', '0205-10', 'INDEUREC S.A.', '01813-MAC03-02', '28/2/2019', '28/2/2022', '10290', '0,0097', '99,813');
INSERT INTO `hoja1` VALUES ('C01DA14TAB194X0', 'MONONITRATO DE ISOSORBIDA TABLETA  20 MG NR', 'CAJA X 250 TABLETAS', '', 'D8020', 'AUROCHEM LABORATORIES (I) PVT. LTD', '2699-MEE-0517', '30/4/2018', '31/3/2021', '2500', '0,045', '112,5');
INSERT INTO `hoja1` VALUES ('C01DA14TAB194X0', 'MONONITRATO DE ISOSORBIDA TABLETA  20 MG NR', 'CAJA X 250 TABLETAS', '', 'C9040', 'AUROCHEM LABORATORIES (I) PVT. LTD', '2699-MEE-0517', '30/3/2019', '28/2/2022', '5000', '0,045', '225');
INSERT INTO `hoja1` VALUES ('A09AA02CAP437X0', 'MULTIENZIMAS (LIPASA, PROTEASA, ETC.) CÁPSULA  150 MG (8 000 UI + 10 000 UI + 600 UI) NR', 'CAJA X 20 TABLETAS', '', '0017-19', 'INDEUREC S.A.', '293-MEN-0215', '30/1/2019', '31/1/2022', '920', '0,16', '147,2');
INSERT INTO `hoja1` VALUES ('N07AA01SOY321A0', 'NEOSTIGMINA SOLUCIÓN INYECTABLE 0,5 MG/ML AMPOLLA X 1 ML', 'CAJA X 100 AMPOLLA /1ML', '', '75NE0920', 'LABORATORIO SANDERSON S.A.', 'GBE-0567-03-05', '30/5/2019', '31/5/2022', '1900', '0,31', '589');
INSERT INTO `hoja1` VALUES ('N07AA01SOY321A0', 'NEOSTIGMINA SOLUCIÓN INYECTABLE 0,5 MG/ML AMPOLLA X 1 ML', 'CAJA X 100 AMPOLLA /1ML', '', '19.05.2549', 'LABORATORIO BIOSANO S.A', 'GBE-0395-01-04', '30/5/2019', '31/5/2021', '500', '0,31', '155');
INSERT INTO `hoja1` VALUES ('C08CA05TAB091X0', 'NIFEDIPINA TABLETA  10 MG NR', 'CAJA X 50 TABLETAS', '', '7700220', 'LABORATORIO VIDA LABOVIDA S.A.', 'GBN-0328-06-03', '1/2/2020', '28/2/2022', '8450', '0,08', '676');
INSERT INTO `hoja1` VALUES ('A07AA02SUS119X0', 'NISTATINA SUSPENSIÓN  100 000 UI/ML NR', 'CAJA X 1 FRASCO 30ML', '', '190885H', 'ACROMAX LABORATORIO QUIMICO FARMACEUTICO S.A.', '8077-1-06-04', '30/8/2019', '31/8/2022', '21', '1,6', '33,6');
INSERT INTO `hoja1` VALUES ('J01XE01CAP105X0', 'NITROFURANTOÍNA CÁPSULA 100 MG NR', 'CAJA X 100 CÁPSULAS', '', '061218', 'CAPLIN POINT LABORATORIES LTDA', '2027-MEE-0416', '30/12/2018', '30/11/2021', '4700', '0,025', '117,5');
INSERT INTO `hoja1` VALUES ('J01XE01TAB105X0', 'NITROFURANTOÍNA TABLETA  100 MG NR', 'CAJA X 100 CÁPSULAS', '', '50220', 'CAPLIN POINT LABORATORIES LTDA', '2027-MEE-0416', '28/2/2020', '31/1/2023', '78900', '0,025', '1972,5');
INSERT INTO `hoja1` VALUES ('A02BC01CAP194X0', 'OMEPRAZOL CÁPSULA  20 MG NR', 'CAJA X 100 CÁPSULAS', '', '240419', 'CAPLIN POINT LABORATORIES LTDA', '993-MEE-0515', '30/4/2019', '31/3/2022', '14500', '0,0117', '169,65');
INSERT INTO `hoja1` VALUES ('A02BC01CAP194X0', 'OMEPRAZOL CÁPSULA  20 MG NR', 'CAJA X 100 CÁPSULAS', '', '130819', 'CAPLIN POINT LABORATORIES LTDA', '993-MEE-0515', '30/8/2019', '31/7/2022', '19200', '0,0117', '224,64');
INSERT INTO `hoja1` VALUES ('A04AA01TAR286X0', 'ONDANSETRÓN TABLETA RECUBIERTA  4 MG NR', 'CAJA X 30 TABLETAS', '', '021801', 'QUALIPHARM LABORATORIO FARMACEUTICO S.A.', '496-MEN-0815', '28/2/2018', '28/2/2021', '13800', '0,12', '1656');
INSERT INTO `hoja1` VALUES ('J01CF04POI121X0', 'OXACILINA POLVO PARA INYECCIÓN  1 000 MG NR', 'CAJA X 50 AMPOLLAS', '', '183012075', 'REYOUNG PHARMACEUTICAL CO. LTD.', '2132-MEE-0516', '30/4/2018', '30/4/2021', '3350', '0,21', '703,5');
INSERT INTO `hoja1` VALUES ('J01CF04POI121X0', 'OXACILINA POLVO PARA INYECCIÓN  1 000 MG NR', '', '', '193012006', 'REYOUNG PHARMACEUTICAL CO. LTD.', '2132-MEE-0516', '1/2/2019', '28/2/2022', '1150', '0,21', '241,5');
INSERT INTO `hoja1` VALUES ('J01CF04POI121X0', 'OXACILINA POLVO PARA INYECCIÓN  1 000 MG NR', '', '', '193012025', 'REYOUNG PHARMACEUTICAL CO. LTD.', '2132-MEE-0516', '1/6/2018', '30/6/2022', '1150', '0,21', '241,5');
INSERT INTO `hoja1` VALUES ('H01BB02SOY100A0', 'OXITOCINA SOLUCIÓN INYECTABLE 10 UI/ML AMPOLLA X 1 ML', 'CAJA X10 AMPOLLAS /1ML', '', '75NL1885', 'LABORATORIO SANDERSON S.A.', 'GBE-00134-2-01-12', '8/12/2019', '8/11/2022', '4000', '0,1589', '635,6');
INSERT INTO `hoja1` VALUES ('H01BB02SOY100A0', 'OXITOCINA SOLUCIÓN INYECTABLE 10 UI/ML AMPOLLA X 1 ML', 'CAJA X10 AMPOLLAS /1ML', '', '75NA0055', 'LABORATORIO SANDERSON S.A.', 'GBE-00134-2-01-12', '1/8/2019', '30/7/2022', '3000', '0,1589', '476,7');
INSERT INTO `hoja1` VALUES ('N02BE01JBE159X0', 'PARACETAMOL JARABE 160 MG/5 ML NR', 'FRASCO 60ML', '', 'E807', 'AUROCHEM LABORATORIES (I) PVT. LTD', '2574-MEE-0217', '30/4/2018', '30/4/2021', '400', '0,45', '180');
INSERT INTO `hoja1` VALUES ('N02BE01JBE159X0', 'PARACETAMOL JARABE 160 MG/5 ML NR', 'FRASCO 60ML', '', 'EL061', 'AUROCHEM LABORATORIES (I) PVT. LTD', '2295-MEE-0716', '1/9/2019', '30/8/2022', '500', '0,45', '225');
INSERT INTO `hoja1` VALUES ('N02BE01JBE159X0', 'PARACETAMOL JARABE 160 MG/5 ML NR', 'FRASCO 60ML', '', 'DL177', 'RATNAMANI HEALTHCARE PVT. LTD', '2295-MEE-0716', '1/2/2019', '30/1/2022', '1988', '0,45', '894,6');
INSERT INTO `hoja1` VALUES ('N02BE01JBE159X0', 'PARACETAMOL JARABE 150 MG/5 ML NR', 'FRASCO 60ML', '', 'EL098', 'RATNAMANI HEALTHCARE PVT. LTD', '2295-MEE-0716', '1/1/2020', '30/12/2022', '2011', '0,39', '784,29');
INSERT INTO `hoja1` VALUES ('N02BE01JBE159X0', 'PARACETAMOL JARABE 150 MG/5 ML NR', 'FRASCO 60ML', '', 'FL001', 'RATNAMANI HEALTHCARE PVT. LTD', '2295-MEE-0716', '1/5/2020', '30/4/2023', '194', '0,39', '75,66');
INSERT INTO `hoja1` VALUES ('N02BE01JBE169X0', 'PARACETAMOL JARABE  150 MG/5 ML NR', 'FRASCO 60ML', '', 'FB029', 'KRONOS LABORATORIOS C. LTDA.', '2295-MEE-0716', '1/11/2020', '30/12/2022', '1668', '0,39', '650,52');
INSERT INTO `hoja1` VALUES ('N02BE01JBE169X0', 'PARACETAMOL JARABE  160 MG/5 ML NR', 'FRASCO 60ML', '', 'K801', 'AUROCHEM LABORATORIES (I) PVT. LTD', '2574-MEE-0217', '1/11/2028', '30/10/2021', '600', '0,45', '270');
INSERT INTO `hoja1` VALUES ('N02BE01JBE169X0', 'PARACETAMOL JARABE  160 MG/5 ML NR', 'FRASCO 60ML', '', 'K803', 'AUROCHEM LABORATORIES (I) PVT. LTD', '2574-MEE-0217', '1/11/2018', '30/10/2021', '3002', '0,45', '1350,9');
INSERT INTO `hoja1` VALUES ('P03AC04SOT066X0', 'PERMETRINA SOLUCIÓN TÓPICA 1% NR', 'FRASCO 60ML', '', '180911', 'NEW YORKER S.A.', '5869-MAN-10-10', '30/9/2018', '30/9/2021', '72', '1,407', '101,304');
INSERT INTO `hoja1` VALUES ('D10AE01GEL310X0', 'PERÓXIDO DE BENZOÍLO GEL 5% NR', 'TUBO GEL X 60G', '', '190201', 'QUALIPHARM LABORATORIO FARMACEUTICO S.A.', '870-MEN-0616', '1/2/2019', '28/2/2021', '423', '3,2445', '1372,4235');
INSERT INTO `hoja1` VALUES ('H02AB07TAB194X0', 'PREDNISONA TABLETA 20 MG NR', 'CAJA X 100 TABLETAS', '', '1041069', 'LABORATORIOS AC FARMA S.A.', '2688-MEE-0517', '30/4/2019', '30/4/2021', '14900', '0,0238', '354,62');
INSERT INTO `hoja1` VALUES ('H02AB07TAB314X0', 'PREDNISONA TABLETA 5 MG NR', 'CAJA X 100 TABLETAS', '', '1030519', 'LABORATORIOS AC FARMA S.A.', '2689-MEE-0517', '30/3/2019', '31/3/2021', '2000', '0,0138', '27,6');
INSERT INTO `hoja1` VALUES ('A02BA02SOY226A2', 'RANITIDINA SOLUCIÓN INYECTABLE  25 MG/ML AMPOLLA X 2 ML', 'CAJA X10 AMPOLLAS /2ML', '', 'P191281', 'LABVITALIS S.A.', '03160-MAE-07-04', '30/5/2019', '31/5/2021', '7200', '0,24', '1728');
INSERT INTO `hoja1` VALUES ('N05AX08SOL081X0', 'RISPERIDONA SOLUCIÓN ORAL 1 MG/ML NR', 'FRASCO 30ML', '', '2005032', 'LABORATORIOS ANDRÓMACO S.A.', '2560-MEN-0120', '27/5/2020', '30/4/2022', '21', '5,699', '119,679');
INSERT INTO `hoja1` VALUES ('N05AX08SOL081X0', 'RISPERIDONA SOLUCIÓN ORAL 1 MG/ML NR', 'GOTAS  X 30ML', '', 'G19043A', 'LABORATORIOS ANDRÓMACO S.A.', '24-943-02-03', '1/7/2019', '30/6/2023', '354', '5,699', '2017,446');
INSERT INTO `hoja1` VALUES ('N05AX08TAR178X0', 'RISPERIDONA TABLETA RECUBIERTA 2 MG NR', 'CAJA X 100 TABLETAS', '', '1051669', 'LABORATORIOS AC FARMA S.A.', '2693-MEE-0517', '30/5/2019', '31/5/2021', '63700', '0,0118', '751,66');
INSERT INTO `hoja1` VALUES ('N05AX08TAR178X0', 'RISPERIDONA TABLETA RECUBIERTA 2 MG NR', 'CAJA X 100 TABLETAS', '', '1081809', 'LABORATORIOS AC FARMA S.A.', '2693-MEE-0517', '30/8/2019', '31/8/2021', '15500', '0,0118', '182,9');
INSERT INTO `hoja1` VALUES ('M03AC09SOY097A5', 'ROCURONIO, BROMURO DE SOLUCIÓN INYECTABLE 10 MG/ML AMPOLLA X 5 ML', 'CAJA X 12 AMPOLLAS 50MG/5ML', '', '20387', 'GINSBERG ECUADOR S.A.', 'GBN1270113', '1/8/2020', '30/8/2022', '312', '1,74', '542,88');
INSERT INTO `hoja1` VALUES ('M03AC09SOY097A5', 'ROCURONIO, BROMURO DE SOLUCIÓN INYECTABLE 10 MG/ML AMPOLLA X 5 ML', 'CAJA X 12 AMPOLLAS 50MG/5ML', '', '20401', 'GINSBERG ECUADOR S.A.', 'GBN1270113', '1/9/2020', '30/9/2022', '324', '1,74', '563,76');
INSERT INTO `hoja1` VALUES ('R03AC02AER026X0', 'SALBUTAMOL AEROSOL 0,1 MG/DOSIS (100 MCG/DOSIS) NR', 'GOTERO 10ML', '', 'XF8J.', 'GLAXOSMITHKLINE ECUADOR S.A.', '24-641-08-02', '30/11/2019', '30/11/2022', '57', '5', '285');
INSERT INTO `hoja1` VALUES ('R03AC02SOI320X0', 'SALBUTAMOL SOLUCIÓN PARA INHALACIÓN 5 MG/ML NR', 'GOTERO 10ML', '', '11187', 'LABORATORIOS CHALVER DE COLOMBIA S.A', 'H2541212', '30/4/2018', '30/4/2022', '301', '1,05', '316,05');
INSERT INTO `hoja1` VALUES ('N01AB08SOI081X0', 'SEVOFLURANO SOLUCIÓN PARA INHALACIÓN 1 MG/ML NR', 'FRASCFO 250ML', '', '19MQ1211', 'FARMACID S.A.', '364060113', '30/10/2019', '31/10/2023', '32', '58', '1856');
INSERT INTO `hoja1` VALUES ('N01AB08SOI081X0', 'SEVOFLURANO SOLUCIÓN PARA INHALACIÓN 1 MG/ML NR', 'FRASCFO 250ML', '', '20MQ0403', 'FARMACID S.A.', '364060113', '28/2/2020', '29/2/2024', '287', '58', '16646');
INSERT INTO `hoja1` VALUES ('J06AA03POI000X0', 'SUERO ANTIOFÍDICO POLVO PARA INYECCIÓN ND NR', 'CAJA X1 FRASCO 10ML', '', '6280819POLF', 'INSTITUTO CLODOMIRO PICADO', 'GE-465-06-11', '1/8/2019', '31/8/2024', '9', '37,2', '334,8');
INSERT INTO `hoja1` VALUES ('J06AA03POI000X0', 'SUERO ANTIOFÍDICO POLVO PARA INYECCIÓN ND NR', '', '', '6460720POLF', 'INSTITUTO CLODOMIRO PICADO', 'GE-465-06-11', '01/07/202', '30/7/2025', '90', '37,2', '3348');
INSERT INTO `hoja1` VALUES ('V03AB35SOY112X0', 'SUGAMMADEX SOLUCIÓN INYECTABLE 100 MG / ML NR', 'CAJA X 10 AMPOLLAS', '', 'R033942', 'PATHEON  S.P.A.', '4340-MEE-0818', '22/7/2018', '30/7/2021', '9', '5', '45');
INSERT INTO `hoja1` VALUES ('J01EE01SUS206G0', 'SULFAMETOXAZOL Y TRIMETOPRIMA SUSPENSIÓN 200 MG + 40 MG/5 ML FRASCO X 100 ML', 'FRASCO /100ML', '', '18BN0718', 'FARMACID S.A.', '02067-MAC-1-03-12', '30/7/2018', '31/7/2021', '89', '0,25085', '22,32565');
INSERT INTO `hoja1` VALUES ('J01EE01SUS206G0', 'SULFAMETOXAZOL Y TRIMETOPRIMA SUSPENSIÓN 200 MG + 40 MG/5 ML FRASCO X 100 ML', 'FRASCO X 100ML', '', '20BN0101', 'FARMACID S.A.', '02067-MAC-1-03-12', '1/1/2020', '31/1/2023', '300', '0,25085', '75,255');
INSERT INTO `hoja1` VALUES ('J01EE01SUS206G0', 'SULFAMETOXAZOL Y TRIMETOPRIMA SUSPENSIÓN 200 MG + 40 MG/5 ML FRASCO X 100 ML', 'FRASCO X 100ML', '', '19BN1216', 'FARMACID S.A.', '02067-MAC-1-03-12', '1/12/2019', '31/12/2022', '30', '0,25085', '7,5255');
INSERT INTO `hoja1` VALUES ('J01EE01SUS206G0', 'SULFAMETOXAZOL Y TRIMETOPRIMA SUSPENSIÓN 200 MG + 40 MG/5 ML FRASCO X 100 ML', 'FRASCO X 100ML', '0', '20BN0403', 'FARMACID S.A.', '02067-MAC-1-03-12', '1/4/2020', '30/4/2023', '260', '0,25085', '65,221');
INSERT INTO `hoja1` VALUES ('J01EE01SUS206G0', 'SULFAMETOXAZOL Y TRIMETOPRIMA SUSPENSIÓN 200 MG + 40 MG/5 ML FRASCO X 100 ML', 'FRASCO X 100ML', '', '20BN0405', 'FARMACID S.A.', '02067-MAC-1-03-12', '1/4/2020', '30/4/2023', '258', '0,25085', '64,7193');
INSERT INTO `hoja1` VALUES ('J01EE01TAB298X0', 'SULFAMETOXAZOL Y TRIMETOPRIMA TABLETA 800 MG + 160 MG NR', 'CAJA X 30 TABLETAS', '', '19BC0114', 'FARMACID S.A.', '01921-MAC-04-02', '30/1/2019', '30/1/2022', '12750', '0,02099', '267,6225');
INSERT INTO `hoja1` VALUES ('J01EE01TAB392X0', 'SULFAMETOXAZOL Y TRIMETOPRIMA TABLETA 800 MG + 160 MG NR', 'CAJA X 30 TABLETAS', '', '19BC0107', 'FARMACID S.A.', '01921-MAC-04-02', '30/1/2019', '31/1/2022', '22350', '0,02099', '469,1265');
INSERT INTO `hoja1` VALUES ('J01EE01TAB392X0', 'SULFAMETOXAZOL Y TRIMETOPRIMA TABLETA 800 MG + 160 MG NR', 'CAJA X 30 TABLETAS', '', '18BC1029', 'FARMACID S.A.', '01921-MAC-04-02', '30/10/2018', '31/10/2021', '4950', '0,02099', '103,9005');
INSERT INTO `hoja1` VALUES ('J01EE01TAB392X0', 'SULFAMETOXAZOL Y TRIMETOPRIMA TABLETA 800 MG + 160 MG NR', 'CAJA X 30 TABLETAS', '', '18BC1031', 'FARMACID S.A.', '01921-MAC-04-02', '30/10/2018', '31/10/2021', '3000', '0,02099', '62,97');
INSERT INTO `hoja1` VALUES ('J01EE01TAB392X0', 'SULFAMETOXAZOL Y TRIMETOPRIMA TABLETA 800 MG + 160 MG NR', 'CAJA X 30 TABLETAS', '', '19BC0113', 'FARMACID S.A.', '01921-MAC-04-02', '30/1/2019', '31/1/2022', '2280', '0,02099', '47,8572');
INSERT INTO `hoja1` VALUES ('G04CA02TAL041X0', 'TAMSULOSINA TABLETA LIBERACIÓN PROLONGADA 0,4 MG NR', 'CAJA X 30 CÁPSULAS ', '', '190A1106', 'FARMACID S.A.', '364070113', '30/11/2019', '30/11/2021', '39210', '0,07', '2744,7');
INSERT INTO `hoja1` VALUES ('S01ED01SOF044X0', 'TIMOLOL SOLUCIÓN OFTÁLMICA 0,5 % NR', 'GOTERO 5ML', '', '19DH08001', 'MAQUIPHARMA S.A.', '1066-MEN-0517', '30/8/2019', '31/8/2021', '772', '2,5', '1930');
INSERT INTO `hoja1` VALUES ('P01AB02TAB121X0', 'TINIDAZOL TABLETA RECUBIERTA  1 000 MG NR', 'CAJA X 20 TABLETAS', '', '827118S', 'LABORATORIOS G.M. SUCESORES DEL DR. JULIO GONZALEZ MOSQUERA', 'GBN-0222-06-02', '30/8/2018', '31/8/2021', '2440', '0,039199', '95,64556');
INSERT INTO `hoja1` VALUES ('P01AB02TAR121X0', 'TINIDAZOL TABLETA RECUBIERTA  1 000 MG NR', 'CAJA X 20 TABLETAS', '', '82115185', 'LABORATORIOS G.M. SUCESORES DEL DR. JULIO GONZALEZ MOSQUERA', 'GBN-0222-06-02', '30/11/2018', '30/11/2021', '820', '0,0392', '32,144');
INSERT INTO `hoja1` VALUES ('N02AX02CAP329X0', 'TRAMADOL CÁPSULA 50 MG NR', 'CAJA X 30  CÁPSULA', '', 'SDB117', 'BEXIMCO PHARMACEUTICALS LTD.', '2494-MEE-0916', '1/2/2020', '30/1/2023', '6000', '0,032', '192');
INSERT INTO `hoja1` VALUES ('N02AX02CAP329X0', 'TRAMADOL CÁPSULA 50 MG NR', 'CAJA X 30  CÁPSULA', '', 'SCI192', 'BEXIMCO PHARMACEUTICALS LTD.', '2494-MEE-0916', '30/8/2019', '31/8/2022', '10710', '0,032', '342,72');
INSERT INTO `hoja1` VALUES ('D02AE01CRE310X0', 'UREA CREMA 5% NR', 'TUBO 90G', '', '561', 'WEST-COAST PHARMACEUTICAL WORKS LTD.', '2301-MEE-0716', '1/6/2018', '31/5/2021', '362', '8,8', '3185,6');
INSERT INTO `hoja1` VALUES ('J01XA01POI339X0', 'VANCOMICINA POLVO PARA INYECCIÓN 500 MG NR', 'CAJA X 10 AMPOLLAS', '', 'P201548', 'VITALIS S .A.C', 'H3320213', '1/6/2020', '30/6/2022', '520', '1,3', '676');
INSERT INTO `hoja1` VALUES ('J01XA01POI339X0', 'VANCOMICINA POLVO PARA INYECCIÓN 500 MG NR', 'CAJA X 10 AMPOLLAS', '', 'P201224', 'VITALIS S .A.C', 'H3320213', '1/5/2020', '31/5/2022', '860', '1,3', '1118');
INSERT INTO `hoja1` VALUES ('J01XA01POI339X0', 'VANCOMICINA POLVO PARA INYECCIÓN 500 MG NR', '', '', 'P201037', 'VITALIS S .A.C', 'H3320213', '1/5/2020', '31/5/2022', '620', '1,3', '806');

-- ----------------------------
-- Table structure for recetas_medico
-- ----------------------------
DROP TABLE IF EXISTS `recetas_medico`;
CREATE TABLE `recetas_medico` (
  `id_receta_medico` int(255) NOT NULL AUTO_INCREMENT,
  `receta_número` int(255) DEFAULT NULL,
  `id_servicio` int(255) DEFAULT NULL,
  `id_cuarto` int(255) DEFAULT NULL,
  `id_seccion` int(255) DEFAULT NULL,
  `id_cama` int(255) DEFAULT NULL,
  `id_prescriptor` int(255) DEFAULT NULL,
  `id_paciente` int(255) DEFAULT NULL,
  `fecha_emision` datetime DEFAULT NULL,
  `fecha_recepcion` datetime DEFAULT NULL,
  `fecha_caducidad` date DEFAULT NULL,
  `subtotal_grava_iva` decimal(20,2) DEFAULT NULL,
  `subtotal_iva_0_medicinas` decimal(20,2) DEFAULT NULL,
  `subtotal_iva_0_equipos` decimal(20,2) DEFAULT NULL,
  `subtotal_no_objeto_iva` decimal(20,2) DEFAULT NULL,
  `subtotal_excento_iva` decimal(20,2) DEFAULT NULL,
  `subtotal_sin_impuestos` decimal(20,2) DEFAULT NULL,
  `total_descuento_grava_iva` decimal(20,2) DEFAULT NULL,
  `total_descuento_iva_0_medicinas` decimal(20,2) DEFAULT NULL,
  `total_descuento_iva_0_equipos` decimal(20,2) DEFAULT NULL,
  `total_descuento_excento_iva` decimal(20,2) DEFAULT NULL,
  `total_descuento_sin_impuestos` decimal(20,2) DEFAULT NULL,
  `iva_gravado` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `iva` decimal(20,2) DEFAULT NULL,
  `ice` decimal(20,2) DEFAULT NULL,
  `irbpnr` decimal(20,2) DEFAULT NULL,
  `valor_total` decimal(20,2) DEFAULT NULL,
  `donación` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `observaciones` text COLLATE utf8_unicode_ci,
  `firma` blob,
  `sello` blob,
  PRIMARY KEY (`id_receta_medico`) USING BTREE,
  KEY `idservirec` (`id_servicio`),
  KEY `idsecrec` (`id_seccion`),
  KEY `recetas_id_prescriptor_ibfk_1` (`id_prescriptor`),
  KEY `receta_medico_pac` (`id_paciente`),
  KEY `idcuarto` (`id_cuarto`),
  CONSTRAINT `receta_medico_pac` FOREIGN KEY (`id_paciente`) REFERENCES `u_pacientes` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of recetas_medico
-- ----------------------------
INSERT INTO `recetas_medico` VALUES ('1', null, null, null, null, null, '6', '8', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '', null, null, null, null, '', '', null, null);

-- ----------------------------
-- Table structure for recetas_medico_equipos
-- ----------------------------
DROP TABLE IF EXISTS `recetas_medico_equipos`;
CREATE TABLE `recetas_medico_equipos` (
  `id_receta_médico_equipo` int(255) NOT NULL AUTO_INCREMENT,
  `id_receta_médico` int(255) DEFAULT NULL,
  `id_stock_farmacia_equipo` int(255) DEFAULT NULL,
  `código_barras` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_producto` int(255) DEFAULT NULL,
  `descripción` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cantidad` int(20) DEFAULT NULL,
  `precio_unitario` decimal(20,2) DEFAULT NULL,
  `descuento` decimal(20,2) DEFAULT NULL,
  `precio_total` decimal(20,2) DEFAULT NULL,
  `fecha_fabricación` date DEFAULT NULL,
  `fecha_caducidad` date DEFAULT NULL,
  `donación` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entregado` decimal(20,2) DEFAULT NULL,
  `no_entregado` decimal(20,2) DEFAULT NULL,
  `observaciones` text COLLATE utf8_unicode_ci,
  `id_prescriptor` int(255) DEFAULT NULL,
  PRIMARY KEY (`id_receta_médico_equipo`) USING BTREE,
  KEY `fac_prov_equ` (`id_receta_médico`),
  CONSTRAINT `recetas_medico_equipos_ibfk_1` FOREIGN KEY (`id_receta_médico`) REFERENCES `recetas_medico` (`id_receta_medico`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of recetas_medico_equipos
-- ----------------------------

-- ----------------------------
-- Table structure for recetas_medico_medicamentos
-- ----------------------------
DROP TABLE IF EXISTS `recetas_medico_medicamentos`;
CREATE TABLE `recetas_medico_medicamentos` (
  `id_receta_médico_medicamento` int(255) NOT NULL AUTO_INCREMENT,
  `id_receta_médico` int(255) DEFAULT NULL,
  `id_stock_farmacia_medicamentos` int(255) DEFAULT NULL,
  `código_barras` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `código_cnmb` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `descripción` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `forma_farmaceutica` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `concentración` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_producto` int(255) DEFAULT NULL,
  `autorizado_cnmb` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `autorizado_pnacional` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `n_autorizacion_restringido` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fecha_fabricación` date DEFAULT NULL,
  `fecha_caducidad` date DEFAULT NULL,
  `cantidad` decimal(20,2) DEFAULT NULL,
  `precio_unitario` decimal(20,2) DEFAULT NULL,
  `descuento` decimal(20,2) DEFAULT NULL,
  `precio_total` decimal(20,2) DEFAULT NULL,
  `donación` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entregado` decimal(20,2) DEFAULT NULL,
  `no_entregado` decimal(20,2) DEFAULT NULL,
  `observaciones` text COLLATE utf8_unicode_ci,
  `id_prescriptor` int(255) DEFAULT NULL,
  PRIMARY KEY (`id_receta_médico_medicamento`) USING BTREE,
  KEY `fac_prov_med` (`id_receta_médico`),
  KEY `idstockmed` (`id_stock_farmacia_medicamentos`),
  CONSTRAINT `recetas_medico_medicamentos_ibfk_1` FOREIGN KEY (`id_stock_farmacia_medicamentos`) REFERENCES `stock_farmacia_medicamentos` (`id_stock_farmacia_medicamentos`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `recetas_medico_medicamentos_ibfk_2` FOREIGN KEY (`id_receta_médico`) REFERENCES `recetas_medico` (`id_receta_medico`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of recetas_medico_medicamentos
-- ----------------------------

-- ----------------------------
-- Table structure for stockmed
-- ----------------------------
DROP TABLE IF EXISTS `stockmed`;
CREATE TABLE `stockmed` (
  `CODIGO` varchar(255) DEFAULT NULL,
  `NOMBRE` varchar(255) DEFAULT NULL,
  `PRESENTACIÓN` varchar(255) DEFAULT NULL,
  `SINONIMO` varchar(255) DEFAULT NULL,
  `LOTE` varchar(255) DEFAULT NULL,
  `PROVEEDOR` varchar(255) DEFAULT NULL,
  `REGISTRO SANITARIO` varchar(255) DEFAULT NULL,
  `FECHA ELABORACION` varchar(255) DEFAULT NULL,
  `FECHA CADUCIDAD` varchar(255) DEFAULT NULL,
  `STOCK` decimal(10,5) DEFAULT NULL,
  `PRECIO_UNITARIO` decimal(10,5) DEFAULT NULL,
  `VALOR_TOTAL` decimal(10,5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of stockmed
-- ----------------------------
INSERT INTO `stockmed` VALUES ('S01EC01TAB232X0', 'ACETAZOLAMIDA TABLETA 250 MG NR', 'CAJA X 30 TABLETAS', '', '19I20T02', 'KRONOS LABORATORIOS C. LTDA.', 'GBN-0645-05-05', '30/8/2019', '30/9/2021', '1050.00000', '0.21852', '229.44600');
INSERT INTO `stockmed` VALUES ('J05AB01SUS209G0', 'ACICLOVIR SUSPENSIÓN  200 MG/5 ML FRASCO X 100 ML', 'FRASCO 120ML', '', '0001-20', 'INDEUREC S.A.', '00399-1-MAN-07-06', '1/1/2020', '30/1/2023', '45.00000', '3.75000', '168.75000');
INSERT INTO `stockmed` VALUES ('L04AA06TAR173X0', 'ÁCIDO MICOFENÓLICO TABLETA RECUBIERTA 500 MG NR', 'CAJA X 20', '', '1011739', 'MEDIFARMA S.A.', '2675-MEE-0417', '1/1/2019', '30/1/2021', '400.00000', '1.04500', '418.00000');
INSERT INTO `stockmed` VALUES ('B02AA02SOY112A5', 'ÁCIDO TRANEXÁMICO SOLUCIÓN INYECTABLE  100 MG/ML AMPOLLA X 5 ML', 'CAJA X 50 AMPOLLAS /5ML', '', '193212096', 'REYOUNG PHARMACEUTICAL CO. LTD.', '2644-MEE-04-17', '30/7/2019', '31/7/2022', '5660.00000', '0.32000', '1811.20000');
INSERT INTO `stockmed` VALUES ('B02AA02TAB339X0', 'ÁCIDO TRANEXÁMICO TABLETA  500 MG NR', 'CAJA X 10 TABLETAS', '', '200021', 'ROPSOHN LABORATORIOS LTDA.', '0087-MAE-05-11', '30/1/2020', '31/12/2021', '3030.00000', '0.67000', '2030.10000');
INSERT INTO `stockmed` VALUES ('N03AG01TAR339X0', 'ÁCIDO VALPROICO TABLETA RECUBIERTA 500 MG NR', 'CAJA X 30 TABLETAS', '', '07687QA', 'ABBOTT LABORATORIES ARGENTINA S.A.', '25.194.06.03', '30/6/2019', '31/5/2022', '12740.00000', '0.13000', '1656.20000');
INSERT INTO `stockmed` VALUES ('D10AD03GEL024X0', 'ADAPALENO GEL  0,1 % NR', 'TUBO X 30G', '', '10183067', 'GLENMARK PHARMACEUTICALS LTD.', '28988-08-09', '30/12/2018', '30/11/2021', '626.00000', '3.50000', '2191.00000');
INSERT INTO `stockmed` VALUES ('P02CA03SUS116F4', 'ALBENDAZOL SUSPENSIÓN 100 MG/5 ML FRASCO X 20 ML', 'FRASCO X 20ML', '', '860719S', 'LABORATORIOS G.M. SUCESORES DEL DR. JULIO GONZALEZ MOSQUERA', '02691-MAC-06-03', '30/3/2019', '31/3/2022', '579.00000', '0.20790', '120.37410');
INSERT INTO `stockmed` VALUES ('P02CA03SUS116F4', 'ALBENDAZOL SUSPENSIÓN 100 MG/5 ML FRASCO X 20 ML', 'FRASCO X 20ML', '', '118340', 'LABORATORIOS G.M. SUCESORES DEL DR. JULIO GONZALEZ MOSQUERA', '02691-MAC-06-03', '1/8/2019', '30/3/2022', '5376.00000', '0.20790', '1117.67040');
INSERT INTO `stockmed` VALUES ('P02CA03TAM296X0', 'ALBENDAZOL TABLETA MASTICABLE 400 MG NR', 'CAJA X 30 TABLETAS', '', '248V', 'LABORATORIOS ROCNARF S.A.', '02557-MAC-04-03', '30/1/2020', '31/1/2022', '210.00000', '0.18000', '37.80000');
INSERT INTO `stockmed` VALUES ('M04AA01TAB265X0', 'ALOPURINOL TABLETA 300 MG NR', 'CAJA X 30 TABLETA', '', '180508', 'PROPHAR S.A', '1285-MAC-1-04-11', '1/5/2018', '30/5/2021', '16530.00000', '0.03700', '611.61000');
INSERT INTO `stockmed` VALUES ('M04AA01TAB265X0', 'ALOPURINOL TABLETA 300 MG NR', 'CAJA X 30 TABLETA', '', '181217', 'PROPHAR S.A', '1285-MAC-1-04-11', '1/12/2018', '31/12/2021', '150.00000', '0.03700', '5.55000');
INSERT INTO `stockmed` VALUES ('C01BD01SOY334A3', 'AMIODARONA SOLUCIÓN INYECTABLE  50 MG/ML AMPOLLA X 3 ML', 'CAJA X 6 AMPOLLAS /3ML', '', '191173J', 'ACROMAX LABORATORIO QUIMICO FARMACEUTICO S.A.', '5743-MAN-03-10', '30/10/2019', '31/10/2022', '18.00000', '0.47000', '8.46000');
INSERT INTO `stockmed` VALUES ('C01BD01TAB205X0', 'AMIODARONA TABLETA  200 MG NR', 'CAJA X 30 TABLETA', '', '0197-20', 'INDEUREC S.A.', 'GN-2060913', '28/2/2020', '28/2/2023', '1890.00000', '0.33047', '624.58830');
INSERT INTO `stockmed` VALUES ('N06AA09TAB222X0', 'AMITRIPTILINA TABLETA 25 MG NR', 'CAJA X 50 TABLETAS', '', '1730119', 'PSICOFARMA S.A.', '26-484-06-058', '30/1/2019', '31/1/2023', '23400.00000', '0.10000', '2340.00000');
INSERT INTO `stockmed` VALUES ('J01CA04CAP339X0', 'AMOXICILINA CÁPSULA 500 MG NR', 'CAJA X 100 CÁPSULAS', '', '011018', 'CAPLIN POINT LABORATORIES LTDA', '429-MEE-0914', '1/10/2018', '30/9/2021', '31100.00000', '0.02712', '843.43200');
INSERT INTO `stockmed` VALUES ('J01CA04CAP339X0', 'AMOXICILINA CÁPSULA 500 MG NR', 'CAJA X 100 CÁPSULAS', '', '041018', 'CAPLIN POINT LABORATORIES LTDA', '429-MEE-0914', '1/10/2018', '30/9/2021', '19500.00000', '0.02712', '528.84000');
INSERT INTO `stockmed` VALUES ('J01CR02POS229G0', 'AMOXICILINA E INHIBIDORES DE LA ENZIMA POLVO PARA SUSPENSIÓN 250 + 62,5 MG/5 ML FRASCO X 100 ML', 'CAJA X 1 FRASCO 100ML', 'Amoxicilina + Ácido clavulánico', '1052399', 'LABORATORIOS NATURALES Y GENERICOS S. A. C.', 'GBE-1371-08-10', '30/5/2019', '31/5/2021', '133.00000', '1.35000', '179.55000');
INSERT INTO `stockmed` VALUES ('J01CR02POI069X0', 'AMOXICILINA E INHIBIDORES DE LA ENZIMA POLVO PARA INYECCIÓN  1 000 MG + 200 MG  NR', 'CAJA X 10 FRASCO 10', 'Amoxicilina + Ácido clavulánico', '0620004', 'BETAPHARMA S.A.', '2631-MEN-0420', '1/6/2020', '30/6/2022', '27020.00000', '0.07990', '2158.89800');
INSERT INTO `stockmed` VALUES ('J01CR02TAR337X0', 'AMOXICILINA E INHIBIDORES DE LA ENZIMA TABLETA RECUBIERTA 500 + 125 MG NR', 'CAJA X 80 TABLETAS', 'Amoxicilina + Ácido clavulánico', 'KG3595', 'LEK PHARMACEUTICALS', 'H6910913', '1/12/2019', '30/12/2021', '9920.00000', '0.07990', '792.60800');
INSERT INTO `stockmed` VALUES ('J01CA04POS238G0', 'AMOXICILINA POLVO PARA SUSPENSIÓN 250 MG/5 ML FRASCO X 100 ML', 'FRASCO X 100 ML', '', '0419934', 'BETAPHARMA S.A.', '03669-MAN-06-05', '30/4/2019', '30/4/2022', '365.00000', '2.22000', '810.30000');
INSERT INTO `stockmed` VALUES ('J01CA04POS238G0', 'AMOXICILINA POLVO PARA SUSPENSIÓN 250 MG/5 ML FRASCO X 100 ML', 'FRASCO X 100 ML', '', '0519956', 'BETAPHARMA S.A.', '03669-MAN-06-05', '30/5/2019', '31/5/2022', '160.00000', '2.22000', '355.20000');
INSERT INTO `stockmed` VALUES ('J01CR01POI123X0', 'AMPICILINA E INHIBIDORES DE LA ENZIMA POLVO PARA INYECCIÓN 1 000 MG + 500 MG NR', 'CAJA X 10  FRASCO', '', '1019161', 'BETAPHARMA S.A.', '03491-MAN-03-05', '1/10/2019', '30/10/2021', '500.00000', '0.44000', '220.00000');
INSERT INTO `stockmed` VALUES ('J01CR01POI123X0', 'AMPICILINA E INHIBIDORES DE LA ENZIMA POLVO PARA INYECCIÓN 1 000 MG + 500 MG NR', 'CAJA X 10  FRASCO', '', '1020178', 'BETAPHARMA S.A.', '03491-MAN-03-05', '1/10/2020', '30/10/2022', '4010.00000', '0.44000', '1764.40000');
INSERT INTO `stockmed` VALUES ('J01CA01POI121X0', 'AMPICILINA POLVO PARA INYECCIÓN 500 MG NR', 'CAJA X 50 AMPOLLAS', '', '193012020', 'REYOUNG PHARMACEUTICAL CO. LTD.', '2114-MEE-0516', '1/6/2019', '30/6/2022', '2000.00000', '0.11000', '220.00000');
INSERT INTO `stockmed` VALUES ('J01CA01POI121X0', 'AMPICILINA POLVO PARA INYECCIÓN 1 000 MG NR', 'CAJA X 50 AMPOLLAS', '', '193012002', 'REYOUNG PHARMACEUTICAL CO. LTD.', '2124-MEE-0516', '1/2/2019', '28/2/2022', '5000.00000', '0.16500', '825.00000');
INSERT INTO `stockmed` VALUES ('C07AB03TAB329X0', 'ATENOLOL TABLETA  50 MG NR', 'CAJA X 100 TABLETAS', '', 'A0049', 'AUROCHEM LABORATORIES (I) PVT. LTD', '2715-MEE-0517', '1/1/2020', '30/12/2022', '3000.00000', '0.01350', '40.50000');
INSERT INTO `stockmed` VALUES ('A03BA01SOY081A0', 'ATROPINA SOLUCIÓN INYECTABLE  1 MG/ML AMPOLLA X 1 ML', 'CAJA X100AMPOLLAS /1ML', '', '19.08.2692', 'LABORATORIO BIOSANO S.A', '25-450-11-03', '30/8/2019', '31/8/2021', '1600.00000', '0.30000', '480.00000');
INSERT INTO `stockmed` VALUES ('A03BA01SOY081A0', 'ATROPINA SOLUCIÓN INYECTABLE  1 MG/ML AMPOLLA X 1 ML', 'CAJA X100AMPOLLAS /1ML', '', '75ND0755', 'LABORATORIO SANDERSON S.A.', '20-971-1-12-03', '1/4/2019', '30/4/2022', '1100.00000', '0.30000', '330.00000');
INSERT INTO `stockmed` VALUES ('J01FA10TAB339X0', 'AZITROMICINA TABLETA  500 MG NR', 'CAJA X 4 TABLETAS', '', '810V', 'LABORATORIOS ROCNARF S.A.', 'GBN1870513', '1/6/2020', '30/6/2022', '1252.00000', '0.04480', '56.08960');
INSERT INTO `stockmed` VALUES ('J01CE08POI138X0', 'BENCILPENICILINA BENZATÍNICA POLVO PARA INYECCIÓN 1 200 000 UI NR', 'CAJA X 50 AMPOLLAS', '', '193012003', 'REYOUNG PHARMACEUTICAL CO. LTD.', '2309-MEE-0716', '1/2/2019', '28/2/2022', '150.00000', '0.16900', '25.35000');
INSERT INTO `stockmed` VALUES ('J01CE08POI219X0', 'BENCILPENICILINA BENZATÍNICA POLVO PARA INYECCIÓN 2 4000 000 UI NR', 'CAJA X 50 AMPOLLAS', '', '183012012', 'REYOUNG PHARMACEUTICAL CO. LTD.', '2122-MEE-0516', '30/4/2018', '30/4/2021', '450.00000', '0.33000', '148.50000');
INSERT INTO `stockmed` VALUES ('J01CE08POI367X0', 'BENCILPENICILINA BENZATÍNICA POLVO PARA INYECCIÓN 600 000 UI NR', 'CAJA X 50 AMPOLLAS', '', '193012005', 'REYOUNG PHARMACEUTICAL CO. LTD.', '2011-MEE-0416', '1/2/2019', '28/2/2022', '250.00000', '0.17000', '42.50000');
INSERT INTO `stockmed` VALUES ('J01CE01POI352X0', 'BENCILPENICILINA POLVO PARA INYECCIÓN 5 000 000 UI NR', 'CAJA X 10 AMPOLLAS', '', '1119060', 'BETAPHARMA S.A.', 'GBN-0662-05-05', '30/11/2019', '30/11/2021', '300.00000', '0.45000', '135.00000');
INSERT INTO `stockmed` VALUES ('N04AA02TAB178X0', 'BIPERIDENO TABLETA 2 MG NR', 'CAJA X 100 TABLETAS', '', '2020290', 'LABORATORIOS AC FARMA S.A.', '2072-MEE-0518', '28/2/2020', '28/2/2022', '5300.00000', '0.06000', '318.00000');
INSERT INTO `stockmed` VALUES ('N01BB51SOY053A4', 'BUPIVACAÍNA, COMBINACIONES  SOLUCIÓN INYECTABLE 0,75 % AMPOLLA X 4 ML', 'CAJA X 24 AMPOLLAS/4ML', 'Bupivacaína hiperbárica', '00017', 'ROPSOHN LABORATORIOS LTDA.', '03388-MAE-12-04', '1/1/2020', '30/12/2022', '480.00000', '2.53000', '1214.40000');
INSERT INTO `stockmed` VALUES ('A03BB01SOY200A0', 'BUTILESCOPOLAMINA SOLUCIÓN INYECTABLE  20 MG/ML AMPOLLA X 1 ML', 'CAJA X 100  AMPOLLAS/1ML', '', '75MF0924', 'LABORATORIO SANDERSON S.A.', '27-767-07-07', '30/7/2018', '30/6/2022', '2100.00000', '0.29500', '619.50000');
INSERT INTO `stockmed` VALUES ('A03BB01SOY200A0', 'BUTILESCOPOLAMINA SOLUCIÓN INYECTABLE  20 MG/ML AMPOLLA X 1 ML', 'CAJA X 100  AMPOLLAS/1ML', '', '75ML2122', 'LABORATORIO SANDERSON S.A.', '27-767-07-07', '30/11/2018', '30/11/2022', '6100.00000', '0.29500', '1799.50000');
INSERT INTO `stockmed` VALUES ('A03BB01SOY200A0', 'BUTILESCOPOLAMINA SOLUCIÓN INYECTABLE  20 MG/ML AMPOLLA X 1 ML', 'CAJA X 100  AMPOLLAS/1ML', '', '75ML2123', 'LABORATORIO SANDERSON S.A.', '27-767-07-07', '30/11/2018', '30/11/2022', '200.00000', '0.29500', '59.00000');
INSERT INTO `stockmed` VALUES ('N04BC06TAB048X0', 'CABERGOLINA TABLETA 0,5 MG NR', 'CAJA X 20 TABLETAS', '', '061801', 'QUALIPHARM LABORATORIO FARMACEUTICO S.A.', '360000312', '30/6/2018', '30/6/2021', '482.00000', '3.33000', '1605.06000');
INSERT INTO `stockmed` VALUES ('N04BC06TAB048X0', 'CABERGOLINA TABLETA 0,5 MG NR', 'CAJA X 4 TABLETAS', '', '0239-20', 'INDEUREC S.A.', '534-MEN-0915', '30/3/2020', '31/3/2023', '332.00000', '3.33000', '1105.56000');
INSERT INTO `stockmed` VALUES ('D05AX52UNG325T3', 'CALCIPOTRIOL, COMBINACIONES  UNGÜENTO 50 MCG + 0,5 MG/G TUBO X 30 G', 'TUBO X 30G', '', 'H929', 'AUROCHEM LABORATORIES (I) PVT. LTD', '2157-MEE-0516', '30/8/2019', '31/7/2021', '1891.00000', '7.00000', '13237.00000');
INSERT INTO `stockmed` VALUES ('A11CC04CAP047X0', 'CALCITRIOL CÁPSULA  0,5 MCG NR', 'CAJA X 30 CÁPSULAS BLANDAS', '', '19ST1107', 'FARMACID S.A.', '797-MEN-0516', '30/11/2019', '30/11/2021', '5130.00000', '0.20000', '1026.00000');
INSERT INTO `stockmed` VALUES ('A11CC04CAP047X0', 'CALCITRIOL CÁPSULA  0,5 MCG NR', 'CAJA X 30 CÁPSULAS BLANDAS', '', '1257153', 'PROCAPS S.A.', 'H7141013', '30/6/2019', '30/6/2021', '1650.00000', '0.20000', '330.00000');
INSERT INTO `stockmed` VALUES ('N03AF01SUS116X0', 'CARBAMAZEPINA SUSPENSIÓN  100 MG/5 ML NR', '', '', '20FI0301', 'FARMACID S.A.', '04434-MAN-10-06', '1/3/2020', '31/3/2023', '480.00000', '0.50000', '240.00000');
INSERT INTO `stockmed` VALUES ('N03AF01TAB205X0', 'CARBAMAZEPINA TABLETA 200 MG NR', 'CAJA X 20 TABLETAS', '', '19DK0804R', 'FARMACID S.A.', '01157-MAC-1-04-11', '30/8/2021', '30/8/2021', '26610.00000', '0.08000', '2128.80000');
INSERT INTO `stockmed` VALUES ('N03AF01TAB205X0', 'CARBAMAZEPINA TABLETA 200 MG NR', 'CAJA X 20 TABLETAS', '', '191131', 'PROPHAR S.A', '01157-MAC-1-04-11', '1/11/2019', '30/11/2023', '10400.00000', '0.08000', '832.00000');
INSERT INTO `stockmed` VALUES ('N03AF01TAB205X0', 'CARBAMAZEPINA TABLETA 200 MG NR', 'CAJA X 20 TABLETAS', '', '190407', 'PROPHAR S.A', '01157-MAC-1-04-11', '1/4/2019', '30/4/2023', '4680.00000', '0.08000', '374.40000');
INSERT INTO `stockmed` VALUES ('N03AF01TAR296X0', 'CARBAMAZEPINA TABLETA RECUBIERTA 400 MG NR', 'CAJA X 20 TABLETAS', '', '200201', 'PROPHAR S.A', '01270-MAC-1-02-12', '1/2/2020', '29/2/2024', '3860.00000', '0.11000', '424.60000');
INSERT INTO `stockmed` VALUES ('B05BA03SOY088N1', 'CARBOHIDRATOS (DEXTROSA EN AGUA) SOLUCIÓN INYECTABLE  10% FRASCO/FUNDA X 1000 ML', 'CAJA X 16 BOLOS', '', '1900334', 'LABORATORIOS INDUSTRIALES FARMACEUTICOS ECUATORIANOS LIFE C.A.', 'GBN-0917-09-06', '01-30/2019', '31/1/2023', '128.00000', '0.99000', '126.72000');
INSERT INTO `stockmed` VALUES ('B05BA03SOY335U4', 'CARBOHIDRATOS (DEXTROSA EN AGUA) SOLUCIÓN INYECTABLE  50% FUNDA X 500  ML', 'CAJA X 40 BOLOS', '', 'SB18LL5', 'LABORATORIOS BAXTER S.A CALI-COLOMBIA', '21-254-1-04-04', '1/12/2018', '31/12/2020', '150.00000', '1.75000', '262.50000');
INSERT INTO `stockmed` VALUES ('B05BA03SOY335U4', 'CARBOHIDRATOS (DEXTROSA EN AGUA) SOLUCIÓN INYECTABLE  50% FUNDA X 500  ML', 'CAJA X 40 BOLOS', '', 'SB19KF0', 'LABORATORIOS BAXTER S.A CALI-COLOMBIA', '21-254-1-04-04', '1/11/2019', '30/11/2021', '480.00000', '1.75000', '840.00000');
INSERT INTO `stockmed` VALUES ('B05BA03SOY310N1', 'CARBOHIDRATOS (DEXTROSA EN AGUA) SOLUCIÓN INYECTABLE  5% FRASCO/FUNDA X 1000 ML', 'CAJA X 16 BOLOS', '', '1803893', 'LABORATORIOS INDUSTRIALES FARMACEUTICOS ECUATORIANOS LIFE C.A.', 'GBN-0917-09-06', '1/7/2020', '31/7/2022', '1952.00000', '0.71540', '1396.46080');
INSERT INTO `stockmed` VALUES ('B05BA03SOY310N1', 'CARBOHIDRATOS (DEXTROSA EN AGUA) SOLUCIÓN INYECTABLE  5% FRASCO/FUNDA X 1000 ML', 'CAJA X 16 BOLOS', '', '180655', 'LABORATORIOS INDUSTRIALES FARMACEUTICOS ECUATORIANOS LIFE C.A.', 'GBN-0917-09-06', '1/12/2019', '31/12/2022', '592.00000', '0.71540', '423.51680');
INSERT INTO `stockmed` VALUES ('B05BA03SOY310N1', 'CARBOHIDRATOS (DEXTROSA EN AGUA) SOLUCIÓN INYECTABLE  5% FRASCO/FUNDA X 1000 ML', 'CAJA X 16 BOLOS', '', '2000592', 'LABORATORIOS INDUSTRIALES FARMACEUTICOS ECUATORIANOS LIFE C.A.', 'GBN-0917-09-06', '1/2/2020', '28/2/2024', '1680.00000', '0.71540', '1201.87200');
INSERT INTO `stockmed` VALUES ('B05BA03SOY310N1', 'CARBOHIDRATOS (DEXTROSA EN AGUA) SOLUCIÓN INYECTABLE  5% FRASCO/FUNDA X 1000 ML', 'CAJA X 16 BOLOS', '', '1806556', 'LABORATORIOS INDUSTRIALES FARMACEUTICOS ECUATORIANOS LIFE C.A.', 'GBN-0917-09-06', '1/12/2019', '30/12/2022', '3504.00000', '0.71540', '2506.76160');
INSERT INTO `stockmed` VALUES ('B05BA03SOY310N3', 'CARBOHIDRATOS (DEXTROSA EN AGUA) SOLUCIÓN INYECTABLE  5% FRASCO/FUNDA X 500 ML', 'CAJA X 40 BOLOS', '', '2000097', 'LABORATORIOS INDUSTRIALES FARMACEUTICOS ECUATORIANOS LIFE C.A.', 'GBN-0917-09-06', '1/1/2018', '1/1/2023', '800.00000', '1.21000', '968.00000');
INSERT INTO `stockmed` VALUES ('B05BA03SOY310N3', 'CARBOHIDRATOS (DEXTROSA EN AGUA) SOLUCIÓN INYECTABLE  5% FRASCO/FUNDA X 500 ML', 'CAJA X 40 BOLOS', '', '2000098', 'LABORATORIOS INDUSTRIALES FARMACEUTICOS ECUATORIANOS LIFE C.A.', 'GBN-0917-09-06', '1/1/2018', '1/1/2023', '1732.00000', '1.21000', '2095.72000');
INSERT INTO `stockmed` VALUES ('B05BA03SOY310N3', 'CARBOHIDRATOS (DEXTROSA EN AGUA) SOLUCIÓN INYECTABLE  5% FRASCO/FUNDA X 500 ML', 'CAJA X 40 BOLOS', '', '2001554', 'LABORATORIOS INDUSTRIALES FARMACEUTICOS ECUATORIANOS LIFE C.A.', 'GBN-0917-09-06', '1/5/2019', '30/5/2023', '3600.00000', '1.21000', '4356.00000');
INSERT INTO `stockmed` VALUES ('B05BA03SOY310N3', 'CARBOHIDRATOS (DEXTROSA EN AGUA) SOLUCIÓN INYECTABLE  5% FRASCO/FUNDA X 500 ML', 'CAJA X 40 BOLOS', '', '2001556', 'LABORATORIOS INDUSTRIALES FARMACEUTICOS ECUATORIANOS LIFE C.A.', 'GBN-0917-09-06', '1/5/2019', '30/5/2023', '1712.00000', '1.21000', '2071.52000');
INSERT INTO `stockmed` VALUES ('A07BA01POL000X0', 'CARBÓN MEDICINAL POLVO  ND NR', 'FUNDA X 50G', '', 'GAMA-2019011701', 'HANGZHOU NATURE TECHNOLOGY CO., LTD.', '', '1/7/2019', '17/1/2022', '14.00000', '1.29000', '18.06000');
INSERT INTO `stockmed` VALUES ('C07AG02TAB357X0', 'CARVEDILOL TABLETA  6,25 MG NR', 'CAJA X 100 TABLETAS', '', '1041349', 'LABORATORIOS AC FARMA S.A.', '2098-MEE-0516', '30/4/2019', '30/4/2022', '17000.00000', '0.02200', '374.00000');
INSERT INTO `stockmed` VALUES ('C07AG02TAB357X0', 'CARVEDILOL TABLETA  6,25 MG NR', 'CAJA X 100 TABLETAS', '', '2030220', 'LABORATORIOS AC FARMA S.A.', '2098-MEE-0516', '30/3/2020', '31/3/2023', '2900.00000', '0.02200', '63.80000');
INSERT INTO `stockmed` VALUES ('J01DB01CAP339X0', 'CEFALEXINA CÁPSULA 500 MG NR', 'CAJA X 100 CÁPSULAS', '', '0220629', 'BETAPHARMA S.A.', 'GBN-0755-06-05', '1/2/2020', '28/2/2022', '6600.00000', '0.04200', '277.20000');
INSERT INTO `stockmed` VALUES ('J01DB01POS238X0', 'CEFALEXINA POLVO PARA SUSPENSIÓN  250 MG/5 ML NR', 'FRASCO 60ML', '', '093V', 'LABORATORIOS ROCNARF S.A.', 'GB-0036-2-0911', '30/12/2019', '30/6/2021', '107.00000', '1.80000', '192.60000');
INSERT INTO `stockmed` VALUES ('J01DD02POI121X0', 'CEFTAZIDIMA POLVO PARA INYECCIÓN 1 000 MG NR', 'CAJA X 10 AMPOLLAS', '', '200601', 'HUNAN KELUN PHARMACEUTICA CO. LTD', '2258-MEE0616', '17/6/2020', '16/6/2022', '1500.00000', '1.02410', '1536.15000');
INSERT INTO `stockmed` VALUES ('J01DD04POI121X0', 'CEFTRIAXONA POLVO PARA INYECCIÓN 1 000 MG NR', 'CAJA X 10 FRASCO', '', '0520083', 'BETAPHARMA S.A.', 'GBN-0580-03-50', '1/5/2020', '30/5/2022', '5000.00000', '1.21000', '6050.00000');
INSERT INTO `stockmed` VALUES ('J01MA02TAB339X0', 'CIPROFLOXACINO TABLETA 500 MG NR', 'CAJA X 100', '', '030319', 'CSPC OUYI PHARMACEUTICAL CO, LTD.', '3108-MEE-117', '30/3/2019', '28/2/2022', '8100.00000', '0.02700', '218.70000');
INSERT INTO `stockmed` VALUES ('J01MA02TAR339X0', 'CIPROFLOXACINO TABLETA RECUBIERTA 500 MG NR', 'CAJA X 30 TABLETAS', '', '19BL0705', 'FARMACID S.A.', '02069-MAC-07-02', '30/7/2019', '31/7/2022', '390.00000', '0.02700', '10.53000');
INSERT INTO `stockmed` VALUES ('J01MA02SOY183G0', 'CIPROFLOXACINO SOLUCIÓN INYECTABLE  2 MG/ML FRASCO X 100 ML', 'FRASCO X 100ML', '', 'CP219202', 'CAPLIN POINT LABORATORIES LTDA', '2415-MEE-0916', '1/3/2019', '28/2/2021', '250.00000', '3.17000', '792.50000');
INSERT INTO `stockmed` VALUES ('J01MA02SOY183G0', 'CIPROFLOXACINO SOLUCIÓN INYECTABLE  2 MG/ML FRASCO X 100 ML', 'FRASCO X 100ML', '', '73C9DO182', 'CAPLIN POINT LABORATORIES LTDA', '1044-MEE-0915', '1/4/2019', '30/4/2021', '792.00000', '3.17000', '2510.64000');
INSERT INTO `stockmed` VALUES ('J01FF01SOY160A4', 'CLINDAMICINA SOLUCIÓN INYECTABLE 150 MG/ML AMPOLLA X 4 ML', 'CAJA X 10 MPOLLAS MG/4MG', '', 'P200635', 'VITALIS', 'GBE-0574-03-05', '1/3/2020', '31/3/2022', '4310.00000', '0.37530', '1617.54300');
INSERT INTO `stockmed` VALUES ('J01FF01SOY160A4', 'CLINDAMICINA SOLUCIÓN INYECTABLE 150 MG/ML AMPOLLA X 4 ML', 'CAJA X 10 MPOLLAS MG/4MG', '', 'P200029', 'VITALIS', 'GBE-0574-03-05', '1/1/2020', '31/1/2022', '15.00000', '0.37530', '5.62950');
INSERT INTO `stockmed` VALUES ('G03GB02TAB329X0', 'CLOMIFENO TABLETA 50 MG NR', 'CAJA X 10 TABLETAS', '', '8A3149', 'LABORATORIOS SYNTHESIS LTDA. & CIA. S.C.A.', '760-MEE-0215', '30/5/2018', '31/5/2021', '1370.00000', '0.25000', '342.50000');
INSERT INTO `stockmed` VALUES ('G03GB02TAB329X0', 'CLOMIFENO TABLETA 50 MG NR', 'CAJA X 10 TABLETAS', '', '0A2149', 'LABORATORIOS SYNTHESIS LTDA. & CIA. S.C.A.', '760-MEE-0215', '1/5/2018', '30/5/2021', '1200.00000', '0.25000', '300.00000');
INSERT INTO `stockmed` VALUES ('B01AC04TAR380X0', 'CLOPIDOGREL TABLETA RECUBIERTA  75 MG NR', 'CAJA X 30 TABLETAS RECUBIERTAS', '', '19SL1120', 'FARMACID S.A.', '875-MEN-0616', '30/11/2019', '30/11/2021', '8490.00000', '0.02300', '195.27000');
INSERT INTO `stockmed` VALUES ('A01AB03SOB031X0', 'CLORHEXIDINA SOLUCIÓN BUCAL  0,12 % NR', 'FRASCO  300ML', '', '19EE01002', 'FARMACID S.A.', '303--MEN-0315', '1/1/2019', '31/1/2021', '176.00000', '4.21933', '742.60208');
INSERT INTO `stockmed` VALUES ('D08AC02SOT185X0', 'CLORHEXIDINA SOLUCIÓN TÓPICA 2% NR', 'JABONOSO FRASCO X 250ML', '', 'LJ190306', 'LABORATORIOS LIRA S.A.', '1178-MEN-0717', '1/3/2019', '31/3/2021', '700.00000', '4.80000', '3360.00000');
INSERT INTO `stockmed` VALUES ('D08AC02SOT185X0', 'CLORHEXIDINA SOLUCIÓN TÓPICA 2% NR', 'JABONOSO FRASCO X 250ML', '', 'LJ190416', 'LABORATORIOS LIRA S.A.', '1178-MEN-0717', '1/3/2019', '31/3/2021', '3600.00000', '4.80000', '17280.00000');
INSERT INTO `stockmed` VALUES ('D08AC02SOT185X0', 'CLORHEXIDINA SOLUCIÓN TÓPICA 2% NR', 'ACUOSO FRASCO X 500ML', '', 'LA190513', 'LABORATORIOS LIRA S.A.', '6128-MAN-06-11', '19/5/2019', '31/5/2021', '480.00000', '4.80000', '2304.00000');
INSERT INTO `stockmed` VALUES ('D08AC02SOT185X0', 'CLORHEXIDINA SOLUCIÓN TÓPICA 2% NR', 'ACUOSO FRASCO X 500ML', '', 'LA190410', 'LABORATORIOS LIRA S.A.', '6128-MAN-06-11', '19/3/2019', '30/3/2021', '720.00000', '4.80000', '3456.00000');
INSERT INTO `stockmed` VALUES ('D08AC02SOT185X0', 'CLORHEXIDINA SOLUCIÓN TÓPICA 2% NR', 'ACUOSO FRASCO X 500ML', '', 'LA190304', 'LABORATORIOS LIRA S.A.', '6128-MAN-06-11', '19/3/2021', '30/3/2021', '3588.00000', '4.80000', '17222.40000');
INSERT INTO `stockmed` VALUES ('D08AC02SOT284X0', 'CLORHEXIDINA SOLUCIÓN TÓPICA 4% NR', 'FRASCO 500ML', '', '1806410', 'LABORATORIOS INDUSTRIALES FARMACEUTICOS ECUATORIANOS LIFE C.A.', '631-MEN-0116', '30/12/2017', '31/12/2021', '840.00000', '7.00000', '5880.00000');
INSERT INTO `stockmed` VALUES ('D08AC02SOT284X0', 'CLORHEXIDINA SOLUCIÓN TÓPICA 4% NR', 'FRASCO 500ML', '', '1901395', 'LABORATORIOS INDUSTRIALES FARMACEUTICOS ECUATORIANOS LIFE C.A.', '631-MEN-0116', '1/4/2017', '30/4/2022', '1490.00000', '7.00000', '10430.00000');
INSERT INTO `stockmed` VALUES ('N05AA01SOY224A2', 'CLORPROMAZINA SOLUCIÓN INYECTABLE 25 MG/2 ML AMPOLLA X 2 ML', 'CAJA /2ML', '', '75LF1092', 'LABORATORIO SANDERSON S.A.', 'GBE-00088-01-02-05', '4/7/2017', '30/6/2021', '200.00000', '0.25000', '50.00000');
INSERT INTO `stockmed` VALUES ('C03BA04TAB329X0', 'CLORTALIDONA TABLETA  50 MG NR', 'CAJA X 30 TABLETAS', '', '191208', 'PROPHAR S.A', '01202-MAC-1-04-11', '24/12/2019', '31/12/2022', '18450.00000', '0.08000', '1476.00000');
INSERT INTO `stockmed` VALUES ('B05XA01SOY177A1', 'CLORURO DE POTASIO SOLUCIÓN INYECTABLE  2 MEQ/ML (20 %) AMPOLLA X 10 ML', 'CAJA X 40 VÍALES', '', '90157', 'HOSPIMEDIKKA CIA. LTDA.', '03136-MAE-06-04', '1/3/2019', '28/2/2022', '1160.00000', '0.35000', '406.00000');
INSERT INTO `stockmed` VALUES ('B05CB01SOY056U4', 'CLORURO DE SODIO SOLUCIÓN INYECTABLE  0,9 % FUNDA X 500  ML', 'CAJA X 25 VÍALES', '', '20001556', 'LABORATORIOS INDUSTRIALES FARMACEUTICOS ECUATORIANOS LIFE C.A.', 'GBN-0977-09-08', '1/5/2019', '30/1/2023', '1955.00000', '0.66000', '1290.30000');
INSERT INTO `stockmed` VALUES ('B05XA03SOY251A1', 'CLORURO DE SODIO SOLUCIÓN INYECTABLE  3,4 MEQ/ML (20%) AMPOLLA X 10 ML', '', '', '20000763', 'LABORATORIOS INDUSTRIALES FARMACEUTICOS ECUATORIANOS LIFE C.A.', '02384-MAC-01-03', '1/4/2020', '30/4/2025', '920.00000', '0.46000', '423.20000');
INSERT INTO `stockmed` VALUES ('B05XA03SOY251A1', 'CLORURO DE SODIO SOLUCIÓN INYECTABLE  3,4 MEQ/ML (20%) AMPOLLA X 10 ML', '', '', '20000764', 'LABORATORIOS INDUSTRIALES FARMACEUTICOS ECUATORIANOS LIFE C.A.', '02384-MAC-01-03', '1/4/2020', '30/4/2025', '380.00000', '0.46000', '174.80000');
INSERT INTO `stockmed` VALUES ('G01AF02CRV066T5', 'CLOTRIMAZOL CREMA VAGINAL 1% TUBO X 40 G + APLICADORES', 'TUBO X 40G', '', '9GC4878A', 'LABORATORIOS GENERICOS FARMACEUTICOS ECUATORIANOS S.A. GENFAR ECUADOR', '02022-MAC-06-02', '30/9/2019', '30/9/2022', '964.00000', '0.92650', '893.14600');
INSERT INTO `stockmed` VALUES ('G01AF02CRV066T5', 'CLOTRIMAZOL CREMA VAGINAL 1% TUBO X 40 G + APLICADORES', 'TUBO X 40G', '', '0GC0592A', 'LABORATORIOS GENERICOS FARMACEUTICOS ECUATORIANOS S.A. GENFAR ECUADOR', '02022-MAC-06-02', '28/2/2020', '31/1/2023', '2444.00000', '0.92650', '2264.36600');
INSERT INTO `stockmed` VALUES ('G01AF02CRV185T2', 'CLOTRIMAZOL CREMA VAGINAL 2% TUBO X 20 G + APLICADORES', 'TUBO X20G', '', 'E8027', 'CURETECH SKINCARE. PLOT NO.33&34, PHASE IV, BHATOLI KALAN, BADDI', '2299-MEE-0716', '28/2/2018', '31/1/2021', '480.00000', '0.36630', '175.82400');
INSERT INTO `stockmed` VALUES ('B05CB10SOY000U5', 'COMBINACIONES SOLUCIÓN INYECTABLE  ND FUNDA X 1000 ML', 'CAJA X 16 BOLOS', 'Lactato de ringer', '2001204', 'LABORATORIOS INDUSTRIALES FARMACEUTICOS ECUATORIANOS LIFE C.A.', '', '30/4/2020', '30/4/2024', '1792.00000', '0.71460', '1280.56320');
INSERT INTO `stockmed` VALUES ('B05CB10SOY000U5', 'COMBINACIONES SOLUCIÓN INYECTABLE  ND FUNDA X 1000 ML', 'CAJA X 16 BOLOS', 'Lactato de ringer', '2001632', 'LABORATORIOS INDUSTRIALES FARMACEUTICOS ECUATORIANOS LIFE C.A.', '', '30/5/2020', '30/5/2024', '912.00000', '0.71460', '651.71520');
INSERT INTO `stockmed` VALUES ('B05CB10SOY000U5', 'COMBINACIONES SOLUCIÓN INYECTABLE  ND FUNDA X 1000 ML', 'CAJA X 16 BOLOS', 'Lactato de ringer', '2001203', 'LABORATORIOS INDUSTRIALES FARMACEUTICOS ECUATORIANOS LIFE C.A.', '', '30/4/2020', '30/4/2024', '1648.00000', '0.71460', '1177.66080');
INSERT INTO `stockmed` VALUES ('B05CB10SOY000U5', 'COMBINACIONES SOLUCIÓN INYECTABLE  ND FUNDA X 1000 ML', 'CAJA X 16 BOLOS', 'Lactato de ringer', '2001633', 'LABORATORIOS INDUSTRIALES FARMACEUTICOS ECUATORIANOS LIFE C.A.', '', '30/5/2020', '30/4/2024', '2291.00000', '0.71460', '1637.14860');
INSERT INTO `stockmed` VALUES ('J04BA02TAB105X0', 'DAPSONA TABLETA 100 MG NR', 'CAJA X 50 TABLETAS', '', '0001', 'LABORATORIO LAZAR ECUADOR S.A. LAZARECSA', 'GBE-1314-10-09', '30/9/2018', '30/9/2021', '250.00000', '0.26332', '65.83000');
INSERT INTO `stockmed` VALUES ('', 'DEXAMETASONA Y ANTIINFECCIOSOS UNGUENTO OFTALMICO 0.1%+0.3% NR', 'CREMA 3,5G', '', '00170', 'LABORATORIO ROEMMERS S.A', '25,567,02,04', '25/11/2019', '30/11/2021', '150.00000', '5.35000', '802.50000');
INSERT INTO `stockmed` VALUES ('S01CA01SUF025F0', 'DEXAMETASONA Y ANTIINFECCIOSOS SUSPENSIÓN OFTÁLMICA 0,1 % + 0,3 % FRASCO X 5 ML', 'GOTASX 5ML', '', '00346', 'LABORATORIOS POEN S.A.', '23,709-1-05-11', '10/12/2019', '30/12/2021', '197.00000', '5.33000', '1050.01000');
INSERT INTO `stockmed` VALUES ('S01CA01SUF025F0', 'DEXAMETASONA Y ANTIINFECCIOSOS SUSPENSIÓN OFTÁLMICA 0,1 % + 0,3 % FRASCO X 5 ML', 'GOTASX 5ML', '', '00336', 'LABORATORIOS POEN S.A.', '23,709-1-05-11', '1/7/2019', '30/7/2021', '240.00000', '5.33000', '1279.20000');
INSERT INTO `stockmed` VALUES ('N05BA01SOY320A2', 'DIAZEPAM SOLUCIÓN INYECTABLE 5 MG/ML AMPOLLA X 2 ML', 'CAJA X 100 AMPOLLAS', '', '17.08.1288', 'LABORATORIO BIOSANO S.A', 'GBE-00123-1-03-07', '1/8/2017', '31/8/2021', '700.00000', '0.31220', '218.54000');
INSERT INTO `stockmed` VALUES ('N05BA01SOY320A2', 'DIAZEPAM SOLUCIÓN INYECTABLE 5 MG/ML AMPOLLA X 2 ML', 'CAJA X 100 AMPOLLAS', '', '18.01.1437', 'LABORATORIO BIOSANO S.A', 'GBE-00123-1-03-07', '30/1/2018', '31/1/2022', '1600.00000', '0.31220', '499.52000');
INSERT INTO `stockmed` VALUES ('J01CF01CAP339X0', 'DICLOXACILINA CÁPSULA 500 MG NR', 'CAJA X 50  CÁPSULAS', '', 'DCL5111908', 'WEXFORD LABORATORIES PVT. LTD', '362040912', '30/11/2019', '30/11/2022', '3400.00000', '0.12000', '408.00000');
INSERT INTO `stockmed` VALUES ('C01AA05SOY038A2', 'DIGOXINA SOLUCIÓN INYECTABLE  0,25 MG/ML AMPOLLA X 2 ML', 'CAJA X 1 FRASCO DE 60ML', '', 'N-13570', 'CARITAS HEALTHCARE PVT. LTDA', '1444-MEE-1015', '1/4/2019', '31/3/2022', '50.00000', '3.95000', '197.50000');
INSERT INTO `stockmed` VALUES ('N07CA00TAB329X0', 'DIMENHIDRINATO TABLETA 50 MG NR', 'CAJA X 100 TABLETAS', '', '1806324', 'LABORATORIOS ECAR S.A.', '03174-MAE-07-04', '30/6/2018', '30/6/2021', '8300.00000', '0.01881', '156.12300');
INSERT INTO `stockmed` VALUES ('N07CA00TAB329X0', 'DIMENHIDRINATO TABLETA 50 MG NR', 'CAJA X 100 TABLETAS', '', '2001038', 'LABORATORIOS ECAR S.A.', '03174-MAE-07-04', '30/12/2019', '31/12/2022', '4700.00000', '0.01881', '88.40700');
INSERT INTO `stockmed` VALUES ('C01CA07SOY334A5', 'DOBUTAMINA SOLUCIÓN INYECTABLE  50 MG/ML AMPOLLA X 5 ML', 'CAJA X 100 AMPOLLAS', '', '75OE0870', 'LABORATORIO SANDERSON S.A.', 'GBE-0538-02-05', '30/7/2018', '31/5/2021', '930.00000', '1.14400', '1063.92000');
INSERT INTO `stockmed` VALUES ('C01CA07SOY334A5', 'DOBUTAMINA SOLUCIÓN INYECTABLE  50 MG/ML AMPOLLA X 5 ML', 'CAJA X 100 AMPOLLAS', '', '75NF1030', 'LABORATORIO SANDERSON S.A.', 'GBE-0538-02-05', '12/6/2019', '30/6/2022', '320.00000', '1.14400', '366.08000');
INSERT INTO `stockmed` VALUES ('B05BB02SOY322U5', 'ELECTROLITOS CON CARBOHIDRATOS SOLUCIÓN INYECTABLE  5% + 0,9 % FUNDA X 1000 ML', 'CAJA X 16 BOLOS', 'DEXTROSA EN SOLUCIÓN SALINA', '1900235', 'LABORATORIOS INDUSTRIALES FARMACEUTICOS ECUATORIANOS LIFE C.A.', '02267-MAN', '1/1/2018', '30/1/2022', '1014.00000', '1.11000', '1125.54000');
INSERT INTO `stockmed` VALUES ('B05BB02SOY322U5', 'ELECTROLITOS CON CARBOHIDRATOS SOLUCIÓN INYECTABLE  5% + 0,9 % FUNDA X 1000 ML', 'CAJA X 16 BOLOS', 'DEXTROSA EN SOLUCIÓN SALINA', '1900435', 'LABORATORIOS INDUSTRIALES FARMACEUTICOS ECUATORIANOS LIFE C.A.', '02267-MAN', '1/1/2018', '30/1/2023', '1924.00000', '1.11000', '2135.64000');
INSERT INTO `stockmed` VALUES ('B05BB02SOY322U5', 'ELECTROLITOS CON CARBOHIDRATOS SOLUCIÓN INYECTABLE  5% + 0,9 % FUNDA X 1000 ML', 'CAJA X 16 BOLOS', 'DEXTROSA EN SOLUCIÓN SALINA', '1900216', 'LABORATORIOS INDUSTRIALES FARMACEUTICOS ECUATORIANOS LIFE C.A.', '02267-MAN', '1/1/2018', '31/1/2022', '1184.00000', '1.11000', '1314.24000');
INSERT INTO `stockmed` VALUES ('J05AR06TAR268X0', 'EMTRICITABINA, TENOFOVIR DISOPROXIL Y EFAVIRENZ TABLETA RECUBIERTA 200 MG + 300 MG + 600 MG NR', 'CAJA X 30 TABLETAS', 'TRES MARIA', 'BED8929A', 'MACLEODS PHARMACEUTICALS LTD.', 'JGSFVV6F89QB', '1/4/2019', '30/3/2021', '1200.00000', '0.20300', '243.60000');
INSERT INTO `stockmed` VALUES ('J05AR06TAR268X0', 'EMTRICITABINA, TENOFOVIR DISOPROXIL Y EFAVIRENZ TABLETA RECUBIERTA 200 MG + 300 MG + 600 MG NR', 'CAJA X 30 TABLETAS', '', 'BED8830A', 'MACLEODS PHARMACEUTICALS LTD.', 'JGSFVV6F89QB', '30/4/2019', '30/3/2021', '3720.00000', '0.20300', '755.16000');
INSERT INTO `stockmed` VALUES ('C09AA02SOY082A2', 'ENALAPRIL SOLUCIÓN INYECTABLE 1,25 MG/ML AMPOLLA X 2 ML', 'CAJA X 1 AMPOLLA /2ML', '', '00141', 'ROEMMERS S.A.', '29062-10-09', '30/8/2019', '31/8/2022', '750.00000', '5.93990', '4454.92500');
INSERT INTO `stockmed` VALUES ('C09AA02SOY082A2', 'ENALAPRIL SOLUCIÓN INYECTABLE 1,25 MG/ML AMPOLLA X 2 ML', 'CAJA X 1 AMPOLLA /2ML', '', '145', 'ROEMMERS S.A.', '29062-10-09', '1/12/2019', '30/12/2022', '184.00000', '5.93990', '1092.94160');
INSERT INTO `stockmed` VALUES ('C09AA02TAB194X0', 'ENALAPRIL TABLETA 20 MG NR', 'CAJA X 20 TABLETAS', '', '200204', 'PROPHAR S.A', '02173-MAC-09-02', '26/2/2020', '28/2/2023', '11640.00000', '0.08000', '931.20000');
INSERT INTO `stockmed` VALUES ('C09AA02TAB314X0', 'ENALAPRIL TABLETA 5 MG NR', 'CAJA X 50 TABLETAS', '', '0A0514B', 'TECNOQUIMICAS S.A.', '02083-MAC-07-02', '24/1/2020', '31/1/2023', '13300.00000', '0.01870', '248.71000');
INSERT INTO `stockmed` VALUES ('C01CA24SOY081A0', 'EPINEFRINA SOLUCIÓN INYECTABLE  1 MG/ML AMPOLLA X 1 ML', 'CAJA X 100 AMPOLLAS /1ML', '', '75NI1839', 'LABORATORIO SANDERSON S.A.', 'GBE-0090-1-05-05', '30/9/2019', '30/9/2021', '2900.00000', '0.22000', '638.00000');
INSERT INTO `stockmed` VALUES ('R03AA01SOI455W0', 'EPINEFRINA SOLUCIÓN PARA INHALACIÓN  22,5 MG/ML (2,25 %) VIAL X 0,5 ML', 'CAJA X 30 AMPOLLAS /0,5ML', '', '926561', 'NEPHRON PHARMACEUTICALS CORPORATION', '29609-02-11', '28/2/2020', '28/2/2021', '270.00000', '3.50000', '945.00000');
INSERT INTO `stockmed` VALUES ('C03DA01TAB105X0', 'ESPIRONOLACTONA TABLETA  100 MG NR', 'CAJA X 10 TABLETAS', '', '180787G', 'ACROMAX LABORATORIO QUIMICO FARMACEUTICO S.A.', 'GBN-1524-04-11', '30/7/2018', '31/7/2021', '23490.00000', '0.16999', '3993.06510');
INSERT INTO `stockmed` VALUES ('C03DA01TAB222X0', 'ESPIRONOLACTONA TABLETA  25 MG NR', 'CAJA X 100 TABLETAS', '', '1030139', 'LABORATORIOS AC FARMA S.A.', '2666-MEE-0317', '30/3/2019', '31/3/2022', '5400.00000', '0.02000', '108.00000');
INSERT INTO `stockmed` VALUES ('G03CA04CRV080X0', 'ESTRIOL CREMA VAGINAL  1 MG/G (0,1 %) NR', 'TUBO X 15G', '', '1051059', 'LABORATORIOS AC FARMA S.A.', '2092-MEE-0516', '1/3/2019', '30/5/2022', '378.00000', '2.49000', '941.22000');
INSERT INTO `stockmed` VALUES ('G03CA04CRV080X0', 'ESTRIOL CREMA VAGINAL  1 MG/G (0,1 %) NR', 'TUBO X 15G', '', '1031039', 'LABORATORIOS AC FARMA S.A.', '2092-MEE-0516', '30/3/2019', '31/3/2022', '1344.00000', '2.49000', '3346.56000');
INSERT INTO `stockmed` VALUES ('G03CA04CRV080X0', 'ESTRIOL CREMA VAGINAL  1 MG/G (0,1 %) NR', 'TUBO X 15G', '', '1120569', 'LABORATORIOS AC FARMA S.A.', '2092-MEE-0516', '30/12/2019', '31/12/2022', '349.00000', '2.49000', '869.01000');
INSERT INTO `stockmed` VALUES ('L04AB01SOY329X0', 'ETANERCEPT SOLUCIÓN INYECTABLE 50 MG NR', 'CAJA X 1 VÍAL', '', '0F1603', 'PFIZER IRELAND PHARMACEUTICALS GRANGE CASTLE DUBLIN, IRLANDA', '140-MBE-0619', '1/7/2019', '30/6/2022', '8.00000', '249.85730', '1998.85840');
INSERT INTO `stockmed` VALUES ('G03AC08IMP373X0', 'LEVONOGESTREL SÓLIDO PARENTERAL (IMPLANTE SUBDÉRMICO ) 150 MG  2 VARILLAS DE 75MG CAJ X IMPLNTES(S) DE 75MG C/U+ TROCAR', 'CAJA X 10 ', '', 'TU02D0E', 'BAYER S.A.', '', '1/6/2019', '30/6/2024', '100.00000', '16.56000', '1656.00000');
INSERT INTO `stockmed` VALUES ('G03AC08IMP373X0', 'ETONOGESTREL IMPLANTE 68 MG NR', 'CAJA X 1', '', 'R031547', 'MERCK SHARP & DOHME INTER AMERICAN CORPORATION', '29951-07-11', '16/7/2018', '31/7/2023', '102.00000', '16.56000', '1689.12000');
INSERT INTO `stockmed` VALUES ('N03AB02SOY334A5', 'FENITOÍNA SOLUCIÓN INYECTABLE 50 MG/ML AMPOLLA X 5 ML', 'CAJA X 10/5ML', '', 'P200637', 'LABVITALIS S.A.', 'GBE831012', '30/4/2020', '30/4/2022', '15.00000', '0.98000', '14.70000');
INSERT INTO `stockmed` VALUES ('N03AB02SUS142G1', 'FENITOÍNA SUSPENSIÓN 125 MG/5 ML FRASCO X 120 ML', 'FRASCO', '', 'CH7770', 'PFIZER CIA. LTDA.', '30156-03-12', '30/7/2019', '30/6/2021', '182.00000', '3.50000', '637.00000');
INSERT INTO `stockmed` VALUES ('B02BA01SOY097A0', 'FITOMENADIONA SOLUCIÓN INYECTABLE  10 MG/ML AMPOLLA X 1 ML', 'CAJA X 10 AMPOLLAS ', '', '1802266411', 'CISEN PHARMACEUTICAL CO., LTD', '2044-MEE-0416', '27/2/2018', '28/2/2021', '1340.00000', '0.06601', '88.45340');
INSERT INTO `stockmed` VALUES ('B02BA01SOY097A0', 'FITOMENADIONA SOLUCIÓN INYECTABLE  10 MG/ML AMPOLLA X 1 ML', 'CAJA X 100 AMPOLLAS', '', '19.07.2688', 'LABORATORIO BIOSANO S.A', 'GBE-00405-02-04', '30/7/2019', '31/7/2022', '200.00000', '0.06601', '13.20200');
INSERT INTO `stockmed` VALUES ('J02AC01TAB158X0', 'FLUCONAZOL TABLETA 150 MG NR', 'CAJA X 100', '', 'C9029', 'AUROCHEM LABORATORIES (I) PVT. LTD', '2702-MEE-0517', '1/3/2019', '28/2/2022', '1500.00000', '0.03540', '53.10000');
INSERT INTO `stockmed` VALUES ('V03AB25SOY027A5', 'FLUMAZENIL SOLUCIÓN INYECTABLE 0,1 MG/ML AMPOLLA X 5 ML', 'CAJA X 5 AMPOLLAS/5ML', '', '750C0326', 'LABORATORIO SANDERSON S.A.', 'GBE-118-05-08', '10/6/2019', '31/3/2022', '60.00000', '2.90000', '174.00000');
INSERT INTO `stockmed` VALUES ('L02BB01TAB232X0', 'FLUTAMIDA TABLETA 250 MG NR', 'CAJA X 30 TABLETAS', '', '03714', 'ASOFARMA DE MEXICO S.A.', '29592-1-01-11', '30/12/2019', '31/12/2022', '27900.00000', '1.05000', '29295.00000');
INSERT INTO `stockmed` VALUES ('A07CA00POL000X0', 'FORMULACIONES DE SALES DE REHIDRATACIÓN ORAL POLVO  ND NR', 'CAJA X 30 SOBRES', '', '12819', 'LABORATORIOS CHALVER DE COLOMBIA S.A', '1377-MEE-0915', '30/7/2019', '31/7/2021', '900.00000', '0.28000', '252.00000');
INSERT INTO `stockmed` VALUES ('FMSE', 'FORMULA MATERNIZADA SEGUNDA ETAPA', 'TARRO X 400G ', '', '500125', 'ASPEN MÉXICO, S. DE R.L. DE C.V.', '110143E-MAN', '', '25/8/2021', '11.00000', '5.74363', '63.17993');
INSERT INTO `stockmed` VALUES ('FMTE', 'FORMULA MATERNIZADA TERCERA ETAPA', 'TARRO X 400G ', '', '803648', 'ASPEN MÉXICO, S. DE R.L. DE C.V.', '7969-ALE-0718', '', '11/2/2021', '171.00000', '5.74366', '982.16586');
INSERT INTO `stockmed` VALUES ('R07AA02SUT210X0', 'FOSFOLÍPIDOS NATURALES SUSPENSIÓN ESTÉRIL INTRATRAQUEAL 200 MG/8 ML NR', 'FRASCO  25 ML/8ML', '', '1128514', 'ABBVIE DEUTSCHLAND GMBH & CO. KG', '12-MEE-0814', '1/2/2020', '31/7/2021', '9.00000', '193.28710', '1739.58390');
INSERT INTO `stockmed` VALUES ('R07AA02SUT210X0', 'FOSFOLÍPIDOS NATURALES SUSPENSIÓN ESTÉRIL INTRATRAQUEAL 200 MG/8 ML NR', 'FRASCO  25 ML/8ML', '', '1132290', 'ABBVIE DEUTSCHLAND GMBH & CO. KG', '12-MEE-0814', '1/4/2020', '30/9/2021', '102.00000', '193.28710', '19715.28420');
INSERT INTO `stockmed` VALUES ('C03CA01TAB290X0', 'FUROSEMIDA TABLETA  40 MG NR', 'CAJA X 252 TABLETAS', '', '8H2029', 'TECNOQUIMICAS S.A.', '00427-1-MAC-11-05', '30/6/2018', '30/6/2022', '53424.00000', '0.00940', '502.18560');
INSERT INTO `stockmed` VALUES ('C03CA01TAB290X0', 'FUROSEMIDA TABLETA  40 MG NR', 'CAJA X 252 TABLETAS', '', '8R3530', 'TECNOQUIMICAS S.A.', '00427-1-MAC-11-05', '30/11/2018', '30/11/2022', '21672.00000', '0.00940', '203.71680');
INSERT INTO `stockmed` VALUES ('N03AX12CAP265X0', 'GABAPENTINA CÁPSULA  300 MG NR', 'CAJA X 30 CÁPSULAS', '', '9R3820B', 'TECNOQUIMICAS S.A.', '03592-MAE-05-05', '30/11/2019', '30/11/2022', '5130.00000', '0.22000', '1128.60000');
INSERT INTO `stockmed` VALUES ('B05AA06SOY445N3', 'GELATINA, AGENTES CON SOLUCIÓN INYECTABLE  3,5% FRASCO/FUNDA X 500 ML', 'FRASCO X 500ML', '', '73P9B0183', 'FRESENIUS KABI S.A', '29822-05-11', '1/2/2019', '30/02/2021', '510.00000', '10.90000', '5559.00000');
INSERT INTO `stockmed` VALUES ('C10AB04TAB365X0', 'GEMFIBROZILO TABLETA 600 MG NR', 'CAJA X 30 TABLETAS', '', 'K190947', 'ECUAQUIMICA ECUATORIANA DE PRODUCTOS QUIMICOS C.A.', '24292-1-02-12', '30/11/2019', '30/11/2022', '390.00000', '0.12000', '46.80000');
INSERT INTO `stockmed` VALUES ('A12AA03SOY088A1', 'GLUCONATO DE CALCIO SOLUCIÓN INYECTABLE  10% AMPOLLA X 10 ML', 'CAJA X 10 /1MG', '', '181206', 'HEBEI TIACHENG PHARMACEUTICAL COL., LTDA.', '2755-MEE-0517', '1/12/2018', '30/12/2020', '50.00000', '0.15000', '7.50000');
INSERT INTO `stockmed` VALUES ('A12AA03SOY088A1', 'GLUCONATO DE CALCIO SOLUCIÓN INYECTABLE  10% AMPOLLA X 10 ML', '', '', '190307', 'HEBEI BAIMEI LATEX PRODUCTS CO., LTD.', '2755-MEE-0517', '1/3/2017', '31/3/2021', '1200.00000', '0.15000', '180.00000');
INSERT INTO `stockmed` VALUES ('N05AD01SOY334A0', 'HALOPERIDOL SOLUCIÓN INYECTABLE 50 MG/ML AMPOLLA X 1 ML', 'CAJA X 1 AMPOLLA /1ML', '', '180918H', 'ACROMAX LABORATORIO QUIMICO FARMACEUTICO S.A.', '5681-MAN-01-10', '30/8/2018', '31/8/2021', '1051.00000', '0.17000', '178.67000');
INSERT INTO `stockmed` VALUES ('', 'HIDROCORTISONA CREMA ', 'TUBO X 5MG-15MG', '', 'D808', 'AUROCHEM LABORATORIES (I) PVT. LTD', '3097-MEE-1117', '1/4/2018', '30/3/2021', '545.00000', '0.80000', '436.00000');
INSERT INTO `stockmed` VALUES ('B03AD00TAM361X0', 'HIERRO EN COMBINACIÓN CON ÁCIDO FÓLICO TABLETA MASTICABLE  60 MG + 400 MCG NR', '', 'Sales de hierro + Ácido fólico', '1020045', 'QUALIPHARM LABORATORIO FARMACEUTICO S.A.', '43-MEN-0314', '1/10/2020', '30/10/2023', '12000.00000', '0.08000', '960.00000');
INSERT INTO `stockmed` VALUES ('M01AE01SUS209X0', 'IBUPROFENO SUSPENSIÓN  200 MG/5 ML NR', 'CAJA X 20 TABLETAS', '', '20B30S08', 'KRONOS LABORATORIOS C. LTDA.', '435-MEE-0715', '1/2/2020', '28/2/2023', '394.00000', '1.70000', '669.80000');
INSERT INTO `stockmed` VALUES ('M01AE01TAB296X0', 'IBUPROFENO TABLETA 400 MG NR', 'CAJA X 100 TABLETAS', '', 'M010519', 'CAPLIN POINT LABORATORIES LTDA', '527-MEE-1114', '30/5/2019', '30/4/2022', '3900.00000', '0.03000', '117.00000');
INSERT INTO `stockmed` VALUES ('J06BB01SOY230X0', 'INMUNOGLOBULINA ANTI-D (RH) SOLUCIÓN INYECTABLE 250 MCG NR', 'CAJA X 1 AMP/2ML', '', 'D17201B', 'RRPGOLDEN INTEGRA IMPORTADORA S.A', '146-MBE-1119', '1/3/2020', '30/8/2022', '15.00000', '205.00000', '3075.00000');
INSERT INTO `stockmed` VALUES ('J06BB05SOY479X0', 'INMUNOGLOBULINA ANTIRRÁBICA SOLUCIÓN INYECTABLE  300 UI/ML NR', 'CAJA X 1 AMPOLLA 2ML/300UI', '', 'P10034786', 'CSL BEHRING PANAMA S.A.', '', '30/5/2019', '30/5/2021', '10.00000', '40.20000', '402.00000');
INSERT INTO `stockmed` VALUES ('J06BB02SOY240X0', 'INMUNOGLOBULINA ANTITETÁNICA SOLUCIÓN INYECTABLE  250 UI NR', 'CAJA X 1 AMPOLLA 2ML/250UI', '', '081T18038', 'GREEN CROSS', '', '12/12/2018', '11/2/2022', '8.00000', '9.50000', '76.00000');
INSERT INTO `stockmed` VALUES ('A10AB01SOY118F1', 'INSULINA (HUMANA) SOLUCIÓN INYECTABLE  100 UI/ML FRASCO X 10 ML', 'CAJA X 1 FRASCO 10ML/1ML', 'Insulina de acción rápida', 'KT6W992', 'NOVO NORDISK A/S', '107-MBE-0617', '1/3/2020', '30/8/2022', '730.00000', '2.67000', '1949.10000');
INSERT INTO `stockmed` VALUES ('A10AC01SOY118F1', 'INSULINA (HUMANA) SOLUCIÓN INYECTABLE  100 UI/ML FRASCO X 10 ML', 'FRASCO 10ML', 'Insulina de acción intermedia', 'KT6W993', 'NOVO NORDISK A/S', '107-MBE-0617', '1/2/2020', '30/7/2022', '730.00000', '2.67000', '1949.10000');
INSERT INTO `stockmed` VALUES ('A10AB01SOY118F1', 'INSULINA (HUMANA) SOLUCIÓN INYECTABLE  100 UI/ML FRASCO X 10 ML', 'CAJA X 1 FRASCO 10ML/1ML', 'Insulina de acción rápida', 'JT6L541', 'NOVO NORDISK A/S', '107-MBE-0617', '30/12/2018', '31/5/2021', '80.00000', '2.67000', '213.60000');
INSERT INTO `stockmed` VALUES ('A10AC01SOY118F1', 'INSULINA (HUMANA) SOLUCIÓN INYECTABLE  100 UI/ML FRASCO X 10 ML', 'FRASCO 10ML', 'Insulina de acción intermedia', 'JT6L935', 'NOVO NORDISK A/S', '100-MBE-0517', '30/1/2019', '30/6/2021', '285.00000', '2.67000', '760.95000');
INSERT INTO `stockmed` VALUES ('R03BB01AER010F1', 'IPRATROPIO, BROMURO DE AEROSOL 0,02 MG/DOSIS FRASCO X 10 ML', 'CAJA X FRASCO 20ML', '', '20137', 'GINSBERG ECUADOR S.A.', '786-MEN-0416', '1/3/2020', '30/3/2022', '10.00000', '5.00000', '50.00000');
INSERT INTO `stockmed` VALUES ('J02AC02CAP105X0', 'ITRACONAZOL CÁPSULA 100 MG NR', 'CAJA X 4 CÁPSULAS', '', '191005', 'PROPHAR S.A', 'GBNE10912', '30/10/2019', '31/10/2022', '476.00000', '0.07000', '33.32000');
INSERT INTO `stockmed` VALUES ('A06AD11SOL371X0', 'LACTULOSA SOLUCIÓN ORAL  65% NR', 'FRASCO 100ML', '', '160118', 'CAPLIN POINT LABORATORIES LTDA', '2173-MEE-0516', '1/1/2018', '31/12/2020', '972.00000', '1.45000', '1409.40000');
INSERT INTO `stockmed` VALUES ('A06AD11SOL371X0', 'LACTULOSA SOLUCIÓN ORAL  65% NR', 'FRASCO 10ML', '', '010719', 'CAPLIN POINT LABORATORIES LTDA', '2173-MEE-0516', '30/6/2018', '30/6/2022', '777.00000', '1.45000', '1126.65000');
INSERT INTO `stockmed` VALUES ('S01XA20SOF000X0', 'LÁGRIMAS ARTIFICIALES Y OTROS PREPARADOS INERTES SOLUCIÓN OFTÁLMICA  ND NR', 'GOTERO 15ML', '', '19FF1257', 'FARMACID S.A.', '05032K-MAN-01-08', '30/12/2019', '31/12/2021', '325.00000', '0.93100', '302.57500');
INSERT INTO `stockmed` VALUES ('J01MA12TAR339X0', 'LEVOFLOXACINO TABLETA RECUBIERTA 500 MG NR', 'CAJA X 10 TABLETAS', '', '012019-1', 'LABORATORIOS JAIME GUTIERREZ', '71-MEN-0414', '30/1/2019', '31/1/2021', '1140.00000', '0.08100', '92.34000');
INSERT INTO `stockmed` VALUES ('G03AA07TAR156X0', 'LEVONORGESTREL Y ESTRÓGENO TABLETA RECUBIERTA 150 MCG + 30 MCG NR', 'Levonorgestrel + Etinilestradiol', '', 'KT034KT', 'BAYER S.A.', '', '30/1/2019', '30/9/2021', '21.00000', '0.30000', '6.30000');
INSERT INTO `stockmed` VALUES ('G03AC03TAB536X0', 'LEVONORGESTREL  TABLETA  0,030 MG NR', 'CAJA X 35 TABLETAS', '', 'KT02C2T', 'BAYER S.A.', '', '1/6/2018', '30/6/2023', '138.00000', '0.30000', '41.40000');
INSERT INTO `stockmed` VALUES ('G03AC03TAB536X0', 'LEVONORGESTREL  TABLETA  0,030 MG NR', 'CAJA X 35 TABLETAS', '', 'KT02KC2', 'BAYER S.A.', '', '1/6/2018', '30/6/2023', '54.00000', '0.30000', '16.20000');
INSERT INTO `stockmed` VALUES ('H03AA01TAB016X0', 'LEVOTIROXINA SÓDICA TABLETA 0,05 MG NR', 'CAJA X 50 TABLETAS', '', 'M94564', 'MERCK S.A.', '25,895-08-04', '30/8/2019', '31/7/2021', '4750.00000', '0.02000', '95.00000');
INSERT INTO `stockmed` VALUES ('H03AA01TAB016X0', 'LEVOTIROXINA SÓDICA TABLETA 0,05 MG NR', 'CAJA X 50 TABLETAS', '', 'M94565', 'MERCK S.A.', '25,895-08-04', '1/10/2019', '30/9/2021', '11550.00000', '0.02000', '231.00000');
INSERT INTO `stockmed` VALUES ('H03AA01TAB029X0', 'LEVOTIROXINA SÓDICA TABLETA 0,100 MG (100 MCG) NR', 'CAJA X 50 TABLETAS', '', 'M92333', 'MERCK S.A.', '25-894-08-04', '30/4/2019', '31/3/2021', '13500.00000', '0.03000', '405.00000');
INSERT INTO `stockmed` VALUES ('J05AR10SOL387X0', 'LOPINAVIR + RITONAVIR SOLUCIÓN ORAL  80 MG + 20 MG/ML NR', 'FRASCO 160ML', '', '1132284', 'ABBVIE S.A.S.', '562-MEE-1214', '1/6/2020', '1/6/2022', '115.00000', '44.24000', '5087.60000');
INSERT INTO `stockmed` VALUES ('R06AX13JBE318X0', 'LORATADINA JARABE 5 MG/5 ML NR', 'FRASCO 100ML', '', '1269996', 'PROCAPS S.A.', '03429-MAE-02-05', '30/10/2019', '31/10/2022', '250.00000', '1.30000', '325.00000');
INSERT INTO `stockmed` VALUES ('R06AX13TAB091X0', 'LORATADINA TABLETA 10 MG NR', 'CAJA X 40 TABLETAS', '', '20OB0101', 'FARMACID S.A.', '105MEN-0614', '30/1/2020', '31/1/2022', '9240.00000', '0.00900', '83.16000');
INSERT INTO `stockmed` VALUES ('B05BC01SOY202U4', 'MANITOL SOLUCIÓN INYECTABLE  20% FUNDA X 500  ML', 'FUNDA X 500ML', '', 'SB19F09', 'LABORATORIOS BAXTER S.A CALI-COLOMBIA', '20-972-1-01-04', '1/1/2019', '30/1/2021', '15.00000', '4.15000', '62.25000');
INSERT INTO `stockmed` VALUES ('L01BB02TAB329X0', 'MERCAPTOPURINA TABLETA 50 MG NR', 'CAJA X 100 TABLETAS', '', 'E938804', 'KOREA UNITED PHARM INC.', '27,718-06-07', '25/4/2018', '24/4/2021', '300.00000', '0.15000', '45.00000');
INSERT INTO `stockmed` VALUES ('L01BB02TAB329X0', 'MERCAPTOPURINA TABLETA 50 MG NR', 'CAJA X 100 TABLETAS', '', 'E938814', 'KOREA UNITED PHARM INC.', '27,718-06-07', '21/11/2019', '20/11/2021', '800.00000', '0.15000', '120.00000');
INSERT INTO `stockmed` VALUES ('A10BD02TAB338X0', 'METFORMINA Y SULFONAMIDAS TABLETA  500 MG + 2,5 MG NR', 'CAJA X 30 TABLETA', '', '181316L', 'ACROMAX LABORATORIO QUIMICO FARMACEUTICO S.A.', '27,942-MAN-03-08', '1/12/2018', '30/12/2021', '19860.00000', '0.18000', '3574.80000');
INSERT INTO `stockmed` VALUES ('A10BD02TAB338X0', 'METFORMINA Y SULFONAMIDAS TABLETA  500 MG + 2,5 MG NR', 'CAJA X 30 TABLETA', '', '1813762', 'ACROMAX LABORATORIO QUIMICO FARMACEUTICO S.A.', '27,942-MAN-03-08', '30/12/2018', '31/12/2021', '15810.00000', '0.18000', '2845.80000');
INSERT INTO `stockmed` VALUES ('A10BD02TAB338X0', 'METFORMINA Y SULFONAMIDAS TABLETA  500 MG + 2,5 MG NR', 'CAJA X 30 TABLETA', '', '181317L', 'ACROMAX LABORATORIO QUIMICO FARMACEUTICO S.A.', '27,942-MAN-03-08', '30/12/2018', '31/12/2021', '33810.00000', '0.18000', '6085.80000');
INSERT INTO `stockmed` VALUES ('A10BD02TAB283X0', 'METFORMINA Y SULFONAMIDAS TABLETA  500 MG + 5 MG NR', 'CAJA X 30 TABLETAS', '', '19UD1127', 'FARMACID S.A.', '850-MEN-0616', '30/11/2019', '30/11/2021', '54270.00000', '0.00880', '477.57600');
INSERT INTO `stockmed` VALUES ('A03FA01TAB091X0', 'METOCLOPRAMIDA TABLETA  10 MG NR', 'CAJA X 100 TABLETAS', '', '2000416', 'LABORATORIOS INDUSTRIALES FARMACEUTICOS ECUATORIANOS LIFE C.A.', '02836-MAN-10-03', '1/1/2020', '31/1/2023', '8700.00000', '0.02500', '217.50000');
INSERT INTO `stockmed` VALUES ('A03FA01TAB091X0', 'METOCLOPRAMIDA TABLETA  10 MG NR', 'CAJA X 100 TABLETAS', '', '200767', 'LABORATORIOS INDUSTRIALES FARMACEUTICOS ECUATORIANOS LIFE C.A.', '02836-MAN-10-03', '1/1/2020', '30/1/2023', '2000.00000', '0.02500', '50.00000');
INSERT INTO `stockmed` VALUES ('A03FA01TAB091X0', 'METOCLOPRAMIDA TABLETA  10 MG NR', 'CAJA X 24TABLETAS', '', '00036', 'LABORATORIOS INDUSTRIALES FARMACEUTICOS ECUATORIANOS LIFE C.A.', '24-133-1-09-11', '1/2/2018', '28/2/2022', '408.00000', '0.02500', '10.20000');
INSERT INTO `stockmed` VALUES ('L01BA01SOY226A6', 'METOTREXATO SOLUCIÓN INYECTABLE 25 MG/ML AMPOLLA X 20 ML', 'CAJA X 50 AMPOLLAS /2ML', '', 'MX-2001', 'PROTECH BIOSYSTEMS PVT. LTD.', '2741-MEE-0517', '17/1/2020', '16/1/2022', '25.00000', '5.41408', '135.35200');
INSERT INTO `stockmed` VALUES ('L01BA01TAB060X0', 'METOTREXATO TABLETA 2,5 MG NR', 'CAJA X 100', '', 'MTT1928AC', 'CELON LABORATORIES PVT. LTD.', '1155-MEE-0715', '28/2/2019', '30/1/2021', '9700.00000', '0.03750', '363.75000');
INSERT INTO `stockmed` VALUES ('G01AF01OVU339X0', 'METRONIDAZOL ÓVULO 500 MG NR', 'CAJA X 12 SUPOSITORIOS', '', '380V', 'LABORATORIOS ROCNARF S.A.', '300-MEN-0315', '28/2/2020', '28/2/2022', '108.00000', '0.28000', '30.24000');
INSERT INTO `stockmed` VALUES ('P01AB01TAB339X0', 'METRONIDAZOL TABLETA 500 MG NR', 'CAJA X 30 TABLETAS', '', '0205-10', 'INDEUREC S.A.', '01813-MAC03-02', '28/2/2019', '28/2/2022', '10290.00000', '0.00970', '99.81300');
INSERT INTO `stockmed` VALUES ('C01DA14TAB194X0', 'MONONITRATO DE ISOSORBIDA TABLETA  20 MG NR', 'CAJA X 250 TABLETAS', '', 'D8020', 'AUROCHEM LABORATORIES (I) PVT. LTD', '2699-MEE-0517', '30/4/2018', '31/3/2021', '2500.00000', '0.04500', '112.50000');
INSERT INTO `stockmed` VALUES ('C01DA14TAB194X0', 'MONONITRATO DE ISOSORBIDA TABLETA  20 MG NR', 'CAJA X 250 TABLETAS', '', 'C9040', 'AUROCHEM LABORATORIES (I) PVT. LTD', '2699-MEE-0517', '30/3/2019', '28/2/2022', '5000.00000', '0.04500', '225.00000');
INSERT INTO `stockmed` VALUES ('A09AA02CAP437X0', 'MULTIENZIMAS (LIPASA, PROTEASA, ETC.) CÁPSULA  150 MG (8 000 UI + 10 000 UI + 600 UI) NR', 'CAJA X 20 TABLETAS', '', '0017-19', 'INDEUREC S.A.', '293-MEN-0215', '30/1/2019', '31/1/2022', '920.00000', '0.16000', '147.20000');
INSERT INTO `stockmed` VALUES ('N07AA01SOY321A0', 'NEOSTIGMINA SOLUCIÓN INYECTABLE 0,5 MG/ML AMPOLLA X 1 ML', 'CAJA X 100 AMPOLLA /1ML', '', '75NE0920', 'LABORATORIO SANDERSON S.A.', 'GBE-0567-03-05', '30/5/2019', '31/5/2022', '1900.00000', '0.31000', '589.00000');
INSERT INTO `stockmed` VALUES ('N07AA01SOY321A0', 'NEOSTIGMINA SOLUCIÓN INYECTABLE 0,5 MG/ML AMPOLLA X 1 ML', 'CAJA X 100 AMPOLLA /1ML', '', '19.05.2549', 'LABORATORIO BIOSANO S.A', 'GBE-0395-01-04', '30/5/2019', '31/5/2021', '500.00000', '0.31000', '155.00000');
INSERT INTO `stockmed` VALUES ('C08CA05TAB091X0', 'NIFEDIPINA TABLETA  10 MG NR', 'CAJA X 50 TABLETAS', '', '7700220', 'LABORATORIO VIDA LABOVIDA S.A.', 'GBN-0328-06-03', '1/2/2020', '28/2/2022', '8450.00000', '0.08000', '676.00000');
INSERT INTO `stockmed` VALUES ('A07AA02SUS119X0', 'NISTATINA SUSPENSIÓN  100 000 UI/ML NR', 'CAJA X 1 FRASCO 30ML', '', '190885H', 'ACROMAX LABORATORIO QUIMICO FARMACEUTICO S.A.', '8077-1-06-04', '30/8/2019', '31/8/2022', '21.00000', '1.60000', '33.60000');
INSERT INTO `stockmed` VALUES ('J01XE01CAP105X0', 'NITROFURANTOÍNA CÁPSULA 100 MG NR', 'CAJA X 100 CÁPSULAS', '', '061218', 'CAPLIN POINT LABORATORIES LTDA', '2027-MEE-0416', '30/12/2018', '30/11/2021', '4700.00000', '0.02500', '117.50000');
INSERT INTO `stockmed` VALUES ('J01XE01TAB105X0', 'NITROFURANTOÍNA TABLETA  100 MG NR', 'CAJA X 100 CÁPSULAS', '', '50220', 'CAPLIN POINT LABORATORIES LTDA', '2027-MEE-0416', '28/2/2020', '31/1/2023', '78900.00000', '0.02500', '1972.50000');
INSERT INTO `stockmed` VALUES ('A02BC01CAP194X0', 'OMEPRAZOL CÁPSULA  20 MG NR', 'CAJA X 100 CÁPSULAS', '', '240419', 'CAPLIN POINT LABORATORIES LTDA', '993-MEE-0515', '30/4/2019', '31/3/2022', '14500.00000', '0.01170', '169.65000');
INSERT INTO `stockmed` VALUES ('A02BC01CAP194X0', 'OMEPRAZOL CÁPSULA  20 MG NR', 'CAJA X 100 CÁPSULAS', '', '130819', 'CAPLIN POINT LABORATORIES LTDA', '993-MEE-0515', '30/8/2019', '31/7/2022', '19200.00000', '0.01170', '224.64000');
INSERT INTO `stockmed` VALUES ('A04AA01TAR286X0', 'ONDANSETRÓN TABLETA RECUBIERTA  4 MG NR', 'CAJA X 30 TABLETAS', '', '021801', 'QUALIPHARM LABORATORIO FARMACEUTICO S.A.', '496-MEN-0815', '28/2/2018', '28/2/2021', '13800.00000', '0.12000', '1656.00000');
INSERT INTO `stockmed` VALUES ('J01CF04POI121X0', 'OXACILINA POLVO PARA INYECCIÓN  1 000 MG NR', 'CAJA X 50 AMPOLLAS', '', '183012075', 'REYOUNG PHARMACEUTICAL CO. LTD.', '2132-MEE-0516', '30/4/2018', '30/4/2021', '3350.00000', '0.21000', '703.50000');
INSERT INTO `stockmed` VALUES ('J01CF04POI121X0', 'OXACILINA POLVO PARA INYECCIÓN  1 000 MG NR', '', '', '193012006', 'REYOUNG PHARMACEUTICAL CO. LTD.', '2132-MEE-0516', '1/2/2019', '28/2/2022', '1150.00000', '0.21000', '241.50000');
INSERT INTO `stockmed` VALUES ('J01CF04POI121X0', 'OXACILINA POLVO PARA INYECCIÓN  1 000 MG NR', '', '', '193012025', 'REYOUNG PHARMACEUTICAL CO. LTD.', '2132-MEE-0516', '1/6/2018', '30/6/2022', '1150.00000', '0.21000', '241.50000');
INSERT INTO `stockmed` VALUES ('H01BB02SOY100A0', 'OXITOCINA SOLUCIÓN INYECTABLE 10 UI/ML AMPOLLA X 1 ML', 'CAJA X10 AMPOLLAS /1ML', '', '75NL1885', 'LABORATORIO SANDERSON S.A.', 'GBE-00134-2-01-12', '8/12/2019', '8/11/2022', '4000.00000', '0.15890', '635.60000');
INSERT INTO `stockmed` VALUES ('H01BB02SOY100A0', 'OXITOCINA SOLUCIÓN INYECTABLE 10 UI/ML AMPOLLA X 1 ML', 'CAJA X10 AMPOLLAS /1ML', '', '75NA0055', 'LABORATORIO SANDERSON S.A.', 'GBE-00134-2-01-12', '1/8/2019', '30/7/2022', '3000.00000', '0.15890', '476.70000');
INSERT INTO `stockmed` VALUES ('N02BE01JBE159X0', 'PARACETAMOL JARABE 160 MG/5 ML NR', 'FRASCO 60ML', '', 'E807', 'AUROCHEM LABORATORIES (I) PVT. LTD', '2574-MEE-0217', '30/4/2018', '30/4/2021', '400.00000', '0.45000', '180.00000');
INSERT INTO `stockmed` VALUES ('N02BE01JBE159X0', 'PARACETAMOL JARABE 160 MG/5 ML NR', 'FRASCO 60ML', '', 'EL061', 'AUROCHEM LABORATORIES (I) PVT. LTD', '2295-MEE-0716', '1/9/2019', '30/8/2022', '500.00000', '0.45000', '225.00000');
INSERT INTO `stockmed` VALUES ('N02BE01JBE159X0', 'PARACETAMOL JARABE 160 MG/5 ML NR', 'FRASCO 60ML', '', 'DL177', 'RATNAMANI HEALTHCARE PVT. LTD', '2295-MEE-0716', '1/2/2019', '30/1/2022', '1988.00000', '0.45000', '894.60000');
INSERT INTO `stockmed` VALUES ('N02BE01JBE159X0', 'PARACETAMOL JARABE 150 MG/5 ML NR', 'FRASCO 60ML', '', 'EL098', 'RATNAMANI HEALTHCARE PVT. LTD', '2295-MEE-0716', '1/1/2020', '30/12/2022', '2011.00000', '0.39000', '784.29000');
INSERT INTO `stockmed` VALUES ('N02BE01JBE159X0', 'PARACETAMOL JARABE 150 MG/5 ML NR', 'FRASCO 60ML', '', 'FL001', 'RATNAMANI HEALTHCARE PVT. LTD', '2295-MEE-0716', '1/5/2020', '30/4/2023', '194.00000', '0.39000', '75.66000');
INSERT INTO `stockmed` VALUES ('N02BE01JBE169X0', 'PARACETAMOL JARABE  150 MG/5 ML NR', 'FRASCO 60ML', '', 'FB029', 'KRONOS LABORATORIOS C. LTDA.', '2295-MEE-0716', '1/11/2020', '30/12/2022', '1668.00000', '0.39000', '650.52000');
INSERT INTO `stockmed` VALUES ('N02BE01JBE169X0', 'PARACETAMOL JARABE  160 MG/5 ML NR', 'FRASCO 60ML', '', 'K801', 'AUROCHEM LABORATORIES (I) PVT. LTD', '2574-MEE-0217', '1/11/2028', '30/10/2021', '600.00000', '0.45000', '270.00000');
INSERT INTO `stockmed` VALUES ('N02BE01JBE169X0', 'PARACETAMOL JARABE  160 MG/5 ML NR', 'FRASCO 60ML', '', 'K803', 'AUROCHEM LABORATORIES (I) PVT. LTD', '2574-MEE-0217', '1/11/2018', '30/10/2021', '3002.00000', '0.45000', '1350.90000');
INSERT INTO `stockmed` VALUES ('P03AC04SOT066X0', 'PERMETRINA SOLUCIÓN TÓPICA 1% NR', 'FRASCO 60ML', '', '180911', 'NEW YORKER S.A.', '5869-MAN-10-10', '30/9/2018', '30/9/2021', '72.00000', '1.40700', '101.30400');
INSERT INTO `stockmed` VALUES ('D10AE01GEL310X0', 'PERÓXIDO DE BENZOÍLO GEL 5% NR', 'TUBO GEL X 60G', '', '190201', 'QUALIPHARM LABORATORIO FARMACEUTICO S.A.', '870-MEN-0616', '1/2/2019', '28/2/2021', '423.00000', '3.24450', '1372.42350');
INSERT INTO `stockmed` VALUES ('H02AB07TAB194X0', 'PREDNISONA TABLETA 20 MG NR', 'CAJA X 100 TABLETAS', '', '1041069', 'LABORATORIOS AC FARMA S.A.', '2688-MEE-0517', '30/4/2019', '30/4/2021', '14900.00000', '0.02380', '354.62000');
INSERT INTO `stockmed` VALUES ('H02AB07TAB314X0', 'PREDNISONA TABLETA 5 MG NR', 'CAJA X 100 TABLETAS', '', '1030519', 'LABORATORIOS AC FARMA S.A.', '2689-MEE-0517', '30/3/2019', '31/3/2021', '2000.00000', '0.01380', '27.60000');
INSERT INTO `stockmed` VALUES ('A02BA02SOY226A2', 'RANITIDINA SOLUCIÓN INYECTABLE  25 MG/ML AMPOLLA X 2 ML', 'CAJA X10 AMPOLLAS /2ML', '', 'P191281', 'LABVITALIS S.A.', '03160-MAE-07-04', '30/5/2019', '31/5/2021', '7200.00000', '0.24000', '1728.00000');
INSERT INTO `stockmed` VALUES ('N05AX08SOL081X0', 'RISPERIDONA SOLUCIÓN ORAL 1 MG/ML NR', 'FRASCO 30ML', '', '2005032', 'LABORATORIOS ANDRÓMACO S.A.', '2560-MEN-0120', '27/5/2020', '30/4/2022', '21.00000', '5.69900', '119.67900');
INSERT INTO `stockmed` VALUES ('N05AX08SOL081X0', 'RISPERIDONA SOLUCIÓN ORAL 1 MG/ML NR', 'GOTAS  X 30ML', '', 'G19043A', 'LABORATORIOS ANDRÓMACO S.A.', '24-943-02-03', '1/7/2019', '30/6/2023', '354.00000', '5.69900', '2017.44600');
INSERT INTO `stockmed` VALUES ('N05AX08TAR178X0', 'RISPERIDONA TABLETA RECUBIERTA 2 MG NR', 'CAJA X 100 TABLETAS', '', '1051669', 'LABORATORIOS AC FARMA S.A.', '2693-MEE-0517', '30/5/2019', '31/5/2021', '63700.00000', '0.01180', '751.66000');
INSERT INTO `stockmed` VALUES ('N05AX08TAR178X0', 'RISPERIDONA TABLETA RECUBIERTA 2 MG NR', 'CAJA X 100 TABLETAS', '', '1081809', 'LABORATORIOS AC FARMA S.A.', '2693-MEE-0517', '30/8/2019', '31/8/2021', '15500.00000', '0.01180', '182.90000');
INSERT INTO `stockmed` VALUES ('M03AC09SOY097A5', 'ROCURONIO, BROMURO DE SOLUCIÓN INYECTABLE 10 MG/ML AMPOLLA X 5 ML', 'CAJA X 12 AMPOLLAS 50MG/5ML', '', '20387', 'GINSBERG ECUADOR S.A.', 'GBN1270113', '1/8/2020', '30/8/2022', '312.00000', '1.74000', '542.88000');
INSERT INTO `stockmed` VALUES ('M03AC09SOY097A5', 'ROCURONIO, BROMURO DE SOLUCIÓN INYECTABLE 10 MG/ML AMPOLLA X 5 ML', 'CAJA X 12 AMPOLLAS 50MG/5ML', '', '20401', 'GINSBERG ECUADOR S.A.', 'GBN1270113', '1/9/2020', '30/9/2022', '324.00000', '1.74000', '563.76000');
INSERT INTO `stockmed` VALUES ('R03AC02AER026X0', 'SALBUTAMOL AEROSOL 0,1 MG/DOSIS (100 MCG/DOSIS) NR', 'GOTERO 10ML', '', 'XF8J.', 'GLAXOSMITHKLINE ECUADOR S.A.', '24-641-08-02', '30/11/2019', '30/11/2022', '57.00000', '5.00000', '285.00000');
INSERT INTO `stockmed` VALUES ('R03AC02SOI320X0', 'SALBUTAMOL SOLUCIÓN PARA INHALACIÓN 5 MG/ML NR', 'GOTERO 10ML', '', '11187', 'LABORATORIOS CHALVER DE COLOMBIA S.A', 'H2541212', '30/4/2018', '30/4/2022', '301.00000', '1.05000', '316.05000');
INSERT INTO `stockmed` VALUES ('N01AB08SOI081X0', 'SEVOFLURANO SOLUCIÓN PARA INHALACIÓN 1 MG/ML NR', 'FRASCFO 250ML', '', '19MQ1211', 'FARMACID S.A.', '364060113', '30/10/2019', '31/10/2023', '32.00000', '58.00000', '1856.00000');
INSERT INTO `stockmed` VALUES ('N01AB08SOI081X0', 'SEVOFLURANO SOLUCIÓN PARA INHALACIÓN 1 MG/ML NR', 'FRASCFO 250ML', '', '20MQ0403', 'FARMACID S.A.', '364060113', '28/2/2020', '29/2/2024', '287.00000', '58.00000', '16646.00000');
INSERT INTO `stockmed` VALUES ('J06AA03POI000X0', 'SUERO ANTIOFÍDICO POLVO PARA INYECCIÓN ND NR', 'CAJA X1 FRASCO 10ML', '', '6280819POLF', 'INSTITUTO CLODOMIRO PICADO', 'GE-465-06-11', '1/8/2019', '31/8/2024', '9.00000', '37.20000', '334.80000');
INSERT INTO `stockmed` VALUES ('J06AA03POI000X0', 'SUERO ANTIOFÍDICO POLVO PARA INYECCIÓN ND NR', '', '', '6460720POLF', 'INSTITUTO CLODOMIRO PICADO', 'GE-465-06-11', '01/07/202', '30/7/2025', '90.00000', '37.20000', '3348.00000');
INSERT INTO `stockmed` VALUES ('V03AB35SOY112X0', 'SUGAMMADEX SOLUCIÓN INYECTABLE 100 MG / ML NR', 'CAJA X 10 AMPOLLAS', '', 'R033942', 'PATHEON  S.P.A.', '4340-MEE-0818', '22/7/2018', '30/7/2021', '9.00000', '5.00000', '45.00000');
INSERT INTO `stockmed` VALUES ('J01EE01SUS206G0', 'SULFAMETOXAZOL Y TRIMETOPRIMA SUSPENSIÓN 200 MG + 40 MG/5 ML FRASCO X 100 ML', 'FRASCO /100ML', '', '18BN0718', 'FARMACID S.A.', '02067-MAC-1-03-12', '30/7/2018', '31/7/2021', '89.00000', '0.25085', '22.32565');
INSERT INTO `stockmed` VALUES ('J01EE01SUS206G0', 'SULFAMETOXAZOL Y TRIMETOPRIMA SUSPENSIÓN 200 MG + 40 MG/5 ML FRASCO X 100 ML', 'FRASCO X 100ML', '', '20BN0101', 'FARMACID S.A.', '02067-MAC-1-03-12', '1/1/2020', '31/1/2023', '300.00000', '0.25085', '75.25500');
INSERT INTO `stockmed` VALUES ('J01EE01SUS206G0', 'SULFAMETOXAZOL Y TRIMETOPRIMA SUSPENSIÓN 200 MG + 40 MG/5 ML FRASCO X 100 ML', 'FRASCO X 100ML', '', '19BN1216', 'FARMACID S.A.', '02067-MAC-1-03-12', '1/12/2019', '31/12/2022', '30.00000', '0.25085', '7.52550');
INSERT INTO `stockmed` VALUES ('J01EE01SUS206G0', 'SULFAMETOXAZOL Y TRIMETOPRIMA SUSPENSIÓN 200 MG + 40 MG/5 ML FRASCO X 100 ML', 'FRASCO X 100ML', '0', '20BN0403', 'FARMACID S.A.', '02067-MAC-1-03-12', '1/4/2020', '30/4/2023', '260.00000', '0.25085', '65.22100');
INSERT INTO `stockmed` VALUES ('J01EE01SUS206G0', 'SULFAMETOXAZOL Y TRIMETOPRIMA SUSPENSIÓN 200 MG + 40 MG/5 ML FRASCO X 100 ML', 'FRASCO X 100ML', '', '20BN0405', 'FARMACID S.A.', '02067-MAC-1-03-12', '1/4/2020', '30/4/2023', '258.00000', '0.25085', '64.71930');
INSERT INTO `stockmed` VALUES ('J01EE01TAB298X0', 'SULFAMETOXAZOL Y TRIMETOPRIMA TABLETA 800 MG + 160 MG NR', 'CAJA X 30 TABLETAS', '', '19BC0114', 'FARMACID S.A.', '01921-MAC-04-02', '30/1/2019', '30/1/2022', '12750.00000', '0.02099', '267.62250');
INSERT INTO `stockmed` VALUES ('J01EE01TAB392X0', 'SULFAMETOXAZOL Y TRIMETOPRIMA TABLETA 800 MG + 160 MG NR', 'CAJA X 30 TABLETAS', '', '19BC0107', 'FARMACID S.A.', '01921-MAC-04-02', '30/1/2019', '31/1/2022', '22350.00000', '0.02099', '469.12650');
INSERT INTO `stockmed` VALUES ('J01EE01TAB392X0', 'SULFAMETOXAZOL Y TRIMETOPRIMA TABLETA 800 MG + 160 MG NR', 'CAJA X 30 TABLETAS', '', '18BC1029', 'FARMACID S.A.', '01921-MAC-04-02', '30/10/2018', '31/10/2021', '4950.00000', '0.02099', '103.90050');
INSERT INTO `stockmed` VALUES ('J01EE01TAB392X0', 'SULFAMETOXAZOL Y TRIMETOPRIMA TABLETA 800 MG + 160 MG NR', 'CAJA X 30 TABLETAS', '', '18BC1031', 'FARMACID S.A.', '01921-MAC-04-02', '30/10/2018', '31/10/2021', '3000.00000', '0.02099', '62.97000');
INSERT INTO `stockmed` VALUES ('J01EE01TAB392X0', 'SULFAMETOXAZOL Y TRIMETOPRIMA TABLETA 800 MG + 160 MG NR', 'CAJA X 30 TABLETAS', '', '19BC0113', 'FARMACID S.A.', '01921-MAC-04-02', '30/1/2019', '31/1/2022', '2280.00000', '0.02099', '47.85720');
INSERT INTO `stockmed` VALUES ('G04CA02TAL041X0', 'TAMSULOSINA TABLETA LIBERACIÓN PROLONGADA 0,4 MG NR', 'CAJA X 30 CÁPSULAS ', '', '190A1106', 'FARMACID S.A.', '364070113', '30/11/2019', '30/11/2021', '39210.00000', '0.07000', '2744.70000');
INSERT INTO `stockmed` VALUES ('S01ED01SOF044X0', 'TIMOLOL SOLUCIÓN OFTÁLMICA 0,5 % NR', 'GOTERO 5ML', '', '19DH08001', 'MAQUIPHARMA S.A.', '1066-MEN-0517', '30/8/2019', '31/8/2021', '772.00000', '2.50000', '1930.00000');
INSERT INTO `stockmed` VALUES ('P01AB02TAB121X0', 'TINIDAZOL TABLETA RECUBIERTA  1 000 MG NR', 'CAJA X 20 TABLETAS', '', '827118S', 'LABORATORIOS G.M. SUCESORES DEL DR. JULIO GONZALEZ MOSQUERA', 'GBN-0222-06-02', '30/8/2018', '31/8/2021', '2440.00000', '0.03920', '95.64800');
INSERT INTO `stockmed` VALUES ('P01AB02TAR121X0', 'TINIDAZOL TABLETA RECUBIERTA  1 000 MG NR', 'CAJA X 20 TABLETAS', '', '82115185', 'LABORATORIOS G.M. SUCESORES DEL DR. JULIO GONZALEZ MOSQUERA', 'GBN-0222-06-02', '30/11/2018', '30/11/2021', '820.00000', '0.03920', '32.14400');
INSERT INTO `stockmed` VALUES ('N02AX02CAP329X0', 'TRAMADOL CÁPSULA 50 MG NR', 'CAJA X 30  CÁPSULA', '', 'SDB117', 'BEXIMCO PHARMACEUTICALS LTD.', '2494-MEE-0916', '1/2/2020', '30/1/2023', '6000.00000', '0.03200', '192.00000');
INSERT INTO `stockmed` VALUES ('N02AX02CAP329X0', 'TRAMADOL CÁPSULA 50 MG NR', 'CAJA X 30  CÁPSULA', '', 'SCI192', 'BEXIMCO PHARMACEUTICALS LTD.', '2494-MEE-0916', '30/8/2019', '31/8/2022', '10710.00000', '0.03200', '342.72000');
INSERT INTO `stockmed` VALUES ('D02AE01CRE310X0', 'UREA CREMA 5% NR', 'TUBO 90G', '', '561', 'WEST-COAST PHARMACEUTICAL WORKS LTD.', '2301-MEE-0716', '1/6/2018', '31/5/2021', '362.00000', '8.80000', '3185.60000');
INSERT INTO `stockmed` VALUES ('J01XA01POI339X0', 'VANCOMICINA POLVO PARA INYECCIÓN 500 MG NR', 'CAJA X 10 AMPOLLAS', '', 'P201548', 'VITALIS S .A.C', 'H3320213', '1/6/2020', '30/6/2022', '520.00000', '1.30000', '676.00000');
INSERT INTO `stockmed` VALUES ('J01XA01POI339X0', 'VANCOMICINA POLVO PARA INYECCIÓN 500 MG NR', 'CAJA X 10 AMPOLLAS', '', 'P201224', 'VITALIS S .A.C', 'H3320213', '1/5/2020', '31/5/2022', '860.00000', '1.30000', '1118.00000');
INSERT INTO `stockmed` VALUES ('J01XA01POI339X0', 'VANCOMICINA POLVO PARA INYECCIÓN 500 MG NR', '', '', 'P201037', 'VITALIS S .A.C', 'H3320213', '1/5/2020', '31/5/2022', '620.00000', '1.30000', '806.00000');

-- ----------------------------
-- Table structure for stock_equipos
-- ----------------------------
DROP TABLE IF EXISTS `stock_equipos`;
CREATE TABLE `stock_equipos` (
  `id_stock_equipo` int(255) NOT NULL AUTO_INCREMENT,
  `id_fpp` int(255) DEFAULT NULL,
  `id_producto` int(255) DEFAULT NULL,
  `descripción` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `tamaño` varchar(255) DEFAULT NULL,
  `calibre` varchar(255) DEFAULT NULL,
  `volumen` varchar(255) DEFAULT NULL,
  `fecha_fabricación` date DEFAULT NULL,
  `fecha_caducidad` date DEFAULT NULL,
  `cantidad` decimal(20,2) DEFAULT NULL,
  `precio_unitario` decimal(20,2) DEFAULT NULL,
  `precio_total` decimal(20,2) DEFAULT NULL,
  `donación` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `reingreso` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `zona` int(255) DEFAULT NULL,
  `percha` int(255) DEFAULT NULL,
  `altura` int(255) DEFAULT NULL,
  `sección` int(255) DEFAULT NULL,
  `entregado` decimal(20,2) DEFAULT NULL,
  `no_entregado` decimal(20,2) DEFAULT NULL,
  `id_almacenista` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_stock_equipo`),
  KEY `fac_med_stock` (`id_fpp`),
  CONSTRAINT `stock_equipos_ibfk_1` FOREIGN KEY (`id_fpp`) REFERENCES `facturas_proveedor_equipos` (`id_factura_proveedor_equipo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of stock_equipos
-- ----------------------------
INSERT INTO `stock_equipos` VALUES ('2', '23', '8', 'AGUJA PERICRANEAL', '21G', '', '', null, null, '25.00', '4.00', '100.00', '', '', null, null, null, null, null, null, 'admin');

-- ----------------------------
-- Table structure for stock_farmacia_equipos
-- ----------------------------
DROP TABLE IF EXISTS `stock_farmacia_equipos`;
CREATE TABLE `stock_farmacia_equipos` (
  `id_stock_farmacia_equipo` int(255) NOT NULL AUTO_INCREMENT,
  `id_aeq` int(255) DEFAULT NULL,
  `id_producto` int(255) DEFAULT NULL,
  `descripción` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `tamaño` varchar(255) DEFAULT NULL,
  `calibre` varchar(255) DEFAULT NULL,
  `volumen` varchar(255) DEFAULT NULL,
  `fecha_fabricación` date DEFAULT NULL,
  `fecha_caducidad` date DEFAULT NULL,
  `cantidad` decimal(20,2) DEFAULT NULL,
  `precio_unitario` decimal(20,2) DEFAULT NULL,
  `precio_total` decimal(20,2) DEFAULT NULL,
  `donación` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `reingreso` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `zona` int(255) DEFAULT NULL,
  `percha` int(255) DEFAULT NULL,
  `altura` int(255) DEFAULT NULL,
  `sección` int(255) DEFAULT NULL,
  `entregado` decimal(20,2) DEFAULT NULL,
  `no_entregado` decimal(20,2) DEFAULT NULL,
  `id_farmaceuta` int(255) NOT NULL,
  PRIMARY KEY (`id_stock_farmacia_equipo`),
  KEY `stock_farmacia_equipos_ibfk_1` (`id_aeq`),
  KEY `sfeidfarma` (`id_farmaceuta`),
  CONSTRAINT `sfeidfarma` FOREIGN KEY (`id_farmaceuta`) REFERENCES `u_farmaceuticos` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stock_farmacia_equipos_ibfk_1` FOREIGN KEY (`id_aeq`) REFERENCES `actas_entrega_equipos` (`id_acta_entrega_equipo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of stock_farmacia_equipos
-- ----------------------------

-- ----------------------------
-- Table structure for stock_farmacia_general
-- ----------------------------
DROP TABLE IF EXISTS `stock_farmacia_general`;
CREATE TABLE `stock_farmacia_general` (
  `id_stock_farmacia_general` int(255) NOT NULL AUTO_INCREMENT,
  `id_aeg` int(255) DEFAULT NULL,
  `id_producto` int(255) DEFAULT NULL,
  `descripción` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `tamaño` varchar(255) DEFAULT NULL,
  `calibre` varchar(255) DEFAULT NULL,
  `volumen` varchar(255) DEFAULT NULL,
  `fecha_fabricación` date DEFAULT NULL,
  `fecha_caducidad` date DEFAULT NULL,
  `cantidad` decimal(20,2) DEFAULT NULL,
  `precio_unitario` decimal(20,2) DEFAULT NULL,
  `precio_total` decimal(20,2) DEFAULT NULL,
  `donación` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `reingreso` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `zona` int(255) DEFAULT NULL,
  `percha` int(255) DEFAULT NULL,
  `altura` int(255) DEFAULT NULL,
  `sección` int(255) DEFAULT NULL,
  `entregado` decimal(20,2) DEFAULT NULL,
  `no_entregado` decimal(20,2) DEFAULT NULL,
  `id_farmaceuta` int(255) NOT NULL,
  PRIMARY KEY (`id_stock_farmacia_general`),
  KEY `stock_farmacia_general_ibfk_1` (`id_aeg`),
  KEY `sfgidfarma` (`id_farmaceuta`),
  CONSTRAINT `sfgidfarma` FOREIGN KEY (`id_farmaceuta`) REFERENCES `u_farmaceuticos` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stock_farmacia_general_ibfk_1` FOREIGN KEY (`id_aeg`) REFERENCES `actas_entrega_general` (`id_acta_entrega_general`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of stock_farmacia_general
-- ----------------------------

-- ----------------------------
-- Table structure for stock_farmacia_medicamentos
-- ----------------------------
DROP TABLE IF EXISTS `stock_farmacia_medicamentos`;
CREATE TABLE `stock_farmacia_medicamentos` (
  `id_stock_farmacia_medicamentos` int(255) NOT NULL AUTO_INCREMENT,
  `id_aem` int(255) DEFAULT NULL,
  `código_cnmb` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `descripción` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `forma_farmaceutica` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `concentración` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_producto` int(255) DEFAULT NULL,
  `fecha_fabricación` date DEFAULT NULL,
  `fecha_caducidad` date DEFAULT NULL,
  `cantidad` decimal(20,2) DEFAULT NULL,
  `precio_unitario` decimal(20,2) DEFAULT NULL,
  `precio_total` decimal(20,2) DEFAULT NULL,
  `donación` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `reingreso` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `zona` int(255) DEFAULT NULL,
  `percha` int(255) DEFAULT NULL,
  `altura` int(255) DEFAULT NULL,
  `sección` int(255) DEFAULT NULL,
  `entregado` decimal(20,2) DEFAULT NULL,
  `no_entregado` decimal(20,2) DEFAULT NULL,
  `id_farmaceuta` int(255) NOT NULL,
  PRIMARY KEY (`id_stock_farmacia_medicamentos`),
  KEY `stock_farmacia_medicamentos_ibfk_1` (`id_aem`),
  KEY `sfmeidfarma` (`id_farmaceuta`),
  CONSTRAINT `sfmeidfarma` FOREIGN KEY (`id_farmaceuta`) REFERENCES `u_farmaceuticos` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stock_farmacia_medicamentos_ibfk_1` FOREIGN KEY (`id_aem`) REFERENCES `actas_entrega_medicamentos` (`id_acta_entrega_medicamento`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of stock_farmacia_medicamentos
-- ----------------------------

-- ----------------------------
-- Table structure for stock_general
-- ----------------------------
DROP TABLE IF EXISTS `stock_general`;
CREATE TABLE `stock_general` (
  `id_stock_general` int(255) NOT NULL AUTO_INCREMENT,
  `id_fpg` int(255) DEFAULT NULL,
  `id_producto` int(255) DEFAULT NULL,
  `descripción` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `tamaño` varchar(255) DEFAULT NULL,
  `calibre` varchar(255) DEFAULT NULL,
  `volumen` varchar(255) DEFAULT NULL,
  `fecha_fabricación` date DEFAULT NULL,
  `fecha_caducidad` date DEFAULT NULL,
  `cantidad` decimal(20,2) DEFAULT NULL,
  `precio_unitario` decimal(20,2) DEFAULT NULL,
  `precio_total` decimal(20,2) DEFAULT NULL,
  `donación` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `reingreso` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `zona` int(255) DEFAULT NULL,
  `percha` int(255) DEFAULT NULL,
  `altura` int(255) DEFAULT NULL,
  `sección` int(255) DEFAULT NULL,
  `entregado` decimal(20,2) DEFAULT NULL,
  `no_entregado` decimal(20,2) DEFAULT NULL,
  `id_almacenista` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_stock_general`),
  KEY `fac_med_stock` (`id_fpg`),
  CONSTRAINT `stock_general_ibfk_1` FOREIGN KEY (`id_fpg`) REFERENCES `facturas_proveedor_general` (`id_factura_proveedor_general`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of stock_general
-- ----------------------------

-- ----------------------------
-- Table structure for stock_medicamentos
-- ----------------------------
DROP TABLE IF EXISTS `stock_medicamentos`;
CREATE TABLE `stock_medicamentos` (
  `id_stock_medicamentos` int(255) NOT NULL AUTO_INCREMENT,
  `id_fpm` int(255) DEFAULT NULL,
  `código_cnmb` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `descripción` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `forma_farmaceutica` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `concentración` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_producto` int(255) DEFAULT NULL,
  `fecha_fabricación` date DEFAULT NULL,
  `fecha_caducidad` date DEFAULT NULL,
  `cantidad` decimal(20,2) DEFAULT NULL,
  `precio_unitario` decimal(20,2) DEFAULT NULL,
  `precio_total` decimal(20,2) DEFAULT NULL,
  `donación` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `reingreso` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `zona` int(255) DEFAULT NULL,
  `percha` int(255) DEFAULT NULL,
  `altura` int(255) DEFAULT NULL,
  `sección` int(255) DEFAULT NULL,
  `entregado` decimal(20,2) DEFAULT NULL,
  `no_entregado` decimal(20,2) DEFAULT NULL,
  `id_almacenista` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_stock_medicamentos`),
  KEY `fac_med_stock` (`id_fpm`),
  CONSTRAINT `fac_med_stock` FOREIGN KEY (`id_fpm`) REFERENCES `facturas_proveedor_medicamentos` (`id_factura_proveedor_medicamentos`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of stock_medicamentos
-- ----------------------------
INSERT INTO `stock_medicamentos` VALUES ('1', '4', '', 'Acetilcisteína', 'Líquido para inhalación', '100 mg/mL', '5', null, null, '2.00', '1.00', '2.00', 'Si', 'Si', null, null, null, null, null, null, 'admin');

-- ----------------------------
-- Table structure for usuarios
-- ----------------------------
DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios` (
  `id_usuario` int(255) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(255) DEFAULT NULL,
  `pass` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `nombres` varchar(255) DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `id_grupo` int(255) DEFAULT NULL,
  `activo` int(11) DEFAULT NULL,
  `ext_seguridad_id` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `reset_token` varchar(50) DEFAULT NULL,
  `reset_date` datetime DEFAULT NULL,
  `id_tecnico` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  KEY `gru_us` (`id_grupo`),
  CONSTRAINT `gru_us` FOREIGN KEY (`id_grupo`) REFERENCES `u_grupos` (`id_grupo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of usuarios
-- ----------------------------
INSERT INTO `usuarios` VALUES ('6', 'admin', '$2y$10$nJNcGhkNeNr8BZhsjZO5ouAm8oZjY7LTAJUaXhobODP7K91ahbRgu', 'admin', 'admin', '1', null, null, null, null, null);
INSERT INTO `usuarios` VALUES ('7', 'medico1', '$2y$10$7RrJJDxsI/gQwrjvwQZOk.B/F2kMO1b0g.rdQO5akRXuiQ/O0d5K.', 'medico1', '', '2', null, '', null, null, 'admin');
INSERT INTO `usuarios` VALUES ('8', 'paciente1', '$2y$10$xkY/tLVWz2QvpO.ZFwPWKOXK7K6eTZggAeT4UfjiBILHY6ZWD26zu', 'paciente1', '', '3', null, '', null, null, 'admin');
INSERT INTO `usuarios` VALUES ('9', 'farmacia1', '$2y$10$smCAUlhvGBdkwmnSWdEqYewpGOwD0ByjfIpgCTWo4vet0/hJ4kOYO', 'farmacia1', '', '5', null, '', null, null, 'admin');
INSERT INTO `usuarios` VALUES ('10', 'almacenista1', '$2y$10$uuDAvcCxtqDe6lIeh3PfQu5xCQCt4wVqIOkGqAy30/Wcxy0nSWC0W', 'almacenista1', '', '6', null, '', null, null, 'admin');
INSERT INTO `usuarios` VALUES ('11', 'proveedor1', '$2y$10$jYMwYF1ZDHGDH6/dtGyiFOVtBp8we8OMvCPfKyKPbNq4ubpRu8kLq', 'proveedor1', '', '7', null, '', null, null, 'admin');
INSERT INTO `usuarios` VALUES ('12', 'luis', '$2y$10$TXI6v3Fit71w9f6UO0eK3e2ZKi2qIP/eYRJ4WWkJkdU9TUnTpRbhG', '', '', '1', null, '', null, null, 'admin');
INSERT INTO `usuarios` VALUES ('13', 'bodega1', '$2y$10$/zlcsooJpScc9C3llz6Vg.quVxVT6m/O8CdMNzuG5cyon0kmx8Kk2', '', '', '7', null, '', null, null, 'admin');

-- ----------------------------
-- Table structure for u_almacenistas
-- ----------------------------
DROP TABLE IF EXISTS `u_almacenistas`;
CREATE TABLE `u_almacenistas` (
  `id_almacenista` int(255) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(255) DEFAULT NULL,
  `nombres` varchar(255) DEFAULT NULL,
  `apellidos` varchar(255) DEFAULT NULL,
  `documento_de_identidad` int(25) DEFAULT NULL,
  `id_nacionalidad` int(11) DEFAULT NULL,
  `id_sexo` int(10) DEFAULT NULL,
  `id_especialidad` int(255) DEFAULT NULL,
  `libro` varchar(255) DEFAULT NULL,
  `folio` varchar(10) DEFAULT NULL,
  `número` int(10) DEFAULT NULL,
  `firma_electrónica` varchar(255) DEFAULT NULL,
  `firma` blob,
  `sello` blob,
  `teléfono` int(20) DEFAULT NULL,
  `celular` int(20) DEFAULT NULL,
  `id_provincia` int(255) DEFAULT NULL,
  `id_canton` int(255) DEFAULT NULL,
  `id_parroquia` int(255) DEFAULT NULL,
  `dirección` varchar(255) DEFAULT NULL,
  `id_tecnico` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_almacenista`),
  KEY `idparropft` (`id_parroquia`),
  KEY `idcantopft` (`id_canton`),
  KEY `idnacioft` (`id_nacionalidad`),
  KEY `idprovinft` (`id_provincia`),
  KEY `idsexopft` (`id_sexo`),
  KEY `uespecit` (`id_especialidad`),
  KEY `ualmact` (`id_usuario`),
  CONSTRAINT `idcantopft` FOREIGN KEY (`id_canton`) REFERENCES `conf_cantones` (`id_canton`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `idnacioft` FOREIGN KEY (`id_nacionalidad`) REFERENCES `conf_nacionalidad` (`id_nacionalidad`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `idparropft` FOREIGN KEY (`id_parroquia`) REFERENCES `conf_parroquias` (`id_parroquia`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `idprovinft` FOREIGN KEY (`id_provincia`) REFERENCES `conf_provincias` (`id_provincia`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `idsexopft` FOREIGN KEY (`id_sexo`) REFERENCES `conf_genero` (`id_sexo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ualmact` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `uespecit` FOREIGN KEY (`id_especialidad`) REFERENCES `conf_especialidades` (`id_especialidad`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of u_almacenistas
-- ----------------------------
INSERT INTO `u_almacenistas` VALUES ('1', '10', 'almacenista1', 'almacenista1', '12444', '53', '2', null, '', '', null, '', null, null, null, null, '8', '68', '466', 'B', 'admin');

-- ----------------------------
-- Table structure for u_contadores
-- ----------------------------
DROP TABLE IF EXISTS `u_contadores`;
CREATE TABLE `u_contadores` (
  `id_contador` int(255) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(255) DEFAULT NULL,
  `nombres` varchar(255) DEFAULT NULL,
  `apellidos` varchar(255) DEFAULT NULL,
  `documento_de_identidad` int(25) DEFAULT NULL,
  `id_nacionalidad` int(11) DEFAULT NULL,
  `id_sexo` int(10) DEFAULT NULL,
  `id_especialidad` int(255) DEFAULT NULL,
  `firma` blob,
  `sello` blob,
  `teléfono` int(20) DEFAULT NULL,
  `celular` int(20) DEFAULT NULL,
  `id_provincia` int(255) DEFAULT NULL,
  `id_canton` int(255) DEFAULT NULL,
  `id_parroquia` int(255) DEFAULT NULL,
  `dirección` varchar(255) DEFAULT NULL,
  `id_tecnico` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_contador`),
  KEY `usu_pres` (`id_usuario`),
  KEY `esp_pres` (`id_especialidad`),
  KEY `idparropt` (`id_parroquia`),
  KEY `idcantopt` (`id_canton`),
  KEY `idnaciot` (`id_nacionalidad`),
  KEY `idprovint` (`id_provincia`),
  KEY `idsexopt` (`id_sexo`),
  CONSTRAINT `u_contadores_ibfk_1` FOREIGN KEY (`id_canton`) REFERENCES `conf_cantones` (`id_canton`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `u_contadores_ibfk_2` FOREIGN KEY (`id_nacionalidad`) REFERENCES `conf_nacionalidad` (`id_nacionalidad`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `u_contadores_ibfk_3` FOREIGN KEY (`id_parroquia`) REFERENCES `conf_parroquias` (`id_parroquia`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `u_contadores_ibfk_4` FOREIGN KEY (`id_provincia`) REFERENCES `conf_provincias` (`id_provincia`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `u_contadores_ibfk_5` FOREIGN KEY (`id_sexo`) REFERENCES `conf_genero` (`id_sexo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `u_contadores_ibfk_7` FOREIGN KEY (`id_especialidad`) REFERENCES `conf_especialidades` (`id_especialidad`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `u_contadores_ibfk_8` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of u_contadores
-- ----------------------------

-- ----------------------------
-- Table structure for u_empresas
-- ----------------------------
DROP TABLE IF EXISTS `u_empresas`;
CREATE TABLE `u_empresas` (
  `id_empresa` int(255) NOT NULL AUTO_INCREMENT,
  `id_t_persona_juridica` int(255) DEFAULT NULL,
  `empresa` varchar(255) DEFAULT NULL,
  `ruc` int(20) DEFAULT NULL,
  `teléfono` int(20) DEFAULT NULL,
  `celular` int(20) DEFAULT NULL,
  `id_país` int(255) DEFAULT NULL,
  `id_provincia` int(255) DEFAULT NULL,
  `id_canton` int(255) DEFAULT NULL,
  `id_parroquia` int(255) DEFAULT NULL,
  `dirección` varchar(255) DEFAULT NULL,
  `id_tecnico` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_empresa`),
  KEY `idpj` (`id_t_persona_juridica`),
  KEY `idp` (`id_país`),
  KEY `idpro` (`id_provincia`),
  KEY `idpar` (`id_parroquia`),
  KEY `idcan` (`id_canton`),
  CONSTRAINT `idcan` FOREIGN KEY (`id_canton`) REFERENCES `conf_cantones` (`id_canton`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `idp` FOREIGN KEY (`id_país`) REFERENCES `conf_paises` (`id_pais`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `idpar` FOREIGN KEY (`id_parroquia`) REFERENCES `conf_parroquias` (`id_parroquia`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `idpj` FOREIGN KEY (`id_t_persona_juridica`) REFERENCES `conf_tipo_persona_juridica` (`id_persona`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `idpro` FOREIGN KEY (`id_provincia`) REFERENCES `conf_provincias` (`id_provincia`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of u_empresas
-- ----------------------------
INSERT INTO `u_empresas` VALUES ('1', '2', 'Alion.Pro S.A.', '2147483647', '23038386', '963092296', '66', '17', '178', '1089', 'Calle Soledad B1', 'admin');
INSERT INTO `u_empresas` VALUES ('2', '2', 'Bayer S.A.', '1792222222', '22222', '99999', '66', '17', '178', '1078', 'Calle 1', 'admin');

-- ----------------------------
-- Table structure for u_farmaceuticos
-- ----------------------------
DROP TABLE IF EXISTS `u_farmaceuticos`;
CREATE TABLE `u_farmaceuticos` (
  `id_farmaceutico` int(255) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(255) DEFAULT NULL,
  `nombres` varchar(255) DEFAULT NULL,
  `apellidos` varchar(255) DEFAULT NULL,
  `documento_de_identidad` int(25) DEFAULT NULL,
  `id_nacionalidad` int(11) DEFAULT NULL,
  `id_sexo` int(10) DEFAULT NULL,
  `id_especialidad` int(255) DEFAULT NULL,
  `libro` varchar(255) DEFAULT NULL,
  `folio` varchar(10) DEFAULT NULL,
  `número` int(10) DEFAULT NULL,
  `firma_electrónica` varchar(255) DEFAULT NULL,
  `firma` blob,
  `sello` blob,
  `teléfono` int(20) DEFAULT NULL,
  `celular` int(20) DEFAULT NULL,
  `id_provincia` int(255) DEFAULT NULL,
  `id_canton` int(255) DEFAULT NULL,
  `id_parroquia` int(255) DEFAULT NULL,
  `dirección` varchar(255) DEFAULT NULL,
  `id_tecnico` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_farmaceutico`),
  KEY `usu_pres` (`id_usuario`),
  KEY `esp_pres` (`id_especialidad`),
  KEY `idcantopf` (`id_canton`),
  KEY `idnaciof` (`id_nacionalidad`),
  KEY `idprovinf` (`id_provincia`),
  KEY `idsexopf` (`id_sexo`),
  KEY `idparropf` (`id_parroquia`),
  CONSTRAINT `idcantopf` FOREIGN KEY (`id_canton`) REFERENCES `conf_cantones` (`id_canton`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `idnaciof` FOREIGN KEY (`id_nacionalidad`) REFERENCES `conf_nacionalidad` (`id_nacionalidad`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `idparropf` FOREIGN KEY (`id_parroquia`) REFERENCES `conf_parroquias` (`id_parroquia`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `idprovinf` FOREIGN KEY (`id_provincia`) REFERENCES `conf_provincias` (`id_provincia`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `idsexopf` FOREIGN KEY (`id_sexo`) REFERENCES `conf_genero` (`id_sexo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `u_farmaceuticos_ibfk_1` FOREIGN KEY (`id_especialidad`) REFERENCES `conf_especialidades` (`id_especialidad`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `u_farmaceuticos_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of u_farmaceuticos
-- ----------------------------
INSERT INTO `u_farmaceuticos` VALUES ('2', '9', 'farmacia1', 'farmacia1', '1111', '53', '2', null, '', '', null, '', null, null, null, null, '8', '67', '430', 'A', 'admin');

-- ----------------------------
-- Table structure for u_grupos
-- ----------------------------
DROP TABLE IF EXISTS `u_grupos`;
CREATE TABLE `u_grupos` (
  `id_grupo` int(255) NOT NULL AUTO_INCREMENT,
  `grupo` varchar(255) DEFAULT NULL,
  `id_tecnico` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_grupo`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of u_grupos
-- ----------------------------
INSERT INTO `u_grupos` VALUES ('1', 'Tecnicos', null);
INSERT INTO `u_grupos` VALUES ('2', 'Prescriptores', null);
INSERT INTO `u_grupos` VALUES ('3', 'Pacientes', null);
INSERT INTO `u_grupos` VALUES ('4', 'Contabilidad', null);
INSERT INTO `u_grupos` VALUES ('5', 'Farmaceuticos', null);
INSERT INTO `u_grupos` VALUES ('6', 'Almacenistas', null);
INSERT INTO `u_grupos` VALUES ('7', 'Proveedores', null);
INSERT INTO `u_grupos` VALUES ('8', 'Trabajadores', null);

-- ----------------------------
-- Table structure for u_pacientes
-- ----------------------------
DROP TABLE IF EXISTS `u_pacientes`;
CREATE TABLE `u_pacientes` (
  `id_paciente` int(255) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(255) DEFAULT NULL,
  `nombres` varchar(255) DEFAULT NULL,
  `apellidos` varchar(255) DEFAULT NULL,
  `documento_de_identidad` int(25) DEFAULT NULL,
  `id_nacionalidad` int(11) DEFAULT NULL,
  `id_sexo` int(10) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `historia_clinica` varchar(255) DEFAULT NULL,
  `cie_10` varchar(255) DEFAULT NULL,
  `edad_años` int(3) DEFAULT NULL,
  `edad_meses` int(3) DEFAULT NULL,
  `teléfono` int(20) DEFAULT NULL,
  `celular` int(20) DEFAULT NULL,
  `id_provincia` int(255) DEFAULT NULL,
  `id_canton` int(255) DEFAULT NULL,
  `id_parroquia` int(255) DEFAULT NULL,
  `dirección` varchar(255) DEFAULT NULL,
  `id_tecnico` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_paciente`),
  KEY `usu_pac` (`id_usuario`),
  KEY `idnaci` (`id_nacionalidad`),
  KEY `idprovi` (`id_provincia`),
  KEY `idcanto` (`id_canton`),
  KEY `idparro` (`id_parroquia`),
  KEY `idsexo` (`id_sexo`),
  CONSTRAINT `idcanto` FOREIGN KEY (`id_canton`) REFERENCES `conf_cantones` (`id_canton`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `idnaci` FOREIGN KEY (`id_nacionalidad`) REFERENCES `conf_nacionalidad` (`id_nacionalidad`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `idparro` FOREIGN KEY (`id_parroquia`) REFERENCES `conf_parroquias` (`id_parroquia`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `idprovi` FOREIGN KEY (`id_provincia`) REFERENCES `conf_provincias` (`id_provincia`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `idsexo` FOREIGN KEY (`id_sexo`) REFERENCES `conf_genero` (`id_sexo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `usu_pac` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of u_pacientes
-- ----------------------------
INSERT INTO `u_pacientes` VALUES ('6', '8', 'paciente1', 'paciente1', '1717180812', '53', '2', '1986-07-27', '0003399', '', '34', '9', '23038386', '963092296', '17', '178', '1098', 'J', 'admin');

-- ----------------------------
-- Table structure for u_prescriptores
-- ----------------------------
DROP TABLE IF EXISTS `u_prescriptores`;
CREATE TABLE `u_prescriptores` (
  `id_prescritor` int(255) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(255) DEFAULT NULL,
  `ZONA` varchar(255) DEFAULT NULL,
  `COD_EOD` varchar(255) DEFAULT NULL,
  `EOD` varchar(255) DEFAULT NULL,
  `CEDULA_PASAPORTE` varchar(255) DEFAULT NULL,
  `APELLIDOS_Y_NOMBRES` varchar(255) DEFAULT NULL,
  `AREA_DONDE_LABORA` varchar(255) DEFAULT NULL,
  `DENOMINACION_DE_PUESTO_POSICIONAL_CONFORME_CATALOGO_DE_MANUAL_DE` varchar(255) DEFAULT NULL,
  `FECHA_DE_NACIMIENTO` varchar(255) DEFAULT NULL,
  `CORREO_ELECTRONICO_INSTITUCIONAL` varchar(255) DEFAULT NULL,
  `CORREO_ELECTRONICO_PERSONAL` varchar(255) DEFAULT NULL,
  `CONTACTO_TELEFONICO` varchar(255) DEFAULT NULL,
  `GENERO` varchar(255) DEFAULT NULL,
  `PROFESION_TITULO` varchar(255) DEFAULT NULL,
  `NIVEL_DE_INSTRUCCION` varchar(255) DEFAULT NULL,
  `AUTORIZADOS` varchar(255) DEFAULT NULL,
  `libro` varchar(255) DEFAULT NULL,
  `folio` varchar(10) DEFAULT NULL,
  `número` int(10) DEFAULT NULL,
  `firma_electrónica` varchar(255) DEFAULT NULL,
  `firma` blob,
  `sello` blob,
  `id_tecnico` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_prescritor`),
  KEY `usu_prescrip` (`id_usuario`),
  CONSTRAINT `usu_prescrip` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=825 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of u_prescriptores
-- ----------------------------
INSERT INTO `u_prescriptores` VALUES ('1', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801703679', 'ACERO ESTUPIÑAN JULIANA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '22/3/1984', 'juliana.estupiñan@hdtc.gob.ec', 'juliananaceroestupinan@gmail.com', '097383432', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('2', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0800323701', 'ACEVEDO BALLESTERO JOSE BIRGILIO', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A ESPECIALISTA EN ANESTESIOLOGIA 1', '21/05/1953', 'jose.acevedo@hdtc.gob.ec', 'jbacevedo@yahoo.es', '069341344', 'MASCULINO', 'MEDICO ESPECIALISTA ANASTESEOLOGIA', 'CUARTO NIVEL', 'X', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('3', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1804472239', 'ACOSTA FONSECA PEDRO FERNANDO', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '1/7/1990', 'pedro.acosta@hdtc.gob.ec', 'marlenejules@hotmail.com', '0996544652', 'MASCULINO', 'MEDICO', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('4', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1759045386', 'ACOSTA GUERRERO YESSICA CARINA', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A ESPECIALISTA EN CUIDADOS INTENSIVOS 1', '04/12/1962', 'yessica.acosta@hdtc.gob.ec', 'yessica.acosta@hdtc.gob.ec', '0988501834', 'FEMENINO', 'MEDICO ESPECIALISTA  INTENSIVISTA', 'CUARTO NIVEL', 'X', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('5', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1310558778', 'AGUAYO MACIAS ANGEL RAFAEL', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '05/01/1961', 'angel.aguayo@hdtc.gob.ec', 'lincearam@hotmail.com', '0999347764', 'MASCULINO', 'MEDICO CIRUJANO', 'TERCER NIVEL', 'X', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('6', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0927073536', 'AGUILAR BAZURTO ANGEL GABRIEL', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '28/10/1988', 'angel.aguilar@hdtc.gob.ec', 'angel-aguilar-28@hotmail.com', '0999344165', 'MASCULINO', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIA 1', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('7', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0704589431', 'AJILA AJILA YOHANA CATHERINE', 'GESTION DE ADMISIONES', 'ASISTENTE DE ADMISIONES', '27/08/1962', 'yohana.ajila@hdtc.gob.ec', 'catherineajila@hotmail.com', '0939599087', 'FEMENINO', 'S/N', 'BACHILLER', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('8', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1718455049', 'ALAVA MALDONADO MAYRA ISABEL', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A ESPECIALISTA EN GERIATRIA 1', '23/3/1984', 'mayra.alava@hdtc.gob.ec', 'mayra.alava@hdtc.gob.ec', '0987006052', 'FEMENINO', 'MEDICO/A ESPECIALISTA EN GERIATRIA 1', 'CUARTO NIVEL', 'X', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('9', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1312273525', 'ALAVA VILLAFUERTE ERIKA TATIANA', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '01/07/1986', 'erika.alava@hdtc.gob.ec', 'erika.alava@hdtc.gob.ec', '0986668235', 'FEMENINO', 'MEDICO GENERAL EN FUNCIONES HOSPITALARIAS', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('10', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801941469', 'ALCIVAR DELGADO OSCAR ANTONIO', 'GESTION DE CUIDADOS DE ENFERMERIA', 'AUXILIAR DE ENFERMERIA', '11/10/1989', 'oscar.alcivar@hdtc.gob.ec', 'oscaralcivar@hotmail.com', '062995100', 'MASCULINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('11', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802361352', 'ALCIVAR MONTAÑO EVA LUCIA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'AUXILIAR DE ENFERMERIA', '21/02/1970', ' eva.alcivar@hdtc.gob.ec', 'eltiempo27@yahoo.com', '0991432232', 'FEMENINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('12', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801277195', 'ALCIVAR QUIÑONEZ VILMAR DIOCELINA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '25/03/1970', 'vilmar.alcivar@hdtc.gob.ec', 'tinaalcivar@yahoo.es', '0984890073', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('13', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803456961', 'ALMACHI TACO LIGIA ELIZABETH', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '01/02/1974', 'ligia.almachi@hdtc.gob.ec', 'ligiaalmachi@hotmail.com', '0969609469', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('14', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801337544', 'ALTAFUYA INTRIAGO DARMIN YISELA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '07/11/1976', 'darmin.altafuya@hdtc.gob.ec', 'guadaenferforever@hotmail.com', '0909913419', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('15', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802290106', 'ALTAFUYA INTRIAGO DEYSY CARMINA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'AUXILIAR DE ENFERMERIA', '10/11/1989', 'deysy.altafuya@hdtc.gob.ec', 'deisyaltafuya@gmail.com', '0988692111', 'FEMENINO', 'TECNICO EN ENFERMERIA', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('16', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '802320309', 'ALVAREZ CAMACHO GISSELA AMELIA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '28/02/1978', 'gissela.alvarez@hdtc.gob.ec', 'lindaanais81@gmail.com', '0979561910', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('17', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0302102850', 'ALVAREZ PICHAZACA MANUEL ANTONIO', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '16/09/1962', 'manuel.alvarez@hdtc.gob.ec', 'anthonyalpi@hotmail.com', '0987608091', 'MASCULINO', 'MEDICO GENERAL EN FUNCIONES HOSPITALARIAS', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('18', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803044874', 'ANCHUNDIA CHAVEZ ANGEL RAUL', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '07/02/1982', 'angel.anchundia@hdtc.gob.ec', 'ANYEL.10-01-1987@HOTMAIL.COM', '0979576184', 'MASCULINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('19', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1716869829', 'ANDINO JURADO NATALY DANIELA', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A ESPECIALISTA EN GASTROENTEROLOGIA 1', '28/11/1990', 'nataly.andino@hdtc.gob.ec', 'dananjura@gmail.com', '0982370524', 'FEMENINO', 'ESPECIALISTA EN GASTROENTEROLOGIA Y ENDOSCOPIA', 'CUARTO NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('20', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803047745', 'ANDRADE CORTES KATIUSKA DEL PILAR', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '24/05/1987', 'katiuska.andrade@hdtc.gob.ec', 'katiuskadelpilarandrade@gmail.com', '0967849722', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('21', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802828947', 'ANDRADE TAFUR ERIKA ELIZABETH', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '24/05/1979', 'erika.andrade@hdtc.gob.ec', 'erika.andrade@hdtc.gob.ec', '0967399991', 'FEMENINO', 'MEDICO GENERAL EN FUNCIONES HOSPITALARIAS', 'TERCER NIVEL', 'X', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('22', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0800721151', 'ANGULO ARBOLEDA SEGUNDO EBERTO', 'GESTION DE CUIDADOS DE ENFERMERIA', 'AUXILIAR DE ENFERMERIA', '25/07/1955', 'segundo.angulo@hdtc.gob.ec', 'eltiempo27@yahoo.com', '0988938019', 'MASCULINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('23', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802303255', 'ANGULO CASTILLO CARLOS JUSTINO', 'GESTION ADMINISTRATIVA', 'AUXILIAR ADMINISTRATIVO DE SALUD DEL SECTOR SALUD', '20/04/1987', 'carlos.angulo@hdtc.gob.ec', 'memorante68@yahoo.com', '0997909499', 'MASCULINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('24', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803140672', 'ANGULO CORTEZ EDITH JEANETH', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '13/09/1982', 'edith.angulo@hdtc.gob.ec', 'ejanguloczs5@gmail.com', '0991314849', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('25', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803598671', 'ANGULO GOMEZ WLADIMIR JHOSIMAR', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '24/02/1968', 'wladimir.angulo@hdtc.gob.ec', 'angulojoar@gmail.com', '0993697993', 'MASCULINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('26', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803707819', 'ANGULO MALDONADO OSIRIS ALEXANDRA', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '15/6/1993', 'osiris.angulo@hdtc.gob.ec', 'aongulocsz5@gmail.com', '0968578467', 'FEMENINO', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIA 1', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('27', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802902965', 'ANGULO REINA KATHERINE YAHAIRA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'AUXILIAR DE ENFERMERIA', '14/07/1973', 'katherine.angulo@hdtc.gob.ec', 'thebaby07@hotmail.com', '0996495524', 'FEMENINO', 'TECNICO EN ENFERMERIA', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('28', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802376624', 'ANGULO TAMAYO JESSICA CECIBEL', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '13/08/1970', 'jessica.angulo@hdtc.gob.ec', 'lidia.rodriguez@msp.gob.ec', '062995100', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('29', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802757872', 'ANGULO TAMAYO KAREN ELIZABETH', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'OBSTETRIZ / OBSTETRA 1', '20/03/1990', 'karen. angulo@hdtc.gob.ec', 'elizabeth198212@hotmail.com', '0999484635', 'FEMENINO', 'OBSTETRIZ / OBSTETRA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('30', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803525088', 'ANGULO VERA PAOLA CECIBEL', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '10/12/1983', 'paola.angulo@hdtc.gob.ec', 'paoceci1990@hotmail.com', '0939308609', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('31', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802174235', 'ARANA ROLDAN DILSON ANDRES', 'GESTION ADMINISTRATIVA', 'AUXILIAR ADMINISTRATIVO DE SALUD DEL SECTOR SALUD', '19/09/1968', 'dilson.arana@@hdtc.gob.ec', 'sonia.cedeno@hdtc.gob.ec', '0991442739', 'MASCULINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('32', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803059948', 'ARBOLEDA ESCOBAR JANETH ELVIRA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '27/9/1985', 'janneth.arboleda@hdtc.gob.ec', 'jeannethares085@hotmail.com', '0997272160', 'FEMENINO', 'ENFERMERO/A 3', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('33', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1803023827', 'ARBOLEDA MAZON ALEX MAURICIO', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '28/07/1989', 'alex.arboleda@hdtc.gob.ec', 'drarboleda22@hotmail.com', '099131262', 'MASCULINO', 'MEDICO GENERAL EN FUNCIONES HOSPITALARIAS', 'TERCER NIVEL', 'X', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('34', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802935650', 'ARCE BONAGA JOMAIRA NOEIRA', 'GESTION DE ADMISIONES', 'ASISTENTE DE ADMISIONES', '17/03/1972', 'jomaira.arce@hdtc.gob.ec', 'MSPMIGRACION@MSP.GOB.EC', '0997893969', 'FEMENINO', 'INGENIERA EN CONTABILIDAD Y AUDITORIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('35', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802502898', 'ARCE MINA JOHANNA ISABEL', 'GESTION DE CUIDADOS DE ENFERMERIA', 'AUXILIAR DE ENFERMERIA', '07/08/1992', 'johanna.arce@hdtc.gob.ec', 'bybeca12@hotmail.com', '0994967998', 'FEMENINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('36', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801904723', 'ARDILA LOZANO VIVIANA ISABEL', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A ESPECIALISTA EN ANESTESIOLOGIA 1', '09/11/1986', 'viviana.ardila@hdtc.gob.ec', 'dra_ardila@hotmail.com', '0985028738', 'FEMENINO', 'MEDICO ESPECIALISTA ANASTESEOLOGIA', 'CUARTO NIVEL', 'X', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('37', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802202317', 'AREQUIPA GARCES LORENA ELIZABETH', 'GESTION FINANCIERA', 'ANALISTA DE PRESUPUESTO 2', '10/6/1979', 'lorena.arequipa@hdtc.gob.ec', 'lorena1029@hotmail.com', '0988229539', 'FEMENINO', 'INGENIERA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('38', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802243055', 'AREVALO ALARCON ROSA LEONOR', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '17/3/1989', 'rosa.arevalo@hdtc.gob.ec', 'rosabellla_2985@hotmail.com', '062995100', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('39', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802221911', 'ARGANDOÑA RODRIGUEZ EDITH VERONICA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '4/7/1978', 'edith.argandoña@hdtc.gob.ec', 'guadaenferforever@hotmail.com', '092612847', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('40', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802138370', 'ARMENDARIZ ORDOÑEZ ROCIO ELIZABETH', 'GESTION DE CUIDADOS DE ENFERMERIA', 'AUXILIAR DE ENFERMERIA', '11/12/1982', 'rocio.armendariz@hdtc.gob.ec', 'chioely3@hotmail.com', '0993166444', 'FEMENINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('41', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803338326', 'ARROYO ARROYO RAMON ORLANDO', 'GESTION ADMINISTRATIVA', 'AUXILIAR ADMINISTRATIVO DE SALUD DEL SECTOR SALUD', '21/3/1990', 'ramón.arroyo@hdtc.gob.ec', 'ramonor@yahho.es', '062995100', 'MASCULINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('42', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0800503880', 'ARROYO BALLESTEROS MARTHA FELICIANA', 'GESTION ADMINISTRATIVA', 'AUXILIAR ADMINISTRATIVO DE SALUD DEL SECTOR SALUD', '24/1/1958', 'martha.arroyo@hdtc.gob.ec', 'arroyomartha@yahoo.es', '062726008', 'FEMENINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('43', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802665075', 'ARROYO COROZO MERCEDES JESSICA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '11/12/1982', 'mercedes.arroyo@hdtc.gob.ec', 'veronica_b1976@yahoo.com', '0993259365', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('44', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802078840', 'ARROYO QUIÑONEZ JUANA KARINA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'AUXILIAR DE ENFERMERIA', '30/5/1974', 'juana.arroyo@hdtc.gob.ec', 'miavega2014@hotmail.com', '0980395332', 'FEMENINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('45', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803258011', 'ARROYO VALDEZ TATIANA ISABEL', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '29/8/1990', 'tatiana.arroyo@hdtc.gob.ec', 'arroyovaldeztatianaisabel@gmail.com', '0986983141', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('46', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801513540', 'ASTUDILLO ROMERO MARCO ANTONIO', 'GESTION DE ADMISIONES', 'ASISTENTE DE ADMISIONES', '20/12/1969', 'marco.astudillo@hdtc.gob.ec', 'marco.astudillo@dpsesmeraldas.gob.ec', '09906455150', 'MASCULINO', 'LICENCIADO', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('47', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801865460', 'AVEIGA MALDONADO PEDRO', 'LABORATORIO', 'TECNOLOGO MEDICO DE LABORATORIO 3', '17/3/1976', 'pedro.maldonado@hdtc.gob.ec', 'aveigapedro@hotmail.com', '0984152731', 'MASCULINO', 'TECNOLOGO MEDICO DE LABORATORIO ', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('48', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1312317108', 'AVILA CARDENAS LILIANA ANNABEL', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '28/3/1988', 'liliana.avila@hdtc.gob.ec', 'guadaenferforever@hotmail.com', '091355390', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('49', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803289883', 'AVILA CEVALLOS MARIA FERNANDA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '3/6/1983', 'maria.avila@hdtc.gob.ec', 'maruhappy911@hotmail.com', '0968837604', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('50', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802647180', 'AVILA COTERA KAREN PAOLA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '17/3/1988', 'karen.avila@hdtc.gob.ec', 'paocotera@hotmail.es', '062995100', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('51', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803489517', 'AYOVI ARROYO GABRIELA SUGEY', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '29/7/1990', 'gabriela.ayovi@hdtc.gob.ec', 'gabriela.ayovi@distrito1p.gob.ec', '0967589570', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('52', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0800898553', 'AYOVI CEVALLOS PASTORA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'AUXILIAR DE ENFERMERIA', '22/12/1985', 'pastora.cevallos@hdtc.gob.ec', 'eltiempo27@yahoo.com', '0980184007', 'FEMENINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('53', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803356021', 'AYOVI COROZO CARMEN ANDREINA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '11/12/1982', 'carmen.ayovi@hdtc.gob.ec', 'andreinacorozo10@hotmail.com', '062995100', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('54', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802265751', 'AYOVI LASTRE PAOLA MARIUXI', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '5/1/1986', 'paola.ayovi@@hdtc.gob.ec', 'paolitaayovi@hotmail.com', '0988143094', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('55', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802969188', 'AYOVI NAZARENO PAOLA MARIA', 'GESTION ADMINISTRATIVA', 'AUXILIAR ADMINISTRATIVO DE SALUD DEL SECTOR SALUD', '20/9/1989', 'paola.ayovi@hdtc.gob.ec', 'ayovin@yahoo.es', '0967617184', 'FEMENINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('56', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802243899', 'AYOVI PRECIADO BYRON ADOLFO', 'GESTION ADMINISTRATIVA', 'AUXILIAR ADMINISTRATIVO DE SALUD DEL SECTOR SALUD', '23/12/1963', 'byron.ayovi@hdtc.gob.ec', 'nikkitagt@hotmail.com', '0988084746', 'MASCULINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('57', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0910161652', 'BALLESTEROS VINTIMILLA AZUCENA MARIA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '16/11/1963', 'azucena.ballesteros@hdtc.gob.ec', 'guadaenferforever@hotmail.com', '0995061941', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('58', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801966474', 'BANGUERA CABEZAS JENNY JANETH', 'GESTION DE CUIDADOS DE ENFERMERIA', 'AUXILIAR ADMINISTRATIVO DE SALUD DEL SECTOR SALUD', '15/2/1976', 'jenny.banguera@hdtc.gob.ec', 'chioely3@hotmail.com', '069542715', 'FEMENINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('59', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802655084', 'BARCO RIVAS CARMEN GRACIELA', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '2/6/1983', 'carmen.barco@hdtc.gob.ec', 'carmen.chelita@hotmail.com', '0939997060', 'FEMENINO', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIA 1', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('60', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0800729238', 'BARRAGAN OTOYA BERNARDITA LORENA DE LOURDES', 'IMAGENOLOGIA', 'TECNOLOGO MEDICO DE IMAGENOLOGIA 3', '04/12/1962', 'bernardita.barragan@hdtc.gob.ec', 'berloren2011@hotmail.com', '091417397', 'FEMENINO', 'TECNOLOGO MEDICO DE IMAGENOLOGIA ', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('61', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802557231', 'BARRETO COVEÑA MELISA HAYDEE', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '16/3/1978', 'melisa.barreto@hdtc.gob.ec', 'meljohu-05@hotmail.com', '0985348815', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('62', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803254762', 'BARRIO GARCIA RITA BETSY', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '11/12/1982', 'ritta.barrio@hdtc.gob.ec', 'tatentohumanodpse@hotmail.com', '0991841674', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('63', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802069047', 'BARRIO NUÑEZ MONICA MARIUXI', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '4/10/1977', 'monica.barrio@hdtc.gob.ec', 'monica-maru@hotmail.com', '0959653140', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('64', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1757510373', 'BARRUECO SUAREZ LIENA IRENA', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A ESPECIALISTA EN CUIDADOS INTENSIVOS 1', '11/12/1982', 'liena.barrueco@hdtc.gob.ec', 'liena.barrueco@hdtc.gob.ec', '0998044574', 'FEMENINO', 'MEDICO ESPECIALISTA  INTENSIVISTA', 'CUARTO NIVEL', 'X', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('65', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1758881005', 'BARRUECO SUAREZ OXANA IRINA', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '15/8/1985', 'oxana.barrueco@hdtc.gob.ec', 'oxana.barrueco@hdtc.gob.ec', '099131262', 'FEMENINO', 'MEDICO GENERAL EN FUNCIONES HOSPITALARIAS', 'TERCER NIVEL', 'X', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('66', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801896234', 'BATALLAS RIVADENEIRA MARIANELA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'AUXILIAR DE ENFERMERIA', '1/8/1976', 'marianela.rivadeneira@hdtc.gob.ec', 'chiki_beibi@hotmail.com', '0982861584', 'FEMENINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('67', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802296756', 'BAUTISTA ARANA MIRTHA MARISOL', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '11/12/1982', 'mirtha.bautista@hdtc.gob.ec', 'mirtharana@hotmail.com', '0988414407', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('68', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801553611', 'BAUTISTA CASTRO KARLA MIRELLA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'AUXILIAR DE ENFERMERIA', '14/3/1975', 'karla.bautista@hdtc.gob.ec', 'eltiempo27@yahoo.com', '0999583872', 'FEMENINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('69', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801918467', 'BAUTISTA CHILA JENNY LEONOR', 'GESTION DE ADMISIONES', 'ASISTENTE DE ADMISIONES', '11/12/1982', 'jenny.bautista@hdtc.gob.ec', 'jenny.bautista@dpsesmeraldas.gob.ec', '0991870991', 'FEMENINO', 'ABOGADA DE LOS TRIBUNALES Y JUZGADOS DE LA REPUBLICA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('70', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801595547', 'BAUTISTA MENENDEZ JOHN PATRICIO', 'FARMACIA, INSUMOS, DISPOSITIVOS MEDICOS Y REACTIVOS', 'AUXILIAR ADMINISTRATIVO DE SALUD DEL SECTOR SALUD', '27/10/1987', 'john.bautista@hdtc.gob.ec', 'ositabella1982@hotmail.com', '062995100', 'MASCULINO', 'BACHILLER', 'BACHILLER', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('71', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803203470', 'BAZAN OLMEDO RAQUEL ROCIOS', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '5/5/1985', 'raquel.bazan@hdtc.gob.ec', 'rakelita_@hotmail.es', '0985508729', 'FEMENINO', 'LICENCIADO/A EN ENFERMERÍA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('72', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801323213', 'BAZURTO MENDOZA CARLOS DANIEL', 'FARMACIA, INSUMOS, DISPOSITIVOS MEDICOS Y REACTIVOS', 'QUIMICO / BIOQUIMICO FARMACEUTICO 1', '6/10/1968', 'carlos.bazurto@hdtc.gob.ec', 'ositabella1982@hotmail.com', '0980088271', 'MASCULINO', 'QUIMICO / BIOQUIMICO FARMACEUTICO', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('73', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801161878', 'BAZURTO MENDOZA MAIRA IVON', 'FARMACIA, INSUMOS, DISPOSITIVOS MEDICOS Y REACTIVOS', 'AUXILIAR DE FARMACIA', '5/12/1966', 'maira.bazurto@hdtc.gob.ec', 'ivonbazurto@hotmail.com', '0985915074', 'FEMENINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('74', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803039387', 'BAZURTO MENDOZA MARIA VERONICA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '28/11/1988', 'maria.bazurto@hdtc.gob.ec', 'mariabazurto1@hotmail.com', '0980281729', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('75', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802935742', 'BECERRA NAZARENO SABRINA MERCEDES', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '14/8/1983', 'sabrina.becerra@hdtc.gob.ec', 'sabrinabecerra@hotmail.co', '0988670574', 'FEMENINO', 'MEDICO GENERAL EN FUNCIONES HOSPITALARIAS', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('76', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803751387', 'BECERRA PALMA MARTHA ELIZABETH', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '22/2/1991', 'martha.becerra@hdtc.gob.ec', 'elizabethbecerrapalma@hotmail.com', '062995100', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('77', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0800627523', 'BECERRA POSLIGUA CARLOS RAMON', 'REHABILITACION Y TERAPIA FISICA', 'TECNOLOGO MEDICO DE REHABILITACION Y TERAPIA FISICA 3', '05/01/1961', 'carlos.becerra@hdtc.gob.ec', 'ceraflica@hotmail.com', '090534110', 'MASCULINO', 'MAGISTER EN GERENCIA EN SALUD PARA EL DESARROLLO LOCAL', 'CUARTO NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('78', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803102342', 'BEDON MARIN DORIS MERCEDES', 'GESTION ADMINISTRATIVA', 'ANALISTA DE ADQUISICIONES 2', '26/9/1987', 'doris.bedon@hdtc.gob.ec', 'dbedon@infaesm.gob.ec', '062995100', 'FEMENINO', 'INGENIERA COMERCIAL', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('79', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0800483513', 'BEDON PACHECO LUIS SEGUNDO', 'MANTENIMIENTO', 'CHOFER DE AMBULANCIA DEL SECTOR SALUD', '26/12/1970', 'luis.bedon@hdtc.gob.ec', 'luis.bedon@hdtc.gob.ec', '0986965124', 'MASCULINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('80', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801753641', 'BEDOYA SEVILLANO SONIA ELIZABETH', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '9/11/1977', 'sonia.bedoya@hdtc.gob.ec', 'esabelcielo@gmail.com', '0939877188', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('81', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801914649', 'BEDOYA VINUEZA BETSY VERONICA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '7/5/1986', 'betsy.bedoya@hdtc.gob.ec', 'waleska_240406@hotmil.com', '0985747653', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('82', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802519983', 'BELTRAN CORDOVA INGRID JANETH', 'IMAGENOLOGIA', 'TECNOLOGO MEDICO DE IMAGENOLOGIA 3', '19/6/1986', 'ingrid.beltran@hdtc.gob.ec', 'beltrancordova@hotmail.com', '062722778', 'FEMENINO', 'TECNOLOGO MEDICO DE IMAGENOLOGIA ', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('83', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803167519', 'BENITEZ VALENCIA CARLOS DIEGO', 'GESTION ADMINISTRATIVA', 'AUXILIAR ADMINISTRATIVO DE SALUD DEL SECTOR SALUD', '13/1/1976', 'carlos.benitez@hdtc.gob.ec  ', 'cardiabv@hotmail.com', '0959980378', 'MASCULINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('84', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802200477', 'BENNET NAZARENO LOURDES BERCELIA', 'FARMACIA, INSUMOS, DISPOSITIVOS MEDICOS Y REACTIVOS', 'AUXILIAR ADMINISTRATIVO DE SALUD DEL SECTOR SALUD', '31/8/1971', 'lourdes.bennet@hdtc.gob.ec', 'lourdesbenet@hotmail.com', '0980455408', 'FEMENINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('85', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803009810', 'BERMEO MONTAÑO DIANA PRISCILA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '7/9/1988', 'diana.bermeo@hdtc.gob.ec', 'priscilachinita@hotmail.com', '0988013154', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('86', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1756753719', 'BERNADOT GUEMS', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '7/1/1991', 'guems.bernadot@hdtc.gob.ec', 'guemsbermadot@yahoo.fr', '0939644682', 'MASCULINO', 'MEDICO GENERAL EN FUNCIONES HOSPITALARIAS', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('87', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802292896', 'BOBOY GUISAMANO TATIANA IVIS', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '11/12/1982', 'tatiana.boboy@hdtc.gob.ec', 'tatiana.pasion18@outlook.com', '0969960918', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('88', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0850042193', 'BOLAÑOS BAUTISTA ERIKA PAOLA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '16/10/1994', 'erika.bolanos@hdtc.gob.ec', 'babyvaleruska92@gmail.com', '09992009550', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('89', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0800696767', 'BONE CASIERRA COLOMBIA TEODORA', 'GESTION DE TRABAJO SOCIAL', 'TRABAJADOR/A SOCIAL 1', '17/11/1982', 'colombia.bone@hdtc.gob.ec', 'colombia.bone@hdtc.gob.ec', '0990123857', 'FEMENINO', 'TRABAJADORA SOCIAL', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('90', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802134346', 'BONE CASTRO VERONICA ELIZABETH', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '2/1/1991', 'veronica.bone@hdtc.gob.ec', 'vbonecastro79@hotmail.com', '0994041717', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('91', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803867076', 'BONE GARCIA TOMMY JAVIER', 'LABORATORIO', 'TECNOLOGO MEDICO DE LABORATORIO 1', '19/9/1992', 'tommy.bone@hdtc.gob.ec', 'tommybone1990@hotmail.com', '0960712977', 'MASCULINO', 'TECNOLOGO MEDICO DE REHABILITACION Y TERAPIA FISICA 3', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('92', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801349614', 'BONE MATAMOROS JANINE MELANIE', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '5/8/1970', 'janine.bone@hdtc.gob.ec', 'janinebone610@hotmail.com', '0994265573', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('93', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802542399', 'BONE MERCADO MIRIAN MABEL', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '27/7/1984', 'miria.bone@hdtc.gob.ec', 'mabelbone@hotmail.com', '0968191405', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('94', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803151505', 'BONE RIVADENEIRA CARMEN MARGARITA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '7/7/1988', 'carmen.bone@hdtc.gob.ec', 'macebari_87@hotmail.com', '0987991759', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('95', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802052621', 'BONE SOLIS MIRELLA JACINTA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '5/7/1991', 'mirella.bone@hdtc.gob.ec', 'miresol1679@hotmail.com', '0982553471', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('96', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801100090', 'BONE SOSA YEMMY GRETA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '11/12/1982', 'yemmy.bone@hdtc.gob.ec', 'guadaenferforever@hotmail.com', '062995100', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('97', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802226431', 'BORJA BECERRA DEISY INDAURA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'AUXILIAR DE ENFERMERIA', '19/4/1980', 'deisy.borja@hdtc.gob.ec', 'deisib@yahoo.com', '094651042', 'FEMENINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('98', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1307688695', 'BRIONES MEZA FREDDY GEOVANNY', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A ESPECIALISTA EN GINECOLOGIA 1', '15/4/1985', 'freddy.briones@hdtc.gob.ec', 'fgbrionesm@gmail.com', '0985014921', 'MASCULINO', 'MEDICO ESPECIALISTA GINECOLOGIA', 'CUARTO NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('99', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803293661', 'BRIONES MONTALVO LEONARDO ANDRES', 'IMAGENOLOGIA', 'TECNOLOGO MEDICO DE IMAGENOLOGIA 2', '24/7/1996', 'leonardo.briones@hdtc.gob.ec', 'leo_bri24@hotmail.com', '0993664581', 'MASCULINO', 'TECNOLOGO MEDICO DE IMAGENOLOGIA 2', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('100', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1759729732', 'BRITO SOSA CARLA YSABEL', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '4/9/1992', 'carla.brito@hdtc.gob.ec', 'paola1292@hotmail.com', '0991817463', 'FEMENINO', 'MEDICO CIRUJANO', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('101', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803324359', 'BUCHELI VALDEZ AZUCENA ESTEFANIA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'AUXILIAR DE ENFERMERIA', '19/10/1980', 'azucena.bucheli@hdtc.gob.ec', 'nayobi1987@gmail.com', '0999315039', 'FEMENINO', 'TECNICO EN ENFERMERIA', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('102', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803176155', 'BURBANO QUIÑONEZ IRMA VIVIANA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '18/3/1982', 'irma.burbano@hdtc.gob.ec', 'irmaburbano@hotmail.es', '0980284570', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('103', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803198498', 'BURBANO TENORIO TATIANA ISABEL', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '9/11/1977', 'tatiana.burbano@hdtc.gob.ec', 'isabel.2686@hotmail.com', '0993902883', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('104', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0950639278', 'BURGOS VIÑAN ARIANA KATHERINE', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '22/5/1993', 'ariana.burgos@hdtc.gob.ec', 'nicolas1112.nm@gmail.com', '0986581212', 'FEMENINO', 'MEDICO', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('105', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802635383', 'BUSTOS MONTAÑO FABIO JOSE', 'GESTION ADMINISTRATIVA', 'AUXILIAR ADMINISTRATIVO DE SALUD DEL SECTOR SALUD', '25/7/1955', 'fabio.bustos@hdtc.gob.ec', 'ositabella1982@hotmail.com', '062722778', 'MASCULINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('106', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0604490789', 'CABADIANA MOROCHO VERONICA MARIBEL', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '5/4/1991', 'veronica.cabadiana@hdtc.gob.ec', 'cabadiana18@gmail.com', '0987910377', 'FEMENINO', 'MEDICO GENERAL EN FUNCIONES HOSPITALARIAS', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('107', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803820620', 'CABEZA CAICEDO GERMANIA MERCEDES', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '31/3/1989', 'germania.cabeza@hdtc.gob.ec', 'germania.cabeza@hdtc.gob.ec', '0997048816', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('108', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801600628', 'CABEZA ESPAÑA KETTY MARITXA', 'GESTION DE TRABAJO SOCIAL', 'TRABAJADOR/A SOCIAL 1', '16/3/1971', 'ketty.cabeza@hdtc.gob.ec', 'MSPMIGRACION@MSP.GOB.EC', '0986533356', 'FEMENINO', 'TRABAJADORA SOCIAL', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('109', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802718262', 'CABEZAS GAMEZ KARLA ANDREINA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '1/10/1988', 'karla.cabezas@hdtc.gob.ec', 'karlita1010_@outlook.es', '0998093976', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('110', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0804195162', 'CABEZAS LARREA MAURICIO DAVID', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '27/8/1994', 'mauricio.cabezas@hdtc.gob.ec', 'mauricio.cabezas@hdtc.gob.ec', '0989280865', 'MASCULINO', 'MEDICO/A GENERAL ', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('111', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802396515', 'CABEZAS MALDONADO ELVIS MIGUEL', 'GERENCIA ', 'ESPECIALISTA DE ADMISIONES', '10/5/1987', 'elvis.cabezas@hdtc.gob.ec', 'miguelcabezasmaldonado_83@hotmail.com', '0997830233', 'MASCULINO', 'MAGISTER EN ADMINISTRACION DE EMPRESAS MENCION PLANEACION', 'CUARTO NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('112', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0912521614', 'CABEZAS MINA YOLANDA DELMA', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'OBSTETRIZ / OBSTETRA 1', '15/8/1985', ' yolanda.cabezas@hdtc.gob.ec', 'jeryclaud@hotmail.com', '0994855456', 'FEMENINO', 'OBSTETRIZ / OBSTETRA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('113', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801177122', 'CADENA CAPURRO NESTOR CLIFOR', 'MANTENIMIENTO', 'AUXILIAR ADMINISTRATIVO DE SALUD DEL SECTOR SALUD', '27/4/1966', 'nestor.cadena@hdtc.gob.ec', 'nestorcadena@hotmail.com', '0980045551', 'MASCULINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('114', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802299826', 'CAGUA MONTERO ALEXANDRA JOHANNA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '11/12/1982', 'alexandra.cagua@hdtc.gob.ec', 'jovicjael@hotmail.com', '09881161235', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('115', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803294628', 'CAICEDO ALEGRIA MARIA DEL PILAR', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '29/7/1989', 'maria.caicedo@hdtc.gob.ec', 'MARIAPILAR@hotmail.com', '0982756577', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('116', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0800675472', 'CAICEDO BENAVIDES ELVIA ROXANA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'AUXILIAR DE ENFERMERIA', '4/5/1981', 'elvia.caicedo@hdtc.gob.ec', 'eltiempo27@yahoo.com', '062452374', 'FEMENINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('117', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802705285', 'CAICEDO CAMBINDO KAREN ENIS', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '21/4/1979', 'karen.caicedo@hdtc.gob.ec', 'renka-sine@outlook.es', '0981432760', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('118', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802225052', 'CAICEDO CANGA DIANA XIMENA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'AUXILIAR DE ENFERMERIA', '11/12/1982', 'ximena.caicedo@hdtc.gob.ec', 'xime_gemenis1982@hotmail.com', '0986813368', 'FEMENINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('119', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802304923', 'CAICEDO COROZO NIRMI MAELA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'AUXILIAR DE ENFERMERIA', '11/12/1982', 'nirmi.caicedo@hdtc.gob.ec', 'maelacaicedo@hotmail.com', '0981983702', 'FEMENINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('120', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1704295763', 'CAICEDO PLATA MIGUEL', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A ESPECIALISTA EN PEDIATRIA 1', '22/9/1954', 'miguel.caicedo@hdtc.gob.ec', 'MIGUELCAICEDO55@HOTMAIL.COM', '099546114', 'MASCULINO', 'MEDICO/A ESPECIALISTA EN PEDIATRIA ', 'CUARTO NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('121', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803489236', 'CAICEDO QUINTERO KAREN TATIANA', 'TRANSFUSIONAL', 'TECNOLOGO MEDICO DE MEDICINA TRANSFUSIONAL 1', '23/10/1990', 'karen.caicedo.@hdtc.gob.ec', 'karen.quintero@hdtc.gob.ec', '0968407388', 'FEMENINO', 'TECNOLOGO MEDICO DE REHABILITACION Y TERAPIA FISICA 3', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('122', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803118868', 'CAICEDO RAYO HELEN KATIUSCA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'AUXILIAR DE ENFERMERIA', '24/2/1968', 'helen.caicedo@hdtc.gob.ec', 'ositabella1982@hotmail.com', '0993235356', 'FEMENINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('123', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803133644', 'CALAHORRANO VALENCIA LADY CAROLINA', 'LABORATORIO', 'TECNOLOGO MEDICO DE LABORATORIO 2', '11/9/1987', 'lady.calahorrano@hdtc.gob.ec', 'ladycalahorranov@hotmail.com', '0982301400', 'FEMENINO', 'QUIMICA Y FARMACEUTICA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('124', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803760842', 'CALDERON PLAZA SUANY DAYANA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'AUXILIAR DE ENFERMERIA', '13/8/1970', 'suany.calderon@hdtc.gob.ec', 'dayibella_2412@hotmail.com', '0979529142', 'FEMENINO', 'TECNICO EN ENFERMERIA', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('125', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0928106079', 'CALLE BAYAS JUDIE NATHALY', 'LABORATORIO', 'TECNOLOGO MEDICO DE LABORATORIO 3', '13/4/1993', 'judie.calle@hdtc.gob.ec', 'julio.calle@hotmail.com', '0967773926', 'FEMENINO', 'TECNOLOGO MEDICO DE LABORATORIO ', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('126', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801944661', 'CAMACHO DELGADO EDWIN ALFREDO', 'GESTION DE TECNOLOGIAS DE LA INFORMACION Y COMUNICACIONES', 'ASISTENTE DE SOPORTE TECNICO ', '18/9/1976', 'edwin.camacho@hdtc.gob.ec', 'ecamachito1976@gmail.com', '0980589553', 'MASCULINO', 'INGENIERO EN SISTEMAS INFORMATICOS', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('127', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1759217597', 'CAMARA NABY MOUSSA', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '3/1/1985', 'naby.camara@hdtc.gob.ec', 'naby.camara@hdtc.gob.ec', '0994626407', 'MASCULINO', 'MEDICO', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('128', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1759029596', 'CAMARGO NAVARRO LUISDIMAR NOHEMI', 'GESTION DE CALIDAD', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '21/11/1967', 'luisdimar.camargo@hdtc.gob.ec', 'luisdimar.camargo@hdtc.gob.ec', '0996717254', 'FEMENINO', 'MEDICO GENERAL EN FUNCIONES HOSPITALARIAS', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('129', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1308302205', 'CAMPOS JAIRALA MARCOS LENIN', 'LABORATORIO', 'CITOHITOPATOLOGO', '5/7/1977', 'marcos.campos@hdtc.gob.ec', 'marcos.campos@hdtc.gob.ec', '0963647971', 'MASCULINO', 'LICENCIADO EN CITOHITOPATOLOGO', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('130', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802550467', 'CAMPOVERDE ALEXANDER ANGELINA VANESSA', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '15/8/1985', 'angelina.campoverde@hdtc.gob.ec', 'vane_d_ra@hotmail.com', '062995100', 'FEMENINO', 'MEDICO GENERAL EN FUNCIONES HOSPITALARIAS', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('131', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0800443616', 'CAMPOVERDE AYALA FELIX HUMBERTO', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A ESPECIALISTA EN PEDIATRIA 1', '27/9/1956', 'felix.campoverde@hdtc.gob.ec', 'felixumb@yahoo.es', '095300909', 'MASCULINO', 'MEDICO/A ESPECIALISTA EN PEDIATRIA ', 'CUARTO NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('132', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0705382877', 'CAMPOVERDE JIMENEZ ERASMO JAVIER', 'LABORATORIO', 'TECNOLOGO MEDICO DE LABORATORIO 3', '29/9/1989', 'erasmo.campoverde@hdtc.gob.ec', 'javier-campoverde15@hotmail.com', '0968113436', 'MASCULINO', 'TECNOLOGO MEDICO DE LABORATORIO ', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('133', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1315398402', 'CAMPOZANO SOLEDISPA DANNES ADRIAN', 'LABORATORIO', 'TECNOLOGO MEDICO DE LABORATORIO 3', '6/5/1994', 'dannes.campozano@hdtc.gob.ec', 'dacamposole@hotmail.com', '0979580196', 'MASCULINO', 'TECNOLOGO MEDICO DE LABORATORIO ', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('134', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0929237212', 'CAMPUZANO CUSME ELIZABETH ELIDA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'AUXILIAR DE ENFERMERIA', '24/7/1960', 'elizabeth.campuzano@hdtc.gob.ec', 'eli04campuzano@hotmail.com', '0994359776', 'FEMENINO', 'TECNICO EN ENFERMERIA', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('135', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0701736738', 'CAÑARTE JURADO TERESA DE JESUS', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A ESPECIALISTA EN PSIQUIATRIA 1', '27/08/1962', 'teresa.cañarte@hdtc.gob.ec', 'teresita_caarte@yahoo.com', '0999634625', 'FEMENINO', 'ESPECIALISTA EN PSIQUIATRIA', 'CUARTO NIVEL', 'X', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('136', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803714427', 'CARABALI ARBOLEDA LIZETH STEFANIA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '17/9/1994', 'lizeth.carabali@hdtc.gob.ec', 'carolina132008@hotmail.com', '0997142690', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('137', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0800691685', 'CARAVALI VIVERO DAVIDA ALFONCINA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '24/12/1956', 'davida.caravali@hdtc.gob.ec', 'licenciadacarabali@hotmail.com', '062995100', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('138', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803055060', 'CARBAJAL ORTIZ MARIA DEL CARMEN', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '3/11/1987', 'maria.carbajal@hdtc.gob.ec', 'mary.carmita@hotmail.com', '0993782857', 'FEMENINO', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIA 1', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('139', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1758862112', 'CARNERO ECHARTE MAGIN', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A ESPECIALISTA EN PEDIATRIA 1', '15/1/1975', 'magin.echarte@hdtc.gob.ec', 'magin.echarte@hdtc.gob.ec', '0998044574', 'MASCULINO', 'MEDICO/A ESPECIALISTA EN PEDIATRIA ', 'CUARTO NIVEL', 'X', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('140', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1309594636', 'CARRANZA FARIAS GABRIELA JOSEFA', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '15/8/1985', 'gabriela.carranza@hdtc.gob.ec', 'gajo@webadictos.net', '0989822466', 'FEMENINO', 'MEDICO GENERAL EN FUNCIONES HOSPITALARIAS', 'TERCER NIVEL', 'X', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('141', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1203955909', 'CARRANZA FARIAS HECTOR RICARDO', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '15/8/1985', 'hector.carranza@hdtc.gob.ec', 'hectorcarranza2010@hotmail.com', '099935853', 'MASCULINO', 'MEDICO GENERAL EN FUNCIONES HOSPITALARIAS', 'TERCER NIVEL', 'X', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('142', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1711671089', 'CARRANZA TORRES ALBERTO RAUL', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A ESPECIALISTA EN EMERGENCIAS Y DESASTRES 1', '11/12/1982', 'alberto.carranza@hdtc.gob.ec', 'bg9500@hotmail.com', '0983764293', 'MASCULINO', 'MEDICO/A ESPECIALISTA EN EMERGENCIAS Y DESASTRES 1', 'CUARTO NIVEL', 'X', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('143', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1803241809', 'CARRASCO INFANTE WILSON HUMBERTO', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO ESPECIALISTA OTORRINOLARINGOLOGIA', '7/11/1978', 'wilson.carrasco@hdtc.gob.ec', 'wilson.carrasco@hdtc.gob.ec', '0984927674', 'MASCULINO', 'MEDICO ESPECIALISTA OTORRINOLARINGOLOGIA', 'CUARTO NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('144', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801524356', 'CARRILLO CAÑOLA HOOVER OSBALDO', 'MANTENIMIENTO', 'CHOFER DE AMBULANCIA DEL SECTOR SALUD', '22/5/1962', 'hoover.carrillo@hdtc.gob.ec', 'hoocara70@yahoo.com', '0986545445', 'MASCULINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('145', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803082585', 'CARVACHE ZAMBRANO JESSENIA ELIZABETH              ', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '15/8/1985', 'jessenia.carvache@hdtc.gob.ec', 'jesseniacarvache@gmail.com', '0997357816', 'FEMENINO', 'MEDICO GENERAL EN FUNCIONES HOSPITALARIAS', 'TERCER NIVEL', 'X', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('146', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1758805269', 'CASCO OLIVAS JOSE FRANCISCO', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '12/12/1971', 'jose.casco@hdtc.gob.ec', 'jose.casco@hdtc.gob.ec', '0969549625', 'MASCULINO', 'MEDICO CIRUJANO', 'TERCER NIVEL', 'X', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('147', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802463026', 'CASTILLO ARROYO MARICELA SUGEY', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '25/11/1984', 'maricela.castillo@hdtc.gob.ec', 'mcastillo198@outlook.com', '0991875271', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('148', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802343566', 'CASTILLO CAICEDO AURA MAJHOGANNY', 'GESTIÓN DE PROCESOS DE APOYO DIAGNÓSTICO Y TERAPÉUTICO', 'TECNOLOGO MEDICO DE REHABILITACION Y TERAPIA FISICA 3', '7/6/1981', 'aura.castillo@hdtc.gob.ec', 'auramajhoganny@gmail.com', '097550384', 'FEMENINO', 'LICENCIADA EN TERAPIA RESPIRATORIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('149', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0800612327', 'CASTILLO CASIERRA CELIA ENRIQUETA', 'MANTENIMIENTO', 'TECNICO DE MANTENIMIENTO', '15/7/1960', 'celia.castillo@hdtc.gob.ec', 'sonia.cedeno@hdtc.gob.ec', '062727497', 'FEMENINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('150', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801526658', 'CASTILLO MEDINA MARY JAEL', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '9/10/1986', 'mary.castillo@hdtc.gob.ec', 'maryahel68@hotmail.com', '0968654727', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('151', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803842228', 'CASTILLO PACHECO MARTHA CRISTINA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '2/6/1961', 'martha.castillo@hdtc.gob.ec', 'cristhina2202@hotmail.com', '0967532865', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('152', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1759722075', 'CASTILLO PALMAR DULCE CAROLINA', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A ESPECIALISTA EN MEDICINA INTERNA 1', '8/2/1987', 'dulce.castillo@hdtc.gob.ec', 'deulcedecarvajal@gmail.com', '0999636215', 'FEMENINO', 'MEDICO/A ESPECIALISTA EN MEDICINA INTERNA 1', 'CUARTO NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('153', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803438696', 'CASTILLO SANTANA EDDA MARITZA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '8/6/1972', 'edda.castillo@hdtc.gob.ec', 'egdasantana@hotmail.com', '0989205308', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('154', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0800783102', 'CASTRO BECERRA CARMEN EMERENCIANA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'AUXILIAR DE ENFERMERIA', '3/7/1965', 'carmen.castro@hdtc.gob.ec', 'carmitacastro@hotmail.com', '094101292', 'FEMENINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('155', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801836800', 'CASTRO MONROY VERONICA CERNELIA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'AUXILIAR DE ENFERMERIA', '9/9/1958', 'veronica.castro@hdtc.gob.ec', 'lanenadellagoazul@gmail.com', '062995100', 'FEMENINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('156', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0800534422', 'CASTRO PEÑA BETTY YOLANDA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'AUXILIAR ADMINISTRATIVO DE SALUD DEL SECTOR SALUD', '20/8/1958', 'betty.castro@hdtc.gob.ec', 'bettyyolandacp@hotmail.com', '062995100', 'FEMENINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('157', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803583806', 'CASTRO VASQUEZ MARIA DAYANA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '15/3/1993', 'maria.castro@hdtc.gob.ec', 'dyn-15@hotmail.com', '0997979572', 'FEMENINO', 'ENFERMERO/A 3', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('158', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802607572', 'CAZARES ABAD JORGE DAVID', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '8/6/1983', ' jorge.cazares@hdtc.gob.ec', 'Jorge_26@ymail.com', '0988202999', 'MASCULINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('159', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803552934', 'CEDEÑO CEVALLO NARCISA PAMELA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '11/12/1982', 'narcisa.cedeño@hdtc.gob.ec', 'pamelitacede@yahoo.es', '0988404029', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('160', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803148279', 'CEDEÑO CHERE DIANA JASMINA', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '15/8/1985', 'diana.cedeño@hdtc.gob.ec', 'diani_2909@hotmail.com', '0967708223', 'FEMENINO', 'MEDICO GENERAL EN FUNCIONES HOSPITALARIAS', 'TERCER NIVEL', 'X', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('161', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803043694', 'CEDEÑO CHICHANDE ALBA MARIA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '11/12/1982', 'alba.cedeño@hdtc.gob.ec', 'amcchi1985@hotmail.com', '0989209259', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('162', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802765065', 'CEDEÑO ESTUPIÑAN MARIA ALEXANDRA', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '15/8/1985', 'maria.cedeño@hdtc.gob.ec', 'maria1985alexa@hotmail.com', '0993855217', 'FEMENINO', 'MEDICO GENERAL EN FUNCIONES HOSPITALARIAS', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('163', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803716513', 'CEDEÑO ORTIZ ALAN ELIAS', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '15/8/1985', 'alan.cedeno@hdtc.gob.ec', 'alan.cedeno@21d03.saludzona1.gob.ec', '0995957896', 'MASCULINO', 'MEDICO GENERAL EN FUNCIONES HOSPITALARIAS', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('164', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801991290', 'CEDEÑO SAAVEDRA CARLOS JAVIER', 'GESTION FINANCIERA', 'ASISTENTE DE ADMINISTRACION DE CAJA', '13/8/1989', 'carlos.cedeño@hdtc.gob.ec', 'carlos.cedeño@hdtc.gob.ec', '0991181892', 'MASCULINO', 'ASISTENTE DE ADMINISTRACION DE CAJA', 'BACHILLER', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('165', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1709561508', 'CEDEÑO SOLIS ROBERTH NIMIO', 'GERENCIA ', 'GERENTE HOSPITAL', '11/12/1982', 'roberth.cedeño@hdtc.gob.ec', 'ROBERT.CEDENO@HDTC.GOB.EC', '0992241907', 'MASCULINO', 'MEDICO/A ESPECIALISTA INTERNISTA', 'CUARTO NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('166', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802256396', 'CENTENO MINA ROSA ANGELA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '11/10/1988', 'rosa.centeno@hdtc.gob.ec', 'guadaenferforever@hotmail.com', '062727497', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('167', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803117332', 'CEVALLOS ANGULO MARIA FERNANDA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '26/9/1982', 'maria.cevallos@hdtc.gob.ec', 'mariacevallos1986@gmail.com', '0985072294', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('168', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0800758682', 'CEVALLOS BONE GUILLERMO SEGUNDO', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A ESPECIALISTA EN CIRUGIA GENERAL 1', '11/12/1982', 'segundo.cevallos@hdtc.gob.ec', 'segundo.cevallos@hdtc.gob.ec', '0980457481', 'MASCULINO', 'MEDICO ESPECIALISTA CIRUGIA GENERAL', 'CUARTO NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('169', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802279596', 'CEVALLOS COLORADO INGRID KAREN', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '13/10/1981', 'ingrid.cevallos@hdtc.gob.ec', 'karencevalloscolorado@gmail.com', '0986859905', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('170', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0918375957', 'CEVALLOS CORTEZ ANTONIETA DEL ROCIO', 'GESTION DE CUIDADOS DE ENFERMERIA', 'AUXILIAR DE ENFERMERIA', '18/8/1976', 'antonieta.cevallos@hdtc.gob.ec', 'antoniac@hotmail.com', '0993410862', 'FEMENINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('171', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1757746597', 'CHADD BADRA JULIET YSABEL', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A ESPECIALISTA EN GINECOLOGIA 1', '11/12/1982', 'juliet.chadd@hdtc.gob.ec', 'julietysabel@gmail.com', '0995659596', 'FEMENINO', 'MEDICO/A ESPECIALISTA EN GINECOLOGIA ', 'CUARTO NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('172', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802290403', 'CHALEN ARMIJO VERONICA GISSELA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'AUXILIAR DE ENFERMERIA', '16/9/1979', 'veronica.chalen@hdtc.gob.ec', 'veronicachalen@hotmail.com', '062711717', 'FEMENINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('173', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0800964447', 'CHAMORRO BETANCOURT VICTOR MANUEL', 'GESTION ADMINISTRATIVA', 'AUXILIAR ADMINISTRATIVO DE SALUD DEL SECTOR SALUD', '29/5/1982', 'victor.chamorro@hdtc.gob.ec', 'ositabella1982@hotmail.com', '0980640212', 'MASCULINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('174', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0401779277', 'CHAMORRO LOMAS LENNIN DAVID', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '22/9/1988', 'negus.ojeda@hdtc.gob.ec', 'negus.ojeda@hdtc.gob.ec', '0959522864', 'MASCULINO', 'MEDICO GENERAL EN FUNCIONES HOSPITALARIAS', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('175', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802099945', 'CHANOLUISA COLOBON MARIA LUZMILA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '4/8/1974', 'maria.chanoluisa@hdtc.gob.ec', 'analiacastillo-25@hotmail.com', '0993962553', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('176', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801909672', 'CHARCOPA CASTILLO ANTONIO EUCLIDES', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '6/10/1974', 'antonio.charcopa@hdtc.gob.ec', 'anthonyechc31@hotmail.com', '0993291705', 'MASCULINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('177', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803494467', 'CHARCOPA SANCHEZ DEYSON ABEL', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '13/5/1986', 'deyson.charcopa@hdtc.gob.ec', 'dexonomega@hotmail.com', '0994879197', 'MASCULINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('178', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1756754519', 'CHARLES JEAN LICARY', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '1/3/1982', 'jean.charles@hdtc.gob.ec', 'jldm53@hotmail.com', '0984038892', 'MASCULINO', 'MEDICO GENERAL EN FUNCIONES HOSPITALARIAS', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('179', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802370072', 'CHAVEZ PISCO JORGE ANTONIO', 'MANTENIMIENTO', 'ANALISTA DE ELECTRICA-ELECTRONICA', '20/10/1980', 'jorge.chavez@hdtc.gob.ec', 'jorge.chavez@hdtc.gob.ec', '0994200578', 'MASCULINO', 'INGENIERO ELECTRICO', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('180', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1003970371', 'CHAVEZ QUINTERO RUBEN DARIO', 'IMAGENOLOGIA', 'TECNOLOGO MEDICO DE IMAGENOLOGIA 3', '15/8/1962', 'ruben.chavez@hdtc.gob.ec', 'chavecito1@hotmail.com', '0984025883', 'MASCULINO', 'TECNOLOGO EN RADIOLOGIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('181', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801010828', 'CHICAIZA ACOSTA LUIS ANTONIO', 'GESTION DE CUIDADOS DE ENFERMERIA', 'AUXILIAR DE ENFERMERIA', '11/12/1982', 'luis.chicaiza@hdtc.gob.ec', 'antoniochicaiza@hotmail.com', '0993317041', 'MASCULINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('182', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803294446', 'CHICHANDE CABEZA DENNY ISABEL', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '17/3/1987', 'denny.chichande@hdtc.gob.ec', 'misumajo@hotmail.com', '0991410136', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('183', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802182618', 'CHICHANDE CABEZA SINAY OLIVA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'AUXILIAR DE ENFERMERIA', '15/6/1979', 'sinay.chichande@hdtc.gob.ec', 'sinaychichandec@hotmail.com', '097371155', 'FEMENINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('184', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802332148', 'CHICHANDE REINA MARIA ELENA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'AUXILIAR DE ENFERMERIA', '19/4/1992', 'maria.chichande@hdtc.gob.ec', 'maria.chichande@hotmail.com', '0939024220', 'FEMENINO', 'TECNICO EN ENFERMERIA', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('185', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802872135', 'CHILA ANGULO DIANA ALEXANDRA', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '26/11/1985', 'diana.chila@hdtc.gob.ec', 'lunadia85@gmail.com', '0993072136', 'FEMENINO', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIA 1', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('186', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802082099', 'CHILLAMBO ESPINOZA MARIA DEL ROSARIO', 'GESTION DE CUIDADOS DE ENFERMERIA', 'AUXILIAR DE ENFERMERIA', '6/4/1974', 'maria.rosario@hdtc.gob.ec', 'mariadelcarmen@hotmail.com', '091445024', 'FEMENINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('187', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0914624663', 'CHUMO MACIAS SOLANNY CONCEPCION', 'GESTION ADMINISTRATIVA', 'AUXILIAR ADMINISTRATIVO DE SALUD DEL SECTOR SALUD', '8/12/1969', 'solanny.chumo@hdtc.gob.ec', 'lissriver2010@hotmail.com', '062702655', 'FEMENINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('188', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1718137589', 'CHUQUIZALA DUTAN JOSE LUIS', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A ESPECIALISTA EN NEUROCIRUGIA 1', '2/6/1983', 'jose.chuquizala@hdtc.gob.ec', 'dr.chuquizala@gmail.com', '0996401917', 'MASCULINO', 'MEDICO', 'CUARTO NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('189', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1314822162', 'COELLO ZAMBRANO STEPHANIE KRISTELL', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '24/10/1993', 'coello.stephanie@hdtc.gob.ec', 'kristellj1@hotmail.com', '0996991349', 'FEMENINO', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIA 1', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('190', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802655217', 'COIME GRACIA JESSICA IVONNE', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '26/12/1982', 'jessica.coime@hdtc.gob.ec', 'jessica.coime@hdtc.gob.ec', '062995100', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('191', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803001734', 'COIME QUIÑONEZ YADIRA GEOMAR', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '7/7/1980', 'yadira.coime@hdtc.gob.ec', 'yadicoime07@gmail.com', '0988697297', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('192', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802351064', 'COLOBON CASTILLO CARMEN GUMANI', 'GESTION DE CUIDADOS DE ENFERMERIA', 'AUXILIAR DE ENFERMERIA', '5/8/1979', ' carmen.colobon@hdtc.gob.ec', 'gumani79@hotmail.com', '0995941415', 'FEMENINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('193', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802833095', 'COLOBON SAAVEDRA NELLY JOHANNA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '11/12/1982', 'nelly.colobon@hdtc.gob.ec', 'johacs85@hotmail.com', '0988529563', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('194', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0800953390', 'CONFORME CHILA BIENVENIDA LUCCIOLA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '1/5/1964', 'bienvenida.conforme@hdtc.gob.ec', 'guadaenferforever@hotmail.com', '062995100', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('195', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802595454', 'COPETE VALENCIA ALFONSO JAVIER', 'REHABILITACION Y TERAPIA FISICA', 'TECNOLOGO EN TERAPIA RESPIRATORIA', '27/11/1985', 'reynaldo.torres@hdtc.gob.ec', 'paportd67@gmail.com', '0982447737', 'MASCULINO', 'LICENCIADO EN TERAPIA RESPIRATORIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('196', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802398701', 'CORDOVA LOPEZ FERNANDO DANILO', 'GESTION ADMINISTRATIVA', 'AUXILIAR ADMINISTRATIVO DE SALUD DEL SECTOR SALUD', '18/5/1986', 'fernando.cordova@hdtc.gob.ec', 'cancherosurf@hotmail.com', '0939202843', 'MASCULINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('197', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802945642', 'CORELLA ARROYO LETTY ISABEL', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '8/8/1986', ' letty.corella@hdtc.gob.ec', 'Isacorella@hotmail.com', '0981916806', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('198', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1312484155', 'CORNEJO ZAMBRANO LUIS MIGUEL', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '5/5/1977', 'luis.cornejo@hdtc.gob.ec', 'luis.cornejo@hdtc.gob.ec', '0984604929', 'MASCULINO', 'MEDICO GENERAL EN FUNCIONES HOSPITALARIAS', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('199', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802920835', 'COROZO CHAVEZ PABLO MIGUEL', 'FARMACIA, INSUMOS, DISPOSITIVOS MEDICOS Y REACTIVOS', 'AUXILIAR ADMINISTRATIVO DE SALUD DEL SECTOR SALUD', '22/3/1964', 'pablo.corozo@hdtc.gob.ec', 'miguelinho1984@hotmail.com', '062995100', 'MASCULINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('200', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801031782', 'COROZO CHAVEZ PEDRO ANDRADE', 'GESTION ADMINISTRATIVA', 'AUXILIAR ADMINISTRATIVO DE SALUD DEL SECTOR SALUD', '16/2/1984', 'pedro.corozo@hdtc.gob.ec', 'alkiana@hotmail.com', '0989767520', 'MASCULINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('201', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802785634', 'COROZO HIZQUIERDO MARIA KARINA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '28/2/1982', 'maria.corozo@hdtc.gob.ec', 'meliza2882@hotmail.com', '0985676305', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('202', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802833368', 'COROZO HURTADO CECILIA JEANNETH', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '11/10/1989', 'cecilia.corozo@hdtc.gob.ec', 'cecilia.corozo@hdtc.gob.ec', '0988501834', 'FEMENINO', 'MEDICO GENERAL EN FUNCIONES HOSPITALARIAS', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('203', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0962155941', 'CORTES WISAMANO CINDY MARGARITA', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '25/1/1987', 'cindy.cortes@hdtc.gob.ec', 'cindy.cortes@hdtc.gob.ec', '0983985826', 'FEMENINO', 'MEDICO GENERAL EN FUNCIONES HOSPITALARIAS', 'TERCER NIVEL', 'X', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('204', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1724481450', 'CORTEZ CABEZAS LUIS ARMANDO', 'GESTION DE CUIDADOS DE ENFERMERIA', 'AUXILIAR DE ENFERMERIA', '2/7/1971', 'luis.cortez@hdtc.gob.ec', 'luis.cortez@hdtc.gob.ec', '062995100', 'MASCULINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('205', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801892977', 'CORTEZ ESPAÑA CARLOS ALBERTO', 'GESTION ADMINISTRATIVA', 'AUXILIAR ADMINISTRATIVO DE SALUD DEL SECTOR SALUD', '11/12/1982', 'carlos.cortez@hdtc.gob.ec', 'pandroandrade@yahoo.es', '062995100', 'MASCULINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('206', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0804449874', 'CORTEZ MEDRANDA CARLOS JAVIER', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '21/11/1995', 'carlos.cortez@hdtc.gob.ec', 'javiercarlos_1995@hotmail.com', '0988775333', 'MASCULINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('207', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803297266', 'CORTEZ MENESES SARA CAROLINA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '31/12/1986', 'sara.cortez@hdtc.gob.ec', 'churito_1991@hotmail.com', '0992970526', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('208', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802122846', 'CORTEZ MONRROY ANDREINA SUGEY', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '4/7/1989', 'andreina.cortez@hdtc.gob.ec', 'sugeymonrroy@hptmail.com', '0939405232', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('209', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802564088', 'CORTEZ TENORIO ALEXA MARIDALIA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'AUXILIAR DE ENFERMERIA', '14/9/1990', 'alexa.cortez@hdtc.gob.ec', 'alexa.cortez@hdtc.gob.ec', '0969133537', 'FEMENINO', 'TECNICO EN ENFERMERIA', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('210', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801239781', 'CRUZ CARRILLO SARA BEATRIZ', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '12/9/1966', 'sara.cruz@hdtc.gob.ec', 'guadaenferforever@hotmail.com', '062995100', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('211', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1719197947', 'CUERO ANGULO ROCIO DEL PILAR', 'LABORATORIO', 'TECNOLOGO MEDICO DE LABORATORIO 2', '29/7/1988', 'rocio.cuero@hdtc.gob.ec', 'pilarcueroa@gmail.com', '0988924367', 'FEMENINO', 'QUIMICA Y FARMACEUTICA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('212', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801025602', 'CUERO BATIOJA ESTEBAN HUMBERTO', 'GESTION ADMINISTRATIVA', 'AUXILIAR ADMINISTRATIVO DE SALUD DEL SECTOR SALUD', '24/2/1969', 'esteban.cuero@hdtc.gob.ec', 'cuerobatioja@yahoo.es', '094618334', 'MASCULINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('213', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802705970', 'CUERO BENNETT MARIA DOLORES', 'GESTION DE CUIDADOS DE ENFERMERIA', 'AUXILIAR DE ENFERMERIA', '13/3/1984', 'maria.cuero@hdtc.gob.ec', 'cbmaria@hotmail.com', '093671946', 'FEMENINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('214', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801584103', 'CUERO BURBANO GRECELIA JACINTA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'AUXILIAR ADMINISTRATIVO DE SALUD DEL SECTOR SALUD', '5/10/1969', 'grecelia.cuero@hdtc.gob.ec', 'estaoyenina69@hotmail.com', '062995100', 'FEMENINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('215', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802595967', 'CUERO BURBANO IRENE CECIBEL', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '9/2/1985', 'irene.cuero@hdtc.gob.ec', 'cec-idario@hotmail.es', '0993590474', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('216', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802946012', 'CUERO BURBANO JOSE MARCIAL', 'FARMACIA, INSUMOS, DISPOSITIVOS MEDICOS Y REACTIVOS', 'AUXILIAR DE FARMACIA', '11/12/1982', 'jose.cuero@hdtc.gob.ec', 'ositabella1982@hotmail.com', '0981156116', 'MASCULINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('217', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801476698', 'CUERO CABEZAS WISTON SEGUNDO', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '15/9/1975', 'wiston.cuero@hdtc.gob.ec', 'wiston.cuero@hdtc.gob.ec', '0987425786', 'MASCULINO', 'MEDICO GENERAL EN FUNCIONES HOSPITALARIAS', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('218', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801188871', 'CUERO GRUEZO FILOMENA LUCIA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '5/7/1961', 'filomena.cuero@hdtc.gob.ec', 'eltiempo27@yahoo.com', '0988855774', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('219', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803596220', 'CUERO QUIÑONES MAIRA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '11/12/1982', ' maira.cuero@hdtc.gob.ec', 'mariacuerq@hotmail.com', '0994592192', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('220', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0910256221', 'CUESTA MAGALLANES DOMITILA CLEOFE', 'GESTION FINANCIERA', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '11/12/1982', 'domitila.cuesta@hdtc.gob.ec', 'domcuesta@hotmail.com', '0996789454', 'FEMENINO', 'MEDICO OCUPACIONAL', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('221', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803460815', 'CUSME MONTENEGRO DELIA MARITZA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '11/12/1982', 'delia.cusme@hdtc.gob.ec', 'deliacusme7montenegro@hotmail.com', '0994030638', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('222', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0911449288', 'DE LA PAZ HUACON XAVIER AURELIO', 'GESTIÓN DE PROCESOS DE APOYO DIAGNÓSTICO Y TERAPÉUTICO', 'QUIMICO / BIOQUIMICO FARMACEUTICO 4', '20/7/1983', 'xavier.de la paz@hdtc.gob.ec', 'xavierdelapaz@hotmail.com', '0990611451', 'MASCULINO', 'MEDICO GENERAL EN FUNCIONES HOSPITALARIAS', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('223', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0800894008', 'DE LA VERA GRUEZO ROBERT GEOVANNY', 'GESTION DE CUIDADOS DE ENFERMERIA', 'AUXILIAR DE ENFERMERIA', '11/12/1982', 'robert.delavera@hdtc.gob.ec', 'robertdelavera@otmail.com', '0995468486', 'MASCULINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('224', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803452952', 'DEL CASTILLO CAICEDO NATALIA VIVIANA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '3/5/1990', 'natalia.delcastillo@hdtc.gob.ec', 'natalia-bonita3@hotmail.com', '0985545509', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('225', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802313122', 'DELGADO CASTILLO MARIA DEL CARMEN', 'GESTION DE CUIDADOS DE ENFERMERIA', 'AUXILIAR DE ENFERMERIA', '20/7/1956', 'maria.delgado@hdtc.gob.ec', 'maria.delgado@hdtc.gob.ec', '0990122586', 'FEMENINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('226', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802906610', 'DELGADO NAZARENO MARCELO ADRIAN', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '30/4/1988', 'marcelo.delgado@hdtc.gob.ec', 'marcelo.delgado@hsvp.gob.ec', '0996469456', 'MASCULINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('227', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801727363', 'DELGADO QUINTERO JORGE ALBERTO', 'GESTION ADMINISTRATIVA', 'AUXILIAR ADMINISTRATIVO DE SALUD DEL SECTOR SALUD', '18/4/1983', 'jorge.delgado@hdtc.gob.ec', 'jorge.delgado@hdtc.gob.ec', '0953487641', 'MASCULINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('228', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801449885', 'DELGADO QUIÑONEZ FRANCISCO RUBEN', 'MANTENIMIENTO', 'AUXILIAR ADMINISTRATIVO DE SALUD DEL SECTOR SALUD', '16/11/1968', 'francisco.delgado@hdtc.gob.ec', 'hospitaldelfinatorres_vahs@yahoo.es', '094653294', 'MASCULINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('229', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0800593162', 'DELGADO QUIÑONEZ GERMANIA ELIZABETH', 'FARMACIA, INSUMOS, DISPOSITIVOS MEDICOS Y REACTIVOS', 'AUXILIAR ADMINISTRATIVO DE SALUD DEL SECTOR SALUD', '27/7/1961', 'germania.delgado@hdtc.gob.ec', 'germaniaelizabeth27@hotmail.com', '062995100', 'FEMENINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('230', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802260919', 'DELGADO QUIÑONEZ HECTOR EFRAIN', 'FARMACIA, INSUMOS, DISPOSITIVOS MEDICOS Y REACTIVOS', 'QUIMICO / BIOQUIMICO FARMACEUTICO 1', '19/6/1995', 'hector.delgado@hdtc.gob.ec', 'hector2134delgado@gmail.com', '0960411535', 'MASCULINO', 'BIOQUIMICO FARMACEUTICO', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('231', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803062678', 'DELGADO TORRES EDDY JOHN', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '21/2/1989', 'eddy.delgado@hdtc.gob.ec', 'eddyantonio.1423@gmail.com', '0994250149', 'MASCULINO', 'ENFERMERO/A 3', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('232', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801433525', 'DELGADO VIVERO ERMELINA LEONOR', 'GESTION DE CUIDADOS DE ENFERMERIA', 'AUXILIAR DE ENFERMERIA', '10/7/1966', ' ermelina.delgado@hdtc.gob.ec', 'labellamini@hotmail.com', '062727892', 'FEMENINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('233', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1757016116', 'DELSOIN SHERLEY', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '15/8/1985', 'sherley.delsoin@hdtc.gob.ec', 'sherley.delsoin@hdtc.gob.ec', '099131262', 'FEMENINO', 'MEDICO GENERAL EN FUNCIONES HOSPITALARIAS', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('234', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1759141003', 'DEVERA SILVA MARIANGEL', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '23/6/1991', 'mariangel.devera@hdtc.gob.ec', 'jnieves1820@hotmail.com', '0992786619', 'FEMENINO', 'MEDICO CIRUJANO', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('235', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803070168', 'DIAZ MINA MARIA FERNANDA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '20/7/1987', 'maria.diaz@hdtc.gob.ec', 'guadaenferforever@hotmail.com', '062995100', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('236', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0804192177', 'DIAZ VALENCIA ANDREA DENNIS', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '25/9/1990', 'andrea.diaz@hdtc.gob.ec', 'andreadennisd@gmail.com', '0983672314', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('237', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '803969823', 'DIAZ VALENCIA ANDREA VALERIA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '12/6/1992', 'andrea.diaz@hdtc.gob.ec', 'lizethcarabali041@gmail.com', '0980737203', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('238', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1759990060', 'DONNAT JONATHAN', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '29/8/1987', 'donnat.jonathan@hdtc.gob.ec', 'doctordonnat@hotmail.com', '0987149233', 'MASCULINO', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIA 1', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('239', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1723353767', 'DUQUE VELEZ ARTURO FABIAN', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '16/4/1994', 'arturo.duque@hdtc.gob.ec', 'arfaduve@hotmail.com', '0990311151', 'MASCULINO', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIA 1', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('240', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0961150216', 'DURAN AGUILAR ELI JOSIAS', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A ESPECIALISTA EN CIRUGIA GENERAL 1', '11/12/1982', 'eli.duran@hdtc.gob.ec', 'ejd30@hotmail.com', '062995100', 'MASCULINO', 'MEDICO ESPECIALISTA CIRUGIA GENERAL', 'CUARTO NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('241', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802898569', 'ECHEVERRIA OTOYA RICARDO ALBERTO', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '8/4/1963', 'ricardo.echeverria@hdtc.gob.ec', 'raeo1002@hotmail.com', '0996910417', 'MASCULINO', 'MEDICO CIRUJANO', 'TERCER NIVEL', 'X', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('242', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802719021', 'ENRIQUEZ BATIOJA ERIKA MARIUXI', 'GESTION DE CUIDADOS DE ENFERMERIA', 'AUXILIAR DE ENFERMERIA', '30/9/1981', 'erika.enriquez@hdtc.gob.ec', 'princesita8151@hotmail.com', '091740641', 'FEMENINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('243', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1758733768', 'ENTRENA PINTO DELIANA GABRIELA', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A ESPECIALISTA EN PEDIATRIA 1', '24/1/1984', 'deliana.pinto@hdtc.gob.ec', 'N/A', '0994629748', 'FEMENINO', 'MEDICO ESPECIALISTA EN GINECOLOGIA', 'CUARTO NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('244', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803147859', 'ERAZO CADENA TATIANA PAOLA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '28/3/1986', 'tatiana.erazo@hdtc.gob.ec', 'taniaerazo11@outlook.com', '0967306790', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('245', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801304791', 'ERAZO GONZALES FAVIOLA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '2/11/1963', 'faviola.erazo@hdtc.gob.ec', 'favi1964@hotamil.com.es', '0986130394', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('246', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0804163087', 'ERAZO MENDEZ MARIA STEFANIA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '20/7/1987', 'maria.erazo@hdtc.gob.ec', 'maraestefania28@gmail.com', '0939741715', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('247', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801409624', 'ESCOBAR CHILA MARIA MARICELA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '16/1/1969', 'maria.escobar@hdtc.gob.ec', 'm.chelita1969@hotmail.com', '0991549070', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('248', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803607829', 'ESCOBAR CUERO JOSE ENRIQUE', 'TRANSFUSIONAL', 'TECNOLOGO MEDICO DE MEDICINA TRANSFUSIONAL 1', '13/8/1987', 'jose.escobar@hdtc.gob.ec', 'jose.escobar@hdtc.gob.ec', '0957264831', 'MASCULINO', 'TECNOLOGO MEDICO DE MEDICINA TRANSFUSIONAL ', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('249', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802148601', 'ESCOBAR DE LA CRUZ JOSE LUIS', 'FARMACIA, INSUMOS, DISPOSITIVOS MEDICOS Y REACTIVOS', 'AUXILIAR ADMINISTRATIVO DE SALUD DEL SECTOR SALUD', '6/9/1989', 'jose.escobar@hdtc.gob.ec', 'escobarcruz@yahoo.es', '062721827', 'MASCULINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('250', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0201396512', 'ESCOBAR VILLACRES EDWIN WILFRIDO', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A ESPECIALISTA EN ANESTESIOLOGIA 1', '11/12/1982', 'edwin.escobar@hdtc.gob.ec', 'ELGEBO@HOTMAIL.ES', '094867947', 'MASCULINO', 'MEDICO ESPECIALISTA ANASTESEOLOGIA', 'CUARTO NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('251', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801408592', 'ESPAÑA VIVAS BERONICA BELLA', 'GESTION DE ATENCION AL USUARIO/A', 'ASISTENTE DE ATENCION AL USUARIO', '13/12/1971', 'beronica.españa @hdtc.gob.ec', 'veronicavella12@hotmail.com', '0997833077', 'FEMENINO', 'INGENIERIA EN ADMINISTRACION DE EMPRESA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('252', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1803863214', 'ESPIN MORALES MAYRA ALEXANDRA', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '15/8/1985', 'mayra.espin@hdtc.gob.ec', 'alexa2224@hotmail.com', '0983857961', 'FEMENINO', 'MEDICO GENERAL EN FUNCIONES HOSPITALARIAS', 'TERCER NIVEL', 'X', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('253', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1712595808', 'ESPINOSA FLORES MELISSA', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO ESPECIALISTA MEDICINA INTERNA', '24/3/2020', 'melissa.espinosa@hdtc.gob.ec', 'dra.melissaef@gmail.com', '0990488895', 'FEMENINO', 'ESPECIALISTA MEDICINA INTERNA', 'CUARTO NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('254', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803484229', 'ESPINOZA BONE MARIA JOSE', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '11/12/1982', 'maria.espinoza@hdtc.gob.ec', 'majito_fx@hotmail.com', '0982266100', 'FEMENINO', 'MEDICO GENERAL EN FUNCIONES HOSPITALARIAS', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('255', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803600246', 'ESPINOZA HERNANDEZ JORGE LUIS', 'GESTION DE ATENCION AL USUARIO/A', 'ASISTENTE DE ATENCION AL USUARIO', '24/7/1990', 'jorge.espinoza@hdtc.gob.ec', 'jorgelespinozah@hotmail.com', '062995100', 'MASCULINO', 'S/N', 'BACHILLER', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('256', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1311447187', 'ESPINOZA VALENCIA ROSA ANGELA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '20/7/1985', 'rosa.espinoza@hdtc.gob.ec', 'roussej@hotmail.es', '0999325911', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('257', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803105915', 'ESTACIO ORDOÑEZ ANA GERMANIA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '18/8/1987', 'ana. estacio@hdtc.gob.ec', 'anagermania09@gmail.com', '0959939234', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('258', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801733049', 'ESTRADA ORDOÑEZ ANDREA GABRIELA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'AUXILIAR DE ENFERMERIA', '5/4/1987', 'andrea.estrada@hdtc.gob.ec', 'andrea@hotmail.com', '0981098842', 'FEMENINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('259', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0804167930', 'ESTRADA VASQUEZ JUAN JOSE', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '26/9/1993', 'juan.estrada@hdtc.gob.ec', 'jestrada.4amdc.espoch@gmail.com', '0986164662 / 062461115', 'MASCULINO', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIA 1', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('260', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802262311', 'ESTRELLA GAIBOR CESAR ESTEBAN', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A SUBESPECIALISTA EN CIRUGIA PEDIATRICA', '14/10/1984', 'cesar.estrella@hdtc.gob.ec', 'cesar.estrella@hdtc.gob.ec', '0984881274', 'MASCULINO', 'MEDDICO ESPECIALISTA ENCIRUGIA PEDIATRICA', 'CUARTO NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('261', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802660340', 'ESTUPIÑAN GONZALEZ IVETTE KATHERINE', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '29/7/1976', 'ivette.estupiñan@hdtc.gob.ec', 'zai4e11@gmail.com', '0968455778', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('262', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803829951', 'ESTUPIÑAN HIDALGO SAHIR ISABEL', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '15/9/1986', 'sahir.estupiñan@hdtc.gob.ec', 'bel_sasa@hotmail.com', '0968546943', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('263', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802950634', 'ESTUPIÑAN JAEN DENNISSE DANIELA', 'TRANSFUSIONAL', 'TECNOLOGO MEDICO DE MEDICINA TRANSFUSIONAL 1', '27/10/1988', 'dennisse.estupinan@hdtc.gob.ec', 'dennisse.estupinan@hdtc.gob.ec', '0986445963', 'FEMENINO', 'TECNOLOGO MEDICO DE MEDICINA TRANSFUSIONAL ', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('264', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802453076', 'ESTUPIÑAN MONTAÑO NORKA ANGELICA', 'REHABILITACION Y TERAPIA FISICA', 'TERAPISTA DE LENGUAJE Y AUDITIVA', '5/1/1982', 'norka.estupiñan@hdtc.gob.ec', 'norkaangelica@yahoo.es', '062995100', 'FEMENINO', 'TERAPISTA DE LENGUAJE Y AUDITIVA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('265', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802941450', 'ESTUPIÑAN QUIÑONEZ SOLANGE SORAYA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '30/1/1986', 'solange.estupiñan@hdtc.gob.ec', 'soila2011@live.com', '0988022800', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('266', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1310961295', 'ESTUPIÑAN RAMIREZ LISETTE ESTEFANIA', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '16/10/1987', 'lisette.estupiñan@hdtc.gob.ec', 'liss206@hotmail.com', '0997977642', 'FEMENINO', 'MEDICO GENERAL EN FUNCIONES HOSPITALARIAS', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('267', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802365635', 'ESTUPIÑAN SAENZ YELITZA ELIANA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '19/10/1982', 'yelitza.estupiñan@hdtc.gob.ec', 'yulitzaeleana@hotmail.com', '0981447807', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('268', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801567553', 'ESTUPIÑAN TORRES KATYNA CECILIA', 'GESTION ADMINISTRATIVA Y FINANCIERA', 'ANALISTA DE SERVICIOS GENERALES 2', '21/12/1970', 'katyna.estupiñan@hdtc.gob.ec', 'katyna.estupinan@hdtc.gob.ec', '0988327560', 'FEMENINO', 'INGENIERO EN ADMINISTRACION PUBLICA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('269', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801804824', 'ESTUPIÑAN VALENCIA VIVIANNE YELENA', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '15/8/1985', 'vivianne.estupiñan@hdtc.gob.ec', 'viviana.estupinan@hdtc.gob.ec', '0995834981', 'FEMENINO', 'MEDICO GENERAL EN FUNCIONES HOSPITALARIAS', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('270', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801252545', 'ESTUPIÑAN ZAMBRANO LUIS ORLANDO', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A ESPECIALISTA EN TRAUMATOLOGIA 1', '23/8/1958', 'luis.zambranohdtc.gob.ec', 'luis.zambranohdtc.gob.ec', '0986813368', 'MASCULINO', 'MEDICO/A ESPECIALISTA EN TRAUMATOLOGIA ', 'CUARTO NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('271', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802799114', 'FALCONES ESTRADA KARINA SABRINA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '6/10/1984', 'sabrina.falcones@hdtc.gob.ec', 'skfe_19_9_84@hotmail.com', '0982838034', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('272', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802593566', 'FALCONES ESTRADA TANIA YANELA', 'GESTION ADMINISTRATIVA Y FINANCIERA', 'ANALISTA DE TALENTO HUMANO 3', '11/12/1983', 'tania.falcones@hdtc.gob.ec', 'tania_ecuador@yahoo.es', '0994629748', 'FEMENINO', 'MAGISTER EN PLANEAMIENTO', 'CUARTO NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('273', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801646258', 'FALCONES QUINTERO FANNY MARIBEL', 'REHABILITACION Y TERAPIA FISICA', 'TECNOLOGO MEDICO DE REHABILITACION Y TERAPIA FISICA 1', '1/1/1972', 'fanny.falcones@hdtc.gob.ec', 'fannyf@yahoo.es', '062995100', 'FEMENINO', 'TECNOLOGO MEDICO DE REHABILITACION Y TERAPIA FISICA ', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('274', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802192245', 'FARIAS CHEME DARWIN JESUS', 'MANTENIMIENTO', 'AUXILIAR ADMINISTRATIVO DE SALUD DEL SECTOR SALUD', '4/7/1987', 'darwin.farias@hdtc.gob.ec', 'fariasdarwin@hotmail.com', '062995100', 'MASCULINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('275', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801359605', 'FARIAS TENORIO JAIRO FEDERICO', 'IMAGENOLOGIA', 'TECNOLOGO MEDICO DE IMAGENOLOGIA 2', '22/2/1968', 'jairo.farias@hdtc.gob.ec', 'jairo.farias@hdt.gob.ec', '0956487531', 'MASCULINO', 'LICENCIADO EN IMAGENOLOGIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('276', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801466491', 'FERRER VIZCAINO ELEONORA IVONNE', 'GESTION DE CALIDAD', 'ASISTENTE ADMINISTRATIVO', '21/3/1969', 'eleonora.ferrer@hdtc.gob.ec', 'ivonneferrer897@hotmail.com', '0987231212', 'FEMENINO', 'S/N', 'BACHILLER', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('277', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802378059', 'FERRIN ANDRADE CARMEN AURELIANA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'AUXILIAR DE ENFERMERIA', '30/3/1963', 'carmen.ferrin@hdtc.gob.ec', 'carfean2@hotmail.com', '062995100', 'FEMENINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('278', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801613969', 'FEY TAFUR MAGDALA VICTORIA', 'LABORATORIO', 'TECNOLOGO MEDICO DE LABORATORIO 3', '25/3/1970', 'magdala.fey@hdtc.gob.ec', 'magu-fey@hotmail.com', '022725603', 'FEMENINO', 'TECNOLOGO MEDICO DE LABORATORIO ', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('279', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801024589', 'FIALLOS CARVAJAL MAGNA VICTORIA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'AUXILIAR DE ENFERMERIA', '17/11/1964', 'magna.fiallos@hdtc.gob.ec', 'mag-fi@hotmail.com', '062700763', 'FEMENINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('280', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801945437', 'FLORES GARCIA DANNY MAYOLI', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '24/3/1988', 'danny.flores@hdtc.gob.ec', 'mayoliflores@hotmail.com', '0984459869', 'FEMENINO', 'MEDICO GENERAL EN FUNCIONES HOSPITALARIAS', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('281', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802942342', 'FRANCIS MEDINA MARLEN PIEDAD', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '16/1/1993', 'marlen.francis@hdtc.gob.ec', 'marleyfrancis@hotmail.com', '0997007750', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('282', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802923094', 'FRANCIS MEDINA MARY MAGALY', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '26/6/1987', 'mary.francis@hdtc.gob.ec', 'guadaenferforever@hotmail.com', '062995100', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('283', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803488279', 'FRANCO BOMBON CINTHIA ANABELLA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '5/6/1991', 'cinthia.franco@hdtc.gob.ec', 'anabellafranco1990@gmail.com', '099102563', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('284', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801219635', 'FUENTES QUINTERO MARIANA PATRICIA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'AUXILIAR DE ENFERMERIA', '11/12/1982', 'mariana.fuentes@hdtc.gob.ec', 'mariana.fuentes@hdtc.gob.ec', '062995100', 'FEMENINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('285', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1758544256', 'FURGIUELE MORILLO GEANNELLA DESIREE', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A ESPECIALISTA EN PEDIATRIA 1', '11/12/1982', 'geannella.furgiurgiele@hdtc.gob.ec', 'geannella.furgiurgiele@hdtc.gob.ec', '0984432683', 'FEMENINO', 'MEDICO/A ESPECIALISTA EN PEDIATRIA 1', 'CUARTO NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('286', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0917491573', 'GALARZA VALENCIA YOLANDA YESENIA', 'LABORATORIO', 'AUXILIAR DE LABORATORIO', '20/10/1987', 'yolanda.galarza@hdtc.gob.ec', 'jesigava-jose@hotmail.com', '0990122586', 'FEMENINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('287', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801728387', 'GALIANO ARTURO IVAN RICARDO', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A ESPECIALISTA EN CUIDADOS INTENSIVOS 1', '11/12/1982', 'ivan.galiano@hdtc.gob.ec', 'igaleano@hotmail.com', '095230506', 'MASCULINO', 'MEDICO ESPECIALISTA  INTENSIVISTA', 'CUARTO NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('288', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802597955', 'GALIANO QUINTERO DINA JOHANNA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '18/11/1988', 'dina.galiano@hdtc.gob.ec', 'dinagalianoq@hotmail.com', '0968394581', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('289', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1723472369', 'GALLEGOS REINOSO IVAN FERNANDO', 'IMAGENOLOGIA', 'TECNOLOGO MEDICO DE IMAGENOLOGIA 2', '1/12/1988', 'ivan.gallegos@hdtc.gob.ec', 'ivangallegos112@gmail.com', '0993664581', 'MASCULINO', 'TECNOLOGO MEDICO DE IMAGENOLOGIA 2', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('290', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803715937', 'GARCES ALCIVAR PATRICK MANUEL', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '14/4/1991', 'gabriela.carranza@hdtc.gob.ec', 'gajo@webadictos.net', '0958992317', 'MASCULINO', 'MEDICO GENERAL EN FUNCIONES HOSPITALARIAS', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('291', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801910175', 'GARCES CASTILLO NARCISA CELESTE', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '29/10/1973', 'narcisa.garces@hdtc.gob.ec', 'eltiempo27@yahoo.com', '0987231979', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('292', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803042548', 'GARCIA ALVAREZ KAREN ELIZABETH', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '19/3/1987', 'karen.garcia@hdtc.gob.ec', '87karen@hotmail.es', '062995100', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('293', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801768540', 'GARCIA CERVANTES MIRNA KARIME', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '24/6/1989', 'mirna.garcia@hdtc.gob.ec', 'mkgc_med@hotmail.com', '0984846171', 'FEMENINO', 'MEDICO GENERAL EN FUNCIONES HOSPITALARIAS', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('294', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801262338', 'GILER SALVATIERRA MIRYAN MARJORIE', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '11/6/1967', 'miryan.giler@hdtc.gob.ec', 'migiler@hotmail.com', '062995100', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('295', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802040139', 'GODOY PEREZ ALEX FRANCISCO', 'GESTION FINANCIERA', 'ANALISTA DE ADMINISTRACION DE CAJA 1', '4/7/1985', 'alex.godoy@hdtc.gob.ec', 'chitoamol@hotmail.com', '0993715419', 'MASCULINO', 'INGENIERO EN ADMINISTRACION PUBLICA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('296', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0850271305', 'GODOY RODRIGUEZ SHABELLY ANNABELL', 'GESTIÓN DE PROCESOS DE APOYO DIAGNÓSTICO Y TERAPÉUTICO', 'PSICOLOGO/A CLINICO/A  1', '5/8/1995', 'shabelly.godoy@hdtc.gob.ec', 'shabelly@gmail.com', '09963609888', 'FEMENINO', 'PSICOLOGA CLINICA ', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('297', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801535790', 'GODOY VALENCIA LUIS HERMOGENES', 'MANTENIMIENTO', 'AUXILIAR ADMINISTRATIVO DE SALUD DEL SECTOR SALUD', '24/12/1980', 'luis.godoy@hdtc.gob.ec', 'luis.godoy@hdtc.gob.ec', '062995100', 'MASCULINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('298', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802304097', 'GOMEZ ABAD KARLA XIOMARA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '11/12/1982', 'karla.gomez@hdtc.gob.ec', 'jonnierycristi@hotmail.com', '0986861205', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('299', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803261387', 'GOMEZ BARCIA GRACE GABRIELA', 'NUTRICION', 'NUTRICIONISTA 2', '11/12/1982', 'grace.gomez@hdtc.gob.ec', 'gaby-jo21@hotmail.com', '0991114105', 'FEMENINO', 'LICENCIADA EN NUTRICION Y DIETETICA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('300', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802352674', 'GOMEZ ESTUPIÑAN JUAN PABLO', 'GERENCIA ', 'COORDINADOR ADMINISTRATIVA FINANCIERA', '13/9/1982', 'juan.gomez@hdtc.gob.ec', 'jupagoestu@hotmail.com', '0994629748', 'MASCULINO', 'INGENIERO EN ADMINISTRACION DE EMPRESAS', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('301', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0800808107', 'GOMEZ NIEVES NIGLYS GORGIE', 'MANTENIMIENTO', 'CHOFER DE AMBULANCIA DEL SECTOR SALUD', '4/11/1959', 'niglys.gomez@hdtc.gob.ec', 'niglysgomez@hotmail.com', '0983094000', 'MASCULINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('302', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802465864', 'GOMEZ POROZO TOMASA LUCIA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '9/9/1977', 'tomasa.gomez@hdtc.gob.ec', 'gomezporozo@gmail.com', '0981940271', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('303', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1311487068', 'GOMEZ ZAMBRANO MARIA ELENA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '29/3/1985', 'maria.gomez@hdtc.gob.ec', 'marygz29@hotamil.com', '062995100', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('304', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801526138', 'GOMEZ ZUÑIGA LUIS EMIR', 'MANTENIMIENTO', 'TECNICO DE MANTENIMIENTO', '4/12/1979', 'luis.gomez@hdtc.gob.ec', 'luis06gomez02@gmail.com', '0993567890', 'MASCULINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('305', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803327246', 'GONGORA CAICEDO XIMENA VERONICA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '11/12/1982', 'ximena.gongora@hdtc.gob.ec', 'veronica_2040@oaulook.com', '0990091052', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('306', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0804315745', 'GONGORA PINEDA KAROL YURANY', 'GESTION DE ADMISIONES', 'ASISTENTE DE ADMISIONES', '27/6/1994', 'karol.gongora@hdtc.gob.ec', 'karitogongora-pineda@hotmail.com', '0967070144', 'FEMENINO', 'S/N', 'BACHILLER', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('307', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1758559072', 'GONZALEZ ALVARADO ROBINSON ANTONIO', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '11/10/1988', 'robinzon.alvarado@hdtc.gob.ec', 'robinzon.alvarado@hdtc.gob.ec', '0996593849', 'MASCULINO', 'MEDICO GENERAL EN FUNCIONES HOSPITALARIAS', 'TERCER NIVEL', 'X', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('308', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0800469835', 'GONZALEZ CABEZA GENNY ROSULA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'AUXILIAR DE ENFERMERIA', '13/9/1960', 'genny.gonzalez@hdtc.gob.ec', 'eltiempo27@yahoo.com', '0994844539', 'FEMENINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('309', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801876236', 'GONZALEZ CASTILLO ALEXANDRA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '27/10/1975', 'alexandra.gonzalez@hdtc.gob.ec', 'aleaxaelian06@gmail.com', '0968934802', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('310', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1758624165', 'GONZALEZ GALINDO VICTOR JOSE', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A ESPECIALISTA EN TRAUMATOLOGIA 1', '11/12/1982', 'victor.gonzalez@hdtc.gob.ec', 'victor.gonzalez@hdtc.gob.ec', '0998044574', 'MASCULINO', 'MEDICO/A ESPECIALISTA EN MEDICINA INTERNA ', 'CUARTO NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('311', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802293068', 'GONZALEZ MERIZALDE JUANA MARIA', 'GESTION DE ATENCION AL USUARIO/A', 'TRABAJADOR/A SOCIAL 2', '17/12/1991', 'juana.gonzalez@hdtc.gob.ec', 'ugomez6@hotmail.com', '094703866', 'FEMENINO', 'TRABAJADORA SOCIAL', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('312', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '803591908', 'GONZALEZ MIKETTA NATHALY CAROLINA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '1/10/1993', 'nathaly.gonzalez@hdtc.gob.ec', 'erikalaflaki@hotmail.com', '0980390064', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('313', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0922934161', 'GOSSMANN ARROYO CAROLINA CLEOTILDE', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '6/2/1981', 'carolina.gossman@hdtc.gob.ec', 'bella-1998@hotmail.es', '0993588187', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('314', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801950247', 'GOSSMANN ARROYO JESSENIA AMARILY', 'GESTION DE CUIDADOS DE ENFERMERIA', 'AUXILIAR DE ENFERMERIA', '18/5/1975', 'jessenia.gossmann@hdtc.gob.ec', 'ciie2797@hotmail.com', '0991568637', 'FEMENINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('315', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803231893', 'GRACIA CHAMORRO RODOLFO RUBEN', 'LABORATORIO', 'TECNOLOGO MEDICO DE LABORATORIO 1', '7/9/1992', 'rodolfo.chamorro@hdtc.gob.ec', 'rubengraciachamorro@hotmail.es', '0989733337', 'MASCULINO', 'INGENIERO ELECTRICO', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('316', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1312413840', 'GRACIA MARQUEZ DIANA CAROLINA', 'IMAGENOLOGIA', 'TECNOLOGO MEDICO DE IMAGENOLOGIA 2', '14/7/1990', 'diana.gracia@hdtc.gob.ec', 'dianagm16_@hotmail.com', '0994626407', 'FEMENINO', 'LICENCIADO EN IMAGENOLOGIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('317', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802471458', 'GRUEZO ESPINOZA LUIS GERARDO', 'GESTION DE CUIDADOS DE ENFERMERIA', 'AUXILIAR DE ENFERMERIA', '10/2/1977', 'luis.gruezo@hdtc.gob.ec', 'luis.gruezo@hdtc.gob.ec', '062995100', 'MASCULINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('318', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803257682', 'GRUEZO VASQUEZ TANIA ANDREA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '29/11/1989', 'tania.gruezo@hdtc.gob.ec', 'kadeoshol@gmail.com', '0969530528', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('319', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801861899', 'GUADAMUD GARCIA ANGEL ALBERTO', 'MANTENIMIENTO', 'AUXILIAR ADMINISTRATIVO DE SALUD DEL SECTOR SALUD', '11/12/1982', 'angel.guadamud@hdtc.gob.ec', 'angelguadamud@hotmail.com', '062713216', 'MASCULINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('320', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802166785', 'GUADAMUD SOLORZANO NATIVIDAD BENILDA', 'GERENCIA ', 'ANALISTA DE ASESORIA JURIDICA 1', '25/12/1975', 'natividad.guadamud@hdtc.gob.ec', 'naty_guadamud@hotmail.com', '0994435340', 'FEMENINO', 'ABOGADA DE LOS TRIBUNALES Y JUZGADOS DE LA REPUBLICA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('321', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1805002324', 'GUAMAN CRIOLLO JEANETTE ALEXANDRA', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '7/10/1991', 'jeanette.guaman@hdtc.gob.ec', 'jeanette.guaman@hdtc.gob.ec', '0988697297', 'FEMENINO', 'MEDICO', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('322', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1725262156', 'GUDIÑO JUSTICIA CARLOS STEEWARTH', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '1/11/1993', 'gabriela.carranza@hdtc.gob.ec', 'gajo@webadictos.net', '0988127348', 'MASCULINO', 'MEDICO GENERAL EN FUNCIONES HOSPITALARIAS', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('323', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1305814152', 'GUERRERO GUERRERO FRANCISCO ANTONIO', 'MANTENIMIENTO', 'AUXILIAR ADMINISTRATIVO DE SALUD DEL SECTOR SALUD', '1/2/1974', 'francisco.guerrero@hdtc.gob.ec', 'francisco.guerrero@hdtc.gob.ec', '0993360647', 'MASCULINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('324', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802782441', 'GUERRERO GUERRERO MARINELA DEL CARMEN', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '15/8/1985', 'marinela.guerrero@hdtc.gob.ec', 'nelamary85@hotmail.com', '0996841278', 'FEMENINO', 'MEDICO GENERAL EN FUNCIONES HOSPITALARIAS', 'TERCER NIVEL', 'X', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('325', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802166793', 'GUERRERO GUTIERREZ XAVIER DARIO', 'MANTENIMIENTO', 'ANALISTA DE ELECTRICA-ELECTRONICA', '10/10/1977', 'xavier.guerrero@hdtc.gob.ec', 'xdguerrero77@hotmail.com', '0988321378', 'MASCULINO', 'INGENIERO ELECTRICO', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('326', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802293837', 'GUERRERO PRECIADO SEGUNDO OMAR', 'GESTION DE CUIDADOS DE ENFERMERIA', 'AUXILIAR DE ENFERMERIA', '9/3/1978', 'segundo.guerrero@hdtc.gob.ec', 'segundoguerrero1979@gmail.com', '0991782389', 'MASCULINO', 'TECNICO EN ENFERMERIA', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('327', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802957779', 'GUERRERO RODRIGUEZ JAHAIRA KATHERINE', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '26/9/1986', 'jahaira.guerrero@hdtc.gob.ec', 'guadaenferforever@hotmail.com', '062727497', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('328', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803840180', 'GUEVARA ANDRADE FERNANDO GABRIEL', 'LABORATORIO', 'LABORATORISTA CLINICO 1', '16/2/1991', 'fernando.guevara@hdtc.gob.ec', 'fernan_life@hotmail.com', '0981403081', 'MASCULINO', 'LABORATORISTA CLINICO 1', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('329', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803712090', 'GUEVARA QUINTERO VERONICA CAROLINA', 'GESTION DE ADMISIONES', 'ASISTENTE DE ADMISIONES', '11/12/1982', 'verónica.guevara@hdtc.gob.ec', 'veronica.guevara@hdtc.gob.ec', '0997879195', 'FEMENINO', 'S/N', 'BACHILLER', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('330', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802259804', 'GUEVARA ZAMBRANO ALEX ALONSO', 'GESTION DE CUIDADOS DE ENFERMERIA', 'AUXILIAR DE ENFERMERIA', '15/2/1976', 'alex.guevara@hdtc.gob.ec', 'ositabella1982@hotmail.com', '062722778', 'MASCULINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('331', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1726233651', 'GUILARTE GONZALEZ MERCEDES', 'GESTIÓN DE PROCESOS DE APOYO DIAGNÓSTICO Y TERAPÉUTICO', 'PSICOLOGO/A CLINICO/A 3', '4/3/1967', 'mercedes.guilarte@hdtc.gob.ec', 'guilartemerco@yahoo.es', '0998336971', 'FEMENINO', 'PSICOLOGO/A CLINICO/A ', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('332', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1756927545', 'GUSTAVE ELOISE', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '9/8/1983', 'eloise.gustave@hdtc.gob.ec', 'elodigust@gmail.com', '0984804251', 'FEMENINO', 'MEDICO GENERAL EN FUNCIONES HOSPITALARIAS', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('333', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1759284449', 'GUTIERREZ CARRILLO MARILITZA ANDREINA', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '15/8/1985', 'marilitza.gutierrez@hdtc.gob.ec', 'marilitza.gutierrez@hdtc.gob.ec', '0967399991', 'FEMENINO', 'MEDICO GENERAL EN FUNCIONES HOSPITALARIAS', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('334', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0800895161', 'GUTIERREZ MORALES VICTOR HUGO', 'GESTION ADMINISTRATIVA', 'AUXILIAR ADMINISTRATIVO DE SALUD DEL SECTOR SALUD', '11/4/1964', 'victor.gutierrez@hdtc.gob.ec', 'ositabella1982@hotmail.com', '0981940894', 'MASCULINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('335', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0924535800', 'GUZMAN MEDINA JULIANA MONSERRATE', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '11/12/1982', 'juliana.guzman@hdtc.gob.ec', 'JULI_1986@HOTMAIL.COM', '091931157', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('336', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1756987812', 'HERNANDEZ CHAVEZ ARTURO', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A ESPECIALISTA EN NEUROLOGIA 1', '5/1/1975', 'arturo.hernandez@hdtc.gob.ec', 'arturo.hernandez@hdtc.gob.ec', '0967070144', 'MASCULINO', 'MEDICO ESPSCIALISTA EN NEUROLOGIA', 'CUARTO NIVEL', 'X', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('337', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1711842979', 'HERRERA ROMERO ANDRES', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A ESPECIALISTA EN NEUROCIRUGIA 1', '8/5/1988', 'andres.herrera@hdtc.gob.ec', 'ansebas1911@gmail.com', '0998236960', 'MASCULINO', 'MEDICO NEUROCIRUJANO', 'CUARTO NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('338', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801840943', 'HIDALGO FAJARDO ANDREA ELIZABETH', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '29/11/1986', 'andrea.hidalgo@hdtc.gob.ec', 'andreita_hila@hotmail.es', '0994949115', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('339', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802770792', 'HIDALGO MINA JONATHAN ADALBERTO', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '15/8/1985', 'jonathan.hidalgo@hdtc.gob.ec', 'forceleonone@hotmail.com', '0967731149', 'MASCULINO', 'MEDICO GENERAL EN FUNCIONES HOSPITALARIAS', 'TERCER NIVEL', 'X', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('340', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802645226', 'HIDALGO MINA PAUL DARIO', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '13/6/1983', 'paul.hidalgo@hdtc.gob.ec', 'paul.hidalgo@hdtc.gob.ec', '0969648868', 'FEMENINO', 'MEDICO GENERAL EN FUNCIONES HOSPITALARIAS', 'TERCER NIVEL', 'X', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('341', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801761883', 'HINOJOSA CASTILLO GLADYS VICTORIA', 'IMAGENOLOGIA', 'TECNOLOGO MEDICO DE IMAGENOLOGIA 3', '19/10/1974', 'gladys.hinojosa@hdtc.gob.ec', 'hoyeselfuturodeayer@hotmail.com', '062995100', 'FEMENINO', 'TECNOLOGO MEDICO DE IMAGENOLOGIA ', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('342', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0804376903', 'HINOJOSA MENDEZ WLADIMIR ALEXANDER', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '30/12/1992', 'wladimir.hinojosa@hdtc.gob.ec', 'wladimir.hinojosa@hdtc.gob.ec', '0969725942', 'MASCULINO', 'MEDICO/A GENERAL ', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('343', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '102492433', 'HUNG HUANG SEILEE', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A ESPECIALISTA EN ENDOCRINOLOGIA 1', '1/2/1986', 'seilee.hung@hdtc.gob.ec', 'seilee.hung@hdtc.gob.ec', '0998173014', 'FEMENINO', 'MEDICO ESPECIALSITA EN ENDOCRINOLOGIA', 'CUARTO NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('344', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801937129', 'HURTADO ANGULO MARCO ANTONIO', ' ACTIVO FIJO Y GUARDALMACEN ', 'ASISTENTE ADMINISTRATIVO', '5/8/1975', 'marcos.hurtado@hdtc.gob.ec', 'marcohurtado3675@hotmail.com', '0967070144', 'MASCULINO', 'INGENIERIA FORESTAL', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('345', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801824012', 'HURTADO MEZA ROSA YALILA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'AUXILIAR DE ENFERMERIA', '9/4/1966', 'rosa.hurtado@hdtc.gob.ec', 'rosa.hurtado@hdtc.gob.ec', '0999689491', 'FEMENINO', 'TECNICO EN ENFERMERIA', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('346', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1758037715', 'HURTADO QUIÑONES SANDRA PATRICIA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '9/12/1990', 'sandra.hurtado@hdtc.gob.ec', 'sandra.hurtado@hdtc.gob.ec', '062995100', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('347', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801926973', 'HURTADO ROA SABRINA EMILIANA', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'PARAMEDICO/A 2', '29/7/1987', 'sabrina.hurtado@hdtc.gob.ec', 'emilianita2020@outlook.com', '0968938179', 'FEMENINO', 'PARAMEDICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('348', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0800784647', 'HURTADO ZATIZABAL OMAR REINALDO', 'GESTION FINANCIERA', 'ANALISTA DE CONTABILIDAD 2', '24/8/1962', 'omar.hurtado@hdtc.gob.ec', 'omarrhurtadoz@yahoo.es', '0993044013', 'MASCULINO', 'INGENIRO EN ADMINISTRACION D EEMPRESAS', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('349', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0804417509', 'IBARRA ESTUPIÑAN MARCOS DAVID', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '7/8/1994', 'marcos.ibarra@hdtc.gob.ec', 'marcosdie7@hotmail.com', '0985308167', 'MASCULINO', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIA 1', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('350', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801657321', 'IBARRA SEGURA SAMUEL LEONIDAS', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A ESPECIALISTA EN MEDICINA INTERNA 1', '21/5/1953', 'samuel.ibarra@hdtc.gob.ec', 'samuelib22@yahoo.com', '0994839129', 'MASCULINO', 'MEDICO/A ESPECIALISTA EN MEDICINA INTERNA ', 'CUARTO NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('351', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1311307084', 'IGLESIAS GARCIA VERONICA ELIZABETH', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '21/6/1989', 'verónica.iglesias@hdtc.gob.ec', 'veriely2290@outlook.com', '0997541617', 'FEMENINO', 'MEDICO GENERAL EN FUNCIONES HOSPITALARIAS', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('352', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802981258', 'IMUES LOPEZ LUIS FAVIO', 'GESTION ADMINISTRATIVA Y FINANCIERA', 'ANALISTA DE REDES, COMUNICACIONES E INFRAESTRUCTURA', '11/12/1982', 'luis.imues@hdtc.gob.ec', 'luis_imues@hdtc.gob.ec', '0991474214', 'MASCULINO', 'INGENIERO EN SISTEMAS INFORMATICOS', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('353', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1758591372', 'INESTROZA PEROZO MARIA ALEXANDRA', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A ESPECIALISTA EN PEDIATRIA 1', '6/4/1985', 'maria.inestrosa@hdtc.gob.ec', 'maria.inestrosa@hdtc.gob.ec', '0994629748', 'FEMENINO', 'MEDICO ESPECIALSITA EN PEDIATRIA', 'CUARTO NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('354', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1313788109', 'JACOME MEZA JAIME ANDRES', 'IMAGENOLOGIA', 'TECNOLOGO MEDICO DE IMAGENOLOGIA 2', '13/11/1996', 'jaime.jacome@hdtc.gob.ec', 'jaimejacome.m08salud@gmail.com', '0989194621', 'MASCULINO', 'TECNOLOGO MEDICO DE IMAGENOLOGIA 2', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('355', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802510628', 'JAMA CAICEDO EDER ELADIO', 'GESTION DE CUIDADOS DE ENFERMERIA', 'AUXILIAR DE ENFERMERIA', '17/8/1973', 'eder.jama@hdtc.gob.ec', 'eltiempo27@yahoo.com', '062722778', 'MASCULINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('356', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803155837', 'JAMA RAMIREZ LEIDY GABRIELA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '2/6/1987', 'leidy.jama.@hdtc.gob.ec', 'mileidy2011@hotmail.com', '0980219504', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('357', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803144997', 'JARAMILLO BOBOY AMANDA XIMENA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '14/4/1988', 'amanda.jaramillo@hdtc.gob.ec', 'x-jaramillo@hotmail.com', '0997287076', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('358', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802873265', 'JARAMILLO CEDEÑO JULIO JOSE', 'GESTION DE CALIDAD', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '17/10/1985', 'julio.jaramillo@hdtc.gob.ec', 'julioja007@hotmail.com', '0984533199', 'MASCULINO', 'DOCTOR EN MEDICINA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('359', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0706281532', 'JARAMILLO ESPINOZA ANYI ELSI', 'FARMACIA, INSUMOS, DISPOSITIVOS MEDICOS Y REACTIVOS', 'QUIMICO / BIOQUIMICO FARMACEUTICO 1', '22/3/1991', 'anyi.jaramillo@hdtc.gob.ec', 'anyi_2203@hotmail.com', '0988268343', 'FEMENINO', 'QUIMICO / BIOQUIMICO FARMACEUTICO ', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('360', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802950667', 'JARAMILLO FREIRE MAYRA TAMARA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '24/7/1985', 'mayra.jaramillo@hdtc.gob.ec', 'misnenena_3110@hotmail.com', '0939815001', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('361', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1756780340', 'JEUNE SARA', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '7/4/1989', 'sara.jeune@hdtc.gob.ec', 'betymaykel@gmail.com', '0995933028', 'FEMENINO', 'DOCTORA EN MEDICINA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('362', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1756780506', 'JEUNE THAMAR', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '29/3/1988', 'thamar.jeune@hdtc.gob.ec', 'sarajeune@yahoo.fr', '0999174417', 'FEMENINO', 'DOCTORA EN MEDICINA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('363', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802671552', 'JIMENEZ BATIOJA JANY JIMENA', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '29/6/1983', 'jany. jimenez@hdtc.gob.ec', 'janijimenez1982@yahoo.es', '062995100', 'FEMENINO', 'MEDICO GENERAL EN FUNCIONES HOSPITALARIAS', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('364', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802338335', 'JIMENEZ BETANCOURT CARLA PATRICIA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '20/12/1979', 'carla.jimenez@hdtc.gob.ec', 'carla-jimenez79@hotmail.com', '091810977', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('365', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1756954762', 'JOSEPH FENEL', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '4/4/1987', 'fenel.joseph@hdtc.gob.ec', 'kerbyjoeph81@yahoo.fr', '0991048493', 'MASCULINO', 'MEDICO GENERAL EN FUNCIONES HOSPITALARIAS', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('366', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1756806392', 'JULES MARLENE', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '18/5/1983', 'marlene.jules@hdtc.gob.ec', 'jeunethamar@yahoo.fr', '0983097087', 'FEMENINO', 'DOCTORA EN MEDICINA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('367', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801664145', 'JURADO QUINTERO NINIVE MORAYMA', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'OBSTETRIZ / OBSTETRA 1', '15/8/1985', ' ninive.jurado@hdtc.gob.ec', 'obst_jurado@yahoo.com', '0995045263', 'FEMENINO', 'OBSTETRIZ / OBSTETRA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('368', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1758912610', 'KEIRA ABOUBACAR FODE', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A ESPECIALISTA EN ANESTESIOLOGIA 1', '20/1/1989', 'aboubacar.keira@hdtc.gob.ec', 'aboubacar.keira@hdtc.gob.ec', '0994839076', 'MASCULINO', 'MEDICO ESPECIALISTA ANASTESEOLOGIA', 'CUARTO NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('369', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1759394222', 'KEITA IBRAHIMA KALIL', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A ESPECIALISTA EN CIRUGIA GENERAL 1', '25/10/1984', 'keita.ibrahima@hdtc.gob.ec', 'lilkeith8681@yahoo.com', '0995329176', 'MASCULINO', 'ESPECIALISTA DE PRIMER GRADO EN CIRUGIA GENERAL', 'CUARTO NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('370', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801941931', 'KLINGER JAEN MARIA ANTONIETA', ' ACTIVO FIJO Y GUARDALMACEN ', 'GUARDALMACEN', '7/11/1976', 'maria.klinger@hdtc.gob.ec', 'almacenhdtc@yahoo.es', '062995100', 'FEMENINO', 'INGENIERO COMERCIAL / LICENCIADO EN ADMINISTRACION DE ENPRESAS', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('371', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803156520', 'KLINGER MENDEZ MARIUXI LISSETTE', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '15/6/1991', 'mariuxi.klinger@hdtc.gob.ec', 'maru1209@hotmail.com', '0959558663', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('372', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803840941', 'LASTRA MONTAÑO JOSE ABELINO', 'MANTENIMIENTO', 'AUXILIAR ADMINISTRATIVO DE SALUD DEL SECTOR SALUD', '11/12/1982', 'jose.lastra@hdtc.gob.ec', 'ositabella1982@hotmail.com', '062722778', 'MASCULINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('373', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802970608', 'LASTRA VERNAZA ANDREA JESSENIA', ' ACTIVO FIJO Y GUARDALMACEN ', 'ANALISTA DE ACTIVOS FIJOS 1', '9/1/1989', 'andrea.lastra@hdtc.gob.ec', 'andrea.lastra@hdtc.gob.ec', '0991181899', 'FEMENINO', 'INGENIERA EN SISTEMAS Y COMPUTACION', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('374', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0800800005', 'LASTRE GONZALEZ DAISIS FELIZA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'AUXILIAR DE ENFERMERIA', '19/2/1961', 'deicy.lastre@hdtc.gob.ec', 'daisis.lastre@hdtc.gob.ec', '0998143094', 'FEMENINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('375', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1758559064', 'LAYA RIVERO PAOLA BEATRIZ', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '25/6/1992', 'paola.laya@hdtc.gob.ec', 'mariangeldeverasilva8@gmail.com', '0988515659', 'FEMENINO', 'MEDICO CIRUJANO', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('376', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801521014', 'LAZO BATALLAS CARLOS CRISTOBAL', 'GESTION DE CUIDADOS DE ENFERMERIA', 'AUXILIAR DE ENFERMERIA', '16/11/1969', 'carlos.lazo@hdtc.gob.ec', 'guadaenferforever@hotmail.com', '0980208532', 'MASCULINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('377', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802776930', 'LEMA TOALA GISSELA VANESSA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '24/3/1984', 'gissela.lema@hdtc.gob.ec', 'guadaenferforever@hotmail.com', '093817109', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('378', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803116177', 'LEON MEDINA ANGEL ALFREDO', 'GESTION ADMINISTRATIVA', 'AUXILIAR ADMINISTRATIVO DE SALUD DEL SECTOR SALUD', '24/1/1974', 'angel.leon@hdtc.gob.ec', 'ositabella1982@hotmail.com', '062995100', 'MASCULINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('379', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801010653', 'LEON TELLO MARGARITA DEL CARMEN', 'GESTION ADMINISTRATIVA ', 'TECNICO DE ARCHIVO', '27/4/1965', 'margarita.leon@hdtc.gob.ec', 'ltello@hotmail.com', '096450220', 'FEMENINO', 'S/N', 'BACHILLER', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('380', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1202087050', 'LEON VERA PERPETUA JOSEFINA', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A ESPECIALISTA EN ANESTESIOLOGIA 1', '27/8/1955', 'perpetua.leon@hdtc.gob.ec', 'pleon08@hotmail.com', '091306820', 'FEMENINO', 'MEDICO ESPECIALISTA ANASTESEOLOGIA', 'CUARTO NIVEL', 'X', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('381', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0927469726', 'LERMA NAZARENO DARWIN RENATO', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '15/8/1985', ' darwin.lerma@hdtc.gob.ec', 'RENATO.1989RESPET@HOTMAIL.COM', '0949278164', 'MASCULINO', 'MEDICO GENERAL EN FUNCIONES HOSPITALARIAS', 'TERCER NIVEL', 'X', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('382', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0800634339', 'LEYES QUIÑONEZ ROSA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'AUXILIAR DE ENFERMERIA', '18/3/1960', 'rosa.quiñonez@hdtc.gob.ec', 'ley1860@hotmail.com', '062725423', 'FEMENINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('383', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1755117213', 'LEYVA HERRERA ABEL', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A ESPECIALISTA EN UROLOGIA 1', '3/4/1991', 'abel.leiva@hdtc.gob.ec', 'abel.leiva@hdtc.gob.ec', '0983324575', 'MASCULINO', 'MEDICO/A ESPECIALISTA EN UROLOGIA ', 'CUARTO NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('384', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0800691578', 'LIZANO GARCES ANGELA ESTELA PATRICIA', 'GESTION ADMINISTRATIVA ', 'ASISTENTE ADMINISTRATIVO 2', '13/3/1962', 'angela.patricia@hdtc.gob.ec', 'angepatliz@hotmail.com', '062995100', 'FEMENINO', 'S/N', 'BACHILLER', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('385', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0706030814', 'LLANOS RODRIGUEZ MARYURI ISABEL', 'FARMACIA, INSUMOS, DISPOSITIVOS MEDICOS Y REACTIVOS', 'QUIMICO / BIOQUIMICO FARMACEUTICO 2', '8/5/1984', 'maryuri.llanos@hdtc.gob.ec', 'mi.llanosrodriguez@gmail.com', '0981253454', 'FEMENINO', 'QUIMICO / BIOQUIMICO FARMACEUTICO 2', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('386', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '142916689', 'LOBO JUAN CARLOS', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A ESPECIALISTA EN GINECOLOGIA 1', '7/9/1987', 'juan.lobo@hdtc.gob.ec', 'juan.lobo@hdtc.gob.ec', '0991180239', 'MASCULINO', 'MEDICO ESPECIALISTA EN GINECOLOGIA', 'CUARTO NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('387', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802607838', 'LOOR MONROY LEONARDO ARGEMIRO', 'LABORATORIO', 'AUXILIAR ADMINISTRATIVO DE SALUD DEL SECTOR SALUD', '2/8/1984', 'leonardo.loor@hdtc.gob.ec', 'subleo_82@hotmail.com', '062995100', 'MASCULINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('388', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1308644671', 'LOOR MOREIRA JAIME LEONIDAS', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '27/3/1985', 'jaime.loor@hdtc.gob.ec', 'jaimeleo24@hotmail.com', '0996717254', 'MASCULINO', 'MEDICO GENERAL EN FUNCIONES HOSPITALARIAS', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('389', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802826115', 'LOOR ZAMBRANO MARIA MONSERRATE', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '17/10/1981', 'maria.loor@hdtc.gob.ec', 'dulcelinda21@hotmail.com', '0939454968', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('390', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801900499', 'LOPEZ CLAVEL LUIS DANIEL', 'MANTENIMIENTO', 'CHOFER DE AMBULANCIA DEL SECTOR SALUD', '16/3/1959', 'luis.lopez@hdtc.gob.ec', 'daniel.lopez.@hdtc.gob.ec', '0981579532', 'MASCULINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('391', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1312680927', 'LOPEZ INTRIAGO INGRID XIOMARA', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '15/8/1985', 'ingrid.lopez@hdtc.gob.ec', 'xiomy1727@hotmail.com', '0980967309', 'FEMENINO', 'MEDICO GENERAL EN FUNCIONES HOSPITALARIAS', 'TERCER NIVEL', 'X', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('392', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1710486042', 'LOPEZ LOPEZ MONICA JANETH', 'LABORATORIO', 'AUXILIAR DE LABORATORIO', '10/8/1970', 'monica.lopez@hdtc.gob.ec', 'monicam@gmail.com', '062995100', 'FEMENINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('393', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1310184997', 'LOPEZ ORTIZ LIZETTE KATHERINE', 'NUTRICION', 'NUTRICIONISTA 2', '19/9/1980', 'lizette.lopez@hdtc.gob.ec', 'FUNCIONARIOSME@EDUCACION.GOB.EC', '023961400', 'FEMENINO', 'LICENCIADA EN NUTRICION Y DIETETICA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('394', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803260496', 'LOZANO JARAMILLO ALEXANDRA ELIZABETH', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '4/5/1990', 'alexandra.lozano@hdtc.gob.ec', 'cachetona1988@hotmail.es', '0985088254', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('395', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803289164', 'LOZANO JARAMILLO DAIRA CAROLINA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'AUXILIAR DE ENFERMERIA', '9/11/1986', 'daira.lozano@hdtc.gob.ec', 'lozanodaira@outlook.es', '0980484733', 'FEMENINO', 'TECNICO EN ENFERMERIA', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('396', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802595231', 'LUGO ANGULO JESSENIA GEOMARA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '14/9/1964', 'jessenia.lugo@hdtc.gob.ec', 'jessenialugo@gmail.com', '0997067657', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('397', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802941658', 'LUJANO PATA GLORIA BANESA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '6/4/1985', 'gloria.lujano@hdtc.gob.ec', 'glorialujanop@hotmail.com', '0986143278', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('398', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803195809', 'LUNA CUERO KARLA XIMENA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '27/2/1991', 'karla.luna@hdtc.gob.ec', 'ximen_dira@hotmail.com', '09800335767', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('399', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802942672', 'LUNA VELASCO GABRIELA ROSARIO', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '30/7/1990', 'gabriela.luna@hdtc.gob.ec', 'gabrielalunav1990@hotmail.com', '0986786697', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('400', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801978941', 'MACIAS EGUEZ SIMON GABRIEL', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A ESPECIALISTA EN TRAUMATOLOGIA 1', '11/12/1982', 'simon.macias@hdtc.gob.ec', 'sigabme@hotmail.com', '0984038892', 'MASCULINO', 'MEDICO/A ESPECIALISTA EN TRAUMATOLOGIA ', 'CUARTO NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('401', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802876847', 'MAFFARE BONE ALEXIS ELIZABETH', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '1/5/1977', 'alexis.maffare@hdtc.gob.ec', 'alapollo86@yahoo.es', '0980319284', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('402', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0800802423', 'MAFFARE VERA EDGAR HENRY', 'MANTENIMIENTO', 'CHOFER DE AMBULANCIA DEL SECTOR SALUD', '11/12/1982', 'edgar.maffare@hdtc.gob.ec', 'henrymaffare@gmail.com', '0988713913', 'MASCULINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('403', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1757107113', 'MAHBBOB KHURRAM', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '16/5/1988', 'mahbbob.khurram@hdtc.gob.ec', 'mahbbob.khurram@hdtc.gob.ec', '0982153715', 'MASCULINO', 'MEDICO GENERAL EN FUNCIONES HOSPITALARIAS', 'TERCER NIVEL', 'X', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('404', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1758771610', 'MAITA CASANOVA DAYANA TRINIDAD', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A ESPECIALISTA EN ANESTESIOLOGIA 1', '10/9/1972', 'dayana.maita@hdtc.gob.ec', 'dayana.maita@hdtc.gob.ec', '0998044574', 'FEMENINO', 'MEDICO/A ESPECIALISTA EN GINECOLOGIA ', 'CUARTO NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('405', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801235128', 'MALDONADO MESIAS GALIA ZORAIDA', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'OBSTETRIZ / OBSTETRA 1', '15/8/1985', 'galia.maldonado@hdtc.gob.ec', 'eltiempo27@yahoo.com', '0969716555', 'FEMENINO', 'OBSTETRIZ / OBSTETRA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('406', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801879750', 'MANTUANO CABEZAS JIMMY XAVIER', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '2/7/1989', 'jimmy.mantuano@hdtc.gob.ec', 'mantuanocj74@hotmail.com', '0979984135', 'MASCULINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('407', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1758569469', 'MARCANO GONZALEZ JOSE JESUS', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A ESPECIALISTA EN TRAUMATOLOGIA 1', '29/7/1984', 'jose.marcano@hdtc.gob.ec', 'jose.marcano@hdtc.gob.ec', '0996910417', 'MASCULINO', 'MEDICO/A ESPECIALISTA EN TRAUMATOLOGIA ', 'CUARTO NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('408', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0924406127', 'MARCILLO LEON LAURA KATIUSKA', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '25/5/1984', 'laura.marcillo@hdtc.gob.ec', 'la_mar83@hotmail.com', '0990657022', 'FEMENINO', 'MEDICO GENERAL EN FUNCIONES HOSPITALARIAS', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('409', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1207218429', 'MARIDUEÑA SANTILLAN ERIKA ALEXANDRA', 'REHABILITACION Y TERAPIA FISICA', 'TECNOLOGO EN TERAPIA RESPIRATORIA', '11/12/1982', 'erika.maridueña@hdtc.gob.ec', 'mserika94-@outlook.com', '0989514275', 'FEMENINO', 'LICENCIADO EN TERAPIA RESPIRATORIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('410', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803009703', 'MARIN FERRIN RENE EDUARDO', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '10/8/1993', 'rene.marin@hdtc.gob.ec', 'renemarinferrin@hotmail.com', '0999068714', 'MASCULINO', 'MEDICO GENERAL EN FUNCIONES HOSPITALARIAS', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('411', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802851238', 'MARQUEZ CETRE INGRID YOMAIRA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '13/5/1985', 'ingrid.marquez@hdtc.gob.ec', 'darmin.altafuya@hdtc.gob.ec', '0986424062', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('412', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801472754', 'MARQUEZ CETRE YOLI CARMEN', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '21/5/1969', 'yol.marquez@hdtc.gob.ec', 'yoli502030@yahoo.es', '0994743863', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('413', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802958892', 'MARQUEZ MEDINA MARIA FERNANDA', 'GESTION DE ADMISIONES', 'ANALISTA DE ADMISIONES', '28/2/1986', 'maria.marquez@hdtc.gob.ec', 'mariafer2802@hotmail.com', '0993502659', 'FEMENINO', 'INGENIERA EN ADMINISTRACION PUBLICA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('414', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802109777', 'MARQUEZ MEDINA MARIA VERONICA', 'FARMACIA, INSUMOS, DISPOSITIVOS MEDICOS Y REACTIVOS', 'AUXILIAR DE FARMACIA', '5/6/1982', 'maria.marquez@hdtc.gob.ec', 'veritomarquez2009@hotmail.com', '0985444298', 'FEMENINO', 'QUIMICO / BIOQUIMICO FARMACEUTICO ', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('415', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801692864', 'MARTINEZ BALLESTEROS ALLAN EDUARDO', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A ESPECIALISTA EN TRAUMATOLOGIA 1', '11/12/1982', 'allan.martinez@hdtc.gob.ec', 'sarumico@hotmail.com', '0993509024', 'MASCULINO', 'MEDICO/A ESPECIALISTA EN TRAUMATOLOGIA ', 'CUARTO NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('416', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803143189', 'MARTINEZ LAJONES KAREN MONSERRATE', 'TRANSFUSIONAL', 'TECNOLOGO MEDICO DE LABORATORIO 2', '22/1/1981', 'karen.martinez@hdtc.gob.ec', 'karen_280688@outlook.es', '0980508662', 'FEMENINO', 'QUIMICA Y FARMACEUTICA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('417', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801649187', 'MARTINEZ OLIVO SARA URISTELA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '11/12/1982', 'sara.martinez@hdtc.gob.ec', 'saritamartinez02@hotmail.com', '0989310332', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('418', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802058792', 'MARTINEZ TIRSIO JUAN JOSE', 'GESTION ADMINISTRATIVA', 'AUXILIAR ADMINISTRATIVO DE SALUD DEL SECTOR SALUD', '6/12/1976', 'juan.martinez@hdtc.gob.ec', 'helenka81988@outlook.com', '0981774726', 'MASCULINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('419', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0804383255', 'MATAMBA ORTIZ MARIA INES', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '6/10/1993', 'maria.matamba@hdtc.gob.ec', 'jaquie105_@hotmail.com', '0989936467', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('420', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801960337', 'MAYORGA ANGULO RAFAEL ANTONIO', 'MANTENIMIENTO', 'TECNICO DE MANTENIMIENTO', '1/1/1976', 'rafael.mayorga@hdtc.gob.ec', 'rafaelmay2015@outlook.es', '0989869031', 'MASCULINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('421', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802297770', 'MEDINA ANGULO LIDIA JAHAIRA', 'GESTION DE ADMISIONES', 'ANALISTA DE ADMISIONES', '28/2/1978', 'lidia.medina@hdtc.gob.ec', 'yali78@hotmail.es', '0981280768', 'FEMENINO', 'INGENIERA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('422', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0800725533', 'MEDINA CORTEZ ANTONIO JANNER NENDIS', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A ESPECIALISTA EN MEDICINA INTERNA 1', '27/1/1962', 'antonio.medina@hdtc.gob.ec', 'jannermendis@hotmail.com', '0992742896', 'MASCULINO', 'MEDICO/A ESPECIALISTA EN MEDICINA INTERNA ', 'CUARTO NIVEL', 'X', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('423', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1722043435', 'MEDINA GUEVARA ANTONIO JOAQUIN', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '22/3/1991', 'joaquin.medina@hdtc.gob.ec', 'joaquin.medina@hdtc.gob.ec', '0981265869', 'MASCULINO', 'MEDICO/A GENERAL ', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('424', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803204460', 'MEDINA RODRIGUEZ LEONELA ISABEL', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '22/4/1983', 'leonela.medina@hdtc.gob.ec', 'leonelamedina1988@live.com', '0997673645', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('425', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802931147', 'MEJIA SALINAS AARON FRANCISCO', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '15/8/1985', 'francisco.mejia@hdtc.gob.ec', 'francisco.mejia@hdtc.gob.ec', '094651042', 'MASCULINO', 'MEDICO', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('426', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0804163426', 'MENDOZA ESPAÑA CINTHYA CAROLINA', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '11/5/1993', 'cinthya.mendoza@hdtc.gob.ec', 'cinthya_93@hotmail.com', '0960191117', 'FEMENINO', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIA 1', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('427', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0800694374', 'MENDOZA GALLEGOS NORMA ALEXANDRA', 'GESTION DE TALENTO HUMANO', 'ANALISTA DE TALENTO HUMANO 1', '16/9/1962', 'norma.mendoza@hdtc.gob.ec', 'NORMITAMG@HOTMAIL.COM', '091018802', 'FEMENINO', 'INGENIERO EN ADMINISTRACION DE EMPRESAS', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('428', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802124420', 'MENDOZA MENDOZA SUHAI FERNANDA', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '15/8/1985', 'suhai.mendoza@hdtc.gob.ec', 'suhai.mendoza@hdtc.gob.ec', '0993980665', 'FEMENINO', 'MEDICO GENERAL EN FUNCIONES HOSPITALARIAS', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('429', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1312037615', 'MENDOZA SABANDO MARIA DOLORES', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '15/8/1985', 'maria.mendoza@hdtc.gob.ec', 'maria.mendoza@hdtc.gob.ec', '0999583872', 'FEMENINO', 'MEDICO', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('430', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1206100370', 'MENDOZA SALAS JAZMIN CRISTINA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'AUXILIAR DE ENFERMERIA', '11/12/1982', 'jazmin.mendoza@hdtc.gob.ec', 'jazminmendozasalas1990@gmail.com', '0999196595', 'FEMENINO', 'TECNICO EN ENFERMERIA', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('431', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802378851', 'MENENDEZ ARIZALA ARMENIA MARITZA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '20/10/1981', 'armenia.menendez@hdtc.gob.ec', 'maritzama2081@hotmail.com', '0993345295', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('432', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803450899', 'MENENDEZ PORTILLA ANTONIO VINICIO', 'GESTION ADMINISTRATIVA', 'AUXILIAR ADMINISTRATIVO DE SALUD DEL SECTOR SALUD', '18/3/1956', 'antonio.menendez@hdtc.gob.ec', 'antonio.menendez@hdtc.gob.ec', '0967789919', 'MASCULINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('433', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1312705377', 'MERA QUIROZ ANGEL DAVID', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '15/8/1985', 'angel.mera@hdc.gob.ec', 'angel.mera@hdc.gob.ec', '062995100', 'MASCULINO', 'MEDICO GENERAL EN FUNCIONES HOSPITALARIAS', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('434', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1003086269', 'MESA CAMPOS EDISON AMILCAR', 'GERENCIA ', 'ANALISTA DE CALIDAD 3', '17/4/1988', 'edison.mesa@hdtc.gob.ec', 'edisonyvi@gmail.com', '091688474', 'MASCULINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('435', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802713180', 'MESIAS ALARCON DIANA DENICE', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '23/11/1986', 'diana. mesias@hdtc.gob.ec', 'darilu2008@hotmail.com', '0991475700', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('436', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0804195097', 'MESIAS VERA KARLA NICOLLE', 'NUTRICION', 'ANALISTA DE NUTRICION 1', '10/10/1992', 'karla.mesias@hdtc.gob.ec', 'nikokar23@gmail.com', '0997681153', 'FEMENINO', 'NUTRICIONISTA DIETISTA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('437', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801866104', 'MEZA ESPAÑA REBECA ARACELY', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '27/3/1975', ' rebeca.meza@hdtc.gob.ec', 'eltiempo27@yahoo.com', '0988006995', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('438', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801862889', 'MICOLTA HUILA YASMIN YESENIA', 'REHABILITACION Y TERAPIA FISICA', 'TECNOLOGO MEDICO DE REHABILITACION Y TERAPIA FISICA 3', '9/9/1975', 'yasmin.micolta@hdtc.gob.ec', 'yasmin@gmail.com', '092462593', 'FEMENINO', 'LICENCIADA EN TERAPIA FISICA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('439', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802193029', 'MIDEROS HURTADO TANYA TAMARA', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '15/8/1985', 'tanya.mideros@hdtc.gob.ec', 'tanya.mideros@hdtc.gob.ec', '097371155', 'FEMENINO', 'MEDICO', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('440', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0962223871', 'MILLAN MARTINEZ RONNEYS EDUARDO', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A ESPECIALISTA EN ANESTESIOLOGIA 1', '20/6/1976', 'ronneys.millan@hdtc.gob.ec', 'ronneys.millan@hdtc.gob.ec', '0969549625', 'MASCULINO', 'MEDICO ESPECIALISTA ANASTESEOLOGIA', 'CUARTO NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('441', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0800921033', 'MINA BOLAÑO ANA LUZMILA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'AUXILIAR DE ENFERMERIA', '29/5/1989', 'ana.mina@hdtc.gob.ec', 'analuz_mina24@hotmail.com', '0988955310', 'FEMENINO', 'TECNICO EN ENFERMERIA', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('442', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802280123', 'MINA CAICEDO MARIA EUGENIA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '14/9/1990', 'maria.mina@hdtc.gob.ec', 'maeumica_27@hotmail.com', '0993640248', 'FEMENINO', 'TECNICO EN ENFERMERIA', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('443', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0800617391', 'MINA RIOS NANCY MERCEDES', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A ESPECIALISTA EN PEDIATRIA 1', '18/7/1961', 'nancy.mina@hdtc.gob.ec', 'nancy.mina@hdtc.gob.ec', '0998044574', 'FEMENINO', 'MEDICO/A ESPECIALISTA EN PEDIATRIA ', 'CUARTO NIVEL', 'X', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('444', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0800791865', 'MINA VALENCIA JORGE ARGELIO', 'GESTION ADMINISTRATIVA', 'AUXILIAR ADMINISTRATIVO DE SALUD DEL SECTOR SALUD', '10/9/1978', 'jorge.mina@hdtc.gob.ec', 'nikktagt@hotmail.com', '0968180917', 'MASCULINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('445', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802410092', 'MINOTA SIMISTERRA ANNY MARIA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'AUXILIAR DE ENFERMERIA', '14/9/1990', 'anni.minota@hdtc.gob.ec', 'anni.minota@hdtc.gob.ec', '0995941415', 'FEMENINO', 'TECNICO EN ENFERMERIA', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('446', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801619073', 'MOGOLLON CORTES SUSANA MARIA', 'GESTIÓN DE PROCESOS DE APOYO DIAGNÓSTICO Y TERAPÉUTICO', 'TECNOLOGO MEDICO EN ANESTESIOLOGIA', '9/10/1971', 'susana.mogollon@hdtc.gob.ec', 'sumogollon@yahoo.es', '0997057744', 'FEMENINO', 'TECNOLOGO MEDICO EN ANESTESIOLOGIA', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('447', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0151871829', 'MOLINA PEÑALOZA LUIS EDUARDO', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '2/7/1970', 'luis.molina@hdtc.gob.ec', 'luis.molina@hdtc.gob.ec', '0994629748', 'MASCULINO', 'MEDICO', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('448', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802466094', 'MOLINA VELIS CARLOS GERMANICO', 'GESTION DE TALENTO HUMANO', 'ANALISTA DE SEGURIDAD OCUPACIONAL', '28/8/1987', 'carlos.molina@hdtc.gob.ec', 'carlos.molina@hdtc.gob.ec', '0987966114', 'MASCULINO', 'INGENIERO DE MANTENIMIENTO', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('449', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803127539', 'MONROY SOLIS LENNY PAMELA', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '26/12/1982', 'lenny.monroy@hdtc.gob.ec', 'PAMELONGORIS@HOTMAIL.COM', '0994808571', 'FEMENINO', 'MEDICO GENERAL EN FUNCIONES HOSPITALARIAS', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('450', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802786350', 'MONRROY GEORGE ROSA ANGELA', 'LABORATORIO', 'AUXILIAR DE LABORATORIO', '11/12/1982', 'rosa.monrroy@hdtc.gob.ec', 'rosamonrroy@live.com', '0980402828', 'FEMENINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('451', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1751277094', 'MONTALVAN NELSON GEOVANNY', 'GESTION DE CALIDAD', 'EPIDEMIÓLOGO/A DE VIGILANCIA HOSPITALARIA', '27/1/1962', 'geovanny.montalvan@hdtc.gob.ec', 'nelson.montalvan@hdtc.gob.ec', '0980457481', 'MASCULINO', 'MEDICO ESPECIALISTA CIRUGIA GENERAL', 'CUARTO NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('452', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802287441', 'MONTAÑO BALLESTEROS MIRIAN MARIBEL', 'GESTION FINANCIERA', 'ANALISTA DE CONTABILIDAD 1', '4/10/1979', 'mirian.montaño@hdtc.gob.ec', 'antonellas18@hotmail.com.com', '0989558581', 'FEMENINO', 'S/N', 'BACHILLER', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('453', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803546647', 'MONTAÑO GONZALES YASMIN MARGARITA', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '15/8/1985', 'yasmin.montano@hdtc.gob.ec', 'yasmin.montano@hdtc.gob.ec', '0968594653', 'FEMENINO', 'MEDICO', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('454', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0701546707', 'MONTAÑO RODRIGUEZ DENNIS VIOLETA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'AUXILIAR DE ENFERMERIA', '16/7/1979', 'dennis.montano@hdtc.gob.ec', 'dennisvioleta@yahoo.es', '094161869', 'FEMENINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('455', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802200154', 'MONTAÑO ROLDAN ROBERTO EDWIN', 'GESTION DE TECNOLOGIAS DE LA INFORMACION Y COMUNICACIONES', 'ANALISTA DE REDES, COMUNICACIONES E INFRAESTRUCTURA', '26/9/1979', 'roberto.montaño@hdtc.gob.ec', 'roberto_edwin1979@hotmail.com', '0997153938', 'MASCULINO', 'LICENCIADO EN CIENCIAS DE LA EDUCACION MENCION INFORMATICA EDUCATIVA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('456', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802635540', 'MONTAÑO TENORIO XIMENA FABRICIA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '26/7/1982', 'ximena.montaño@hdtc.gob.ec', 'guadaenferforever@hotmail.com', '062722778', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('457', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803225630', 'MONTERO MEJIA CARLOS ANDRES', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '16/11/1989', 'carlos.montero@hdtc.gob.ec', 'dr.carlosmonteromejia@gmail.com', '0996962399', 'MASCULINO', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIA 1', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('458', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0800827693', 'MONTES DELGADO SORAYA BRACILIA', 'GESTIÓN DE PROCESOS DE APOYO DIAGNÓSTICO Y TERAPÉUTICO', 'PSICOLOGO/A CLINICO/A 3', '25/8/1973', 'soraya.montes@hdtc.gob.ec', 'maria.montes@hdtc.gob.ec', '062995100', 'FEMENINO', 'PSICOLOGO/A CLINICO/A ', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('459', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803151661', 'MONTES RODRIGUEZ SHIRLEY ELENA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '16/6/1992', 'shirley.montes@hdtc.gob.ec', 'shirleyelenam@gmail.com', '0986850641', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('460', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803228642', 'MONTESUMA CHARCOPA KAREN ELENA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '24/12/1985', 'karen.montesuma@hdtc.gob.ec', 'karocha-24@hotmail.com', '0959151236', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('461', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1718558172', 'MONTUFAR ALBUJA PATRICIO NICOLAS', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '11/12/1989', 'patricio.montufar@hdtc.gob.ec', 'acostaferm@gmail.com', '0984657587', 'MASCULINO', 'MEDICO', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('462', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802816033', 'MOPOSITA ESTUPIÑAN SAMIRA DESSIRE', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '28/7/1979', 'samira.moposita@hdtc.gob.ec', 'samiritadessy@hotmail.com', '0982899709', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('463', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1309781423', 'MORA CARRANZA OSCAR ELOY', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '15/8/1985', 'oscar.mora@hdtc.gob.ec', 'caosmoleloy@hotmail.com', '0999617058', 'MASCULINO', 'MEDICO GENERAL EN FUNCIONES HOSPITALARIAS', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('464', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801432485', 'MORA DROUET ELITA DE LAS MERCEDES', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A ESPECIALISTA EN GINECOLOGIA 1', '31/10/1973', 'elita.mora@hdtc.gob.ec', 'dra.elitamora@hotmail.com', '0997559164', 'FEMENINO', 'MEDICO/A ESPECIALISTA EN GINECOLOGIA ', 'CUARTO NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('465', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '046432337', 'MORALES DE CARDOZO ELEIDI', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '8/2/1989', 'eleidi.morales@hdtc.gob.ec', 'draeleidimorales@hotmail.com', '0989975227', 'FEMENINO', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIA 1', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('466', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1202688121', 'MORANTE MONTIEL MARIA EUGENIA', 'GERENCIA ', 'ANALISTA DE PLANIFICACION, SEGUIMIENTO Y EVALUACION DE LA GESTION 3', '1/1/1968', 'maria.morante@hdtc.gob.ec', 'memorante@hotmail.com', '0989225131', 'FEMENINO', 'DIPLOMA SUPERIOR EN GESTION Y EVALUACION DE PROYECTOS', 'CUARTO NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('467', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0800923252', 'MOREIRA PROAÑO GIL EDILBERTO', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A ESPECIALISTA EN GINECOLOGIA 1', '02/25/1964', 'gil.moreira@hdtc.gob.ec', 'gilmoteroiraproano@yahoo.es', '099937277', 'MASCULINO', 'MEDICO/A ESPECIALISTA EN GINECOLOGIA ', 'CUARTO NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('468', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802598524', 'MOREIRA QUIÑONEZ ADAN SALVADOR', 'GESTION ADMINISTRATIVA ', 'ANALISTA DE MANTENIMIENTO', '10/12/1983', 'adan.moreira@hdtc.gob.ec', 'adanmoreira@hotmail.com', '0995015489', 'MASCULINO', 'MEDICO GENERAL EN FUNCIONES HOSPITALARIAS', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('469', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1708327430', 'MORENO ABAD SEGUNDO BENITO', 'GESTION DE CUIDADOS DE ENFERMERIA', 'AUXILIAR ADMINISTRATIVO DE SALUD DEL SECTOR SALUD', '7/3/1963', 'segundo.moreno@hdtc.gob.ec', 'ositabella1982@hotmail.com', '097597568', 'MASCULINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('470', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1804763900', 'MORENO VARGAS JAZMINA ALEXANDRA', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '15/8/1985', 'jazmina.moreno@hdtc.gob.ec', 'jazmina.moreno@hdtc.gob.ec', '0939573917', 'FEMENINO', 'MEDICO CIRUJANO', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('471', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803516855', 'MORILLO CABRERA NATASHA JAZMIN', 'TRANSFUSIONAL', 'TECNOLOGO MEDICO DE MEDICINA TRANSFUSIONAL 1', '24/4/1990', 'natasha.morillo@hdtc.gob.ec', 'tashita.morillo@hdtc.gob.ec', '0995666820', 'FEMENINO', 'TECNOLOGO MEDICO DE REHABILITACION Y TERAPIA FISICA 3', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('472', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802686725', 'MOSCOSO BENITEZ YURI MARGARITA', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '15/9/1985', 'yuri.moscoso@hdtc.gob.ec', 'kristycardenasalvarado@gmail.com', '098255701', 'FEMENINO', 'MEDICO GENERAL EN FUNCIONES HOSPITALARIAS', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('473', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802130484', 'MOSQUERA CRUEL KARLA TERESA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '29/9/1991', 'karla.mosquera@hdtc.gob.ec', 'redaxelgy@hotmail.com', '0997251157', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('474', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803439728', 'MOSQUERA GUERRERO LEIVI ROCIO', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '4/11/1989', 'leivi.mosquera@hdtc.gob.ec', 'leivirociomosgue@gmail.com', '0968263505', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('475', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801107848', 'MOSQUERA VALENCIA DORIS GRACIELA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'AUXILIAR ADMINISTRATIVO DE SALUD DEL SECTOR SALUD', '11/12/1982', 'doris.mosquera@hdtc.gob.ec', 'ositabella1982@hotmail.com', '0994275323', 'FEMENINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('476', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801925090', 'MUÑOZ QUIÑONEZ JESSICA ALEXANDRA', 'LABORATORIO', 'AUXILIAR ADMINISTRATIVO DE SALUD DEL SECTOR SALUD', '11/12/1982', 'jessica.muñoz@hdtc.gob.ec', 'jamunozq_18@hotmail.com', '062995100', 'FEMENINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('477', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801596610', 'MUÑOZ QUIÑONEZ RAQUEL ZENEIDA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'AUXILIAR DE ENFERMERIA', '21/8/1972', 'raquel.muñoz@hdtc.gob.ec', 'raquel@hotmail.com', '062995100', 'FEMENINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('478', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0401386305', 'NARVAEZ IBARRA ALVARO ANDRES', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '15/8/1985', 'alvaro.narvaez@hdtc.gob.ec', 'narvaez@hotmail.com', '062722778', 'MASCULINO', 'MEDICO GENERAL EN FUNCIONES HOSPITALARIAS', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('479', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1759528142', 'NAVARRO JAZPE FRANCYS MARIA', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '15/8/1985', 'francys.navarro@hdtc.gob.ec', 'carla.quevedo@hdtc.gob.ec', '0990407307', 'FEMENINO', 'MEDICO GENERAL EN FUNCIONES HOSPITALARIAS', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('480', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801131244', 'NAVIA BATIOJA RUTH NOEMI', 'GESTION ADMINISTRATIVA ', 'ANALISAT DE SERVICIOS GENERALES 1', '23/11/1964', 'ruth.navia@hdtc.gob.ec', 'naviabatioja@gmail.com', '094772684', 'FEMENINO', 'MEDICO GENERAL EN FUNCIONES HOSPITALARIAS', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('481', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801588104', 'NAZARENO ALARCON MARIA ADELA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'AUXILIAR DE ENFERMERIA', '12/11/1986', 'maria.nazareno@hdtc.gob.ec', 'adelanazareno1966@gmail.com', '0979848110', 'FEMENINO', 'TECNICO EN ENFERMERIA', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('482', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803058239', 'NAZARENO ARROYO MARIA DESSIRE', 'LABORATORIO', 'TECNOLOGO MEDICO DE LABORATORIO 3', '15/3/1987', 'maria.nazareno@hdtc.gob.ec', 'madenaart1987@hotmail.com', '062995100', 'FEMENINO', 'TECNOLOGO MEDICO DE LABORATORIO ', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('483', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0804337293', 'NAZARENO BONE MARIA ALEXANDRA', 'GERENCIA ', 'ANALISTA DE ATENCION AL USUARIO/A', '19/12/1991', 'maria.nazareno@hdtc.gob.ec', 'alexandra.nazareno@yahoo.com', '0996695241', 'FEMENINO', 'ING. MARKETING Y PUBLICIDAD', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('484', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802478255', 'NAZARENO HUILA MAYRA LAURA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '8/11/1983', 'mayra.nazareno@hdtc.gob.ec', 'guadaenferforever@hotmail.com', '062727497', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('485', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803021195', 'NAZARENO MERCADO CECIBEL', 'LABORATORIO', 'TECNOLOGO MEDICO DE LABORATORIO 3', '24/5/1987', 'cecibel.nazareno@hdtc.gob.ec', 'cecibeljuanita@hotmail.com', '062995100', 'FEMENINO', 'TECNOLOGO MEDICO DE LABORATORIO ', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('486', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803522952', 'NAZARENO MINA AURELIA EULOFIA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '9/7/1990', 'aurelia.nazareno@hdtc.gob.ec', 'aureliasoltera@hotmail.es', '0991566912', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('487', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802160135', 'NAZARENO POROZO RAMON EDUARDO', 'GESTION ADMINISTRATIVA', 'AUXILIAR ADMINISTRATIVO DE SALUD DEL SECTOR SALUD', '4/5/1978', 'ramon.nazareno@hdtc.gob.ec', 'sonia.cedeno@hdtc.gob.ec', '0980541389', 'MASCULINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('488', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802583484', 'NAZARENO QUIÑONEZ NADINE JANNETTY', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '11/12/1982', 'nadine.nazareno@hdtc.gob.ec', 'nadine_1901@hotmail.com', '0997465400', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('489', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0804007623', 'NIEVE HURTADO XIOMARA CAROLINA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'AUXILIAR DE ENFERMERIA', '25/11/1990', 'xiomara.nieve@hdtc.gob.ec', 'nieve.carolina@yahoo.es', '0982347750', 'FEMENINO', 'TECNICO EN ENFERMERIA', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('490', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803475268', 'NIEVES QUIÑONEZ JOSUE EZEQUIEL', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '18/8/1991', 'josue.nieves@hdtc.gob.ec', 'calaysabel1@gmail.com', '0968658605', 'MASCULINO', 'MEDICO', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('491', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803170240', 'NUÑEZ GAMBOA JONATHAN JOSUE', 'GESTIÓN DE PROCESOS DE APOYO DIAGNÓSTICO Y TERAPÉUTICO', 'TECNOLOGO MEDICO DE MEDICINA TRANSFUSIONAL 1', '11/8/1984', 'jonathan.nuñez@hdtc.gob.ec', 'chioely3@hotmail.com', '0999192444', 'MASCULINO', 'TECNOLOGO MEDICO DE MEDICINA TRANSFUSIONAL ', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('492', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802276097', 'OBANDO COLOBON EDDY LUIS', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'PARAMEDICO/A 2', '27/12/1978', 'eddy.obando@hdtc.gob.ec', 'lenindepaul@hotmail.com', '0990498830', 'MASCULINO', 'PARAMEDICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('493', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802947317', 'OBANDO MENDEZ ALFREDO GEOVANNY', 'GESTION ADMINISTRATIVA', 'AUXILIAR ADMINISTRATIVO DE SALUD DEL SECTOR SALUD', '19/1/1984', 'alfredo.obando@hdtc.gob.ec', 'alfredo.obando@hdtc.gob.ec', '0993338957', 'MASCULINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('494', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802896928', 'OLAVE QUINTERO DAYANARA ERIKA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'AUXILIAR DE ENFERMERIA', '5/6/1982', 'dayana.olave@hdtc.gob.ec', 'erikaolave0801@gmail.com', '0981698867', 'FEMENINO', 'TECNICO EN ENFERMERIA', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('495', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802247338', 'OLIVEROS REALPE LAURA CECILIA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'AUXILIAR DE ENFERMERIA', '30/5/1957', 'laura.oliveros@hdtc.gob.ec', 'capri3029@hotmail.com', '062995100', 'FEMENINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('496', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802146373', 'ORDOÑEZ BURGOS NUBIA DEL CARMEN', 'GESTION DE TRABAJO SOCIAL', 'TRABAJADOR/A SOCIAL 1', '3/5/1977', 'nubia.carmen@hdtc.gob.ec', 'trabajosocial_hdtc@hotmail.com', '0989225131', 'FEMENINO', 'TRABAJADORA SOCIAL', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('497', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0800463192', 'ORDOÑEZ PALOMINO CARMEN REBECA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'AUXILIAR DE ENFERMERIA', '3/12/1990', 'carmen.ordoñez@hdtc.gob.ec', 'eltiempo27@yahoo.com', '0990610779', 'FEMENINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('498', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802071365', 'ORDOÑEZ SANCLEMENTE VICTORIA XIMENA', 'FARMACIA, INSUMOS, DISPOSITIVOS MEDICOS Y REACTIVOS', 'AUXILIAR DE FARMACIA', '2/5/1977', 'victoria.ordonez@hdtc.gob.ec', 'VIXIORSA@HOTMAIL.ES', '094331888', 'FEMENINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('499', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802595371', 'OREJUELA FIALLOS VICTOR SAMUEL', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '4/8/1987', 'victor.orejuela@hdtc.gob.ec', 'victor-of87@hotmail.com', '0997274384', 'MASCULINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('500', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0850095191', 'ORELLANA VILA JORGE DAVID', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '31/5/1994', 'jorge.orellana@hdtc.gob.ec', 'donda941@hotmail.com', '062995100', 'MASCULINO', 'LICENCIADO EN ENFERMERÍA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('501', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801329517', 'ORTEGA ARAUJO LORAYNE BETZABE', 'NUTRICION', 'NUTRICIONISTA 1', '2/6/1974', 'lorayne.ortega@hdtc.gob.ec', 'ositabella1982@hotmail.com', '099864972', 'FEMENINO', 'TECNOLOGA MEDICA EN DIETETICA Y NUTRICION', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('502', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802326058', 'ORTEGA RAMIREZ DALILA AZUCENA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '11/12/1982', 'dalila.ortega@hdtc.gob.ec', 'susanita0612@yahoo.com', '0990634502', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('503', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802925115', 'ORTIZ ANGULO YUNANI ELIZABETH', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '13/5/1985', 'yunani.ortiz@hdtc.gob.ec', 'yunani-ortiz@hotmail.com', '0991628086', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('504', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803050848', 'ORTIZ BONE MARIUXI ALEXANDRA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'AUXILIAR DE ENFERMERIA', '29/9/1987', 'mariuxi.ortiz@hdtc.gob.ec', 'mariuxi.ortiz@hdtc.gob.ec', '0997025597', 'FEMENINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('505', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0800698250', 'ORTIZ CABEZA SEGUNDO ANIBAL', 'GESTION DE ADMISIONES', 'ASISTENTE DE ADMISIONES', '5/1/1994', 'segundo.ortiz@hdtc.gob.ec', 'segundoanibalortiz@gmail.com', '0991180239', 'MASCULINO', 'S/N', 'BACHILLER', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('506', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801908658', 'ORTIZ CABEZAS MARJORIE ELAINE', 'GESTION ADMINISTRATIVA', 'AUXILIAR ADMINISTRATIVO DE SALUD DEL SECTOR SALUD', '11/12/1982', 'marjorie.ortiz@hdtc.gob.ec', 'marjorie_ortiz@yahoo.es', '0988366823', 'FEMENINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('507', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803113612', 'ORTIZ CUERO CAROLINA TATIANA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '23/5/1987', 'carolina.ortiz@hdtc.gob.ec', 'guadaenferforever@hotmail.com', '062727497', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('508', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0804231272', 'ORTIZ DELGADO ELKIN ANDRES', 'TRANSFUSIONAL', 'TECNOLOGO MEDICO DE MEDICINA TRANSFUSIONAL 1', '19/8/1970', 'elkin.ortiz@hdtc.gob.ec', 'elkinltigre@hotmail.com', '0981324808', 'MASCULINO', 'TECNOLOGO MEDICO DE MEDICINA TRANSFUSIONAL ', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('509', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1715642425', 'ORTIZ FLORES DORYS ELIZABETH', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A ESPECIALISTA EN GINECOLOGIA 1', '15/1/1985', 'dorys.ortiz@hdtc.gob.ec', 'DORIS1015@HOTMAIL.COM', '095624766', 'FEMENINO', 'MEDICO ESPECIALISTA GINECOLOGIA', 'CUARTO NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('510', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801652017', 'ORTIZ GODOY MARIA ESPERANZA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'AUXILIAR DE ENFERMERIA', '1/8/1970', 'maria.ortiz@hdtc.gob.ec', 'eltiempo27@yahoo.com', '062757038', 'FEMENINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('511', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803717610', 'ORTIZ GOMEZ ERIKA ROSARIO', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '15/5/1973', 'erika.ortiz@hdtc.gob.ec', 'erikaortizgomez@outlook.es', '0968680438', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('512', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801280082', 'ORTIZ MORALES JULIO ALBERTO', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '2/4/1968', 'julio.ortiz@hdtc.gob.ec', 'julioafro5@hotmail.com', '0982740585', 'MASCULINO', 'ENFERMERO/A 3', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('513', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802067538', 'ORTIZ NAZARENO CLAUDIA LILIANA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'AUXILIAR DE ENFERMERIA', '5/11/1975', 'claudia.ortiz@hdtc.gob.ec', 'claudijislyn05@hotmail.com', '0989961805', 'FEMENINO', 'TECNICO EN ENFERMERIA', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('514', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802128652', 'ORTIZ PORTOCARRERO CRISTINA LORENA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '12/6/1983', 'cristina.ortiz@hdtc.gob.ec', 'guadaenferforever@hotmail.com', '0968680438', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('515', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0800774879', 'ORTIZ QUINTERO MODESTA ATOCHA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '11/12/1982', 'modesta.ortiz@hdtc.gob.ec', 'modestaortiz@outlook.com', '0990590938', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('516', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801852716', 'ORTIZ QUIÑONEZ MARIS LORENA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'AUXILIAR DE ENFERMERIA', '8/11/1996', 'maris.ortiz@hdtc.gob.ec', 'marisortiz1973@hotmail.com', '0988366823', 'FEMENINO', 'TECNICO EN ENFERMERIA', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('517', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801435603', 'ORTIZ TENORIO RICHARD', 'FARMACIA, INSUMOS, DISPOSITIVOS MEDICOS Y REACTIVOS', 'QUIMICO / BIOQUIMICO FARMACEUTICO 1', '21/4/1969', 'richard.tenorio@hdtc.gob.ec', 'richardtenorio@hotmail.com', '0986551475', 'MASCULINO', 'QUIMICO / BIOQUIMICO FARMACEUTICO ', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('518', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1757511876', 'PACHECO ATAUCHI ALVARO', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A ESPECIALISTA EN GINECOLOGIA 1', '27/8/1993', 'alvaro.pacheco@hdtc.gob.ec', 'dralvaricoque@hotmail.com', '0987640335', 'MASCULINO', 'MEDICO/A ESPECIALISTA EN GINECOLOGIA ', 'CUARTO NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('519', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802504753', 'PACHECO MENDOZA LIA YANINA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '11/10/1981', 'lia.pacheco@hdtc.gob.ec', 'liayanip@hotmail.com', '099457793', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('520', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802363234', 'PACHECO SUAREZ TATIANA JUDITH', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '21/10/1981', 'tatiana.pacheco@hdtc.gob.ec', 'munequita81@hotmail.com', '0999131562', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('521', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802716456', 'PACHECO VASQUEZ LENIN LEONARD', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A ESPECIALISTA EN MEDICINA INTERNA 1', '24/4/1987', 'lenin.pacheco@hdtc.gob.ec', 'logosblanco@gmail.com', '0983319148', 'MASCULINO', 'MEDICO/A ESPECIALISTA EN MEDICINA INTERNA 1', 'CUARTO NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('522', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1721228284', 'PADILLA BARRAGAN DANIEL ESTEBAN', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A ESPECIALISTA EN GINECOLOGIA 1', '17/3/1970', 'daniel.padilla@hdtc.gob.ec', 'daniel_8mh@hotmail.com', '0995487001', 'MASCULINO', 'MEDICO ESPECIALISTA GINECOLOGIA', 'CUARTO NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('523', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0800838724', 'PADILLA CHUQUIMARCA ROSA EULALIA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '27/6/1964', 'rosa.padilla@hdtc.gob.ec', 'guadaenferforever@hotmail.com', '099555169', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('524', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802365932', 'PADILLA SEGURA MARJORIE ELEONORA', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '3/9/1984', 'marjorie.padilla@hdtc.gob.ec', 'mayitoeleonora@hotamail.com', '062995100', 'FEMENINO', 'MEDICO', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('525', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803268838', 'PALACIO GONZALEZ DENISSE NADINE', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '28/11/1997', 'dennisse.palacio@hdtc.gob.ec', 'denissepalaciog@gmail.com', '0968594653', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('526', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802000703', 'PALACIOS QUIÑONEZ EDISON ALEXANDER', 'FARMACIA, INSUMOS, DISPOSITIVOS MEDICOS Y REACTIVOS', 'AUXILIAR ADMINISTRATIVO DE SALUD DEL SECTOR SALUD', '5/5/1978', 'edison.palacios@hdtc.gob.ec', 'palaciose@yahoo.com', '093426545', 'MASCULINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('527', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803522960', 'PALACIOS QUIÑONEZ SUGEY ANDREA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '4/4/1991', 'sugey.palacios@hdtc.gob.ec', 'sugeypalacios1989@hotmail.com', '0989486375', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('528', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803473222', 'PALADINES VELEZ GEOVANNY ANTONIO', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '20/12/1991', 'geovanny.paladines@hdtc.gob.ec', 'gapv2012@hotmail.com', '0999124233', 'MASCULINO', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIA 1', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('529', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803608207', 'PALADINES VELEZ NELLY BETSABETH', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '13/9/1987', 'nely.paladinez@hdtc.gob.ec', 'nely.paladinez@hdtc.gob.ec', '0988670574', 'FEMENINO', 'MEDICO GENERAL EN FUNCIONES HOSPITALARIAS', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('530', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803220888', 'PALOMINO BONE YELITZA YAMILES', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '20/4/1973', 'yelitza.palomino@hdtc.gob.ec', 'yelitza.palomino@hdtc.gob.ec', '0997057744', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('531', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802029884', 'PALOMINO COLORADO ANGELICA MERCEDES', 'MANTENIMIENTO', 'TECNICO DE MANTENIMIENTO', '11/12/1982', 'angelica.palomino@hdtc.gob.ec', 'angelicap@yahoo.es', '062995100', 'FEMENINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('532', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0919981662', 'PANCHANA TORRES RAUL ELIAS', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '11/12/1982', 'raul.panchana@hdtc.gob.ec', 'raulias5@gmail.com', '0991530684', 'MASCULINO', 'MEDICO GENERAL EN FUNCIONES HOSPITALARIAS', 'TERCER NIVEL', 'X', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('533', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0913049557', 'PANCHANO LARA INES CAROLINA', 'GESTION DE CALIDAD', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '11/12/1982', 'ines.panchano@hdtc.gob.ec', 'icplara@yahoo.com', '0984101678', 'FEMENINO', 'MEDICO GENERAL EN FUNCIONES HOSPITALARIAS', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('534', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0800901704', 'PANEZO HURTADO MARBIS ALIDA', 'GESTION ADMINISTRATIVA', 'AUXILIAR ADMINISTRATIVO DE SALUD DEL SECTOR SALUD', '24/8/1986', 'marbis.panezo@hdtc.gob.ec', 'sonia.cedeno@hdtc.gob.ec', '0994528826', 'FEMENINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('535', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802075804', 'PAREDES BEDOYA KARLA KARINA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '11/12/1982', 'karla.paredes@hdtc.gob.ec', 'savinakalu@hotmail.com', '0939204235', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('536', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802869164', 'PARRA AVEIGA KAROL BRIGITTE', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '11/12/1982', 'karol.parra@hdtc.gob.ec', 'karolitaojitos@hotmail.com', '0980376552', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('537', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802290015', 'PARRAGA ZAMBRANO INDAURO INDULFO', 'MANTENIMIENTO', 'AUXILIAR ADMINISTRATIVO DE SALUD DEL SECTOR SALUD', '24/8/1978', 'indauro.parraga@hdtc.gob.ec', 'indauro.parraga@hdtc.gob.ec', '0986041168', 'MASCULINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('538', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0804376762', 'PARRALES VASQUEZ FELIPE ANDRES', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '14/9/1993', 'felipe.parrales@hdtc.gob.ec', 'felipeparrale14@hotmail.com', '0982879255', 'MASCULINO', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIA 1', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('539', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803868785', 'PASQUEL CARVAJAL GABRIELA STEFANIA', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '13/8/1991', 'gabriela.pasquel@hdtc.gob.ec', 'gabriela.pasquel@hdtc.gob.ec', '0991181897', 'FEMENINO', 'MEDICO/A GENERAL ', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('540', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802356436', 'PATIÑO REALPE NADYA GABRIELA', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '15/8/1985', 'nadya.patiño@hdtc.gob.ec', 'nadya_pr21@hotmail.com', '0995556421', 'FEMENINO', 'MEDICO GENERAL EN FUNCIONES HOSPITALARIAS', 'TERCER NIVEL', 'X', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('541', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803036672', 'PAZ MORAN VERONICA ALEXANDRA', 'GESTIÓN DE PROCESOS DE APOYO DIAGNÓSTICO Y TERAPÉUTICO', 'TECNOLOGO MEDICO DE LABORATORIO 3', '28/9/1987', 'verónica.paz@hdtc.gob.ec', 'veronikaalexandra@hotmail.com', '062995100', 'FEMENINO', 'TECNOLOGO MEDICO DE LABORATORIO ', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('542', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801164195', 'PAZMIÑO GALARZA INES VIOLETA', 'REHABILITACION Y TERAPIA FISICA', 'TECNOLOGO MEDICO DE REHABILITACION Y TERAPIA FISICA 3', '29/1/1966', 'ines.pazmiño @hdtc.gob.ec', 'vioacuario@yahoo.es', '062995100', 'FEMENINO', 'LICENCIADA EN TERAPIA FISICA ', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('543', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1311775967', 'PAZMIÑO RUIZ ROBERTH VICENTE', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '30/5/1988', 'roberth.pazmiño@hdtc.gob.ec', 'loganpaz@hotmail.com', '0958970211', 'MASCULINO', 'MEDICO GENERAL EN FUNCIONES HOSPITALARIAS', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('544', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802178608', 'PEÑAFIEL ROLDAN RITA ALEJANDRA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '15/1/1988', 'rita.penafiel@hdtc.gob.ec', 'rita.penafiel@hdtc.gob.ec', '0939454968', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('545', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1312587916', 'PEÑARRIETA JAMA PABLO GEOVANNY', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '15/8/1985', 'pablo.peñarrieta@hdtc.gob.ec', 'drpabropenarrieta@gmail.com', '0967399991', 'MASCULINO', 'MEDICO GENERAL EN FUNCIONES HOSPITALARIAS', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('546', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802784587', 'PERDOMO ESTUPIÑAN KARINA ELIZABETH', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '17/9/1982', 'karina.perdomo@hdtc.gob.ec', 'ekary.82@live.com', '0997791323', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('547', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802471086', 'PEREA CASTAÑEDA FRANCO NEY', 'LABORATORIO', 'TECNOLOGO MEDICO DE LABORATORIO 3', '12/2/1980', 'franco.perea@hdtc.gob.ec', 'franco.perea@vicepresidencia.gob.ec', '0982228654', 'MASCULINO', 'TECNOLOGO MEDICO DE LABORATORIO ', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('548', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803782275', 'PEREA CASTRO JEAN PAUL', 'GESTION DE TALENTO HUMANO', 'ANALISTA DE TALENTO HUMANO 1', '17/8/1991', 'jean.perea@hdtc.gob.ec', 'jeanpoolperea2@gmail.com', '0939470705', 'MASCULINO', 'INGENIERO EN ADMINISTRACION DE EMPRESAS', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('549', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0800546004', 'PEREA CORREA FRANKLIN ARTURO', 'MANTENIMIENTO', 'CHOFER DE AMBULANCIA DEL SECTOR SALUD', '11/12/1982', 'franklin.perea@hdtc.gob.ec', 'talentohumano@gmail.com', '09982181882', 'MASCULINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('550', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1758725434', 'PEREZ DANIEL JOSE', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '17/11/1992', 'jose.perez@hdtc.gob.ec', 'jose.perez@hdtc.gob.ec', '0994629748', 'MASCULINO', 'MEDICO', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('551', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1757107121', 'PEREZ LEON ABEL', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A ESPECIALISTA EN PSIQUIATRIA 1', '17/9/1969', 'abel.perez@hdtc.gob.ec', 'abel.perez@hdtc.gob.ec', '0984038892', 'MASCULINO', 'MEDICO ESPECIALISTA EN PSIQUIATRIA', 'CUARTO NIVEL', 'X', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('552', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '089940516', 'PEREZ PADRON MARIA CANDELARIA', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A ESPECIALISTA EN GINECOLOGIA 1', '11/9/1980', 'maria.perez@hdtc.gob.ec', 'maria.perez@hdtc.gob.ec', '0969981795', 'FEMENINO', 'MEDICO/A ESPECIALISTA EN GINECOLOGIA ', 'CUARTO NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('553', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0959881327', 'PEREZ PEREZ YENICEY ROSA', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A ESPECIALISTA EN GINECOLOGIA 1', '11/12/1982', 'yenicey.perez@hdtc.gob.ec', 'yeni218002@gmail.com', '0998292553', 'FEMENINO', 'MEDICO/A ESPECIALISTA EN GINECOLOGIA ', 'CUARTO NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('554', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1758354896', 'PEREZ ROMERO BEATRIZ', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '21/11/1991', 'betriz.perez@hdtc.gob.ec', 'ariana.214@hotmail.com', '0984457595', 'FEMENINO', 'DOCTORA EN MEDICINA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('555', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801878315', 'PEREZ TREJO NELLY MIREYA', 'REHABILITACION Y TERAPIA FISICA', 'TERAPISTA DE LENGUAJE Y AUDITIVA', '7/2/1981', 'nelly.perez@hdtc.gob.ec', 'nperez@hotmail.com', '097738524', 'FEMENINO', 'TERAPISTA DE LENGUAJE Y AUDITIVA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('556', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801871534', 'PERLAZA CHARCOPA ANNABEL DEL ROCIO', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '29/12/1973', 'annabel.perlaza@hdtc.gob.ec', 'anabeldelrocio1973@hotmail.com', '098026519', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('557', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803007798', 'PERLAZA PATIÑO LUIS ARMANDO', 'GESTION ADMINISTRATIVA', 'AUXILIAR ADMINISTRATIVO DE SALUD DEL SECTOR SALUD', '12/6/1990', 'luis.perlaza@hdtc.gob.ec', 'luisarmando_1989@outlook.com', '0969642280', 'MASCULINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('558', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0104017009', 'PETER MOREIRA KATHERINE MARIBEL', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '11/12/1982', 'katherine.peter@hdtc.gob.ec', 'herinen.peter@hotmail.com', '0984432683', 'FEMENINO', 'MEDICO GENERAL EN FUNCIONES HOSPITALARIAS', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('559', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0800675480', 'PILLIGUA CEDEÑO LEFIA DEL CARMEN', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '16/1/1961', 'lefia.pilligua@hdtc.gob.ec', 'CARMENPILLIGUA@HOTMAIL.COM', '0991737703', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('560', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802286849', 'PINCAY BONE BYRON JOHAN', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '24/1/1984', 'byron.pincay@hdtc.gob.ec', 'byron_johan@hotmail.com', '0959522864', 'MASCULINO', 'MEDICO GENERAL EN FUNCIONES HOSPITALARIAS', 'TERCER NIVEL', 'X', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('561', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802642553', 'PINEDA NARVAEZ ROBER', 'GESTION ADMINISTRATIVA', 'AUXILIAR ADMINISTRATIVO DE SALUD DEL SECTOR SALUD', '21/5/1985', 'rober.pineda@hdtc.gob.ec', 'pinedan@yahoo.es', '098026519', 'MASCULINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('562', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0800401556', 'PIÑEIRO ORDOÑEZ TERESA ANNABETH', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '13/10/1954', 'teresa.piñeiro@hdtc.gob.ec', 'annabethpineiro@hotmail.com', '097745576', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('563', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1311490526', 'PITA AVEIGA CIRLEI ELIZABETH', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '17/11/1971', 'cirlei.pita@hdtc.gob.ec', 'elicirley@hotmail.com', '0994343839', 'FEMENINO', 'MEDICO GENERAL EN FUNCIONES HOSPITALARIAS', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('564', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1721059093', 'PLACENCIA TORRES TAMARA JESAHEL', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A ESPECIALISTA EN EMERGENCIAS Y DESASTRES 1', '4/4/1988', 'tamara.placencia@hdtc.gob.ec', 'tamara.placencia@hdtc.gob.ec', '0998367264', 'FEMENINO', 'MEDICO/A ESPECIALISTA EN EMERGENCIAS Y DESASTRES 1', 'CUARTO NIVEL', 'X', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('565', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802412411', 'PLAZA ESPINOZA CANDY KATHERINE', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '11/12/1982', 'candy.plaza@hdtc.gob.ec', 'dycheloss@hotmail.com', '0981675546', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('566', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801552977', 'PLAZA ORDOÑEZ MARIA DE LOURDES', 'GERENCIA ', 'DIRECTOR/A ASISTENCIAL', '31/1/1972', 'maria.plazaz@hdtc.gob.ec', 'MARYLOUR33@YAHOO.ES', '0983141717', 'FEMENINO', 'MASTER EN MEDICINA TROPICAL', 'CUARTO NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('567', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802118539', 'PONCE SILVA ROLAND PATRICIO', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '5/7/1985', 'roland.ponce@hdtc.gob.ec', 'negreins@gmail.com', '062995100', 'MASCULINO', 'MEDICO GENERAL EN FUNCIONES HOSPITALARIAS', 'TERCER NIVEL', 'X', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('568', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0804318681', 'POVEDA GONZALES VICTOR MANUEL', 'LABORATORIO', 'TECNOLOGO MEDICO DE LABORATORIO 2', '11/12/1982', 'victor.poveda@hdtc.gob.ec', 'vic_pov_58@hotmail.com', '0939349015', 'MASCULINO', 'QUIMICA Y FARMACEUTICA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('569', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801754268', 'POZO TORRES EDISON GABRIEL', 'GESTION DE CUIDADOS DE ENFERMERIA', 'AUXILIAR DE ENFERMERIA', '9/5/1957', 'edison.pozo@hdtc.gob.ec', 'edinson14@hotmail.com', '093944318', 'MASCULINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('570', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801219833', 'PRADO RODRIGUEZ MONNA ELIZABETH', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '9/10/1966', 'monna.prado@hdtc.gob.ec', 'monnaprado@hotmail.com', '062995100', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('571', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802314930', 'PRIAS RAMOS CARLOS VINICIO', 'MANTENIMIENTO', 'TECNICO DE MANTENIMIENTO', '16/3/1971', 'carlos.prias@hdtc.gob.ec', 'ositabella1982@hotmail.com', '0985559142', 'MASCULINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('572', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1758977589', 'PUERTA CLARISA CLARIBETH', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A ESPECIALISTA EN ANESTESIOLOGIA 1', '5/10/1988', 'clarissa.puerta@hdtc.gob.ec', 'clarissa.puerta@hdtc.gob.ec', '0986551475', 'FEMENINO', 'MEDICO ESPECIALISTA ANASTESEOLOGIA', 'CUARTO NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('573', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0301940276', 'QUILLAY CURAY ELIANA ROCIO', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A ESPECIALISTA EN EMERGENCIAS Y DESASTRES 1', '15/7/1986', 'eliana.quillay@hdtc.gob.ec', 'eliana.quillay@hdtc.gob.ec', '0993500142', 'FEMENINO', 'MEDICO/A ESPECIALISTA EN EMERGENCIAS Y DESASTRES 1', 'CUARTO NIVEL', 'X', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('574', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801037516', 'QUINDE MERO JORGE ENRIQUE', 'MANTENIMIENTO', 'CHOFER DE AMBULANCIA DEL SECTOR SALUD', '9/11/1978', 'jorge.quinde.@hdtc.gob.ec', 'giorgeenrrique@hotmail.com', '0969479003', 'MASCULINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('575', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802708065', 'QUINTERO AVILA ERIKA SOFIA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '24/10/1977', 'erika.quintero@hdtc.gob.ec', 'erisofiamor@hotmail.com', '0985377787', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('576', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803187095', 'QUINTERO BAUTISTA AURA MARIA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '14/2/1982', 'aura.quintero@hdtc.gob.ec', 'amqb1998@hotmail.com', '0988060157', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('577', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802552521', 'QUINTERO BUJASE LEANDRA BETZABETH', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '12/9/1986', 'leandra.quintero@hdtc.gob.ec', 'labebe-05@live.com', '0990488993', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('578', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801747437', 'QUINTERO CAICEDO FREDDY FERNANDO', 'GESTION ADMINISTRATIVA', 'AUXILIAR ADMINISTRATIVO DE SALUD DEL SECTOR SALUD', '2/12/1974', 'freddy.quintero@hdtc.gob.ec', 'freddyquintero@yahoo.es', '062995100', 'MASCULINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('579', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1757093370', 'QUINTERO LEONARDO RAFAEL', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A ESPECIALISTA EN CIRUGIA VASCULAR 1', '14/6/1975', 'rafael.quintero@hdtc.gob.ec', 'lqvascular@gmail.com', '0987485856', 'MASCULINO', 'ESPECIALIDAD DE CIRUGIA CARDIOVASCULAR', 'CUARTO NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('580', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801523374', 'QUINTERO SALAZAR MONICA ALEXANDRA', 'GESTION DE TRABAJO SOCIAL', 'TRABAJADOR/A SOCIAL 1', '4/7/1969', 'monica.quintero@hdtc.gob.ec', 'MONICA.QUINTERO@HDTC.GOB.EC', '090111209', 'FEMENINO', 'TRABAJADORA SOCIAL', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('581', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801772724', 'QUINTERO SAMANIEGO TATIANA CLARIZA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '30/12/1986', 'tatiana.quintero@hdtc.gob.ec', 'tatiquintsama@hotmail.com', '0994816651', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('582', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802266049', 'QUINTERO TENORIO CARMEN NARCISA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '26/10/1987', 'carmen.quintero@hdtc.gob.ec', 'rihannamibebe@outlook.es', '0997461571', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('583', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801909771', 'QUINTERO VALENCIA FELICITA CRISTINA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '11/12/1982', 'felicita.quintero@hdtc.gob.ec', 'fcristinaquintero@hotmail.com', '0992263561', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('584', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801909797', 'QUINTERO VALENCIA MARIA DEL CARMEN', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '20/11/1987', 'maria.quintero@hdtc.gob.ec', 'carmenquintero2104@hotmail.com', '0990242848', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('585', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1712490018', 'QUINTERO VARGAS ANGEL ALBERTO', 'GESTION DE ADMISIONES', 'ANALISTA DE ADMISIONES', '11/9/1975', 'angel.quintero@hdtc.gob.ec', 'angel.quintero@dpsesmeraldas.gob.ec', '0980112142', 'MASCULINO', 'S/N', 'BACHILLER', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('586', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0800978280', 'QUINTERO VARGAS NORMA EULALIA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'AUXILIAR DE ODONTOLOGIA', '10/12/1966', 'norma.quintero@hdtc.gob.ec', 'norma-quintero-vargas@hotmail.com', '0995963519', 'FEMENINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('587', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802820142', 'QUINTEROS CAMPOVERDE OSCAR ERNESTO', 'GESTIÓN DE PROCESOS DE APOYO DIAGNÓSTICO Y TERAPÉUTICO', 'NUTRICIONISTA 2', '11/12/1982', 'oscar.quinteros@hdtc.gob.ec', 'oscar.quinteros@hdtc.gob.ec', '062995100', 'MASCULINO', 'LICENCIADA EN NUTRICION Y DIETETICA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('588', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802313932', 'QUIÑONES CORTEZ KARLA HERLINDA', 'GESTION ADMINISTRATIVA', 'AUXILIAR ADMINISTRATIVO DE SALUD DEL SECTOR SALUD', '14/6/1981', 'karla.quiñones@hdtc.gob.ec', 'hospitaldefinatorres_vartsS@yahoo.es', '062995100', 'FEMENINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('589', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802367136', 'QUIÑONEZ ACOSTA VERONICA NEMESIA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '11/12/1982', 'veronica.quiñonez@hdtc.gob.ec', 'veritoquiacosta@hotmail.com', '0995744485', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('590', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802667741', 'QUIÑONEZ AGRIS LIDA DINORA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '30/8/1982', 'lida.quiñonez@hdtc.gob.ec', 'guadaenferforever@hotmail.com', '093301365', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('591', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801553819', 'QUIÑONEZ ALCIVAR VICTORIA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'AUXILIAR DE ENFERMERIA', '10/4/1971', ' victoria.alcivar@hdtc.gob.ec', 'victoriaqui_1@hotmail.com', '0994944095', 'FEMENINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('592', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802889014', 'QUIÑONEZ ALEGRIA EDITH JESSENIA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '11/12/1982', 'edith.quiñonez@hdtc.gob.ec', 'edithjessenia86@hotmail.com', '0980317491', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('593', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802238113', 'QUIÑONEZ ANGULO CARMEN', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '24/7/1976', 'carmen.angulo@hdtc.gob.ec', 'carmita_angulo1976@hotmail.com', '0959555449', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('594', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802884007', 'QUIÑONEZ ARBOLEDA DIANA CAROLINA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '2/1/1981', 'diana.quiñonez@hdtc.gob.ec', 'laiabran@hotmail.com', '0939201509', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('595', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0800799462', 'QUIÑONEZ ARROYO MARIA DEL CARMEN', 'GESTION DE CUIDADOS DE ENFERMERIA', 'AUXILIAR ADMINISTRATIVO DE SALUD DEL SECTOR SALUD', '8/3/1966', 'maria.carmen@hdtc.gob.ec', 'carmenarroyo@hotmail.com', '097707822', 'FEMENINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('596', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802102392', 'QUIÑONEZ AYOVI LLUSBLINA PATRICIA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '21/2/1976', 'llusblina.quiñonez@hdtc.gob.ec', 'guadaenferforever@hotmail.com', '0985175351', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('597', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0850077892', 'QUIÑONEZ BUSTO JENNY SOLANGE', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '17/4/1996', 'jenny.quiñonez@hdtc.gob.ec', 'solangita27@hotmail.com', '0979431576', 'FEMENINO', 'ENFERMERO/A 3', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('598', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801715798', 'QUIÑONEZ CALERO YANSI YESENIA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'AUXILIAR DE ENFERMERIA', '11/12/1982', 'yansi.quiñonez@hdtc.gob.ec', 'mariafer28022@gmail.com', '0997025597', 'FEMENINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('599', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802277756', 'QUIÑONEZ CHAVEZ JOSE WILFRIDO', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'PARAMEDICO/A 2', '12/2/1967', 'jose.quiñonez@hdtc.gob.ec', 'WILFRIDO2407@OUTLOOK.COM', '0993627880', 'MASCULINO', 'PARAMEDICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('600', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0800611717', 'QUIÑONEZ COLORADO NURIS', 'GESTION DE CUIDADOS DE ENFERMERIA', 'AUXILIAR DE ENFERMERIA', '17/11/1960', 'nuris.colorado@hdtc.gob.ec', 'nuris.colorado@hdtc.gob.ec', '062722778', 'FEMENINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('601', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803120666', 'QUIÑONEZ CORTES GABRIELA LORENA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'AUXILIAR ADMINISTRATIVO DE SALUD DEL SECTOR SALUD', '3/11/1963', 'gabriela.quiñonez@hdtc.gob.ec', 'gabriela-qc@hotmail.com', '0985145527', 'FEMENINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('602', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803046721', 'QUIÑONEZ CUERO WENDY LUCETTY', 'LABORATORIO', 'TECNOLOGO MEDICO DE LABORATORIO 1', '3/8/1985', 'wendy.quiñonez@hdtc.gob.ec', 'roberto_erazo87@hotmail.com', '0985572552', 'FEMENINO', 'LICENCIADO EN LABORATORIO', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('603', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0804132835', 'QUIÑONEZ LUGO MALENA CECIBEL', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '3/12/1991', 'malena.quiñonez@hdtc.gob.ec', 'uberto031215@outlook.com', '0993613856', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('604', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802265918', 'QUIÑONEZ MEDINA HIPATIA ISABEL', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '15/8/1985', 'hipatia.quiñonez@hdtc.gob.ec', 'hipis_2012@hotmail.com', '0939891546', 'FEMENINO', 'MEDICO GENERAL EN FUNCIONES HOSPITALARIAS', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('605', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802885681', 'QUIÑONEZ MONTAÑO ROSA ANGELA', 'GESTION DE CALIDAD', 'ANALISTA DE CALIDAD 1', '30/8/1984', 'rosa.quiñonez@hdtc.gob.ec', 'angelamontano3084@gmail.com', '0986639671', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('606', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801215484', 'QUIÑONEZ QUIÑONEZ CASILDA GRACE', 'GESTION DE CUIDADOS DE ENFERMERIA', 'AUXILIAR DE ENFERMERIA', '10/7/1977', 'casilda.quiñonez@hdtc.gob.ec', 'gracequioonez@yahoo.com', '0990572039', 'FEMENINO', 'TECNICO EN ENFERMERIA', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('607', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802116707', 'QUIÑONEZ QUIÑONEZ VANESSA MARIUXI', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '23/12/1976', 'vanessa.quiñonez@hdtc.gob.ec', 'veronica_b1976@yahoo.com', '0991957878', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('608', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802371583', 'QUIÑONEZ RUIZ ELSA EMILIA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '11/12/1982', 'elsa.quiñonez@hdtc.gob.ec', 'elsita2010@hotmail.com.ar', '0982606941', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('609', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0800858532', 'QUIÑONEZ VALENCIA ARMANDO ARMINO', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A ESPECIALISTA EN CIRUGIA GENERAL 1', '18/8/1973', 'armando.quiñonez@hdtc.gob.ec', 'AQUIVAL@HOTMAIL.COM', '099023526', 'MASCULINO', 'MEDICO ESPECIALISTA CIRUGIA GENERAL', 'CUARTO NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('610', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0800599003', 'QUIÑONEZ VALENCIA GUIDO JACINTO', 'MANTENIMIENTO', 'CHOFER DE AMBULANCIA DEL SECTOR SALUD', '18/7/1973', 'guido.quiñonez@hdtc.gob.ec', 'ositabella1982@hotmail.com', '0993489885', 'MASCULINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('611', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802352146', 'QUIÑONEZ YANNUZZELLI VICTOR HUGO', 'GESTION DE CUIDADOS DE ENFERMERIA', 'AUXILIAR DE ENFERMERIA', '17/3/1984', 'victor.quiñonez@hdtc.gob.ec', 'victorelzeus@hotmail.com', '091467898', 'MASCULINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('612', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803782879', 'QUIÑONEZ ZAMBRANO LISETE STEFANIA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '26/3/1986', 'lisete.quiñonez@hdtc.gob.ec', 'lisetestefa@outlook.com', '0988889983', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('613', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1314022375', 'QUIROZ DELGADO YANDRI FABIAN', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '3/8/1991', 'yandri.quiroz@hdtc.gob.ec', 'yandrifire@live.com', '0993210173', 'MASCULINO', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIA 1', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('614', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1306263607', 'QUIROZ MACIAS ANGEL VICENTE', 'MANTENIMIENTO', 'TECNICO DE MANTENIMIENTO', '17/9/1960', 'angel.quiroz@hdtc.gob.ec', 'ositabella1982@hotmail.com', '062995100', 'MASCULINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('615', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0804251288', 'QUISHPE HINOJOSA KATHYA ELIZABETH', 'TRANSFUSIONAL', 'TECNOLOGO MEDICO DE MEDICINA TRANSFUSIONAL 1', '30/6/1991', 'kathya.quishpe@hdtc.gob.ec', 'k_a_sun@hotmail.com', '0969542701', 'FEMENINO', 'TERAPISTA DE LENGUAJE Y AUDITIVA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('616', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803481555', 'RAAK CHEME GIANELLA LOTTY', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '26/6/1986', 'gianella.raak@hdtc.gob.ec', 'gianeraak@gmail.com', '0997779009', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('617', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803021039', 'RAAK CHEME KELLY SILVANA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '13/5/1978', 'kelly.raak@hdtc.gob.ec', 'kellyraa@hotmail.com', '0991856606', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('618', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1207873074', 'RABASCO ALENCASTRO DAVIS JOSUE', 'REHABILITACION Y TERAPIA FISICA', 'TECNOLOGO EN TERAPIA RESPIRATORIA', '24/3/1992', 'reynaldo.torres@hdtc.gob.ec', 'paportd67@gmail.com', '0982026537', 'MASCULINO', 'LICENCIADO EN TERAPIA RESPIRATORIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('619', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0804249423', 'RAMIREZ PEREA GABRIELA JOHANNA', 'LABORATORIO', 'LABORATORISTA CLINICO 1', '12/4/1994', 'gabriela.ramirez@hdtc.gob.ec', 'chikigabi_t@hotmail.com', '0984180097', 'FEMENINO', 'LABORATORISTA CLINICO 1', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('620', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0925101792', 'RAMIREZ SANTANA MARIO EULALIO', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '15/8/1985', 'mario.ramirez@hdtc.gob.ec', 'marioeulalio51@hotmail.com', '062995100', 'MASCULINO', 'MEDICO GENERAL EN FUNCIONES HOSPITALARIAS', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('621', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1758977605', 'RAMOS DIAZ CARMEN JOSEFINA', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A ESPECIALISTA EN ANESTESIOLOGIA 1', '11/12/1982', 'carmen.ramos@hdtc.gob.ec', 'carmen.ramos@hdtc.gob.ec', '0994839076', 'FEMENINO', 'MEDICO ESPECIALISTA ANASTESEOLOGIA', 'CUARTO NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('622', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801389255', 'RAYO QUIÑONEZ DARLI', 'GESTION DE CUIDADOS DE ENFERMERIA', 'AUXILIAR DE ENFERMERIA', '18/11/1966', 'darli.quiñonez@hdtc.gob.ec', 'darli.quiñonez@hdtc.gob.ec', '062995100', 'FEMENINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('623', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0201778891', 'REA CHAUCA DAVID ISRAEL', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '17/9/1985', 'david.rea@hdtc.gob.ec', 'ismito2010@gmail.com', '0969176020', 'MASCULINO', 'MEDICO GENERAL EN FUNCIONES HOSPITALARIAS', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('624', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803527845', 'REALPE ARBOLEDA ALICIA XIOMARA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '17/2/1985', 'alicia.realpe@hdtc.gob.ec', 'alixi0591@hotmail.com', '0991985461', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('625', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801466277', 'REALPE VIVAS KETTY MARLENE', 'LABORATORIO', 'TECNOLOGO MEDICO DE LABORATORIO 3', '10/6/1969', 'ketty.realpe@hdtc.gob.ec', 'ketty.realpe@hotmail.com', '0997514867', 'FEMENINO', 'TECNOLOGO MEDICO DE LABORATORIO ', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('626', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801538067', 'REASCO CEDEÑO PATRICIO GERMAN', 'GESTION ADMINISTRATIVA', 'AUXILIAR ADMINISTRATIVO DE SALUD DEL SECTOR SALUD', '5/2/1970', 'patricio.reasco@hdtc.gob.ec', 'ositabella1982@hotmail.com', '0981047318', 'MASCULINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('627', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803149707', 'RECALDE LIZANO FABIAN MARCELO', 'FARMACIA, INSUMOS, DISPOSITIVOS MEDICOS Y REACTIVOS', 'AUXILIAR ADMINISTRATIVO DE SALUD DEL SECTOR SALUD', '24/11/1965', 'fabian.recalde@hdtc.gob.ec', 'almacenhdtc@yahoo.es', '0908985030', 'MASCULINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('628', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '137758746', 'REQUENA GARCÍA TEOLINDA COROMOTO', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A ESPECIALISTA EN GASTROENTEROLOGIA 1', '11/12/1982', 'teolinda.requena@hdtc.gob.ec', 'teolinda.requena@hdtc.gob.ec', '0986813368', 'FEMENINO', 'ESPECIALISTA EN GASTROENTEROLOGIA', 'CUARTO NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('629', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802761502', 'REQUENE MERCADO ANA MARIA', 'GESTION DE ATENCION AL USUARIO/A', 'ASISTENTE DE ATENCION AL USUARIO', '22/4/1984', 'ana.requene@hdtc.gob.ec', 'meryhany@hotmail.com', '0985617218', 'FEMENINO', 'S/N', 'BACHILLER', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('630', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802264531', 'RESABALA RAMIREZ CYNTHIA VIVIANA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '11/12/1982', 'cynthia.resabala@hdtc.gob.ec', 'cresabala@hotmail.com', '0969076766', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('631', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0961061710', 'REY RODRIGUEZ ALEJANDRA CAROLINA', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A ESPECIALISTA EN GINECOLOGIA 1', '11/12/1982', 'alejandra.rey@hdtc.gob.ec', 'alejandra.rey@hdtc.gob.ec', '062727497', 'FEMENINO', 'ESPECIALISTA EN OBSTETRICIA Y GINECOLOGIA', 'CUARTO NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('632', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0921563953', 'REYES FIGUEROA JERRY JONATHAN', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '27/10/1992', 'jerry .reyes@hdtc.gob.ec', 'jerryreyesyo@hotmail.com', '0994445563', 'MASCULINO', 'MEDICO GENERAL EN FUNCIONES HOSPITALARIAS', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('633', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803321884', 'REYES HURTADO SOLANDA CECIBEL', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '8/10/1986', 'solanda.reyes@hdtc.gob.ec', 'pipiolita.sexi@hotmail.com', '0939286282', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('634', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801665936', 'REYES MARTINEZ MARIA ANGELICA', 'GESTION ADMINISTRATIVA', 'AUXILIAR ADMINISTRATIVO DE SALUD DEL SECTOR SALUD', '31/8/1973', 'maria.reyes@hdtc.gob.ec', 'mariarrr@hotmail.com', '062723016', 'FEMENINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('635', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801488743', 'REYES VIVAS HAIDY ISOLA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '11/12/1982', 'haidy.reyes@hdtc.gob.ec', 'reyes-haidy72@hotmail.com', '0988205118', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('636', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801179615', 'REYES YANEZ NARCISA JACQUELINE', 'GESTION DE ADMISIONES', 'ANALISTA DE ADMISIONES', '29/10/1967', 'narcisa.reyes@hdtc.gob.ec', 'nachareyes@yahoo.es', '0994633384', 'FEMENINO', 'INGENIERO EN ADMINISTRACION PUBLICA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('637', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803988773', 'REYNA SOLORZANO CHRISTIAN ANDRES', 'GESTION DE CUIDADOS DE ENFERMERIA', 'AUXILIAR ADMINISTRATIVO DE SALUD DEL SECTOR SALUD', '18/1/1951', 'christian.reyna@hdtc.gob.ec', 'cristhianr_160@hotmail.com', '0985980634', 'MASCULINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('638', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803074269', 'RIVADENEIRA RODRIGUEZ TATIANA MARIUXI', 'FARMACIA, INSUMOS, DISPOSITIVOS MEDICOS Y REACTIVOS', 'AUXILIAR DE FARMACIA', '1/3/1976', 'tatiana.rivadeneira@hdtc.gob.ec', 'tatianarivadeneira@hotmail.com', '062995100', 'FEMENINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('639', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802245480', 'RIVAS MERCADO MARIA DE LOURDES', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '11/12/1982', 'maria.lourdes@hdtc.gob.ec', 'tuloquita1983@hotmail.es', '0999211078', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('640', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803169143', 'RIVERA MORANTE LEIRY CAROLINA', 'LABORATORIO', 'AUXILIAR DE LABORATORIO', '4/6/1963', 'leiry.rivera@hdtc.gob.ec', 'leiryk@hotmail.com', '069918696', 'FEMENINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('641', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1758574196', 'RIVERA RAMIREZ NUBIA IRENE', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A ESPECIALISTA EN PEDIATRIA 1', '14/7/1962', 'nubia.rivera@hdtc.gob.ec', 'nibia_irene@hotmail.com', '0998435997', 'FEMENINO', 'MEDICO/A ESPECIALISTA EN PEDIATRIA ', 'CUARTO NIVEL', 'X', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('642', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802489385', 'RIVERO VALENCIA LORGIA LISSETH', 'GESTION DE ADMISIONES', 'ANALISTA DE ADMISIONES', '18/11/1982', 'lorgia.rivero@hdtc.gob.ec', 'LISSRIVER2010@HOTMAIL.COM', '0992123625', 'FEMENINO', 'INGENIERA EN ADMINISTRACION DE EMPRESA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('643', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1723495204', 'ROBERTS ATESIANO VIVIANE', 'GESTION FINANCIERA', 'ASISTENTE DE ADMINISTRATIVO', '25/12/1991', 'viviane.roberts@hdtc.gob.ec', 'viviane.roberts@yahoo.es', '0980086242', 'FEMENINO', 'S/N', 'BACHILLER', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('644', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802314427', 'ROBINSON MONRROY LUIS ALBERTO', 'GESTION ADMINISTRATIVA', 'AUXILIAR ADMINISTRATIVO DE SALUD DEL SECTOR SALUD', '11/4/1964', 'luis.robinzon@hdtc.gob.ec', 'luisrobinzon@hotmail.com', '062995100', 'MASCULINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('645', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1758769382', 'ROCA CANSINIS IRVING ANTONIO', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '15/8/1985', 'irving.roca@hdtc.gob.ec', 'irvingrocacansinis@gmail.com', '0993500141', 'MASCULINO', 'MEDICO GENERAL EN FUNCIONES HOSPITALARIAS', 'CUARTO NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('646', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801997040', 'RODRIGUEZ AYOVI POLA RAMONA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'AUXILIAR ADMINISTRATIVO DE SALUD DEL SECTOR SALUD', '12/2/1964', 'pola.rodriguez@hdtc.gob.ec', 'pola.rodriguez@hdtc.gob.ec', '062995100', 'FEMENINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('647', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0800541591', 'RODRIGUEZ BAUTISTA FAVIOLA ISABEL', 'GESTION DE CUIDADOS DE ENFERMERIA', 'AUXILIAR ADMINISTRATIVO DE SALUD DEL SECTOR SALUD', '24/7/1966', 'faviola.rodriguez@hdtc.gob.ec', 'faviolaodriguez@hotmail.com', '062995100', 'FEMENINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('648', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0800706053', 'RODRIGUEZ CHILA TERESA DEGNIS', 'GESTION DE CUIDADOS DE ENFERMERIA', 'AUXILIAR DE ENFERMERIA', '11/12/1982', 'teresa.rodriguez@hdtc.gob.ec', 'hospitaldelfinatorres_varhs@yahoo.es', '062995100', 'FEMENINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('649', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1756859623', 'RODRIGUEZ ESCALONA ERIOCDY', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A ESPECIALISTA EN CARDIOLOGIA 1', '1/3/1985', 'eriocdy.rodriguez@hdtc.gob.ec', 'eri8203@yahoo.com', '0998173014', 'MASCULINO', 'MEDICO/A ESPECIALISTA EN CARDIOLOGIA ', 'CUARTO NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('650', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803041136', 'RODRIGUEZ FUENTES FLOR MARIA', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '11/12/1982', 'flor.rodriguez@hdtc.gob.ec', 'negritalinda_2787@hotmail.com', '0997110758', 'FEMENINO', 'MEDICO GENERAL EN FUNCIONES HOSPITALARIAS', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('651', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802130807', 'RODRIGUEZ GRACIA ELSA VIRGINIA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '26/5/1977', 'elsa.rodriguez@hdtc.gob.ec', 'elsarodriguez77@hotmail.com', '062995100', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('652', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802381525', 'RODRIGUEZ MERCADO ANA ESTATILIA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '15/9/1980', ' ana.rodriguez@hdtc.gob.ec', 'ana_rodri80@hotmail.com', '0994545942', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('653', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801641861', 'RODRIGUEZ PALOMINO JOISY EDITH', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '8/1/1970', 'joisy.rodriguez@hdtc.gob.ec', 'guadaenferforever@hotmail.com', '062995100', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('654', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803523778', 'ROJAS CORONEL KATYA LEONOR', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '22/3/1967', 'katya.rojas@hdtc.gob.ec', 'katyakatu_k@hotmail.com', '099523151', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('655', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801575473', 'ROMULO LOZANO FILOMENA ROSARIO', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '30/12/1969', 'filomena.romulo@hdtc.gob.ec', 'romulofilo@yahoo.es', '0984849383', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('656', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1204499261', 'ROSADO MERA ALEX JAVIER', 'REHABILITACION Y TERAPIA FISICA', 'TECNOLOGO EN TERAPIA RESPIRATORIA', '15/6/1988', 'alex.rosado@hdtc.gob.ec', 'alexjrm2016@outlook.com', '0996569850', 'MASCULINO', 'LICENCIADO EN TERAPIA RESPIRATORIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('657', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803017110', 'ROSALES GIRON JAIME DAVID', ' ACTIVO FIJO Y GUARDALMACEN ', 'ASISTENTE ADMINISTRATIVO 1', '10/7/1991', 'jaime.rosales@hdtc.gob.ec', 'rosalesgiron@hotmail.com', '0997765591', 'MASCULINO', 'S/N', 'BACHILLER', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('658', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802290668', 'ROSERO ANGULO SANDRA VANESSA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'AUXILIAR DE ENFERMERIA', '11/12/1982', 'sandra.rosero@hdtc.gob.ec', 'sanvaroa_1@hotmail.com', '0984982018', 'FEMENINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('659', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802510289', 'RUA BONE ANGELA YADIRA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '1/11/1980', 'angela.rua@hdtc.gob.ec', 'angelayadiraruanaobone@gmail.com', '0993818996', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('660', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803561331', 'RUA MAZO KENIA CELESTE', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '11/12/1982', 'kenia.rua@hdtc.gob.ec', 'keniarua062@hotmil.com', '0994208059', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('661', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803254598', 'SAA MENDOZA CARLOS JAVIER', ' ACTIVO FIJO Y GUARDALMACEN ', 'GUARDALMACEN', '16/1/1988', 'carlos.saa@hdtc.gob.ec', 'carlosjaviersaa@hotmail.com', '0981091502', 'MASCULINO', 'S/N', 'BACHILLER', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('662', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802593780', 'SAAVEDRA CABEZAS BYRON DAVID', 'GESTION DE CUIDADOS DE ENFERMERIA', 'AUXILIAR DE ENFERMERIA', '2/2/1985', 'byron.saavedra@hdtc.gob.ec', 'byroncabezas@hotmail.com', '062995100', 'MASCULINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('663', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802394783', 'SAAVEDRA ORTIZ JOHANNA ELVIRA', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A ESPECIALISTA EN NEFROLOGIA', '8/2/1982', 'johanna saavedra@hdtc.gob.ec', 'joelsa882@hotmail.com', '0989014374', 'FEMENINO', 'ESPECIALISTA DE PRIMER GRADO EN NEFROLOGIA', 'CUARTO NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('664', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0800830242', 'SAAVEDRA REYES DICK GEOVANNY', 'MANTENIMIENTO', 'CHOFER DE AMBULANCIA DEL SECTOR SALUD', '11/12/1982', 'dick.saavedra@hdtc.gob.ec', 'gevanny0207@gmail.com', '0988501834', 'MASCULINO', 'CHOFER', 'BACHILLER', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('665', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801595109', 'SAAVEDRA ROMERO LIYIS MARIA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '11/12/1982', 'liyis.saavedra@hdtc.gob.ec', 'liyissaavedra1977@hotmail.com', '0985649695', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('666', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1720385002', 'SALAZAR GONGORA JENNIFER GEOVANNA', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '21/12/1985', 'jennifer.gongora@hdtc.gob.ec', 'jennifer.gongora@hdtc.gob.ec', '0958838614', 'FEMENINO', 'MEDICO GENERAL EN FUNCIONES HOSPITALARIAS', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('667', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0502778582', 'SALAZAR MALLIQUINGA MONICA', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A ESPECIALISTA EN DERMATOLOGIA 1', '11/8/1982', 'monica.salazar@hdtc.gob.ec', 'monica.salazar@hdtc.gob.ec', '0979529142', 'FEMENINO', 'MEDICO ', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('668', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803867720', 'SALCEDO NEIRA ERICK XAVIER', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '13/8/1984', 'erick.salcedo@hdtc.gob.ec', 'ericksn1992@hotmail.com', '0997382353', 'MASCULINO', 'MEDICO GENERAL EN FUNCIONES HOSPITALARIAS', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('669', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803106129', 'SALDARRIAGA MACIAS CARLOS ALFREDO', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '8/2/1968', 'carlos.saldarriaga@hdtc.gob.ec', 'saldarriaga_alfredo@hotmail.com', '0985213854', 'MASCULINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('670', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801713314', 'SAMANIEGO GARCIA KARLA JOHANNA', 'GESTION FINANCIERA', 'ANALISTA DE PAGO DE NOMINA', '22/5/1978', 'karla.samaniego@hdtc.gob.ec', 'karlitasamaniego@hotmail.com', '0991527255', 'FEMENINO', 'MAGISTER EN PLANEAMIENTO', 'CUARTO NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('671', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803526144', 'SANCHEZ CORTES JANELLA MARIA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '11/5/1982', 'janella.sanchez@hdtc.gob.ec', 'janellamisael23@hotmail.com', '0959914522', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('672', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801950718', 'SANCHEZ CUSME MARIA ISABEL', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '2/5/1976', 'maria.sanchez@hdtc.gob.ec', 'msanchezcusme@yahoo.com', '0991692944', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('673', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803127240', 'SANCHEZ CUSME VIVIANA ALEXANDRA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'AUXILIAR DE ENFERMERIA', '1/4/1979', 'viviana.sanchez@hdtc.gob.ec', 'ositabella1982@hotmai.com', '0986749343', 'FEMENINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('674', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1207972736', 'SANCHEZ MONTES ARIANNA ELIZABETH', 'REHABILITACION Y TERAPIA FISICA', 'TECNOLOGO EN TERAPIA RESPIRATORIA', '30/4/1990', 'arianna.sanchez@hdtc.gob.ec', 'sanchezarianna94@gmail.com', '0989514275', 'FEMENINO', 'LICENCIADO EN TERAPIA RESPIRATORIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('675', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0800784415', 'SANCHEZ PORTILLA CERVANDA EULALIA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '10/12/1963', 'cervanda.sanchez@hdtc.gob.ec', 'sanchezservanda1@hotmail.com', '0989495445', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('676', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801905217', 'SANDOVAL BARAHONA ALEXI BORODINA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'AUXILIAR DE ENFERMERIA', '8/1/1983', 'alexi.sandoval@hdtc.gob.ec', 'tu_tesorito2012@hotmail.com', '0982838479', 'FEMENINO', 'TECNICO EN ENFERMERIA', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('677', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801554924', 'SANNICOLAS DELACRUZ AIDA LAURA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '22/1/1968', 'aida.sannicolas@hdtc.gob.ec', 'guadaenferforever@hotmail.com', '094426875', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('678', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0400937819', 'SANTILLAN NARVAEZ ALEXANDRA PENELOPE', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '2/7/1971', 'alexandra.santillan@hdtc.gob.ec', 'alexandra.santillan@hdtc.gob.ec', '0996782290', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('679', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0800602369', 'SANTORO ESTUPIÑAN JUAN CARLOS', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A ESPECIALISTA EN GINECOLOGIA 1', '15/8/1985', 'juan.santoro@hdtc.gob.ec', 'juan.santoro@hdtc.gob.ec', '090685793', 'MASCULINO', 'MEDICO ESPECIALISTA EN GIENCOLOGIA', 'CUARTO NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('680', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801663253', 'SANTOS ARTEAGA GENOVEVA DE MONSERRATE', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '4/5/1972', 'genoveva.santos@hdtc.gob.ec', 'genovevaa123456@hotmail.com', '0991662350', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('681', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0925414385', 'SANTOS CEDEÑO XEOMAR LEMABEL', 'LABORATORIO', 'TECNOLOGO MEDICO DE LABORATORIO 3', '19/12/1984', 'xeomara.santos@hdtc.gob.ec', 'xeomysant@hotmail.com', '0985952812', 'FEMENINO', 'TECNOLOGO MEDICO DE LABORATORIO ', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('682', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1312507476', 'SANTOS ZAMBRANO JESSENIA ESPERANZA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '18/12/1986', ' jessenia.santos@hdtc.gob.ec', 'eltiempo27@yahoo.com', '0985966012', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('683', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803473065', 'SANTOS ZAMBRANO MARIA GABRIELA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '11/9/1990', 'maria.santos@hdtc.gob.ec', 'mgsz8390@gmail.com', '0986114953', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('684', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0101200632', 'SAQUICELA SIGUENZA MARLENE EULALIA', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A ESPECIALISTA EN CARDIOLOGIA 1', '28/8/1957', 'marlene.saquicela@hdtc.gob.ec', 'eulalia.saquicela@hotmail.com', '0998044574', 'FEMENINO', 'MEDICO/A ESPECIALISTA EN CARDIOLOGIA ', 'CUARTO NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('685', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802657874', 'SAUD GUAGUA EDITH JAHAIRA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '19/11/1984', 'edith.saud@hdtc.gob.ec', 'edith_saud@hotmail.com', '0939473327', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('686', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801997057', 'SEVILLANO RENTERIA ADRIANA AMELIA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '11/12/1982', 'adriana.sevillano@hdtc.gob.ec', 'TALENTOHUMANODPSE@GMAIL.COM', '0981270410', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('687', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802471276', 'SEVILLANO RENTERIA MAURA MAURICIA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'AUXILIAR DE ENFERMERIA', '25/5/1982', 'maura.sevillano@hdtc.gob.ec', 'masevirente@hotmail.com', '0980427440', 'FEMENINO', 'TECNICO EN ENFERMERIA', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('688', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802780460', 'SIERRA TENORIO CRISTINA ISABEL', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '16/8/1979', 'cristina.sierra@hdtc.gob.ec', 'cristinasierra198@gmail.com', '0993939114', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('689', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802650721', 'SILVA QUIÑONEZ INGRID JACQUELINE', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '11/12/1982', 'ingrid.silva@hdtc.gob.ec', 'guadaenferforever@hotmail.com', '062722778', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('690', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802704452', 'SIMBAÑA CAYO CRISTHIAN ANDRES', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '22/7/1994', 'gabriela.carranza@hdtc.gob.ec', 'gajo@webadictos.net', '0991017073', 'MASCULINO', 'MEDICO GENERAL EN FUNCIONES HOSPITALARIAS', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('691', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803065374', 'SIMISTERRA TELLO MARIUXI YAHAIRA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '8/5/1985', 'mariuxi.simisterr@hdtc.gob.ec', 'mariuxitello1985@hotmail.com', '0969695228', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('692', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801755224', 'SOL ANGULO MONICA ESPERANZA', 'GESTION DE TALENTO HUMANO', 'TRABAJADORA SOCIAL DE TALENTO HUMANO ', '14/9/1973', 'monica.sol@hdtc.gob.ec', 'glodia222@hotmail.es', '0959539618', 'FEMENINO', 'LICENCIADA EN TRABAJO SOCIAL', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('693', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802112292', 'SOLANO HERNANDEZ ANGEL RAFAEL', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '28/6/1988', 'angel.solano@hdtc.gob.ec', 'angsol_81@live.com', '0980036666', 'MASCULINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('694', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0800799793', 'SOLIS ORDOÑEZ MARIA LEGNIS', 'GESTION DE CUIDADOS DE ENFERMERIA', 'AUXILIAR DE ENFERMERIA', '4/7/1960', 'maria.solis@hdtc.gob.ec', 'hospitaldelfinatorres_varhs@hotmail.es', '0981751767', 'FEMENINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('695', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801754284', 'SOLIS ORTIZ MARIA BEATRIZ', ' ACTIVO FIJO Y GUARDALMACEN ', 'ANALISTA DE ACTIVOS FIJOS 1', '17/1/1973', 'maria.solis@hdtc.gob.ec', 'FUNCIONARIOSME@EDUCACION.GOB.EC', '0991100583', 'FEMENINO', 'INGENIERO COMERCIAL', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('696', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803143213', 'SOLORZANO WILA JENNIFER ELIZABETH', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '12/12/1988', 'jennifer.solorzano@hdtc.gob.ec', 'jenifer.solorzanoarea2salud@yahoo.com', '0980075870', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('697', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1312632431', 'SORNOZA VILLAVICENCIO RAISSA YELENA', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'ODONTOLOGO/A ESPECIALISTA EN CIRUGIA MAXILOFACIAL 3', '26/10/1987', 'raissa.sornoza@hdtc.gob.ec', 'LIDIA.RODRIGUEZ@MSP.GOB.EC', '0991527255', 'FEMENINO', 'ODONTOLOGA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('698', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802271924', 'SOSA PORTILLA LUISA FERNANDA', 'GESTION DE ADMISIONES', 'ANALISTA DE ADMISIONES', '9/8/1982', 'luisa.sosa@hdtc.gob.ec', 'fernanda_hdtc@hotmail.com', '0988509485', 'FEMENINO', 'INGENIERO EN CONTABILIDAD Y AUDITORIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('699', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803444124', 'SPOONER CONTRERAS CRISTINA NICOL', 'LABORATORIO', 'LABORATORISTA CLINICO 1', '24/2/1993', 'cristina.spooner@hdtc.gob.ec', 'cristinita.spooner@gmail.com', '0997954230', 'FEMENINO', 'LABORATORISTA CLINICO 1', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('700', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0800346215', 'SUAREZ YAGUANA JORGE ENRIQUE', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A ESPECIALISTA EN CIRUGIA GENERAL 1', '1/8/1962', 'jorge.suarez@hdtc.gob.ec', 'jebuenaventurasuarez@hotmail.com', '062995100', 'MASCULINO', 'MEDICO ESPECIALISTA CIRUGIA GENERAL', 'CUARTO NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('701', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802322412', 'SZABO CANGA IRMA GRISELDA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'AUXILIAR DE ENFERMERIA', '13/7/1977', 'griselda.szabo@hdtc.gob.ec', 'eltiempo27@yahoo.com', '0981989456', 'FEMENINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('702', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0850241183', 'TACO MINA HELEN VIVIANA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '17/3/1996', 'helen.taco@hdtc.gob.ec', 'helenviviana1@gmail.com', '0997848039', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('703', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1714412093', 'TAFUR BUSTOS LIA VANESSA', 'LABORATORIO', 'TECNOLOGO MEDICO DE LABORATORIO 3', '31/1/1986', 'lia.tafur@hdtc.gob.ec', 'arenita1519@hotmail.com', '0998537902', 'FEMENINO', 'TECNOLOGO MEDICO DE LABORATORIO ', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('704', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1802417632', 'TAMAYO GARCES RODIL RUBEN', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '27/7/1986', 'rodil.tamayo@hdtc.gob.ec', 'MSPMIGRACION@MSP.GOB.EC', '093758904', 'MASCULINO', 'MEDICO GENERAL EN FUNCIONES HOSPITALARIAS', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('705', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0800542904', 'TAMAYO ORDOÑEZ NOELINA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'AUXILIAR DE ENFERMERIA', '17/9/1957', 'noelina.ordoñez@hdtc.gob.ec', 'eltiempo27@yahoo.com', '062704606', 'FEMENINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('706', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801643412', 'TAPIA DELGADO MARIA ELENA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '14/6/1971', 'maria.tapia@hdtc.gob.ec', 'leinergt@hotmail.com', '039309772', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('707', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1755096789', 'TAPIA INGA DILMER ARNALDO', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '15/8/1985', 'dilmer.tapia@hdtc.gob.ec', 'dilmer.tapia@hdtc.gob.ec', '062995100', 'MASCULINO', 'MEDICO CIRUJANO', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('708', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802549675', 'TELLO MARQUEZ KATHERINE LISBETH', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '15/7/1990', 'katherine.tello@hdtc.gob.ec', 'katherine.tello@23d01.mspz4.gob.ec', '0993731917', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('709', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802334235', 'TELLO VACA ROSA ANGELA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'AUXILIAR DE ENFERMERIA', '25/1/1965', 'rosa.tello@hdtc.gob.ec', 'eltiempo27@yahoo.com', '0985445095', 'FEMENINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('710', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801439670', 'TENORIO BEDOYA MIRIAN ADRIANA', ' ACTIVO FIJO Y GUARDALMACEN ', 'GUARDALMACEN', '18/1/1968', ' mirian.tenorio@hdtc.gob.ec', 'adrianate@hotmail.es', '062995100', 'FEMENINO', 'INGENIERA EN ADMINISTRACION DE EMPRESA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('711', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802266619', 'TENORIO BONE YADIRA ADRIANA', 'GESTION ADMINISTRATIVA ', 'ASISTENTE ADMINISTRATIVO 1', '14/4/1980', 'yadira.tenorio@hdtc.gob.ec', 'tenoriobone@yahoo.es', '0993008355', 'FEMENINO', 'INGENIERA EN CONTABILIDAD Y AUDITORIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('712', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0800850299', 'TENORIO GONZABAY RODRIGO DAVID', 'LABORATORIO', 'TECNOLOGO MEDICO DE LABORATORIO 2', '20/10/1962', 'rodrigo.tenorio@hdtc.gob.ec', 'DAVID.TENORIO@HDTC.GOB.EC', '0991736074', 'MASCULINO', 'DOCTOR EN QUIMICA Y FARMACIA / QUIMICO Y FARMACEUTICO', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('713', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802803932', 'TENORIO LEMOS ANA ANABEL', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '28/11/1981', 'ana.tenorio@hdtc.gob.ec', 'nikkitagt@hotmail.com', '0994473061', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('714', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803493717', 'TENORIO VALENCIA ANDREA KATHERINE', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '11/12/1982', 'andrea.tenorio@hdtc.gob.ec', 'andretenorio1990@gmail.com', '0969549625', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('715', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1307000818', 'TERAN ROMERO FRANCISCA AIDE', 'GESTION DE ADMISIONES', 'ANALISTA DE ADMISIONES', '7/7/1969', 'francisca.teran@hdtc.gob.ec', 'Panchi_ter@hotmail.com', '0983005912', 'FEMENINO', 'INGENIERO EN ADMINISTRACION PUBLICA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('716', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802325134', 'TIPANTUÑA SANTANDER MARICELA VANESSA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '14/7/1980', 'maricela.tipantuña@hdtc.gob.ec', 'guadaenferforever@hotmail.com', '0984152731', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('717', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1756943393', 'TOLEDO PEREZ ISBERT ANTONIO', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A ESPECIALISTA EN ANESTESIOLOGIA 1', '21/2/1980', 'isbet.toledo@hdtc.gob.ec', 'isbertoledo@gmail.com', '0987465520', 'MASCULINO', 'MEDICO ESPECIALISTA ANASTESEOLOGIA', 'CUARTO NIVEL', 'X', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('718', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0302681424', 'TORO MINCHALA MIRIAM ALEXANDRA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '11/12/1982', 'miriam.toro@hdtc.gob.ec', 'mia_leaxi@hotmail.com', '0987750995', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('719', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803126580', 'TORRES CHARCOPA OLGA ROSARIO', 'GESTION DE CUIDADOS DE ENFERMERIA', 'AUXILIAR DE ENFERMERIA', '22/5/1987', 'olga.torres@hdtc.gob.ec', 'HOSPITALDELFINATORRES_VARHS@YAHOO.ES', '091577170', 'FEMENINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('720', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0800831430', 'TORRES CHENCHE NELLYS', 'GESTION DE CUIDADOS DE ENFERMERIA', 'AUXILIAR DE ENFERMERIA', '6/4/1974', 'nellys.chenche@hdtc.gob.ec', 'eltiempo27@yahoo.com', '062722778', 'FEMENINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('721', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1759922584', 'TORRES DUEÑAS REYNALDO', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '30/7/1967', 'reynaldo.torres@hdtc.gob.ec', 'paportd67@gmail.com', '0998690058', 'MASCULINO', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIA 1', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('722', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1708041403', 'TORRES DURAN LUIS GUSTAVO', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A ESPECIALISTA EN OFTALMOLOGIA 1', '12/6/1983', ' luis.torres@hdtc.gob.ec', 'luistorresd@hotmail.com', '0998350914', 'MASCULINO', 'MEDICO/A ESPECIALISTA EN OFTALMOLOGIA ', 'CUARTO NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('723', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1758569535', 'TORRES LARA SANDRA IVANOVHA', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A ESPECIALISTA EN MEDICINA FISICA Y REHABILITACION 1', '7/7/1980', 'sandra.torres@hdtc.gob.ec', 'sandra.torres@hdtc.gob.ec', '0967070144', 'FEMENINO', 'MEDICO ESPECIALISTA EN FISIATRIA', 'CUARTO NIVEL', 'X', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('724', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801491374', 'TORRES MERCADO WILSON', 'GESTION DE CUIDADOS DE ENFERMERIA', 'AUXILIAR DE ENFERMERIA', '17/12/1979', 'wilson.torres@hdtc.gob.ec', 'wmercado@yahoo.com', '093191604', 'MASCULINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('725', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802325159', 'TORRES MINA SILVIA ANGELA', ' ACTIVO FIJO Y GUARDALMACEN ', 'GUARDALMACEN', '8/8/1980', 'silvia.torres@hdtc.gob.ec', 'silvia_jonat@hotmail.com', '0988175637', 'FEMENINO', 'INGENIERA EN ADMINISTRACION DE EMPRESA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('726', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802119388', 'TORRES ZAMORA BAGNER EDUARDO', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '15/8/1985', 'bagner.torres@hdtc.gob.ec', 'dagneretz@hotmail.com', '09994744501', 'MASCULINO', 'MEDICO GENERAL EN FUNCIONES HOSPITALARIAS', 'TERCER NIVEL', 'X', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('727', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0963038393', 'TOVAR MACHUCA JOSE ARGENIS', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A ESPECIALISTA EN ANESTESIOLOGIA 1', '27/5/1988', 'jose.tovar@hdtc.gob.ec', 'jose.tovar@hdtc.gob.ec', '0968594653', 'MASCULINO', 'MEDICO ESPECIALISTA EN ANESTESIOLOGIA', 'CUARTO NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('728', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802384628', 'ULLOA GUAGUA NEY GUILLERMINA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '2/1/1980', 'ney.ulloa@hdtc.gob.ec', 'neiulloa1@hotmail.com', '062995100', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('729', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801239153', 'VACA MARTINEZ SUSANA ELIZABETH', 'GERENCIA ', 'ANALISTA DE COMUNICACION SOCIAL 1', '30/4/1967', 'susana.vaca@hdtc.gob.ec', 'misumisuel@hotmail.com', '0993008355', 'FEMENINO', 'COMUNICADORA SOCIAL', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('730', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801601303', 'VALDEZ CABEZA MARIA LUCRECIA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'AUXILIAR DE ENFERMERIA', '23/6/1982', 'maria.valdez@hdtc.gob.ec', 'Juan200707@hotmail.com', '0980008762', 'FEMENINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('731', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801942699', 'VALDEZ MONTAÑO FANNY ELIZABETH', 'IMAGENOLOGIA', 'TECNOLOGO MEDICO DE IMAGENOLOGIA 3', '11/12/1982', 'fanny.valdez@hdtc.gob.ec', '27faeli@gmail.com', '097080964', 'FEMENINO', 'TECNOLOGO MEDICO DE IMAGENOLOGIA ', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('732', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801920521', 'VALENCIA ALARCON DAYSI DANILA', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'OBSTETRIZ / OBSTETRA 1', '15/8/1985', 'deyci.valencia@hdtc.gob.ec', 'daysidanila@hotmail.com', '0997727306', 'FEMENINO', 'OBSTETRIZ / OBSTETRA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('733', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801707142', 'VALENCIA CAICEDO VICTORIA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'AUXILIAR DE ENFERMERIA', '10/6/1974', 'victoria.caicedo@hdtc.gob.ec', 'victoriavalencia2009@hotmail.com', '0993350286', 'FEMENINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('734', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802711853', 'VALENCIA CEDEÑO MARIA EUGENIA', 'REHABILITACION Y TERAPIA FISICA', 'TERAPISTA DE LENGUAJE Y AUDITIVA', '3/7/1982', 'maria.valencia@hdtc.gob.ec', 'MARIAEUGENIAVALENCIA@HOTMAIL.COM', '093817109', 'FEMENINO', 'TERAPISTA DE LENGUAJE Y AUDITIVA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('735', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801903782', 'VALENCIA CHILAN CARLOS JAVIER', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A ESPECIALISTA EN PEDIATRIA 1', '27/9/1980', 'carlos.valencia@hdtc.gob.ec', 'DRVALENCIACARLOS@HOTMAIL.COM', '091773862', 'MASCULINO', 'MEDICO/A ESPECIALISTA EN PEDIATRIA ', 'CUARTO NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('736', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801723032', 'VALENCIA DELGADO CARLOS RIBELINO', 'GESTION ADMINISTRATIVA', 'AUXILIAR ADMINISTRATIVO DE SALUD DEL SECTOR SALUD', '11/12/1982', 'carlos.valencia@hdtc.gob.ec', 'carlosvalencia@yahoo.com', '062995100', 'MASCULINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('737', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801215948', 'VALENCIA DELGADO LUIS ALFREDO', 'GESTION ADMINISTRATIVA', 'AUXILIAR ADMINISTRATIVO DE SALUD DEL SECTOR SALUD', '11/12/1982', 'luis.valencia@hdtc.gob.ec', 'luisvalencia@gmail.com', '062995100', 'MASCULINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('738', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802655076', 'VALENCIA HURTADO CINTHIA LORENA', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A ESPECIALISTA EN CUIDADOS INTENSIVOS 1', '15/8/1985', 'cinthya.valencia@hdtc.gob.ec', 'cinthya.valencia@hdtc.gob.ec', '0986813368', 'FEMENINO', 'MEDICO', 'TERCER NIVEL', 'X', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('739', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802941047', 'VALENCIA INTRIAGO DEIVI EMMANUEL', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '15/8/1985', 'deivi.valencia@hdtc.gob.ec', 'deivi.valencia@hdtc.gob.ec', '0967399991', 'MASCULINO', 'MEDICO GENERAL EN FUNCIONES HOSPITALARIAS', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('740', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802598292', 'VALENCIA MARQUEZ MIRTHA ADELAIDA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '17/1/1987', 'mirtha.valencia@hdtc.gob.ec', 'lanegrita@hotmail.es', '0979446485', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('741', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '2100384441', 'VALENCIA MINA ADRIAN ANDRES', 'GESTION DE CALIDAD', 'OFICIAL DE SEGURIDAD RADIOLOGICA', '28/2/1986', '  adrian.valencia@hdtc.gob.ec', 'adrianandresv7@gmail.com', '0994839076', 'MASCULINO', 'BIOFISICO', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('742', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801255555', 'VALENCIA MONTAÑO GILIO', 'MANTENIMIENTO', 'CHOFER DE AMBULANCIA DEL SECTOR SALUD', '22/1/1975', 'gilio.valencia@hdtc.gob.ec', 'ositabella1982@hotmail.com', '0981963685', 'MASCULINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('743', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801755992', 'VALENCIA PALACIOS KELY SULINDA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '11/6/1974', 'kely.valencia@hdtc.gob.ec', 'Kvalenciapalacios@yahoo.com', '062995100', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('744', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802654186', 'VALENCIA QUIÑONEZ JAIME CESAR', 'GESTION ADMINISTRATIVA', 'AUXILIAR ADMINISTRATIVO DE SALUD DEL SECTOR SALUD', '11/12/1982', 'jaime.valencia@hdtc.gob.ec', 'jaime.valencia@hdtc.gob.ec', '062726008', 'MASCULINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('745', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801658956', 'VALENCIA QUIÑONEZ MARYIS LUCY', 'GESTION DE CUIDADOS DE ENFERMERIA', 'AUXILIAR DE ENFERMERIA', '26/1/1971', 'maryis.valencia@hdtc.gob.ec', 'marysvalencia@hotmail.com', '090685793', 'FEMENINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('746', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801807355', 'VALENCIA RENTERIA CARMEN RAFAELA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'AUXILIAR DE ENFERMERIA', '14/7/1973', 'carmen.valencia@hdtc.gob.ec', 'eltiempo27@yahoo.com', '0991477762', 'FEMENINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('747', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802151662', 'VALENCIA VERNAZA ROCIMARIS MARIUXI', 'GESTION DE CUIDADOS DE ENFERMERIA', 'AUXILIAR DE ENFERMERIA', '23/10/1978', 'rocimaris.valencia@hdtc.gob.ec', 'eltiempo27@yahoo.com', '062702497', 'FEMENINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('748', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0400691549', 'VALENZUELA RUALES LUIS RAMIRO', 'GESTION DE CUIDADOS DE ENFERMERIA', 'AUXILIAR DE ENFERMERIA', '5/12/1987', 'luis.valenzuela@hdtc.gob.ec', 'ramyval@hotmail.com', '097728392', 'MASCULINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('749', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0800804866', 'VALLECILLA BENAVIDES ROBERTH STALIN', 'MANTENIMIENTO', 'CHOFER DE AMBULANCIA DEL SECTOR SALUD', '20/4/1987', 'roberth.vallecilla@hdtc.gob.ec', 'vallecillastalin@outlook.com', '0985078379', 'MASCULINO', 'CHOFER', 'BACHILLER', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('750', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802383067', 'VALLEJO HERNANDEZ LILIANA EMPERATRIZ', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '23/7/1973', 'liliana.vallejo@hdtc.gob.ec', 'lilianavallejo@yahoo.es', '0993860728', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('751', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802591180', 'VALVERDE CABEZAS JESSENIA YANINA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '25/3/1978', 'jessenia.valverde@hdtc.gob.ec', 'jeseniavalverdec@hotmail.com', '0993547687', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('752', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802038554', 'VALVERDE CARRILLO JOSELYN FERNANDA', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '10/11/1993', 'joselyn.valverde@hdtc.gob.ec', 'joselyn.valverde@hdtc.gob.ec', '0902029036', 'FEMENINO', 'MEDICO/A GENERAL ', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('753', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '804158970', 'VALVERDE TENORIO IDALIA DENNISSE', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '19/3/1992', 'idalia.valverde@hdtc.gob.ec', 'nathalydetoloza@gmail.com', '0958626008', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('754', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1200482949', 'VASQUEZ MORAN MARIANA DEL CARMEN', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A ESPECIALISTA EN MEDICINA INTERNA 1', '27/8/1955', 'mariana.vasquez@hdtc.gob.ec', 'marianadecart@hotmail.com', '0999457431', 'FEMENINO', 'MEDICO/A ESPECIALISTA EN MEDICINA INTERNA ', 'CUARTO NIVEL', 'X', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('755', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0917631012', 'VASQUEZ QUINTERO MARCO ANTONIO', 'MANTENIMIENTO', 'AUXILIAR ADMINISTRATIVO DE SALUD DEL SECTOR SALUD', '15/1/1978', 'marco.antonio@hdtc.gob.ec', 'YARDELELENGREIDO@HOTMAIL.COM', '080157951', 'MASCULINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('756', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0104401377', 'VASQUEZ RODAS JUAN JOSE', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '11/12/1982', 'juan.vasquez@hdtc.gob.ec', 'juanjo.v.r@hotmail.com', '097219356', 'MASCULINO', 'MEDICO GENERAL EN FUNCIONES HOSPITALARIAS', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('757', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1310589450', 'VELEZ MORILLO ORLEY DAVID', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '15/8/1985', 'orley.velez@hdtc.gob.ec', 'drorleyvelez31182_@hotmail.com', '0969756044', 'MASCULINO', 'MEDICO GENERAL EN FUNCIONES HOSPITALARIAS', 'TERCER NIVEL', 'X', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('758', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802131227', 'VELEZ SANTANA RINA GUADALUPE', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '22/9/1992', 'rina.velez@hdtc.gob.ec', 'area9muisne@hotmail.com', '0984291733', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('759', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803844943', 'VERA CAPURRO JULIET ALEXANDRA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '2/7/1991', 'juliet.vera@hdtc.gob.ec', 'julietvera15@gmail.com', '0996803351', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('760', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0800206344', 'VERA FIGUEROA CRISTOBAL BIENVENIDO', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A ESPECIALISTA EN TRAUMATOLOGIA 1', '30/10/1951', 'cristobal.vera@hdtc.gob.ec', 'crisverafi@yahoo.es', '0998458973', 'MASCULINO', 'MEDICO/A ESPECIALISTA EN TRAUMATOLOGIA ', 'CUARTO NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('761', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802066373', 'VERA GASPAR JESSICA ILIANA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'AUXILIAR DE ENFERMERIA', '20/9/1978', 'jessica.vera@hdtc.gob.ec', 'chioely3@hotmail.com', '094695660', 'FEMENINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('762', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803513878', 'VERA OLIVES LISETTE ALEJANDRA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '3/1/1985', 'lisette.veras@hdtc.gob.ec', 'carlos_lisette24@hotmail.com', '0968412466', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('763', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0800808891', 'VERA QUIÑONEZ HENRRY VIDAL', 'MANTENIMIENTO', 'TECNICO DE MANTENIMIENTO', '3/1/1962', 'henrry.vera@hdtc.gob.ec', 'henryvera@hotmail.com', '092131482', 'MASCULINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('764', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1311705535', 'VERGARA GILER DIANA CAROLINA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '12/3/1986', ' diana.vergara@hdtc.gob.ec', 'diany@hotamil.com', '0988264788', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('765', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0913558367', 'VILELA CHEME SANTA BERTHA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '3/3/1969', 'santa.vilela@hdtc.gob.ec', 'berthavilela@hotmail.com', '09913558367', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('766', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802518795', 'VILELA ESPAÑA RICCI DANIELA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '29/7/1982', 'ricci.vilela@hdtc.gob.ec', 'vilelar@hotmail.com', '0997023920', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('767', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802519660', 'VILLA ESCOBAR VICTOR ERNESTO', 'GESTION ADMINISTRATIVA', 'AUXILIAR ADMINISTRATIVO DE SALUD DEL SECTOR SALUD', '3/6/1989', 'victor.villa@hdtc.gob.ec', 'villa.victor@live.com', '0968931375', 'MASCULINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('768', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '802031476', 'VILLACRES BRAVO ROSA MARIA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '6/8/1975', 'rosa.villacres@hdtc.gob.ec', 'rosavillacresb@gmail.com', '0990665760', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('769', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0106445562', 'VILLALVA SIGUENCIA EDISSON SANTIAGO', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '13/4/1988', 'edisson.villalva@hdtc.gob.ec', 'santy.villalva@live.com', '0999283806', 'MASCULINO', 'MEDICO GENERAL EN FUNCIONES HOSPITALARIAS', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('770', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0201840014', 'VILLAMARIN ESCOBAR FERNANDA GABRIELA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '10/6/1985', 'fernanda.villamarin@hdtc.gob.ec', 'fernanda.villamarin@hdtc.gob.ec', '0989514275', 'FEMENINO', 'MEDICO', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('771', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802089656', 'VILLAQUIRAN FRANCO GLORIA ALEXANDRA', 'GESTIÓN DE PROCESOS DE APOYO DIAGNÓSTICO Y TERAPÉUTICO', 'AUXILIAR DE RADIOLOGIA', '11/12/1982', 'gloria.villaquiran@hdtc.gob.ec', 'fresita1976@hotmail.com', '091690713', 'FEMENINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('772', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0800753469', 'VIÑANZAGA COROZO MARIA DEL CARMEN', 'LABORATORIO', 'AUXILIAR DE LABORATORIO', '24/1/1962', 'maria.carmen@hdtc.gob.ec', 'maria.vinanzaga@hdtc.gob.ec', '0987207953', 'FEMENINO', 'TECNICO', 'NIVEL TECNICO O TECNOLOGICO', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('773', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1721646972', 'VITERI RUIZ DIANA DOLORES', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A ESPECIALISTA EN DERMATOLOGIA 1', '6/9/1975', 'diana.viteri@hdtc.gob.ec', 'diana.viteri@hdtc.gob.ec', '062995100', 'FEMENINO', 'MEDICO ESPECIALISTA EN DERMATOLOGIA', 'CUARTO NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('774', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802775098', 'VIVAR VILLON KARIN LILIANA', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '15/8/1985', 'karin.vivar@hdtc.gob.ec', 'karinvivar@hotmail.com', '0967399991', 'FEMENINO', 'MEDICO GENERAL EN FUNCIONES HOSPITALARIAS', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('775', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0800689283', 'VIVAS ARROYO JENNY ELIZABETH', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '11/12/1982', 'jenny.vivas@hdtc.gob.ec', 'eliza-va@hotmail.com', '099208475', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('776', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801890823', 'VIVAS PALACIOS MAGNI JACQUELINE', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '11/12/1982', ' magni.vivas@hdtc.gob.ec', 'jacquelinevivas@yajoo.es', '0994177407', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('777', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801206772', 'YASCARIBAY PAZMIÑO MARIBEL CATALINA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '22/3/1967', 'maribel.yascaribay@hdtc.gob.ec', 'maribelyascaribay@hotmail.com', '097904675', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('778', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0919069294', 'YUGCHA BARRAGAN DARIO JAVIER', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '16/5/1979', 'dario.yugcha@hdtc.gob.ec', 'dario_md84@hotmail.com', '0968794690', 'MASCULINO', 'MEDICO CIRUJANO', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('779', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1312589854', 'ZAMBRANO ALCIVAR JANETH JACQUELINE', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '8/10/1988', 'janeth.zambrano@hdtc.gob.ec', 'janethzambrano1986@hotmail.com', '0969651038', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('780', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802470286', 'ZAMBRANO DELGADO JISSELA ASUNCION', 'GESTION ADMINISTRATIVA', 'ANALISTA DE ACTIVOS FIJOS 2', '2/11/1982', 'jissela.zambrano@hdtc.gob.ec', 'jis82_zd@hotmail.com', '0981369547', 'FEMENINO', 'INGENIERO EN SISTEMAS INFORMATICOS', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('781', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1305646349', 'ZAMBRANO DELGADO LIDIA MARIA', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '15/8/1985', 'lidia.zambrano@hdtc.gob.ec', 'lidiarodriguez@yahoo.com', '0967399991', 'FEMENINO', 'MEDICO GENERAL EN FUNCIONES HOSPITALARIAS', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('782', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1310201585', 'ZAMBRANO GARCIA CECILIO ALBERTO', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A ESPECIALISTA EN NEUROCIRUGIA 1', '21/7/1979', 'cecilio.zambrano@hdtc.gob.ec', 'ZGCA2011@HOTMAIL.COM', '0989973150', 'MASCULINO', 'MEDICO/A ESPECIALISTA EN MEDICINA INTERNA ', 'CUARTO NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('783', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801901745', 'ZAMBRANO GUERRERO HENRY VIDAL', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '25/5/1973', 'henry.zambrano@hdtc.gob.ec', 'zambranohenry18@yahoo.com', '0986445963', 'MASCULINO', 'MEDICO GENERAL EN FUNCIONES HOSPITALARIAS', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('784', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802434381', 'ZAMBRANO LARA MARINA DALINDA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '26/8/1986', 'marina.zambrano@hdtc.gob.ec', 'maryzambranolara@gmail.com', '0991092367', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('785', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802351106', 'ZAMBRANO MATAMOROS LILIAN VANESSA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 4', '6/5/1969', 'lilian.zambrano@hdtc.gob.ec', 'livazama4@gmail.com', '0986827486', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('786', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '1309727962', 'ZAMBRANO MERA MARIA FERNANDA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '2/11/1985', 'maria.zambrano@hdtc.gob.ec', 'maryfer_1985@hotmail.com', '0980861962', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('787', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802785279', 'ZAMBRANO OLIVO KAREN TATIANA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '4/9/1991', 'karen.zambrano@hdtc.gob.ec', 'tatiana-zambrano@homail.com', '0980601798', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('788', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801343229', 'ZAMBRANO VELASCO MARIA ESTILITA', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A ESPECIALISTA EN CIRUGIA GENERAL 1', '22/9/1954', 'maria.zambrano.@hdtc.gob.ec', 'estilitochka@yahoo.com', '062995100', 'FEMENINO', 'MEDICO ESPECIALISTA CIRUGIA GENERAL', 'CUARTO NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('789', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803222355', 'ZAMORA YELA TANNY ANGELINE', 'GESTION DE CUIDADOS DE ENFERMERIA', 'ENFERMERO/A 3', '8/7/1989', 'tanny.zamora@hdtc.gob.ec', 'angeline_807@hotmail.com', '0981588239', 'FEMENINO', 'LICENCIADA EN ENFERMERIA', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('790', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0801649427', 'ZAPATA BASS PATRICIA ALEXANDRA', 'GESTION DE TECNOLOGIAS DE LA INFORMACION Y COMUNICACIONES', 'ANALISTA DE REDES, COMUNICACIONES E INFRAESTRUCTURA', '17/3/1972', 'patricia.zapata@hdtc.gob.ec', 'pzapata_2007@hotmail.com', '0997753313', 'FEMENINO', 'INGENIERO EN SISTEMAS INFORMATICOS', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('791', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0802987826', 'ZUÑIGA REZABALA JOMALLY MARGOTH', 'GESTIÓN DE  ESPECIALIDADES CLÍNICAS, QUIRÚRGICAS O CLÍNICO QUIRÚRGICAS', 'MEDICO/A GENERAL EN FUNCIONES HOSPITALARIAS', '2/5/1991', ' jomally.zuñiga@hdtc.gob.ec', ' jomally.zuñiga@hdtc.gob.ec', '0989667814', 'FEMENINO', 'MEDICO', 'TERCER NIVEL', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('792', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0803212141', 'ZURITA PAREDES MIRIAN YULIANA', 'GESTION DE CUIDADOS DE ENFERMERIA', 'AUXILIAR DE ENFERMERIA', '9/11/1986', 'mirian.zurita@hdtc.gob.ec', 'zuritamirian@hotmail.com', '0991181891', 'FEMENINO', 'TECNICO DE ENFERMERIA', 'BACHILLER', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('793', null, 'ZONA 1', '1160', 'HOSPITAL GENERAL ESMERALDAS SUR DELFINA TORRES DE CONCHA', '0850308206', 'GOMEZ ABAD LINCOLN JAIR', 'MANTENIMIENTO', 'CHOFER DE AMBULANCIA DEL SECTOR SALUD', '6/5/1994', 'lincolin.gomez@hdtc.gob.ec', 'eileenymili@gmail.com', '0993371137', 'MASCULINO', 'CHOFER', 'BACHILLER', '', null, null, null, null, null, null, null);
INSERT INTO `u_prescriptores` VALUES ('824', '7', '', '', '', '1717180812', 'medico1', '', '', '1986-07-27 00:00:00', '', '', '', '2', '', 'Superior', '', '', '', null, '', null, null, 'admin');

-- ----------------------------
-- Table structure for u_proveedores
-- ----------------------------
DROP TABLE IF EXISTS `u_proveedores`;
CREATE TABLE `u_proveedores` (
  `id_proveedor` int(255) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(255) DEFAULT NULL,
  `id_empresa` int(255) DEFAULT NULL,
  `nombres` varchar(255) DEFAULT NULL,
  `apellidos` varchar(255) DEFAULT NULL,
  `id_sexo` int(10) DEFAULT NULL,
  `documento_de_identidad` int(25) DEFAULT NULL,
  `id_nacionalidad` int(11) DEFAULT NULL,
  `teléfono` int(20) DEFAULT NULL,
  `celular` int(20) DEFAULT NULL,
  `id_provincia` int(255) DEFAULT NULL,
  `id_canton` int(255) DEFAULT NULL,
  `id_parroquia` int(255) DEFAULT NULL,
  `dirección` varchar(255) DEFAULT NULL,
  `id_tecnico` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_proveedor`),
  KEY `idusu` (`id_usuario`),
  KEY `idemp` (`id_empresa`),
  KEY `idsex` (`id_sexo`),
  KEY `idnac` (`id_nacionalidad`),
  KEY `idprov` (`id_provincia`),
  KEY `idcant` (`id_canton`),
  KEY `idparr` (`id_parroquia`),
  CONSTRAINT `idcant` FOREIGN KEY (`id_canton`) REFERENCES `conf_cantones` (`id_canton`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `idemp` FOREIGN KEY (`id_empresa`) REFERENCES `u_empresas` (`id_empresa`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `idnac` FOREIGN KEY (`id_nacionalidad`) REFERENCES `conf_nacionalidad` (`id_nacionalidad`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `idparr` FOREIGN KEY (`id_parroquia`) REFERENCES `conf_parroquias` (`id_parroquia`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `idprov` FOREIGN KEY (`id_provincia`) REFERENCES `conf_provincias` (`id_provincia`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `idsex` FOREIGN KEY (`id_sexo`) REFERENCES `conf_genero` (`id_sexo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `idusu` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of u_proveedores
-- ----------------------------
INSERT INTO `u_proveedores` VALUES ('1', '11', '1', 'proveedor1', 'proveedor1', '2', '1717', '53', '23', '963', '17', '178', '1089', 'Calle 1', 'admin');
INSERT INTO `u_proveedores` VALUES ('2', '13', '2', 'Jua n', 'Lopez', '2', '1717171717', '53', '22222', '9987877', '17', '178', '1083', 'Callw 223', 'admin');

-- ----------------------------
-- Table structure for u_tecnicos
-- ----------------------------
DROP TABLE IF EXISTS `u_tecnicos`;
CREATE TABLE `u_tecnicos` (
  `id_tecnico` int(255) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(255) DEFAULT NULL,
  `nombres` varchar(255) DEFAULT NULL,
  `apellidos` varchar(255) DEFAULT NULL,
  `documento_de_identidad` int(25) DEFAULT NULL,
  `id_nacionalidad` int(11) DEFAULT NULL,
  `id_sexo` int(10) DEFAULT NULL,
  `id_especialidad` int(255) DEFAULT NULL,
  `firma` blob,
  `sello` blob,
  `teléfono` int(20) DEFAULT NULL,
  `celular` int(20) DEFAULT NULL,
  `id_provincia` int(255) DEFAULT NULL,
  `id_canton` int(255) DEFAULT NULL,
  `id_parroquia` int(255) DEFAULT NULL,
  `dirección` varchar(255) DEFAULT NULL,
  `id_admin_tecnico` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_tecnico`),
  KEY `usu_pres` (`id_usuario`),
  KEY `esp_pres` (`id_especialidad`),
  KEY `idparropt` (`id_parroquia`),
  KEY `idcantopt` (`id_canton`),
  KEY `idnaciot` (`id_nacionalidad`),
  KEY `idprovint` (`id_provincia`),
  KEY `idsexopt` (`id_sexo`),
  CONSTRAINT `u_tecnicos_ibfk_1` FOREIGN KEY (`id_sexo`) REFERENCES `conf_genero` (`id_sexo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `u_tecnicos_ibfk_2` FOREIGN KEY (`id_canton`) REFERENCES `conf_cantones` (`id_canton`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `u_tecnicos_ibfk_3` FOREIGN KEY (`id_nacionalidad`) REFERENCES `conf_nacionalidad` (`id_nacionalidad`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `u_tecnicos_ibfk_4` FOREIGN KEY (`id_parroquia`) REFERENCES `conf_parroquias` (`id_parroquia`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `u_tecnicos_ibfk_5` FOREIGN KEY (`id_provincia`) REFERENCES `conf_provincias` (`id_provincia`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `u_tecnicos_ibfk_6` FOREIGN KEY (`id_especialidad`) REFERENCES `conf_especialidades` (`id_especialidad`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `u_tecnicos_ibfk_7` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of u_tecnicos
-- ----------------------------

-- ----------------------------
-- Table structure for u_trabajadores
-- ----------------------------
DROP TABLE IF EXISTS `u_trabajadores`;
CREATE TABLE `u_trabajadores` (
  `id_trabajador` int(255) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(255) DEFAULT NULL,
  `nombres` varchar(255) DEFAULT NULL,
  `apellidos` varchar(255) DEFAULT NULL,
  `documento_de_identidad` int(25) DEFAULT NULL,
  `id_nacionalidad` int(11) DEFAULT NULL,
  `id_sexo` int(10) DEFAULT NULL,
  `id_especialidad` int(255) DEFAULT NULL,
  `firma` blob,
  `sello` blob,
  `teléfono` int(20) DEFAULT NULL,
  `celular` int(20) DEFAULT NULL,
  `id_provincia` int(255) DEFAULT NULL,
  `id_canton` int(255) DEFAULT NULL,
  `id_parroquia` int(255) DEFAULT NULL,
  `dirección` varchar(255) DEFAULT NULL,
  `id_tecnico` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_trabajador`),
  KEY `usu_pres` (`id_usuario`),
  KEY `esp_pres` (`id_especialidad`),
  KEY `idparropt` (`id_parroquia`),
  KEY `idcantopt` (`id_canton`),
  KEY `idnaciot` (`id_nacionalidad`),
  KEY `idprovint` (`id_provincia`),
  KEY `idsexopt` (`id_sexo`),
  CONSTRAINT `idcantopt` FOREIGN KEY (`id_canton`) REFERENCES `conf_cantones` (`id_canton`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `idnaciot` FOREIGN KEY (`id_nacionalidad`) REFERENCES `conf_nacionalidad` (`id_nacionalidad`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `idparropt` FOREIGN KEY (`id_parroquia`) REFERENCES `conf_parroquias` (`id_parroquia`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `idprovint` FOREIGN KEY (`id_provincia`) REFERENCES `conf_provincias` (`id_provincia`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `idsexopt` FOREIGN KEY (`id_sexo`) REFERENCES `conf_genero` (`id_sexo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `u_trabajadores_ibfk_1` FOREIGN KEY (`id_especialidad`) REFERENCES `conf_especialidades` (`id_especialidad`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `u_trabajadores_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of u_trabajadores
-- ----------------------------
DROP TRIGGER IF EXISTS `calimpinac`;
DELIMITER ;;
CREATE TRIGGER `calimpinac` BEFORE INSERT ON `actas_entrega` FOR EACH ROW BEGIN
SET new.subtotal_sin_impuestos = new.subtotal_grava_iva + new.subtotal_iva_0_medicinas + new.subtotal_iva_0_equipos + new.subtotal_no_objeto_iva + new.subtotal_excento_iva;
SET new.iva = ((new.subtotal_grava_iva) * new.iva_gravado);
SET new.valor_total = new.subtotal_sin_impuestos + new.iva + new.ice + new.irbpnr;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `calimpupac`;
DELIMITER ;;
CREATE TRIGGER `calimpupac` BEFORE UPDATE ON `actas_entrega` FOR EACH ROW BEGIN
SET new.subtotal_sin_impuestos = new.subtotal_grava_iva + new.subtotal_iva_0_medicinas + new.subtotal_iva_0_equipos + new.subtotal_no_objeto_iva + new.subtotal_excento_iva;
SET new.iva = ((new.subtotal_grava_iva) * new.iva_gravado);
SET new.valor_total = new.subtotal_sin_impuestos + new.iva + new.ice + new.irbpnr;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `calcineqac`;
DELIMITER ;;
CREATE TRIGGER `calcineqac` BEFORE INSERT ON `actas_entrega_equipos` FOR EACH ROW BEGIN
SET new.precio_total = (new.cantidad * new.precio_unitario) - ((new.cantidad * new.precio_unitario) * new.descuento);
SET new.no_almacenado = new.cantidad - new.almacenado;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `calsumineqac`;
DELIMITER ;;
CREATE TRIGGER `calsumineqac` AFTER INSERT ON `actas_entrega_equipos` FOR EACH ROW BEGIN
DECLARE sumacero, sumadesc, sumtaeq  DECIMAL(20,2);
SET sumacero = (SELECT SUM(cantidad) FROM actas_entrega_equipos WHERE id_acta_entrega = NEW.id_acta_entrega);
SET sumadesc = (SELECT SUM(descuento) FROM actas_entrega_equipos WHERE id_acta_entrega = NEW.id_acta_entrega);
SET sumtaeq = (SELECT SUM(cantidad) FROM actas_entrega_equipos WHERE id_acta_entrega = NEW.id_acta_entrega AND  id_stock_equipo = NEW.id_stock_equipo);
UPDATE actas_entrega SET subtotal_iva_0_equipos = sumacero WHERE id_acta_entrega = NEW.id_acta_entrega;
UPDATE actas_entrega SET total_descuento_iva_0_equipos = sumadesc WHERE id_acta_entrega = NEW.id_acta_entrega;
UPDATE stock_equipos SET entregado = sumtaeq WHERE id_stock_equipo = NEW.id_stock_equipo;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `calupeqac`;
DELIMITER ;;
CREATE TRIGGER `calupeqac` BEFORE UPDATE ON `actas_entrega_equipos` FOR EACH ROW BEGIN
SET new.precio_total = (new.cantidad * new.precio_unitario) - ((new.cantidad * new.precio_unitario) * new.descuento);
SET new.no_almacenado = new.cantidad - new.almacenado;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `calsumupeqac`;
DELIMITER ;;
CREATE TRIGGER `calsumupeqac` AFTER UPDATE ON `actas_entrega_equipos` FOR EACH ROW BEGIN
DECLARE sumacero, sumadesc, sumtaeq  DECIMAL(20,2);
SET sumacero = (SELECT SUM(cantidad) FROM actas_entrega_equipos WHERE id_acta_entrega = NEW.id_acta_entrega);
SET sumadesc = (SELECT SUM(descuento) FROM actas_entrega_equipos WHERE id_acta_entrega = NEW.id_acta_entrega);
SET sumtaeq = (SELECT SUM(cantidad) FROM actas_entrega_equipos WHERE id_acta_entrega = NEW.id_acta_entrega AND  id_stock_equipo = NEW.id_stock_equipo);
UPDATE actas_entrega SET subtotal_iva_0_equipos = sumacero WHERE id_acta_entrega = NEW.id_acta_entrega;
UPDATE actas_entrega SET total_descuento_iva_0_equipos = sumadesc WHERE id_acta_entrega = NEW.id_acta_entrega;
UPDATE stock_equipos SET entregado = sumtaeq WHERE id_stock_equipo = NEW.id_stock_equipo;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `calsumdeleqac`;
DELIMITER ;;
CREATE TRIGGER `calsumdeleqac` AFTER DELETE ON `actas_entrega_equipos` FOR EACH ROW BEGIN
DECLARE sumacero, sumadesc, sumtaeq  DECIMAL(20,2);
SET sumacero = (SELECT SUM(cantidad) FROM actas_entrega_equipos WHERE id_acta_entrega = OLD.id_acta_entrega);
SET sumadesc = (SELECT SUM(descuento) FROM actas_entrega_equipos WHERE id_acta_entrega = OLD.id_acta_entrega);
SET sumtaeq = (SELECT SUM(cantidad) FROM actas_entrega_equipos WHERE id_acta_entrega = OLD.id_acta_entrega AND  id_stock_equipo = OLD.id_stock_equipo);
UPDATE actas_entrega SET subtotal_iva_0_equipos = sumacero WHERE id_acta_entrega = OLD.id_acta_entrega;
UPDATE actas_entrega SET total_descuento_iva_0_equipos = sumadesc WHERE id_acta_entrega = OLD.id_acta_entrega;
UPDATE stock_equipos SET entregado = sumtaeq WHERE id_stock_equipo = OLD.id_stock_equipo;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `calcineqacge`;
DELIMITER ;;
CREATE TRIGGER `calcineqacge` BEFORE INSERT ON `actas_entrega_general` FOR EACH ROW BEGIN
SET new.precio_total = (new.cantidad * new.precio_unitario) - ((new.cantidad * new.precio_unitario) * new.descuento);
SET new.no_almacenado = new.cantidad - new.almacenado;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `calsumineqacge`;
DELIMITER ;;
CREATE TRIGGER `calsumineqacge` AFTER INSERT ON `actas_entrega_general` FOR EACH ROW BEGIN
DECLARE sumacero, sumadesc, sumtaeq  DECIMAL(20,2);
SET sumacero = (SELECT SUM(cantidad) FROM actas_entrega_general WHERE id_acta_entrega = NEW.id_acta_entrega);
SET sumadesc = (SELECT SUM(descuento) FROM actas_entrega_general WHERE id_acta_entrega = NEW.id_acta_entrega);
SET sumtaeq = (SELECT SUM(cantidad) FROM actas_entrega_general WHERE id_acta_entrega = NEW.id_acta_entrega AND  id_stock_general = NEW.id_stock_general);
UPDATE actas_entrega SET subtotal_grava_iva = sumacero WHERE id_acta_entrega = NEW.id_acta_entrega;
UPDATE actas_entrega SET total_descuento_grava_iva = sumadesc WHERE id_acta_entrega = NEW.id_acta_entrega;
UPDATE stock_general SET entregado = sumtaeq WHERE id_stock_general = NEW.id_stock_general;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `calupeqacge`;
DELIMITER ;;
CREATE TRIGGER `calupeqacge` BEFORE UPDATE ON `actas_entrega_general` FOR EACH ROW BEGIN
SET new.precio_total = (new.cantidad * new.precio_unitario) - ((new.cantidad * new.precio_unitario) * new.descuento);
SET new.no_almacenado = new.cantidad - new.almacenado;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `calsumupeqacge`;
DELIMITER ;;
CREATE TRIGGER `calsumupeqacge` AFTER UPDATE ON `actas_entrega_general` FOR EACH ROW BEGIN
DECLARE sumacero, sumadesc, sumtaeq  DECIMAL(20,2);
SET sumacero = (SELECT SUM(cantidad) FROM actas_entrega_general WHERE id_acta_entrega = NEW.id_acta_entrega);
SET sumadesc = (SELECT SUM(descuento) FROM actas_entrega_general WHERE id_acta_entrega = NEW.id_acta_entrega);
SET sumtaeq = (SELECT SUM(cantidad) FROM actas_entrega_general WHERE id_acta_entrega = NEW.id_acta_entrega AND  id_stock_general = NEW.id_stock_general);
UPDATE actas_entrega SET subtotal_grava_iva = sumacero WHERE id_acta_entrega = NEW.id_acta_entrega;
UPDATE actas_entrega SET total_descuento_grava_iva = sumadesc WHERE id_acta_entrega = NEW.id_acta_entrega;
UPDATE stock_general SET entregado = sumtaeq WHERE id_stock_general = NEW.id_stock_general;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `calsumdeleqacge`;
DELIMITER ;;
CREATE TRIGGER `calsumdeleqacge` AFTER DELETE ON `actas_entrega_general` FOR EACH ROW BEGIN
DECLARE sumacero, sumadesc, sumtaeq  DECIMAL(20,2);
SET sumacero = (SELECT SUM(cantidad) FROM actas_entrega_general WHERE id_acta_entrega = OLD.id_acta_entrega);
SET sumadesc = (SELECT SUM(descuento) FROM actas_entrega_general WHERE id_acta_entrega = OLD.id_acta_entrega);
SET sumtaeq = (SELECT SUM(cantidad) FROM actas_entrega_general WHERE id_acta_entrega = OLD.id_acta_entrega AND  id_stock_general = OLD.id_stock_general);
UPDATE actas_entrega SET subtotal_grava_iva = sumacero WHERE id_acta_entrega = OLD.id_acta_entrega;
UPDATE actas_entrega SET total_descuento_grava_iva = sumadesc WHERE id_acta_entrega = OLD.id_acta_entrega;
UPDATE stock_general SET entregado = sumtaeq WHERE id_stock_general = OLD.id_stock_general;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `calcinaemed`;
DELIMITER ;;
CREATE TRIGGER `calcinaemed` BEFORE INSERT ON `actas_entrega_medicamentos` FOR EACH ROW BEGIN
SET new.precio_total = (new.cantidad * new.precio_unitario) - ((new.cantidad * new.precio_unitario) * new.descuento);
SET new.no_almacenado = new.cantidad - new.almacenado;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `calsuminmed`;
DELIMITER ;;
CREATE TRIGGER `calsuminmed` AFTER INSERT ON `actas_entrega_medicamentos` FOR EACH ROW BEGIN
DECLARE sumacero, sumadesc, sumtaeq  DECIMAL(20,2);
SET sumacero = (SELECT SUM(cantidad) FROM actas_entrega_medicamentos WHERE id_acta_entrega = NEW.id_acta_entrega);
SET sumadesc = (SELECT SUM(descuento) FROM actas_entrega_medicamentos WHERE id_acta_entrega = NEW.id_acta_entrega);
SET sumtaeq = (SELECT SUM(cantidad) FROM actas_entrega_medicamentos WHERE id_acta_entrega = NEW.id_acta_entrega AND  id_stock_medicamentos = NEW.id_stock_medicamentos);
UPDATE actas_entrega SET subtotal_iva_0_medicamentos = sumacero WHERE id_acta_entrega = NEW.id_acta_entrega;
UPDATE actas_entrega SET total_descuento_iva_0_medicamentos = sumadesc WHERE id_acta_entrega = NEW.id_acta_entrega;
UPDATE stock_medicamentos SET entregado = sumtaeq WHERE id_stock_medicamentos = NEW.id_stock_medicamentos;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `calupaemed`;
DELIMITER ;;
CREATE TRIGGER `calupaemed` BEFORE UPDATE ON `actas_entrega_medicamentos` FOR EACH ROW BEGIN
SET new.precio_total = (new.cantidad * new.precio_unitario) - ((new.cantidad * new.precio_unitario) * new.descuento);
SET new.no_almacenado = new.cantidad - new.almacenado;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `calsumupmed`;
DELIMITER ;;
CREATE TRIGGER `calsumupmed` AFTER UPDATE ON `actas_entrega_medicamentos` FOR EACH ROW BEGIN
DECLARE sumacero, sumadesc, sumtaeq  DECIMAL(20,2);
SET sumacero = (SELECT SUM(cantidad) FROM actas_entrega_medicamentos WHERE id_acta_entrega = NEW.id_acta_entrega);
SET sumadesc = (SELECT SUM(descuento) FROM actas_entrega_medicamentos WHERE id_acta_entrega = NEW.id_acta_entrega);
SET sumtaeq = (SELECT SUM(cantidad) FROM actas_entrega_medicamentos WHERE id_acta_entrega = NEW.id_acta_entrega AND  id_stock_medicamentos = NEW.id_stock_medicamentos);
UPDATE actas_entrega SET subtotal_iva_0_medicamentos = sumacero WHERE id_acta_entrega = NEW.id_acta_entrega;
UPDATE actas_entrega SET total_descuento_iva_0_medicamentos = sumadesc WHERE id_acta_entrega = NEW.id_acta_entrega;
UPDATE stock_medicamentos SET entregado = sumtaeq WHERE id_stock_medicamentos = NEW.id_stock_medicamentos;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `calsumdelmed`;
DELIMITER ;;
CREATE TRIGGER `calsumdelmed` AFTER DELETE ON `actas_entrega_medicamentos` FOR EACH ROW BEGIN
DECLARE sumacero, sumadesc, sumtaeq  DECIMAL(20,2);
SET sumacero = (SELECT SUM(cantidad) FROM actas_entrega_medicamentos WHERE id_acta_entrega = OLD.id_acta_entrega);
SET sumadesc = (SELECT SUM(descuento) FROM actas_entrega_medicamentos WHERE id_acta_entrega = OLD.id_acta_entrega);
SET sumtaeq = (SELECT SUM(cantidad) FROM actas_entrega_medicamentos WHERE id_acta_entrega = OLD.id_acta_entrega AND  id_stock_medicamentos = OLD.id_stock_medicamentos);
UPDATE actas_entrega SET subtotal_iva_0_medicamentos = sumacero WHERE id_acta_entrega = OLD.id_acta_entrega;
UPDATE actas_entrega SET total_descuento_iva_0_medicamentos = sumadesc WHERE id_acta_entrega = OLD.id_acta_entrega;
UPDATE stock_medicamentos SET entregado = sumtaeq WHERE id_stock_medicamentos = OLD.id_stock_medicamentos;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `calimpinac_copy`;
DELIMITER ;;
CREATE TRIGGER `calimpinac_copy` BEFORE INSERT ON `entregas_recetas` FOR EACH ROW BEGIN
SET new.subtotal_sin_impuestos = new.subtotal_grava_iva + new.subtotal_iva_0_medicinas + new.subtotal_iva_0_equipos + new.subtotal_no_objeto_iva + new.subtotal_excento_iva;
SET new.iva = ((new.subtotal_grava_iva - total_descuento_grava_iva) * new.iva_gravado);
SET new.valor_total = new.subtotal_sin_impuestos + new.iva + new.ice + new.irbpnr;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `calimpupac_copy`;
DELIMITER ;;
CREATE TRIGGER `calimpupac_copy` BEFORE UPDATE ON `entregas_recetas` FOR EACH ROW BEGIN
SET new.subtotal_sin_impuestos = new.subtotal_grava_iva + new.subtotal_iva_0_medicinas + new.subtotal_iva_0_equipos + new.subtotal_no_objeto_iva + new.subtotal_excento_iva;
SET new.iva = ((new.subtotal_grava_iva - total_descuento_grava_iva) * new.iva_gravado);
SET new.valor_total = new.subtotal_sin_impuestos + new.iva + new.ice + new.irbpnr;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `calcineqac_copy`;
DELIMITER ;;
CREATE TRIGGER `calcineqac_copy` BEFORE INSERT ON `entregas_recetas_equipos` FOR EACH ROW BEGIN
SET new.precio_total = (new.cantidad * new.precio_unitario) - ((new.cantidad * new.precio_unitario) * new.descuento);
SET new.no_almacenado = new.cantidad - new.almacenado;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `calsumineqac_copy`;
DELIMITER ;;
CREATE TRIGGER `calsumineqac_copy` AFTER INSERT ON `entregas_recetas_equipos` FOR EACH ROW BEGIN
DECLARE sumacero, sumadesc, sumtaeq  DECIMAL(20,2);
SET sumacero = (SELECT SUM(cantidad) FROM entregas_recetas_equipos WHERE id_entrega_receta = NEW.id_entrega_receta);
SET sumadesc = (SELECT SUM(descuento) FROM entregas_recetas_equipos WHERE id_entrega_receta = NEW.id_entrega_receta);
SET sumtaeq = (SELECT SUM(cantidad) FROM entregas_recetas_equipos WHERE id_entrega_receta = NEW.id_entrega_receta AND  id_stock_farmacia_equipo = NEW.id_stock_farmacia_equipo);
UPDATE entregas_recetas SET subtotal_iva_0_equipos = sumacero WHERE id_entrega_receta = NEW.id_entrega_receta;
UPDATE entregas_recetas SET total_descuento_iva_0_equipos = sumadesc WHERE id_entrega_receta = NEW.id_entrega_receta;
UPDATE stock_farmacia_equipos SET entregado = sumtaeq WHERE id_stock_farmacia_equipo = NEW.id_stock_farmacia_equipo;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `calupeqac_copy`;
DELIMITER ;;
CREATE TRIGGER `calupeqac_copy` BEFORE UPDATE ON `entregas_recetas_equipos` FOR EACH ROW BEGIN
SET new.precio_total = (new.cantidad * new.precio_unitario) - ((new.cantidad * new.precio_unitario) * new.descuento);
SET new.no_almacenado = new.cantidad - new.almacenado;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `calsumupeqac_copy`;
DELIMITER ;;
CREATE TRIGGER `calsumupeqac_copy` AFTER UPDATE ON `entregas_recetas_equipos` FOR EACH ROW BEGIN
DECLARE sumacero, sumadesc, sumtaeq  DECIMAL(20,2);
SET sumacero = (SELECT SUM(cantidad) FROM entregas_recetas_equipos WHERE id_entrega_receta = NEW.id_entrega_receta);
SET sumadesc = (SELECT SUM(descuento) FROM entregas_recetas_equipos WHERE id_entrega_receta = NEW.id_entrega_receta);
SET sumtaeq = (SELECT SUM(cantidad) FROM entregas_recetas_equipos WHERE id_entrega_receta = NEW.id_entrega_receta AND  id_stock_farmacia_equipo = NEW.id_stock_farmacia_equipo);
UPDATE entregas_recetas SET subtotal_iva_0_equipos = sumacero WHERE id_entrega_receta = NEW.id_entrega_receta;
UPDATE entregas_recetas SET total_descuento_iva_0_equipos = sumadesc WHERE id_entrega_receta = NEW.id_entrega_receta;
UPDATE stock_farmacia_equipos SET entregado = sumtaeq WHERE id_stock_farmacia_equipo = NEW.id_stock_farmacia_equipo;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `calsumdeleqac_copy`;
DELIMITER ;;
CREATE TRIGGER `calsumdeleqac_copy` AFTER DELETE ON `entregas_recetas_equipos` FOR EACH ROW BEGIN
DECLARE sumacero, sumadesc, sumtaeq  DECIMAL(20,2);
SET sumacero = (SELECT SUM(cantidad) FROM entregas_recetas_equipos WHERE id_entrega_receta = OLD.id_entrega_receta);
SET sumadesc = (SELECT SUM(descuento) FROM entregas_recetas_equipos WHERE id_entrega_receta = OLD.id_entrega_receta);
SET sumtaeq = (SELECT SUM(cantidad) FROM entregas_recetas_equipos WHERE id_entrega_receta = OLD.id_entrega_receta AND  id_stock_farmacia_equipo = OLD.id_stock_farmacia_equipo);
UPDATE entregas_recetas SET subtotal_iva_0_equipos = sumacero WHERE id_entrega_receta = OLD.id_entrega_receta;
UPDATE entregas_recetas SET total_descuento_iva_0_equipos = sumadesc WHERE id_entrega_receta = OLD.id_entrega_receta;
UPDATE stock_farmacia_equipos SET entregado = sumtaeq WHERE id_stock_farmacia_equipo = OLD.id_stock_farmacia_equipo;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `calcinaemed_copy`;
DELIMITER ;;
CREATE TRIGGER `calcinaemed_copy` BEFORE INSERT ON `entregas_recetas_medicamentos` FOR EACH ROW BEGIN
SET new.precio_total = (new.cantidad * new.precio_unitario) - ((new.cantidad * new.precio_unitario) * new.descuento);
SET new.no_almacenado = new.cantidad - new.almacenado;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `calsuminmed_copy`;
DELIMITER ;;
CREATE TRIGGER `calsuminmed_copy` AFTER INSERT ON `entregas_recetas_medicamentos` FOR EACH ROW BEGIN
DECLARE sumacero, sumadesc, sumtaeq  DECIMAL(20,2);
SET sumacero = (SELECT SUM(cantidad) FROM entregas_recetas_medicamentos WHERE id_entrega_receta = NEW.id_entrega_receta);
SET sumadesc = (SELECT SUM(descuento) FROM  entregas_recetas_medicamentos WHERE id_entrega_receta = NEW.id_entrega_receta);
SET sumtaeq = (SELECT SUM(cantidad) FROM  entregas_recetas_medicamentos WHERE id_entrega_receta = NEW.id_entrega_receta AND  id_stock_farmacia_medicamentos = NEW.id_stock_farmacia_medicamentos);
UPDATE entregas_recetas SET subtotal_iva_0_medicamentos = sumacero WHERE id_entrega_receta = NEW.id_entrega_receta;
UPDATE entregas_recetas SET total_descuento_iva_0_medicamentos = sumadesc WHERE id_entrega_receta = NEW.id_entrega_receta;
UPDATE stock_farmacia_medicamentos SET entregado = sumtaeq WHERE id_stock_farmacia_medicamentos = NEW.id_stock_farmacia_medicamentos;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `calupaemed_copy`;
DELIMITER ;;
CREATE TRIGGER `calupaemed_copy` BEFORE UPDATE ON `entregas_recetas_medicamentos` FOR EACH ROW BEGIN
SET new.precio_total = (new.cantidad * new.precio_unitario) - ((new.cantidad * new.precio_unitario) * new.descuento);
SET new.no_almacenado = new.cantidad - new.almacenado;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `calsumupmed_copy`;
DELIMITER ;;
CREATE TRIGGER `calsumupmed_copy` AFTER UPDATE ON `entregas_recetas_medicamentos` FOR EACH ROW BEGIN
DECLARE sumacero, sumadesc, sumtaeq  DECIMAL(20,2);
SET sumacero = (SELECT SUM(cantidad) FROM entregas_recetas_medicamentos WHERE id_entrega_receta = NEW.id_entrega_receta);
SET sumadesc = (SELECT SUM(descuento) FROM  entregas_recetas_medicamentos WHERE id_entrega_receta = NEW.id_entrega_receta);
SET sumtaeq = (SELECT SUM(cantidad) FROM  entregas_recetas_medicamentos WHERE id_entrega_receta = NEW.id_entrega_receta AND  id_stock_farmacia_medicamentos = NEW.id_stock_farmacia_medicamentos);
UPDATE entregas_recetas SET subtotal_iva_0_medicamentos = sumacero WHERE id_entrega_receta = NEW.id_entrega_receta;
UPDATE entregas_recetas SET total_descuento_iva_0_medicamentos = sumadesc WHERE id_entrega_receta = NEW.id_entrega_receta;
UPDATE stock_farmacia_medicamentos SET entregado = sumtaeq WHERE id_stock_farmacia_medicamentos = NEW.id_stock_farmacia_medicamentos;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `calsumdelmed_copy`;
DELIMITER ;;
CREATE TRIGGER `calsumdelmed_copy` AFTER DELETE ON `entregas_recetas_medicamentos` FOR EACH ROW BEGIN
DECLARE sumacero, sumadesc, sumtaeq  DECIMAL(20,2);
SET sumacero = (SELECT SUM(cantidad) FROM entregas_recetas_medicamentos WHERE id_entrega_receta = OLD.id_entrega_receta);
SET sumadesc = (SELECT SUM(descuento) FROM  entregas_recetas_medicamentos WHERE id_entrega_receta = OLD.id_entrega_receta);
SET sumtaeq = (SELECT SUM(cantidad) FROM  entregas_recetas_medicamentos WHERE id_entrega_receta = OLD.id_entrega_receta AND  id_stock_farmacia_medicamentos = OLD.id_stock_farmacia_medicamentos);
UPDATE entregas_recetas SET subtotal_iva_0_medicamentos = sumacero WHERE id_entrega_receta = OLD.id_entrega_receta;
UPDATE entregas_recetas SET total_descuento_iva_0_medicamentos = sumadesc WHERE id_entrega_receta = OLD.id_entrega_receta;
UPDATE stock_farmacia_medicamentos SET entregado = sumtaeq WHERE id_stock_farmacia_medicamentos = OLD.id_stock_farmacia_medicamentos;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `calculaimpuestosin`;
DELIMITER ;;
CREATE TRIGGER `calculaimpuestosin` BEFORE INSERT ON `facturas_proveedor` FOR EACH ROW BEGIN
SET new.subtotal_sin_impuestos = new.subtotal_grava_iva + new.subtotal_iva_0_medicinas + new.subtotal_iva_0_equipos + new.subtotal_no_objeto_iva + new.subtotal_excento_iva;
SET new.iva = ((new.subtotal_grava_iva -new.total_descuento_grava_iva) * new.iva_gravado);
SET new.valor_total = new.subtotal_sin_impuestos + new.iva + new.ice + new.irbpnr;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `calculaimpuestosup`;
DELIMITER ;;
CREATE TRIGGER `calculaimpuestosup` BEFORE UPDATE ON `facturas_proveedor` FOR EACH ROW BEGIN
SET new.subtotal_sin_impuestos = new.subtotal_grava_iva + new.subtotal_iva_0_medicinas + new.subtotal_iva_0_equipos + new.subtotal_no_objeto_iva + new.subtotal_excento_iva;
SET new.iva = ((new.subtotal_grava_iva -new.total_descuento_grava_iva) * new.iva_gravado);
SET new.valor_total = new.subtotal_sin_impuestos + new.iva + new.ice + new.irbpnr;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `calcineq`;
DELIMITER ;;
CREATE TRIGGER `calcineq` BEFORE INSERT ON `facturas_proveedor_equipos` FOR EACH ROW BEGIN
SET new.precio_total = (new.cantidad * new.precio_unitario) - ((new.cantidad * new.precio_unitario) * new.descuento);
SET new.no_almacenado = new.cantidad - new.almacenado;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `calsumineq`;
DELIMITER ;;
CREATE TRIGGER `calsumineq` AFTER INSERT ON `facturas_proveedor_equipos` FOR EACH ROW BEGIN
DECLARE sumacero, sumadesc DECIMAL(20,2);
SET sumacero = (SELECT SUM(cantidad * precio_unitario) FROM facturas_proveedor_equipos WHERE id_factura_proveedor = NEW.id_factura_proveedor);
SET sumadesc = (SELECT SUM( precio_unitario * descuento) FROM facturas_proveedor_equipos WHERE id_factura_proveedor = NEW.id_factura_proveedor);
UPDATE facturas_proveedor SET subtotal_iva_0_equipos = sumacero WHERE id_factura_proveedor = NEW.id_factura_proveedor;
UPDATE facturas_proveedor SET total_descuento_iva_0_equipos = sumadesc WHERE id_factura_proveedor = NEW.id_factura_proveedor;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `calupeq`;
DELIMITER ;;
CREATE TRIGGER `calupeq` BEFORE UPDATE ON `facturas_proveedor_equipos` FOR EACH ROW BEGIN
SET new.precio_total = (new.cantidad * new.precio_unitario) - ((new.cantidad * new.precio_unitario) * new.descuento);
SET new.no_almacenado = new.cantidad - new.almacenado;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `calsumupeq`;
DELIMITER ;;
CREATE TRIGGER `calsumupeq` AFTER UPDATE ON `facturas_proveedor_equipos` FOR EACH ROW BEGIN
DECLARE sumacero, sumadesc DECIMAL(20,2);
SET sumacero = (SELECT SUM(cantidad * precio_unitario) FROM facturas_proveedor_equipos WHERE id_factura_proveedor = NEW.id_factura_proveedor);
SET sumadesc = (SELECT SUM( precio_unitario * descuento) FROM facturas_proveedor_equipos WHERE id_factura_proveedor = NEW.id_factura_proveedor);
UPDATE facturas_proveedor SET subtotal_iva_0_equipos = sumacero WHERE id_factura_proveedor = NEW.id_factura_proveedor;
UPDATE facturas_proveedor SET total_descuento_iva_0_equipos = sumadesc WHERE id_factura_proveedor = NEW.id_factura_proveedor;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `calsumdeleq`;
DELIMITER ;;
CREATE TRIGGER `calsumdeleq` AFTER DELETE ON `facturas_proveedor_equipos` FOR EACH ROW BEGIN
DECLARE sumacero, sumadesc DECIMAL(20,2);
SET sumacero = (SELECT SUM(cantidad * precio_unitario) FROM facturas_proveedor_equipos WHERE id_factura_proveedor = OLD.id_factura_proveedor);
SET sumadesc = (SELECT SUM(precio_unitario *descuento) FROM facturas_proveedor_equipos WHERE id_factura_proveedor = OLD.id_factura_proveedor);
UPDATE facturas_proveedor SET subtotal_iva_0_equipos = sumacero WHERE id_factura_proveedor = OLD.id_factura_proveedor;
UPDATE facturas_proveedor SET total_descuento_iva_0_equipos = sumadesc WHERE id_factura_proveedor = OLD.id_factura_proveedor;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `calciniva`;
DELIMITER ;;
CREATE TRIGGER `calciniva` BEFORE INSERT ON `facturas_proveedor_general` FOR EACH ROW BEGIN
SET new.precio_total = (new.cantidad * new.precio_unitario) - ((new.cantidad * new.precio_unitario) * new.descuento);
SET new.no_almacenado = new.cantidad - new.almacenado;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `calsuminiva`;
DELIMITER ;;
CREATE TRIGGER `calsuminiva` AFTER INSERT ON `facturas_proveedor_general` FOR EACH ROW BEGIN
DECLARE sumacero, sumadesc DECIMAL(20,2);
SET sumacero = (SELECT SUM(cantidad *precio_unitario ) FROM facturas_proveedor_general WHERE id_factura_proveedor = NEW.id_factura_proveedor);
SET sumadesc = (SELECT SUM(precio_unitario * descuento) FROM facturas_proveedor_general WHERE id_factura_proveedor = NEW.id_factura_proveedor);
UPDATE facturas_proveedor SET subtotal_grava_iva = sumacero WHERE id_factura_proveedor = NEW.id_factura_proveedor;
UPDATE facturas_proveedor SET total_descuento_grava_iva = sumadesc WHERE id_factura_proveedor = NEW.id_factura_proveedor;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `calupiva`;
DELIMITER ;;
CREATE TRIGGER `calupiva` BEFORE UPDATE ON `facturas_proveedor_general` FOR EACH ROW BEGIN
SET new.precio_total = (new.cantidad * new.precio_unitario) - ((new.cantidad * new.precio_unitario) * new.descuento);
SET new.no_almacenado = new.cantidad - new.almacenado;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `calsumupiva`;
DELIMITER ;;
CREATE TRIGGER `calsumupiva` AFTER UPDATE ON `facturas_proveedor_general` FOR EACH ROW BEGIN
DECLARE sumacero, sumadesc DECIMAL(20,2);
SET sumacero = (SELECT SUM(cantidad *precio_unitario ) FROM facturas_proveedor_general WHERE id_factura_proveedor = NEW.id_factura_proveedor);
SET sumadesc = (SELECT SUM(precio_unitario * descuento) FROM facturas_proveedor_general WHERE id_factura_proveedor = NEW.id_factura_proveedor);
UPDATE facturas_proveedor SET subtotal_grava_iva = sumacero WHERE id_factura_proveedor = NEW.id_factura_proveedor;
UPDATE facturas_proveedor SET total_descuento_grava_iva = sumadesc WHERE id_factura_proveedor = NEW.id_factura_proveedor;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `calsumdeliva`;
DELIMITER ;;
CREATE TRIGGER `calsumdeliva` AFTER DELETE ON `facturas_proveedor_general` FOR EACH ROW BEGIN
DECLARE sumacero, sumadesc DECIMAL(20,2);
SET sumacero = (SELECT SUM(cantidad * precio_unitario) FROM facturas_proveedor_general WHERE id_factura_proveedor = OLD.id_factura_proveedor);
SET sumadesc = (SELECT SUM(precio_unitario * descuento) FROM facturas_proveedor_general WHERE id_factura_proveedor = OLD.id_factura_proveedor);
UPDATE facturas_proveedor SET subtotal_grava_iva = sumacero WHERE id_factura_proveedor = OLD.id_factura_proveedor;
UPDATE facturas_proveedor SET total_descuento_grava_iva = sumadesc WHERE id_factura_proveedor = OLD.id_factura_proveedor;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `calcin`;
DELIMITER ;;
CREATE TRIGGER `calcin` BEFORE INSERT ON `facturas_proveedor_medicamentos` FOR EACH ROW BEGIN
SET new.precio_total = (new.cantidad * new.precio_unitario) - ((new.cantidad * new.precio_unitario) * new.descuento);
SET new.no_almacenado = new.cantidad - new.almacenado;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `calsumin`;
DELIMITER ;;
CREATE TRIGGER `calsumin` AFTER INSERT ON `facturas_proveedor_medicamentos` FOR EACH ROW BEGIN
DECLARE sumacero, sumadesc DECIMAL(20,2);
SET sumacero = (SELECT SUM(cantidad * precio_unitario) FROM facturas_proveedor_medicamentos WHERE id_factura_proveedor = NEW.id_factura_proveedor);
SET sumadesc = (SELECT SUM(precio_unitario * descuento) FROM facturas_proveedor_medicamentos WHERE id_factura_proveedor = NEW.id_factura_proveedor);
UPDATE facturas_proveedor SET subtotal_iva_0_medicinas = sumacero WHERE id_factura_proveedor = NEW.id_factura_proveedor;
UPDATE facturas_proveedor SET total_descuento_iva_0_medicinas = sumadesc WHERE id_factura_proveedor = NEW.id_factura_proveedor;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `calup`;
DELIMITER ;;
CREATE TRIGGER `calup` BEFORE UPDATE ON `facturas_proveedor_medicamentos` FOR EACH ROW BEGIN
SET new.precio_total = (new.cantidad * new.precio_unitario) - ((new.cantidad * new.precio_unitario) * new.descuento);
SET new.no_almacenado = new.cantidad - new.almacenado;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `calsumup`;
DELIMITER ;;
CREATE TRIGGER `calsumup` AFTER UPDATE ON `facturas_proveedor_medicamentos` FOR EACH ROW BEGIN
DECLARE sumacero, sumadesc DECIMAL(20,2);
SET sumacero = (SELECT SUM(cantidad * precio_unitario) FROM facturas_proveedor_medicamentos WHERE id_factura_proveedor = NEW.id_factura_proveedor);
SET sumadesc = (SELECT SUM(precio_unitario * descuento) FROM facturas_proveedor_medicamentos WHERE id_factura_proveedor = NEW.id_factura_proveedor);
UPDATE facturas_proveedor SET subtotal_iva_0_medicinas = sumacero WHERE id_factura_proveedor = NEW.id_factura_proveedor;
UPDATE facturas_proveedor SET total_descuento_iva_0_medicinas = sumadesc WHERE id_factura_proveedor = NEW.id_factura_proveedor;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `calsumdel`;
DELIMITER ;;
CREATE TRIGGER `calsumdel` AFTER DELETE ON `facturas_proveedor_medicamentos` FOR EACH ROW BEGIN
DECLARE sumacero, sumadesc DECIMAL(20,2);
SET sumacero = (SELECT SUM(cantidad * precio_unitario) FROM facturas_proveedor_medicamentos WHERE id_factura_proveedor = OLD.id_factura_proveedor);
SET sumadesc = (SELECT SUM(precio_unitario * descuento) FROM facturas_proveedor_medicamentos WHERE id_factura_proveedor = OLD.id_factura_proveedor);
UPDATE facturas_proveedor SET subtotal_iva_0_medicinas = sumacero WHERE id_factura_proveedor = OLD.id_factura_proveedor;
UPDATE facturas_proveedor SET total_descuento_iva_0_medicinas = sumadesc WHERE id_factura_proveedor = OLD.id_factura_proveedor;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `calimpinacrm`;
DELIMITER ;;
CREATE TRIGGER `calimpinacrm` BEFORE INSERT ON `recetas_medico` FOR EACH ROW BEGIN
SET new.subtotal_sin_impuestos = new.subtotal_grava_iva + new.subtotal_iva_0_medicinas + new.subtotal_iva_0_equipos + new.subtotal_no_objeto_iva + new.subtotal_excento_iva;
SET new.iva = (new.subtotal_grava_iva  * new.iva_gravado);
SET new.valor_total = new.subtotal_sin_impuestos + new.iva + new.ice + new.irbpnr;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `calimpupacrm`;
DELIMITER ;;
CREATE TRIGGER `calimpupacrm` BEFORE UPDATE ON `recetas_medico` FOR EACH ROW BEGIN
SET new.subtotal_sin_impuestos = new.subtotal_grava_iva + new.subtotal_iva_0_medicinas + new.subtotal_iva_0_equipos + new.subtotal_no_objeto_iva + new.subtotal_excento_iva;
SET new.iva = (new.subtotal_grava_iva  * new.iva_gravado);
SET new.valor_total = new.subtotal_sin_impuestos + new.iva + new.ice + new.irbpnr;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `calcineqrme`;
DELIMITER ;;
CREATE TRIGGER `calcineqrme` BEFORE INSERT ON `recetas_medico_equipos` FOR EACH ROW BEGIN
SET new.precio_total = (new.cantidad * new.precio_unitario) - ((new.cantidad * new.precio_unitario) * new.descuento);
SET new.no_almacenado = new.cantidad - new.almacenado;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `calsumineqrmq`;
DELIMITER ;;
CREATE TRIGGER `calsumineqrmq` AFTER INSERT ON `recetas_medico_equipos` FOR EACH ROW BEGIN
DECLARE sumacero, sumadesc, sumtaeq DECIMAL(20,2);
SET sumacero = (SELECT SUM(cantidad * precio_unitario) FROM receta_médico_equipos WHERE id_receta_médico = NEW.id_receta_médico);
SET sumadesc = (SELECT SUM(precio_unitario * descuento) FROM receta_médico_equipos WHERE id_receta_médico = NEW.id_receta_médico);
SET sumtaeq = (SELECT SUM(cantidad) FROM receta_médico_equipos WHERE id_receta_médico = NEW.id_receta_médico AND  id_stock_farmacia_equipo = NEW.id_stock_farmacia_equipo);
UPDATE recetas_médico SET subtotal_iva_0_equipos = sumacero WHERE id_receta_medico = NEW.id_receta_médico;
UPDATE receta_médico SET total_descuento_iva_0_equipos = sumadesc WHERE id_receta_medico = NEW.id_receta_médico;
UPDATE stock_farmacia_equipos SET entregado = sumtaeq WHERE id_stock_farmacia_equipo = NEW.id_stock_farmacia_equipo;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `calupeqrme`;
DELIMITER ;;
CREATE TRIGGER `calupeqrme` BEFORE UPDATE ON `recetas_medico_equipos` FOR EACH ROW BEGIN
SET new.precio_total = (new.cantidad * new.precio_unitario) - ((new.cantidad * new.precio_unitario) * new.descuento);
SET new.no_almacenado = new.cantidad - new.almacenado;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `calsumupeqrme`;
DELIMITER ;;
CREATE TRIGGER `calsumupeqrme` AFTER UPDATE ON `recetas_medico_equipos` FOR EACH ROW BEGIN
DECLARE sumacero, sumadesc, sumtaeq DECIMAL(20,2);
SET sumacero = (SELECT SUM(cantidad * precio_unitario) FROM receta_médico_equipos WHERE id_receta_médico = NEW.id_receta_médico);
SET sumadesc = (SELECT SUM(precio_unitario * descuento) FROM receta_médico_equipos WHERE id_receta_médico = NEW.id_receta_médico);
SET sumtaeq = (SELECT SUM(cantidad) FROM receta_médico_equipos WHERE id_receta_médico = NEW.id_receta_médico AND  id_stock_farmacia_equipo = NEW.id_stock_farmacia_equipo);
UPDATE recetas_médico SET subtotal_iva_0_equipos = sumacero WHERE id_receta_medico = NEW.id_receta_médico;
UPDATE receta_médico SET total_descuento_iva_0_equipos = sumadesc WHERE id_receta_medico = NEW.id_receta_médico;
UPDATE stock_farmacia_equipos SET entregado = sumtaeq WHERE id_stock_farmacia_equipo = NEW.id_stock_farmacia_equipo;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `calsumdeleqrme`;
DELIMITER ;;
CREATE TRIGGER `calsumdeleqrme` AFTER DELETE ON `recetas_medico_equipos` FOR EACH ROW BEGIN
DECLARE sumacero, sumadesc, sumtaeq DECIMAL(20,2);
SET sumacero = (SELECT SUM(cantidad * precio_unitario) FROM receta_médico_equipos WHERE id_receta_médico = OLD.id_receta_médico);
SET sumadesc = (SELECT SUM(precio_unitario * descuento) FROM receta_médico_equipos WHERE id_receta_médico = OLD.id_receta_médico);
SET sumtaeq = (SELECT SUM(cantidad) FROM receta_médico_equipos WHERE id_receta_médico = OLD.id_receta_médico AND  id_stock_farmacia_equipo = OLD.id_stock_farmacia_equipo);
UPDATE recetas_médico SET subtotal_iva_0_equipos = sumacero WHERE id_receta_medico = OLD.id_receta_médico;
UPDATE receta_médico SET total_descuento_iva_0_equipos = sumadesc WHERE id_receta_medico = OLD.id_receta_médico;
UPDATE stock_farmacia_equipos SET entregado = sumtaeq WHERE id_stock_farmacia_equipo = OLD.id_stock_farmacia_equipo;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `calcinaemedrm`;
DELIMITER ;;
CREATE TRIGGER `calcinaemedrm` BEFORE INSERT ON `recetas_medico_medicamentos` FOR EACH ROW BEGIN
SET new.precio_total = (new.cantidad * new.precio_unitario) - ((new.cantidad * new.precio_unitario) * new.descuento);
SET new.no_entregado = new.cantidad - new.entregado;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `calsuminmedrm`;
DELIMITER ;;
CREATE TRIGGER `calsuminmedrm` AFTER INSERT ON `recetas_medico_medicamentos` FOR EACH ROW BEGIN
DECLARE sumacero, sumadesc, sumtaeq  DECIMAL(20,2);
SET sumacero = (SELECT SUM(cantidad * precio_unitario) FROM receta_médico_medicamentos WHERE id_receta_médico = NEW.id_receta_médico);
SET sumadesc = (SELECT SUM(precio_unitario * descuento) FROM receta_médico_medicamentos WHERE id_receta_médico = NEW.id_receta_médico);
SET sumtaeq = (SELECT SUM(cantidad) FROM receta_médico_medicamentos WHERE id_receta_médico = NEW.id_receta_médico AND  id_stock_farmacia_medicamentos = NEW.id_stock_farmacia_medicamentos);
UPDATE actas_entrega SET subtotal_iva_0_medicamentos = sumacero WHERE id_receta_médico = NEW.id_receta_médico;
UPDATE actas_entrega SET total_descuento_iva_0_medicamentos = sumadesc WHERE id_receta_médico = NEW.id_receta_médico;
UPDATE stock_farmacia_medicamentos SET entregado = sumtaeq WHERE id_stock_farmacia_medicamentos = NEW.id_stock_farmacia_medicamentos;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `calupaemedrm`;
DELIMITER ;;
CREATE TRIGGER `calupaemedrm` BEFORE UPDATE ON `recetas_medico_medicamentos` FOR EACH ROW BEGIN
SET new.precio_total = (new.cantidad * new.precio_unitario) - ((new.cantidad * new.precio_unitario) * new.descuento);
SET new.no_entregado = new.cantidad - new.entregado;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `calsumupmedrm`;
DELIMITER ;;
CREATE TRIGGER `calsumupmedrm` AFTER UPDATE ON `recetas_medico_medicamentos` FOR EACH ROW BEGIN
DECLARE sumacero, sumadesc, sumtaeq  DECIMAL(20,2);
SET sumacero = (SELECT SUM(cantidad * precio_unitario) FROM receta_médico_medicamentos WHERE id_receta_médico = NEW.id_receta_médico);
SET sumadesc = (SELECT SUM(precio_unitario * descuento) FROM receta_médico_medicamentos WHERE id_receta_médico = NEW.id_receta_médico);
SET sumtaeq = (SELECT SUM(cantidad) FROM receta_médico_medicamentos WHERE id_receta_médico = NEW.id_receta_médico AND  id_stock_farmacia_medicamentos = NEW.id_stock_farmacia_medicamentos);
UPDATE actas_entrega SET subtotal_iva_0_medicamentos = sumacero WHERE id_receta_médico = NEW.id_receta_médico;
UPDATE actas_entrega SET total_descuento_iva_0_medicamentos = sumadesc WHERE id_receta_médico = NEW.id_receta_médico;
UPDATE stock_farmacia_medicamentos SET entregado = sumtaeq WHERE id_stock_farmacia_medicamentos = NEW.id_stock_farmacia_medicamentos;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `calsumdelmedrm`;
DELIMITER ;;
CREATE TRIGGER `calsumdelmedrm` AFTER DELETE ON `recetas_medico_medicamentos` FOR EACH ROW BEGIN
DECLARE sumacero, sumadesc, sumtaeq  DECIMAL(20,2);
SET sumacero = (SELECT SUM(cantidad * precio_unitario) FROM receta_médico_medicamentos WHERE id_receta_médico = OLD.id_receta_médico);
SET sumadesc = (SELECT SUM( precio_unitario * descuento) FROM receta_médico_medicamentos WHERE id_receta_médico = OLD.id_receta_médico);
SET sumtaeq = (SELECT SUM(cantidad) FROM receta_médico_medicamentos WHERE id_receta_médico = OLD.id_receta_médico AND  id_stock_farmacia_medicamentos = OLD.id_stock_farmacia_medicamentos);
UPDATE actas_entrega SET subtotal_iva_0_medicamentos = sumacero WHERE id_receta_médico = OLD.id_receta_médico;
UPDATE actas_entrega SET total_descuento_iva_0_medicamentos = sumadesc WHERE id_receta_médico = OLD.id_receta_médico;
UPDATE stock_farmacia_medicamentos SET entregado = sumtaeq WHERE id_stock_farmacia_medicamentos = OLD.id_stock_farmacia_medicamentos;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `sumtoineq`;
DELIMITER ;;
CREATE TRIGGER `sumtoineq` BEFORE INSERT ON `stock_equipos` FOR EACH ROW BEGIN
SET new.precio_total = (new.cantidad * new.precio_unitario);
SET new.no_entregado = new.cantidad - new.entregado;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `sualeq`;
DELIMITER ;;
CREATE TRIGGER `sualeq` AFTER INSERT ON `stock_equipos` FOR EACH ROW BEGIN
DECLARE sumtaeq DECIMAL(20,2);
SET sumtaeq = (SELECT SUM(cantidad) FROM stock_equipos WHERE id_fpp = NEW.id_fpp);
UPDATE facturas_proveedor_equipos SET almacenado = sumtaeq WHERE id_factura_proveedor_equipo = NEW.id_fpp;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `sumtoupeq`;
DELIMITER ;;
CREATE TRIGGER `sumtoupeq` BEFORE UPDATE ON `stock_equipos` FOR EACH ROW BEGIN
SET new.precio_total = (new.cantidad * new.precio_unitario);
SET new.no_entregado = new.cantidad - new.entregado;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `sualupeq`;
DELIMITER ;;
CREATE TRIGGER `sualupeq` AFTER UPDATE ON `stock_equipos` FOR EACH ROW BEGIN
DECLARE sumtaeq DECIMAL(20,2);
SET sumtaeq = (SELECT SUM(cantidad) FROM stock_equipos WHERE id_fpp = NEW.id_fpp);
UPDATE facturas_proveedor_equipos SET almacenado = sumtaeq WHERE id_factura_proveedor_equipo = NEW.id_fpp;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `sadeleq`;
DELIMITER ;;
CREATE TRIGGER `sadeleq` AFTER DELETE ON `stock_equipos` FOR EACH ROW BEGIN
DECLARE sumtaeq DECIMAL(20,2);
SET sumtaeq = (SELECT SUM(cantidad) FROM stock_equipos WHERE id_fpp = OLD.id_fpp);
UPDATE facturas_proveedor_equipos SET almacenado = sumtaeq WHERE id_factura_proveedor_equipo = OLD.id_fpp;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `sumtoineqsf`;
DELIMITER ;;
CREATE TRIGGER `sumtoineqsf` BEFORE INSERT ON `stock_farmacia_equipos` FOR EACH ROW BEGIN
SET new.precio_total = (new.cantidad * new.precio_unitario);
SET new.no_entregado = new.cantidad - new.entregado;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `sualeqsf`;
DELIMITER ;;
CREATE TRIGGER `sualeqsf` AFTER INSERT ON `stock_farmacia_equipos` FOR EACH ROW BEGIN
DECLARE sumtaeq DECIMAL(20,2);
SET sumtaeq = (SELECT SUM(cantidad) FROM stock_farmacia_equipos WHERE id_aeq = NEW.id_aeq);
UPDATE actas_entrega_equipos SET almacenado = sumtaeq WHERE id_acta_entrega_equipo = NEW.id_aeq;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `sumtoupeqsf`;
DELIMITER ;;
CREATE TRIGGER `sumtoupeqsf` BEFORE UPDATE ON `stock_farmacia_equipos` FOR EACH ROW BEGIN
SET new.precio_total = (new.cantidad * new.precio_unitario);
SET new.no_entregado = new.cantidad - new.entregado;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `sualupeqsf`;
DELIMITER ;;
CREATE TRIGGER `sualupeqsf` AFTER UPDATE ON `stock_farmacia_equipos` FOR EACH ROW BEGIN
DECLARE sumtaeq DECIMAL(20,2);
SET sumtaeq = (SELECT SUM(cantidad) FROM stock_farmacia_equipos WHERE id_aeq = NEW.id_aeq);
UPDATE actas_entrega_equipos SET almacenado = sumtaeq WHERE id_acta_entrega_equipo = NEW.id_aeq;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `sadeleqsf`;
DELIMITER ;;
CREATE TRIGGER `sadeleqsf` AFTER DELETE ON `stock_farmacia_equipos` FOR EACH ROW BEGIN
DECLARE sumtaeq DECIMAL(20,2);
SET sumtaeq = (SELECT SUM(cantidad) FROM stock_farmacia_equipos WHERE id_aeq = OLD.id_aeq);
UPDATE actas_entrega_equipos SET almacenado = sumtaeq WHERE id_acta_entrega_equipo = OLD.id_aeq;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `sumtoingf`;
DELIMITER ;;
CREATE TRIGGER `sumtoingf` BEFORE INSERT ON `stock_farmacia_general` FOR EACH ROW BEGIN
SET new.precio_total = (new.cantidad * new.precio_unitario);
SET new.no_entregado = new.cantidad - new.entregado;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `sualgf`;
DELIMITER ;;
CREATE TRIGGER `sualgf` AFTER INSERT ON `stock_farmacia_general` FOR EACH ROW BEGIN
DECLARE sumtaeq DECIMAL(20,2);
SET sumtaeq = (SELECT SUM(cantidad) FROM stock_farmacia_general WHERE id_aeg = NEW.id_aeg);
UPDATE actas_entrega_general SET almacenado = sumtaeq WHERE id_acta_entrega_general = NEW.id_aeg;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `sumtoupgf`;
DELIMITER ;;
CREATE TRIGGER `sumtoupgf` BEFORE UPDATE ON `stock_farmacia_general` FOR EACH ROW BEGIN
SET new.precio_total = (new.cantidad * new.precio_unitario);
SET new.no_entregado = new.cantidad - new.entregado;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `sualupgf`;
DELIMITER ;;
CREATE TRIGGER `sualupgf` AFTER UPDATE ON `stock_farmacia_general` FOR EACH ROW BEGIN
DECLARE sumtaeq DECIMAL(20,2);
SET sumtaeq = (SELECT SUM(cantidad) FROM stock_farmacia_general WHERE id_aeg = NEW.id_aeg);
UPDATE actas_entrega_general SET almacenado = sumtaeq WHERE id_acta_entrega_general = NEW.id_aeg;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `sadelegf`;
DELIMITER ;;
CREATE TRIGGER `sadelegf` AFTER DELETE ON `stock_farmacia_general` FOR EACH ROW BEGIN
DECLARE sumtaeq DECIMAL(20,2);
SET sumtaeq = (SELECT SUM(cantidad) FROM stock_farmacia_general WHERE id_aeg = OLD.id_aeg);
UPDATE actas_entrega_general SET almacenado = sumtaeq WHERE id_acta_entrega_general = OLD.id_aeg;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `sumtoinf`;
DELIMITER ;;
CREATE TRIGGER `sumtoinf` BEFORE INSERT ON `stock_farmacia_medicamentos` FOR EACH ROW BEGIN
SET new.precio_total = (new.cantidad * new.precio_unitario);
SET new.no_entregado = new.cantidad - new.entregado;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `sualf`;
DELIMITER ;;
CREATE TRIGGER `sualf` AFTER INSERT ON `stock_farmacia_medicamentos` FOR EACH ROW BEGIN
DECLARE sumta DECIMAL(20,2);
SET sumta = (SELECT SUM(cantidad) FROM stock_farmacia_medicamentos WHERE id_aem = NEW.id_aem);
UPDATE actas_entrega_medicamentos SET almacenado = sumta WHERE id_acta_entrega_medicamento = NEW.id_aem;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `sumtoupf`;
DELIMITER ;;
CREATE TRIGGER `sumtoupf` BEFORE UPDATE ON `stock_farmacia_medicamentos` FOR EACH ROW BEGIN
SET new.precio_total = (new.cantidad * new.precio_unitario);
SET new.no_entregado = new.cantidad - new.entregado;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `sualupf`;
DELIMITER ;;
CREATE TRIGGER `sualupf` AFTER UPDATE ON `stock_farmacia_medicamentos` FOR EACH ROW BEGIN
DECLARE sumta DECIMAL(20,2);
SET sumta = (SELECT SUM(cantidad) FROM stock_farmacia_medicamentos WHERE id_aem = NEW.id_aem);
UPDATE actas_entrega_medicamentos SET almacenado = sumta WHERE id_acta_entrega_medicamento = NEW.id_aem;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `sadelf`;
DELIMITER ;;
CREATE TRIGGER `sadelf` AFTER DELETE ON `stock_farmacia_medicamentos` FOR EACH ROW BEGIN
DECLARE sumta DECIMAL(20,2);
SET sumta = (SELECT SUM(cantidad) FROM stock_farmacia_medicamentos WHERE id_aem = OLD.id_aem);
UPDATE actas_entrega_medicamentos SET almacenado = sumta WHERE id_acta_entrega_medicamento = OLD.id_aem;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `sumtoing`;
DELIMITER ;;
CREATE TRIGGER `sumtoing` BEFORE INSERT ON `stock_general` FOR EACH ROW BEGIN
SET new.precio_total = (new.cantidad * new.precio_unitario);
SET new.no_entregado = new.cantidad - new.entregado;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `sualg`;
DELIMITER ;;
CREATE TRIGGER `sualg` AFTER INSERT ON `stock_general` FOR EACH ROW BEGIN
DECLARE sumtaeq DECIMAL(20,2);
SET sumtaeq = (SELECT SUM(cantidad) FROM stock_general WHERE id_fpg = NEW.id_fpg);
UPDATE facturas_proveedor_general SET almacenado = sumtaeq WHERE id_factura_proveedor_general = NEW.id_fpg;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `sumtoupg`;
DELIMITER ;;
CREATE TRIGGER `sumtoupg` BEFORE UPDATE ON `stock_general` FOR EACH ROW BEGIN
SET new.precio_total = (new.cantidad * new.precio_unitario);
SET new.no_entregado = new.cantidad - new.entregado;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `sualupg`;
DELIMITER ;;
CREATE TRIGGER `sualupg` AFTER UPDATE ON `stock_general` FOR EACH ROW BEGIN
DECLARE sumtaeq DECIMAL(20,2);
SET sumtaeq = (SELECT SUM(cantidad) FROM stock_general WHERE id_fpg = NEW.id_fpg);
UPDATE facturas_proveedor_general SET almacenado = sumtaeq WHERE id_factura_proveedor_general = NEW.id_fpg;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `sadeleg`;
DELIMITER ;;
CREATE TRIGGER `sadeleg` AFTER DELETE ON `stock_general` FOR EACH ROW BEGIN
DECLARE sumtaeq DECIMAL(20,2);
SET sumtaeq = (SELECT SUM(cantidad) FROM stock_general WHERE id_fpg = OLD.id_fpg);
UPDATE facturas_proveedor_general SET almacenado = sumtaeq WHERE id_factura_proveedor_general = OLD.id_fpg;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `sumtoin`;
DELIMITER ;;
CREATE TRIGGER `sumtoin` BEFORE INSERT ON `stock_medicamentos` FOR EACH ROW BEGIN
SET new.precio_total = (new.cantidad * new.precio_unitario);
SET new.no_entregado = new.cantidad - new.entregado;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `sual`;
DELIMITER ;;
CREATE TRIGGER `sual` AFTER INSERT ON `stock_medicamentos` FOR EACH ROW BEGIN
DECLARE sumta DECIMAL(20,2);
SET sumta = (SELECT SUM(cantidad) FROM stock_medicamentos WHERE id_fpm = NEW.id_fpm);
UPDATE facturas_proveedor_medicamentos SET almacenado = sumta WHERE id_factura_proveedor_medicamentos = NEW.id_fpm;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `sumtoup`;
DELIMITER ;;
CREATE TRIGGER `sumtoup` BEFORE UPDATE ON `stock_medicamentos` FOR EACH ROW BEGIN
SET new.precio_total = (new.cantidad * new.precio_unitario);
SET new.no_entregado = new.cantidad - new.entregado;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `sualup`;
DELIMITER ;;
CREATE TRIGGER `sualup` AFTER UPDATE ON `stock_medicamentos` FOR EACH ROW BEGIN
DECLARE sumta DECIMAL(20,2);
SET sumta = (SELECT SUM(cantidad) FROM stock_medicamentos WHERE id_fpm = NEW.id_fpm);
UPDATE facturas_proveedor_medicamentos SET almacenado = sumta WHERE id_factura_proveedor_medicamentos = NEW.id_fpm;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `sadel`;
DELIMITER ;;
CREATE TRIGGER `sadel` AFTER DELETE ON `stock_medicamentos` FOR EACH ROW BEGIN
DECLARE sumta DECIMAL(20,2);
SET sumta = (SELECT SUM(cantidad) FROM stock_medicamentos WHERE id_fpm = OLD.id_fpm);
UPDATE facturas_proveedor_medicamentos SET almacenado = sumta WHERE id_factura_proveedor_medicamentos = OLD.id_fpm;
END
;;
DELIMITER ;
SET FOREIGN_KEY_CHECKS=1;
