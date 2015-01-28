PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE acquisto
(
    id INTEGER PRIMARY KEY,
    data TEXT NOT NULL,
    fornitore_id INTEGER NOT NULL,
    FOREIGN KEY (fornitore_id) REFERENCES fornitore (id)
);
CREATE TABLE acquistoDettaglio
(
    id INTEGER PRIMARY KEY,
    acquisto_id INTEGER NOT NULL,
    qta INTEGER NOT NULL,
    prezzo INTEGER NOT NULL,
    iva_id INTEGER NOT NULL,
    FOREIGN KEY ( acquisto_id ) REFERENCES acquisto (id),
    FOREIGN KEY ( iva_id ) REFERENCES iva (id)
);
CREATE TABLE categoria
(
    id INTEGER NOT NULL,
    nome TEXT,
    PRIMARY KEY (id)
);
CREATE TABLE fornitore
(
    id INTEGER NOT NULL,
    nome TEXT NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE iva
(
    id INTEGER NOT NULL,
    valore INTEGER NOT NULL,
    descrizione TEXT NOT NULL,
    PRIMARY KEY (id)
);
INSERT INTO "iva" VALUES(1,'4','ALIQUOTA 4%');
INSERT INTO "iva" VALUES(2,'10','ALIQUOTA 10%');
INSERT INTO "iva" VALUES(3,'20','ALIQUOTA 20%');
INSERT INTO "iva" VALUES(4,'22','ALIQUOTA 22%');
INSERT INTO "iva" VALUES(5,'FC','FUORI CAMPO IVA');
CREATE TABLE prodotto
(
    id INTEGER NOT NULL,
    barcode TEXT NOT NULL,
    descrizione TEXT NOT NULL,
    categoria TEXT,
    PRIMARY KEY (id),
    FOREIGN KEY ( categoria ) REFERENCES categoria ( id ) DEFERRABLE INITIALLY DEFERRED
);
INSERT INTO "prodotto" VALUES(1,'7622210088697 ','Halls Xs Peppermint 17g',NULL);
INSERT INTO "prodotto" VALUES(2,'7622210088727 ','Halls Xs Lemon 17g',NULL);
INSERT INTO "prodotto" VALUES(3,'80000310','Halls Mentho-lyptus Sugar Free 32g',NULL);
INSERT INTO "prodotto" VALUES(4,'80000358','Halls Miele E Limone 32g',NULL);
INSERT INTO "prodotto" VALUES(5,'80000327 ','Halls Extra Forte Senza Zucchero 32g',NULL);
INSERT INTO "prodotto" VALUES(6,'80000365 ','Halls Gusto Agrumi Senza Zucchero 32g',NULL);
INSERT INTO "prodotto" VALUES(7,'8000500197080 ','Tic Tac Breeze Cool Melon 26,9g',NULL);
INSERT INTO "prodotto" VALUES(8,'8000500182604 ','Tic Tac Breeze Refreshing Coco 26,9g',NULL);
INSERT INTO "prodotto" VALUES(9,'80800019 ','Tic Tac Strawberry Mix',NULL);
INSERT INTO "prodotto" VALUES(10,'80763307 ','Tic Tac Spearmint Mix',NULL);
INSERT INTO "prodotto" VALUES(11,'80052333 ','Tic Tac Orange',NULL);
INSERT INTO "prodotto" VALUES(12,'80052043 ','Tic Tac Mint',NULL);
INSERT INTO "prodotto" VALUES(13,'80050117 ','Kinder Sorpresa 20g',NULL);
INSERT INTO "prodotto" VALUES(14,'8020320047303 ','Ciao Lighters - Accendini Ricasricabili - Confezione Da 50pz',NULL);
INSERT INTO "prodotto" VALUES(15,'5010891010250 ','Rizla + Azzurre - Confezione Da 100 Pz',NULL);
INSERT INTO "prodotto" VALUES(16,'50973606 ','Rizla + Azzurra Cartine',NULL);
INSERT INTO "prodotto" VALUES(17,'8002530151025 ','Caffe'' Mauro Miscela De Luxe 3kg',NULL);
INSERT INTO "prodotto" VALUES(18,'8005713004293 ','Mistrà Pallini 70cl',NULL);
INSERT INTO "prodotto" VALUES(19,'8411144100082 ','Gin Larios 1l',NULL);
INSERT INTO "prodotto" VALUES(20,'8002095200039 ','Sambuca Molinari 1lt',NULL);
INSERT INTO "prodotto" VALUES(21,'3219820000078 ','Cognac Martell 70cl',NULL);
INSERT INTO "prodotto" VALUES(22,'8004400003137 ','Stravecchio Branca 100cl',NULL);
INSERT INTO "prodotto" VALUES(23,'80195597 ','Vecchia Romagna Etichetta Nera 1,5 Cl',NULL);
INSERT INTO "prodotto" VALUES(24,'7401005004506 ','Ron Zacapa 23y 70cl',NULL);
INSERT INTO "prodotto" VALUES(25,'5099873090442 ','Jack Daniel''s 1l',NULL);
INSERT INTO "prodotto" VALUES(26,'8028286000325 ','Rum Pampero Aniversario 70cl',NULL);
INSERT INTO "prodotto" VALUES(27,'8501110080255 ','Rum Avana 3 1l',NULL);
INSERT INTO "prodotto" VALUES(28,'8410024700008 ','Rum Malibu 1l',NULL);
INSERT INTO "prodotto" VALUES(29,'8002230000067 ','Barbieri Punch Al Mandarino 1 Lt',NULL);
INSERT INTO "prodotto" VALUES(30,'8501110080637 ','Havana Club Anejo Reserva 70cl',NULL);
INSERT INTO "prodotto" VALUES(31,'5010677015806 ','Rum Bacardi Superior 100cl',NULL);
INSERT INTO "prodotto" VALUES(32,'8000440112433 ','Vodka Keglevich Delicious - Vodka Melone 1lt',NULL);
INSERT INTO "prodotto" VALUES(33,'8000440112747 ','Vodka Keglevich Luxuria - Vodka Liquirizia 1 Lt',NULL);
INSERT INTO "prodotto" VALUES(34,'8000440112419 ','Vodka Keglevich Fresh - Vodka Limone 1 Lt',NULL);
INSERT INTO "prodotto" VALUES(35,'8000440112495 ','Vodka Keglevich Fresh - Vodka Mela Verde 1 Lt',NULL);
INSERT INTO "prodotto" VALUES(36,'8000440113492 ','Vodka Keglevich Fresh - Vodka Arancia Rossa 1 Lt',NULL);
INSERT INTO "prodotto" VALUES(37,'8000440112525 ','Vodka Keglevich Delicious - Vodka Fragola 1lt',NULL);
INSERT INTO "prodotto" VALUES(38,'8000440112396 ','Vodka Keglevich Delicious - Vodka Pesca 1 Lt',NULL);
INSERT INTO "prodotto" VALUES(39,'8000440112372 ','Vodka Keglevich Classic - Triple Distilled 1 Lt',NULL);
INSERT INTO "prodotto" VALUES(40,'8000440112471 ','Vodka Keglevich Menta 1 Lt',NULL);
INSERT INTO "prodotto" VALUES(41,'8003760086262 ','Lilibeo Marsala Cremovo 100cl',NULL);
INSERT INTO "prodotto" VALUES(42,'8000570568704 ','Amaro China Martini 70cl',NULL);
INSERT INTO "prodotto" VALUES(43,'8000020000044 ','Vermouth Cinzano Extra Dry 100cl',NULL);
INSERT INTO "prodotto" VALUES(44,'7640109120204 ','Mangaroca Batida De Coco 100 Cl',NULL);
INSERT INTO "prodotto" VALUES(45,'5010677912075 ','Martini Rosso 100cl',NULL);
INSERT INTO "prodotto" VALUES(46,'8000040000802 ','Campari Liquore 100cl',NULL);
INSERT INTO "prodotto" VALUES(47,'4823021800871 ','Nemiroff Vodka Bottiglia Da Esposizione',NULL);
INSERT INTO "prodotto" VALUES(48,'3011932000843 ','Martini Rosato 100 Cl',NULL);
INSERT INTO "prodotto" VALUES(49,'7501005611015 ','Tequila Sauza 100cl',NULL);
INSERT INTO "prodotto" VALUES(50,'5010103800457 ','J&b Scotch Whiskey 1 Litro',NULL);
INSERT INTO "prodotto" VALUES(51,'5000299212905 ','Chivas Regal 12y 1litro',NULL);
INSERT INTO "prodotto" VALUES(52,'075496002005 ','Angostura Bitter Aromatico 200ml',NULL);
INSERT INTO "prodotto" VALUES(53,'5010106111956 ','Ballantines Scotch Whisky 1l',NULL);
INSERT INTO "prodotto" VALUES(54,'3035542001908 ','Cointreau 1lt',NULL);
INSERT INTO "prodotto" VALUES(55,'8001110016341 ','Amaretto Di Saronno 1lt',NULL);
INSERT INTO "prodotto" VALUES(56,'8051084760092 ','Diecicoppe Pasetti 75 Cl',NULL);
INSERT INTO "prodotto" VALUES(57,'8501110080439 ','Havana Club Anejo 7 Anos 70 Cl',NULL);
INSERT INTO "prodotto" VALUES(58,'80190202 ','Brotto Grappa Prosecco Cartizze 70cl',NULL);
INSERT INTO "prodotto" VALUES(59,'8004009005327 ','Marzadro Grappa Le Diciotto Lune',NULL);
INSERT INTO "prodotto" VALUES(60,'8004009000292 ','Marzadro La Trentina Grappa Barrique 70cl',NULL);
INSERT INTO "prodotto" VALUES(61,'8017596018151 ','Mambo Kids Popcorn 120g',NULL);
INSERT INTO "prodotto" VALUES(62,'8017596010759 ','Mambo Kids Sfogliate 160g',NULL);
INSERT INTO "prodotto" VALUES(63,'8017596010735 ','Mambo Kids Classiche 300g',NULL);
INSERT INTO "prodotto" VALUES(64,'8017596017000 ','Mister Sibamba Arachidi Tostate Salate 750gr',NULL);
INSERT INTO "prodotto" VALUES(65,'8000410024025 ','Diger Selz Gusto Classico 12 Bustine 42 Gr.',NULL);
INSERT INTO "prodotto" VALUES(66,'8000300337419 ','Perugina Cacao Amaro 250gr.',NULL);
INSERT INTO "prodotto" VALUES(67,'07622210257956 ','Halls Extra Forte Senza Zucchero 20x32gr=640gr',NULL);
INSERT INTO "prodotto" VALUES(68,'8000500075449 ','Ferrero Duplo 24x26gr Confezione',NULL);
INSERT INTO "prodotto" VALUES(69,'08000500136164 ','Nutella Bready T1x36',NULL);
INSERT INTO "prodotto" VALUES(70,'08000500073698 ','Kinder Bueno T2x30',NULL);
INSERT INTO "prodotto" VALUES(71,'80177609 ','Kinder Cioccolato - 4pezzi 50gr.',NULL);
INSERT INTO "prodotto" VALUES(72,'80050100 ','Nutella & Go! - 39gr. Nutella + 13gr. Bastoncini',NULL);
INSERT INTO "prodotto" VALUES(73,'08000500033784 ','Kinder Cioccolato T4x20 - 50grx20',NULL);
INSERT INTO "prodotto" VALUES(74,'9002100043001 ','Nero Perugina Cioccolata In Tazza Polvere 1 Kg',NULL);
INSERT INTO "prodotto" VALUES(75,'08000500186954  ','Ferrero Rocher T2x16x2 800gr (25g X 16x2)',NULL);
INSERT INTO "prodotto" VALUES(76,'8000500186954 ','Ferrero Rocher T2x16x2 800gr (25g X 16x2)',NULL);
INSERT INTO "prodotto" VALUES(77,'2030L267216814L15714 ','Zucchero Semolato Mauro Bustine Kg 10 Cod.2030',NULL);
INSERT INTO "prodotto" VALUES(78,'3387390320558 ','Nestle Fitness Cioccolato 23,5g',NULL);
INSERT INTO "prodotto" VALUES(79,'5900020012494 ','Nestle Fitness Cioccolato Bianco 23,5 Gr',NULL);
INSERT INTO "prodotto" VALUES(80,'3387390320374 ','Nestle Fitness Cereali 23,5gr',NULL);
INSERT INTO "prodotto" VALUES(81,'80052357 ','Duplo Nocciolato 26gr.',NULL);
INSERT INTO "prodotto" VALUES(82,'40345192 ','Smarties Nestle 38gr',NULL);
INSERT INTO "prodotto" VALUES(83,'50251094 ','Nestle Kitkat 45gr.',NULL);
INSERT INTO "prodotto" VALUES(84,'40057750 ','Nestle Kitkat Cioccolato Bianco 45gr.',NULL);
INSERT INTO "prodotto" VALUES(85,'7613032625474 ','Nestle Lion 42gr.',NULL);
INSERT INTO "prodotto" VALUES(86,'80052760 ','Kinder Bueno 43gr 2 Pezi',NULL);
INSERT INTO "prodotto" VALUES(87,'8000500142004 ','Nutella B-ready',NULL);
INSERT INTO "prodotto" VALUES(88,'80761761 ','Kinder Bueno White 2 Pezzi 42 Gr.',NULL);
INSERT INTO "prodotto" VALUES(89,'80052364 ','Tronky Nocciola 18g.',NULL);
INSERT INTO "prodotto" VALUES(90,'8000300127980 ','Baci Perugina 2,5kg (14,3gr.each))',NULL);
INSERT INTO "prodotto" VALUES(91,'4005500028956 ','Kitkat 24x Ean50251094',NULL);
INSERT INTO "prodotto" VALUES(92,'7613032196257 ','Smarties 36x38g',NULL);
INSERT INTO "prodotto" VALUES(93,'3387390414172 ','Nestle Fitness 564g(24x23,5gr)',NULL);
INSERT INTO "prodotto" VALUES(94,'7613032625481 ','Nestle Lion 24x42gr=1008g',NULL);
INSERT INTO "prodotto" VALUES(95,'8000500075449 ','Ferrero Duplo 24x26gr',NULL);
INSERT INTO "prodotto" VALUES(96,'80310266 ','Kinder Cereali 23,5gr',NULL);
INSERT INTO "prodotto" VALUES(97,'08000500009864 ','Kinder Cereali 72x23,5gr',NULL);
INSERT INTO "prodotto" VALUES(98,'4067700061003 ','Jagermeister 6x1,0lt',NULL);
INSERT INTO "prodotto" VALUES(99,'800500186930 ','Ferrero Rocher 2x25gr',NULL);
INSERT INTO "prodotto" VALUES(100,'80177043 ','Ferrero Rocher 4pz 5''0gr',NULL);
INSERT INTO "prodotto" VALUES(101,'8002495512817 ','Prosecco Tor Dell''elmo 75clx6',NULL);
INSERT INTO "prodotto" VALUES(102,'8002495513395 ','Prosecco Tor Dell''elmo 75cl',NULL);
INSERT INTO "prodotto" VALUES(103,'8000400203379 ','Amaro Averna 1lt',NULL);
INSERT INTO "prodotto" VALUES(104,'8000965161077 ','Acqua Leggermente Frizzante Consilia 1,5lt',NULL);
INSERT INTO "prodotto" VALUES(105,'8000965161084 ','Acqua Naturale Consilia 2 Lt',NULL);
INSERT INTO "prodotto" VALUES(106,'80135944 ','Pocket Coffee Ferrero 5pz 62,5gr',NULL);
INSERT INTO "prodotto" VALUES(107,'8000400005522 ','Grappa Frattina Chardonnay 75cl',NULL);
INSERT INTO "prodotto" VALUES(108,'5011013100118 ','Baileys Original Irish Cream 1 Lt',NULL);
INSERT INTO "prodotto" VALUES(109,'8000330014458 ','Amaro Montenegro 70cl',NULL);
INSERT INTO "prodotto" VALUES(110,'8005240900020 ','Amaro Lucano 100cl',NULL);
INSERT INTO "prodotto" VALUES(111,'8004400023579 ','Branca Menta 100cl',NULL);
INSERT INTO "prodotto" VALUES(112,'8006550302016 ','Amaro Ramazzotti 1lt',NULL);
INSERT INTO "prodotto" VALUES(113,'8000440112822 ','Limonce 1 Lt',NULL);
INSERT INTO "prodotto" VALUES(114,'8014396000393 ','Schweppes Tonica 1 Lt',NULL);
INSERT INTO "prodotto" VALUES(115,'8004400012511 ','Fernet Branca 1 Lt',NULL);
INSERT INTO "prodotto" VALUES(116,'8004009000063 ','Marzadro Anima Nera 1lt',NULL);
INSERT INTO "prodotto" VALUES(117,'8051084760054 ','Pecorino Pasetti 75cl.',NULL);
INSERT INTO "prodotto" VALUES(118,'80145431 ','Lemonsoda 1,5lt',NULL);
INSERT INTO "prodotto" VALUES(119,'4067700011008 ','Jagermeister 1 Lt',NULL);
INSERT INTO "prodotto" VALUES(120,'8002095761783 ','Vov 70cl',NULL);
INSERT INTO "prodotto" VALUES(121,'5010677925303 ','Martini Bianco 1 Lt',NULL);
INSERT INTO "prodotto" VALUES(122,'8002394001801 ','Grappa 903 Barrique 70cl',NULL);
INSERT INTO "prodotto" VALUES(123,'8006264030700 ','Elisir D''abruzzo Rattafia 70 Cl Jannamico',NULL);
INSERT INTO "prodotto" VALUES(124,'8004400074113 ','Caffe'' Borghetti 1 Lt',NULL);
INSERT INTO "prodotto" VALUES(125,'80008354 ','Gassosa San Benedetto Lt 1,5',NULL);
INSERT INTO "prodotto" VALUES(126,'8002670172652 ','Panna Sprayn Granarolo 250g',NULL);
INSERT INTO "prodotto" VALUES(127,'8001663500007 ','Latte Alta Qualita Pastorizzato Fresco Intero Centrale Latte Rm 1lt',NULL);
INSERT INTO "prodotto" VALUES(128,'8001780150673 ','Fabbri Mixibar Granatina 1,300kg 1lt',NULL);
INSERT INTO "prodotto" VALUES(129,'8033609081073 ','Mister Mix Fragola 750 Ml',NULL);
INSERT INTO "prodotto" VALUES(130,'8002915000047 ','Perla Di Vitigno Vino Spumante Brut Toso',NULL);
INSERT INTO "prodotto" VALUES(131,'801190104815 ','Algida Torta Romantica',NULL);
INSERT INTO "prodotto" VALUES(132,'8003130129520 ','San Carlo Più Gusto 50g',NULL);
INSERT INTO "prodotto" VALUES(133,'8003130129599 ','San Carlo Highlander 50g',NULL);
INSERT INTO "prodotto" VALUES(134,'8003130129544 ','San Carlo Rustica Bar 50g',NULL);
INSERT INTO "prodotto" VALUES(135,'8410199011039 ','Lay''s 44g Classiche',NULL);
INSERT INTO "prodotto" VALUES(136,'8410199011046 ','Lay''s 44g Ricetta Campagnola',NULL);
INSERT INTO "prodotto" VALUES(137,'8410199011060 ','Lay''s 37g Xtra Gusto Barbecue',NULL);
INSERT INTO "prodotto" VALUES(138,'8410199011053 ','Lay''s 37g Xtra Gusto Classico',NULL);
INSERT INTO "prodotto" VALUES(139,'8002085002520 ','Puff Rings Gusto Pizza - 38g',NULL);
INSERT INTO "prodotto" VALUES(140,'8002085002131 ','Crick Crock Più Croccanti Gusto Classico 50g',NULL);
INSERT INTO "prodotto" VALUES(141,'8002085002186 ','Crick Crock Bell''italia 45g',NULL);
INSERT INTO "prodotto" VALUES(142,'8002085002094 ','Pop Popcorn 35g',NULL);
INSERT INTO "prodotto" VALUES(143,'8002085002070 ','Crick Crock Stick 50g',NULL);
INSERT INTO "prodotto" VALUES(144,'8002085002902 ','Le Contadine Più Gusto Ketchup 40g',NULL);
INSERT INTO "prodotto" VALUES(145,'8003130139925 ','Wacko''s 40g',NULL);
INSERT INTO "prodotto" VALUES(146,'7622210147905 ','Fonzies Choco 80g',NULL);
INSERT INTO "prodotto" VALUES(147,'8000735005945 ','Fruittella X-cola 90g',NULL);
INSERT INTO "prodotto" VALUES(148,'8000735005013 ','Fruiitella Frizz 90g',NULL);
INSERT INTO "prodotto" VALUES(149,'8000735005006 ','Fruittella Ripieneri 90g',NULL);
INSERT INTO "prodotto" VALUES(150,'8000735005143 ','Fruittella Pinkis 90g',NULL);
INSERT INTO "prodotto" VALUES(151,'8000735005037 ','Fruittella Orsetti 90g',NULL);
INSERT INTO "prodotto" VALUES(152,'8000735005068 ','Fruittella Animals 90g',NULL);
INSERT INTO "prodotto" VALUES(153,'8000735005389 ','Fruittella Fullfun 90g',NULL);
INSERT INTO "prodotto" VALUES(154,'80737018 ','Golia Activ Plus 46g Box',NULL);
INSERT INTO "prodotto" VALUES(155,'80766155 ','Golia Herbs Mirtillo Lampone Box',NULL);
INSERT INTO "prodotto" VALUES(156,'80525172 ','Daygum Protex 30g Box',NULL);
INSERT INTO "prodotto" VALUES(157,'80656074 ','Air Action Vigorsol Box 29g',NULL);
INSERT INTO "prodotto" VALUES(158,'80695929 ','Happydent White Complete 30g Box',NULL);
INSERT INTO "prodotto" VALUES(159,'80729150 ','Vivident Blast Box 30g',NULL);
INSERT INTO "prodotto" VALUES(160,'80794325 ','Mentos 45'' Box Peppermint',NULL);
INSERT INTO "prodotto" VALUES(161,'80854821 ','Mentos 45'' Box Spearmint',NULL);
INSERT INTO "prodotto" VALUES(162,'80712749 ','Golia Activ Plus 34g',NULL);
INSERT INTO "prodotto" VALUES(163,'87108026 ','Mentos Gusto Frutta 38g',NULL);
INSERT INTO "prodotto" VALUES(164,'80758198 ','Alpenliebe Chocolate Gusto Caramel 38g',NULL);
INSERT INTO "prodotto" VALUES(165,'80686415 ','Golia Bianca 38g',NULL);
INSERT INTO "prodotto" VALUES(166,'80686903 ','Alpenliebe Gusto Original Caramel 41g',NULL);
INSERT INTO "prodotto" VALUES(167,'50249916 ','Fruit Joy Original 52,5g',NULL);
INSERT INTO "prodotto" VALUES(168,'5412841601240 ','Frisk Peppermint 5,7g',NULL);
INSERT INTO "prodotto" VALUES(169,'80680215 ','Big Babol Con Succo Di Frutta 37g',NULL);
INSERT INTO "prodotto" VALUES(170,'80926351 ','Mentos Nowmints Strawberry Flavour 18g',NULL);
INSERT INTO "prodotto" VALUES(171,'80810513 ','Brooklin Cinammon 9pz 25g',NULL);
INSERT INTO "prodotto" VALUES(172,'80679387 ','Brooklyn Gusto Classico 9pz 25g',NULL);
INSERT INTO "prodotto" VALUES(173,'80679226 ','Vivident Xilyt Confetti 13,2g',NULL);
INSERT INTO "prodotto" VALUES(174,'80917946 ','Vivident White Xylit Bubble Mint Confetti 13,2 G',NULL);
INSERT INTO "prodotto" VALUES(175,'80679219 ','Vivident Xylit Greenmint Confetti 13,2g',NULL);
INSERT INTO "prodotto" VALUES(176,'80085430 ','Air Action Vigorsol Confetti 13,2g',NULL);
INSERT INTO "prodotto" VALUES(177,'80679233 ','Vigorsol Original Confetti',NULL);
INSERT INTO "prodotto" VALUES(178,'80686842 ','Air Action Vigorsol Ice Cassis Con Vit. C 13,2g',NULL);
INSERT INTO "prodotto" VALUES(179,'80773597 ','Air Action Vigorsol Xtreme 13,2g',NULL);
INSERT INTO "prodotto" VALUES(180,'80717317 ','Air Action Vigorsol Black Ice 13,2g',NULL);
INSERT INTO "prodotto" VALUES(181,'80447078 ','New York Black',NULL);
INSERT INTO "prodotto" VALUES(182,'8006890768305 ','Birra Ichnusa 33cl',NULL);
INSERT INTO "prodotto" VALUES(183,'5010039000624 ','Tennent''s Super Strong Ale 33cl 9%vol',NULL);
INSERT INTO "prodotto" VALUES(184,'8006890626926 ','Bulldog Strong Ale 7,1%vol 33cl',NULL);
INSERT INTO "prodotto" VALUES(185,'42040613 ','Beck''s 33cl',NULL);
INSERT INTO "prodotto" VALUES(186,'5741000001981 ','Ceres Strong Ale 33cl',NULL);
INSERT INTO "prodotto" VALUES(187,'80067955 ','Birra Peroni 33cl',NULL);
INSERT INTO "prodotto" VALUES(188,'80067900 ','Birra Peroni 66cl',NULL);
INSERT INTO "prodotto" VALUES(189,'018200001680 ','Bud 33cl',NULL);
INSERT INTO "prodotto" VALUES(190,'75032814 ','Corona Extra 33cl',NULL);
INSERT INTO "prodotto" VALUES(191,'5391516930642 ','Tennent''s 1885 Lager 5% Vol.',NULL);
INSERT INTO "prodotto" VALUES(192,'5410076067657 ','Pringles Original 40g',NULL);
INSERT INTO "prodotto" VALUES(193,'5413149775244 ','Pringles Paprika 40g',NULL);
INSERT INTO "prodotto" VALUES(194,'5413149775183 ','Pringles Sour Cream & Onion',NULL);
INSERT INTO "prodotto" VALUES(195,'80050643 ','Estathe Limone 20cl Bicchiere',NULL);
INSERT INTO "prodotto" VALUES(196,'80050803 ','Estathe Pesca 20cl Bicchiere',NULL);
INSERT INTO "prodotto" VALUES(197,'8000965161107 ','Acqua Frizzante Consilia 50cl',NULL);
INSERT INTO "prodotto" VALUES(198,'8000965161121 ','Acqua Naturale Consilia 50cl',NULL);
INSERT INTO "prodotto" VALUES(199,'80463535 ','Acqua Di Frasassi Frizzante 50cl',NULL);
INSERT INTO "prodotto" VALUES(200,'9002490100070 ','Redbull Energy Drink 250ml',NULL);
INSERT INTO "prodotto" VALUES(201,'5000112557688 ','Fanta Lattina 330ml',NULL);
INSERT INTO "prodotto" VALUES(202,'8001190104815 ','Torta Romantica Carte D''or',NULL);
INSERT INTO "prodotto" VALUES(203,'80112655 ','Fior Di Fragola',NULL);
INSERT INTO "prodotto" VALUES(204,'8000920461235 ','Calippo Cola',NULL);
INSERT INTO "prodotto" VALUES(205,'8000920401187 ','Calippo Lime',NULL);
INSERT INTO "prodotto" VALUES(206,'8712100325113 ','Solero',NULL);
INSERT INTO "prodotto" VALUES(207,'8000920500200 ','Magnum Classic',NULL);
INSERT INTO "prodotto" VALUES(208,'8000920500217 ','Magnum White',NULL);
INSERT INTO "prodotto" VALUES(209,'8000920500309 ','Cornetto Classico',NULL);
INSERT INTO "prodotto" VALUES(210,'8712100532863 ','Winner Taco',NULL);
INSERT INTO "prodotto" VALUES(211,'8001190101777 ','Croccante',NULL);
INSERT INTO "prodotto" VALUES(212,'8712100526404 ','Cremino',NULL);
INSERT INTO "prodotto" VALUES(213,'80111757 ','Cafè Zero Espresso',NULL);
INSERT INTO "prodotto" VALUES(214,'8033609081240 ','Mister Mix Zucchero Di Canna Grezzo',NULL);
INSERT INTO "prodotto" VALUES(215,'8033609081097 ','Mister Mix Kiwi',NULL);
INSERT INTO "prodotto" VALUES(216,'8033609081226 ','Mister Mix Zucchero Liquido Neutro',NULL);
INSERT INTO "prodotto" VALUES(217,'8033609081042 ','Mister Mix Cocco',NULL);
INSERT INTO "prodotto" VALUES(218,'8033609081134 ','Mister Mix Melone',NULL);
INSERT INTO "prodotto" VALUES(219,'8033609081158 ','Mister Mix Pesca',NULL);
INSERT INTO "prodotto" VALUES(220,'8033609081059 ','Mister Mix Cranberry',NULL);
INSERT INTO "prodotto" VALUES(221,'8033609081165 ','Mister Mix Passion Fruit',NULL);
INSERT INTO "prodotto" VALUES(222,'8033609081189 ','Mister Mix Limone',NULL);
INSERT INTO "prodotto" VALUES(223,'8033609081233 ','Mister Mix Zucchero Liquido Di Canna',NULL);
INSERT INTO "prodotto" VALUES(224,'8033609081035 ','Mister Mix Banana',NULL);
INSERT INTO "prodotto" VALUES(225,'8009160007883 ','Natfood Base Neutra Per Granita Kg 7',NULL);
INSERT INTO "prodotto" VALUES(226,'8002530920300 ','Zucchero In Bustine Cod. 2030 Caffé Mauro',NULL);
INSERT INTO "prodotto" VALUES(227,'8006450014354 ','Miele Ambrosoli 150x6g',NULL);
INSERT INTO "prodotto" VALUES(228,'8014032161006 ','Tovaglioli Di Cellulosa 17x17cm Pz. 2000',NULL);
INSERT INTO "prodotto" VALUES(229,'8033020150112 ','Coperchio 80cc 100pz',NULL);
INSERT INTO "prodotto" VALUES(230,'8710625510755 ','De Kuyper Creme De Cassis 70cl',NULL);
INSERT INTO "prodotto" VALUES(231,'8710625509810 ','De Kuyper Creme De Cacao White 70cl',NULL);
INSERT INTO "prodotto" VALUES(232,'8710625508011 ','De Kuyper Creme De Bananes 70cl',NULL);
INSERT INTO "prodotto" VALUES(233,'8710625502705 ','De Kuyper Apricot Brandy 70cl',NULL);
INSERT INTO "prodotto" VALUES(234,'3018300000139 ','Grand Marnier Cordon Rouge 1 Litro',NULL);
INSERT INTO "prodotto" VALUES(235,'5449000005090 ','Fanta 1,5 Lt',NULL);
INSERT INTO "prodotto" VALUES(236,'8000440112730 ','Keglevich Vodka Liquirizia 70cl',NULL);
INSERT INTO "prodotto" VALUES(237,'8009160008682 ','Sciroppo Di Orzata Naturera 750ml 1kg',NULL);
INSERT INTO "prodotto" VALUES(238,'8051084760085 ','Trebbiano D''abruzzo Zaraché Pasetti',NULL);
INSERT INTO "prodotto" VALUES(239,'8710625640742 ','De Kuyper Blue Curaçao 70cl',NULL);
INSERT INTO "prodotto" VALUES(240,'8001780150673 ','Mixibar Granatina Fabbri 1,3kg 1000 Ml',NULL);
INSERT INTO "prodotto" VALUES(241,'8000440113102 ','Cherry Stock0.7l',NULL);
INSERT INTO "prodotto" VALUES(242,'8001780152974 ','Fabbri Mixibar Pesca Gialla',NULL);
INSERT INTO "prodotto" VALUES(243,'8002580026236 ','Succo Santal Pera 1 Lt',NULL);
INSERT INTO "prodotto" VALUES(244,'7610594251950 ','Kahlùa Cl100',NULL);
INSERT INTO "prodotto" VALUES(245,'8009160015413 ','Naturera Sciroppo Di Zucchero Di Canna Liquido 700ml',NULL);
INSERT INTO "prodotto" VALUES(246,'8710625513411 ','De Kuyper Crème De Menthe White 70cl',NULL);
INSERT INTO "prodotto" VALUES(247,'8710625527203 ','De Kuyper Triple Sec 70cl',NULL);
INSERT INTO "prodotto" VALUES(248,'8710625511219 ','De Kuyper Crème De Menthe Green',NULL);
INSERT INTO "prodotto" VALUES(249,'5099873015377 ','Southern Comfort 1 Lt',NULL);
INSERT INTO "prodotto" VALUES(250,'7896002108133 ','Cachaca 51 1lt',NULL);
INSERT INTO "prodotto" VALUES(251,'8710625524707 ','Peachtree 70cl',NULL);
INSERT INTO "prodotto" VALUES(252,'8716000964984 ','Bols Cacao Brown 70cl',NULL);
INSERT INTO "prodotto" VALUES(253,'3035540001825 ','Passoa 1 Lt',NULL);
INSERT INTO "prodotto" VALUES(254,'0031110040136 ','Mauro Tazzina Da Caffè E Piattino Bianco 6pz',NULL);
INSERT INTO "prodotto" VALUES(255,'0031110040228 ','Mauro Tazzina Da Cappuccino E Piattino Bianco 6pz',NULL);
INSERT INTO "prodotto" VALUES(256,'8033020150181 ','Coperchi 130-200cc 100pz',NULL);
INSERT INTO "prodotto" VALUES(257,'8033020150211 ','Coffee To Go Bicchieri 200cc - Cod Prod C200',NULL);
INSERT INTO "prodotto" VALUES(258,'8033020150105 ','Cofee To Go Bicchieri 80cc - Cod Prod C808000043061008',NULL);
INSERT INTO "prodotto" VALUES(259,'8000043061008 ','Novafruit Fruttosio Cristallino 150pz 600g',NULL);
INSERT INTO "prodotto" VALUES(260,'8032836048781 ','Natfood Sciroppo Ci Ciliegia 500ml',NULL);
INSERT INTO "prodotto" VALUES(261,'8032836048811 ','Natfood Sciroppo Di Arancia 500ml',NULL);
INSERT INTO "prodotto" VALUES(262,'8032836048828 ','Natfood Sciroppo Di Frasgola 500ml',NULL);
INSERT INTO "prodotto" VALUES(263,'8032836048859 ','Natfood Sciroppo Di Anguria 500ml',NULL);
INSERT INTO "prodotto" VALUES(264,'8032836048798 ','Natfood Sciroppo Di Menta 500ml',NULL);
INSERT INTO "prodotto" VALUES(265,'8032836048842 ','Natfood Sciroppo Cola 500ml',NULL);
INSERT INTO "prodotto" VALUES(266,'8032836048804 ','Natfood Sciroppo Di Limone 500ml',NULL);
INSERT INTO "prodotto" VALUES(267,'8032836048835 ','Natfood Sciroppo Frutti Di Bosco 500ml',NULL);
INSERT INTO "prodotto" VALUES(268,'8032836049825 ','Natfood Preparato Frappè Cioccolato E Nocciola 20x40g',NULL);
INSERT INTO "prodotto" VALUES(269,'40084084 ','Mon Cheri Ferrero 52,5 Gr.',NULL);
INSERT INTO "prodotto" VALUES(270,'8000040040716','Campari Soda Confezione Da 5pz X 12 - 60pz',NULL);
INSERT INTO "prodotto" VALUES(271,'8000500034811','Kinder Delice Confezione 10pzx42gr - 10pz',NULL);
INSERT INTO "prodotto" VALUES(272,'8000500021286','Ferrero Fiesta 10pzx40gr - 10pz',NULL);
INSERT INTO "prodotto" VALUES(273,'8020320047303','Accendino Ciao 1pz',NULL);
INSERT INTO "prodotto" VALUES(274,'8017596012265','Dolciando Cioccolato Extra Fondente Cacao 49%min. 500g',NULL);
INSERT INTO "prodotto" VALUES(275,'08017596010735','Cod 0444 Patatine Classiche 12pzx300gr Confezione',NULL);
INSERT INTO "prodotto" VALUES(276,'8030034078','Baci Perugina Confezione 57 Gr Latta Cuore',NULL);
INSERT INTO "prodotto" VALUES(277,'80051770 ','Fiesta Ferrero 40g',NULL);
INSERT INTO "prodotto" VALUES(278,'80052463 ','Kinder Delice 42g',NULL);
INSERT INTO "prodotto" VALUES(279,'08000500039106','Kinder Sorpresa 72pz X 20 Gr',NULL);
INSERT INTO "prodotto" VALUES(280,'8026048000040','Solvay Bicarbonato Di Sodio Purissimo 500grammi',NULL);
INSERT INTO "prodotto" VALUES(281,'8000040040815','Campari Soda 5pzx 9.8cl',NULL);
INSERT INTO "prodotto" VALUES(282,'SR9D','Soffia E Sai',NULL);

COMMIT;
