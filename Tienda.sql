CREATE DATABASE Tienda;

USE Tienda;

CREATE TABLE Cliente
(
	IdCliente        INT        ,
	Nombre           VARCHAR(30),
	ApellidoPaterno  VARCHAR(30),
	ApellidoMaterno  VARCHAR(30),
	FechaNacimiento  DATE       ,
	FechaAlta        DATE       ,
	RFC              VARCHAR(13),
	Telefono         VARCHAR(30),
	NumeroExt        INT        ,
	NumeroInt        INT        ,
	Calle            VARCHAR(30),
	CP               VARCHAR(5) ,
	Colonia          VARCHAR(30),
	CiudadDelegacion VARCHAR(30),
	Estado           VARCHAR(30),
	Pais             VARCHAR(30),
	Deuda            FLOAT      ,
	Credito          FLOAT      ,
	Correo           VARCHAR(30)
);

CREATE TABLE Proveedor
(
	IdProveedor INT        ,
	Nombre      VARCHAR(30),
	FechaVisita DATE       ,
	Telefono    VARCHAR(20),
	Correo      VARCHAR(30),
	Calle       varchar(30),
	NumeroExt   INT        ,
	NumeroInt   INT        ,
	Pais        VARCHAR(30),
	Delegacion  VARCHAR(30),
	Ciudad      VARCHAR(30),
	Estado      VARCHAR(30),
	Colonia     VARCHAR(30),
	CP          VARCHAR(5)
);

CREATE TABLE Producto
(
	IdProducto   INT        ,
	IdProveedor  INT        ,
	Nombre       VARCHAR(50),
	PrecioCompra FLOAT      ,
	PrecioVenta  FLOAT      ,
	PrecioMinimo FLOAT      ,
	Existencia   INT        ,
	Descripcion  VARCHAR(50),
	Fabricante   VARCHAR(30)
);

CREATE TABLE Venta
(
	IdVenta    INT ,
	FechaVenta DATE,
	IdCliente  INT ,
	FormaPago  VARCHAR(10)
);

CREATE TABLE DetalleVenta
(
	IdDetalle   INT  ,
	IdVenta     INT  ,
	IdProducto  INT  ,
	PrecioVenta FLOAT,
	Cantidad    INT
);

DELIMITER //
CREATE TRIGGER TGR_DetalleVenta
BEFORE INSERT ON DetalleVenta
FOR EACH ROW BEGIN
    DECLARE PrecioProducto INT;

    SELECT PrecioVenta INTO PrecioProducto
    FROM Producto
    WHERE NEW.IdProducto = IdProducto;

    SET NEW.PrecioVenta = NEW.Cantidad * PrecioProducto;
END//
DELIMITER ;

INSERT INTO Cliente( IdCliente, Nombre,           ApellidoPaterno,   ApellidoMaterno, FechaNacimiento, FechaAlta,    RFC,             CiudadDelegacion,        Credito,  Deuda    )
VALUES             ( 1 ,        'Natalia'       , 'Alcántara'  ,     'Salgado'   ,    '1988/05/03',    '2010/04/18', 'ALSN870926000', 'Álvaro Obregón'       , 11000   , 2451.23  ),
                   ( 2 ,        'Eduardo'       , 'Chopin'     ,     'González'  ,    '1961/10/14',    '2008/08/22', 'COGX611014000', 'Álvaro Obregón'       , 3421.56 , 1167.00  ),
                   ( 3 ,        'Sharon Yuridia', 'Cordero'    ,     'Portillo'  ,    '1984/01/21',    '2008/12/26', 'COPS840123000', 'Álvaro Obregón'       , 6653.00 , 5000.00  ),
                   ( 4 ,        'Cristina'      , 'Contreras'  ,     'Urieta'    ,    '1980/06/18',    '2009/07/19', 'COUC800618000', 'Azcapotzalco'         , 15674.00, 4488.90  ),
                   ( 5 ,        'Edgar Armando' , 'Catalán'    ,     'Salgado'   ,    '1968/09/11',    '2010/03/11', 'CASE810317000', 'Azcapotzalco'         , 10000   , 55523.57 ),
                   ( 6 ,        'Greta Evelyn'  , 'Cuadros'    ,     'Casiano'   ,    '1993/05/02',    '2016/02/02', 'CUCG930502000', 'Benito Juaréz'        , 8387.98 , 6000.00  ),
	               ( 7 ,        'Blanca'        , 'García'     ,     'Salgado'   ,    '1976/02/21',    '2010/05/16', 'GASB850901000', 'Benito Juárez'        , 15000   , 3879.23  ),
	               ( 8 ,        'Raul'          , 'Gallardo'   ,     'Castrezana',    '1970/09/09',    '2010/05/16', 'GACR800220000', 'Coyoacán'             , 15000   , 3879.23  ),
                   ( 9 ,        'Omar'          , 'Cuevas'     ,     'Sánchez'   ,    '1982/06/23',    '2003/11/28', 'CUSO820623PBA', 'Coyoacán'             , 7345.00 , 1123.40  ),
	               ( 10,        'Patricia'      , 'Bautista'   ,     'Bautista'  ,    '1960/07/17',    '2010/12/12', 'BABP780318000', 'Cuajimalpa de Morelos', 9000    , 8879.75  ),
                   ( 11,        'Patricio'      , 'De La Luz'  ,     'Suastegui' ,    '1980/01/09',    '2001/07/14', 'CUSP800109KJ1', 'Cuajimalpa de Morelos', 8345.32 , 1555.00  ),
	               ( 12,        'Mayra Yazmín'  , 'Alarcón'    ,     'Adame'     ,    '1986/04/16',    '2011/09/21', 'AAAM860416000', 'Cuauhtémoc'           , 12000   , 1753.20  ),
                   ( 13,        'Adriana'       , 'Cuevas'     ,     'Vital'     ,    '1984/07/28',    '1999/07/22', 'CUVA840728000', 'Cuauhtémoc'           , 5678.66 , 2434.00  ),
	               ( 14,        'Raymundo'      , 'Ayala'      ,     'Bailón'    ,    '1970/03/15',    '2007/01/12', 'AABR700315AU9', 'Gustavo A. Madero'    , 89665.13, 2543.30  ),
                   ( 15,        'Areli'         , 'Chávez'     ,     'Carmona'   ,    '1966/12/17',    '2004/11/01', 'CXCA661217000', 'Gustavo A. Madero'    , 5556.70 , 1005.00  ),
	               ( 16,        'Clara'         , 'Adame'      ,     'Catalán'   ,    '1981/08/11',    '2008/08/18', 'AACC810811000', 'Iztacalco'            , 5478.80 , 1200.00  ),
                   ( 17,        'Lorenia'       , 'Delgado'    ,     'Salgado'   ,    '1981/12/18',    '2015/12/23', 'DESL811218000', 'Iztacalco'            , 7500.60 , 3345.00  ),
	               ( 18,        'Lilia'         , 'Ayala'      ,     'González'  ,    '1977/04/25',    '2005/05/25', 'AAGL770425000', 'Iztapalapa'           , 2670.00 , 0.00     ),
                   ( 19,        'María Elena'   , 'Dircio'     ,     'Robledo'   ,    '1982/10/27',    '2013/03/20', 'DIRE8210273M4', 'Iztapalapa'           , 90540.00, 1000.00  ),
	               ( 20,        'Mario Eduardo' , 'Ayala'      ,     'Liquidano' ,    '1972/06/30',    '2007/02/21', 'AALM720630000', 'Magdalena Contreras'  , 1288.08 , 1367.90  ),
                   ( 21,        'Daisy'         , 'Díaz'       ,     'Ureña'     ,    '1979/05/12',    '2011/04/04', 'DIUD790512000', 'Magdalena Contreras'  , 0.00    , 0.00     ),
	               ( 22,        'Aleida'        , 'Abarca'     ,     'Rodríguez' ,    '1976/06/19',    '2011/06/26', 'AARA790619000', 'Miguel Hidalgo'       , 7456.00 , 2234.40  ),
                   ( 23,        'Manuel'        , 'Esparza'    ,     'Mundo'     ,    '1973/04/08',    '2015/01/25', 'EAMM730408DV2', 'Miguel Hidalgo'       , 5210.00 , 5000.50  ),
	               ( 24,        'Elizabeth'     , 'Acatitlan'  ,     'Tecoapa'   ,    '1985/10/18',    '2013/03/23', 'AATE851018000', 'Milpa Alta'           , 6227.00 , 3900.35  ),
                   ( 25,        'Mario'         , 'Evangelista',     'Pineda'    ,    '1991/08/15',    '2015/01/12', 'EAPM910815000', 'Milpa Alta'           , 7743.76 , 7364.00  ),
	               ( 26,        'Lucio'         , 'Albañil'    ,     'Vázquez'   ,    '1978/12/13',    '2015/06/22', 'AAVL781213J10', 'Tláhuac'              , 5578.90 , 3380.00  ),
                   ( 27,        'Gilberto'      , 'Espiritu'   ,     'Mendoza'   ,    '1986/11/11',    '2007/07/16', 'EIMG861111000', 'Tláhuac'              , 78723.34, 12764.40 ),
	               ( 28,        'Luís Miguel'   , 'Arellanes'  ,     'Bailón'    ,    '1982/08/25',    '2012/11/11', 'AEBL820825000', 'Tlalpan'              , 9240.35 , 1000.00  ),
                   ( 29,        'Lucero'        , 'Franco'     ,     'Hernández' ,    '1980/09/04',    '2016/03/25', 'FAHL800904000', 'Tlalpan'              , 8934.64 , 1278.00  ),
	               ( 30,        'Yaneth'        , 'Arteaga'    ,     'Hernández' ,    '1983/01/04',    '2016/01/01', 'AEHY8301043KA', 'Venustiano Carranza'  , 10543.20, 5560.00  ),
                   ( 31,        'Jesika Paola'  , 'Figueroa'   ,     'Salgado'   ,    '1984/02/09',    '2005/12/21', 'FISJ840209000', 'Venustiano Carranza'  , 27287.50, 8347.80  ),
	               ( 32,        'Claudia Yudith', 'Arteaga'    ,     'López'     ,    '1983/11/17',    '2010/10/25', 'AELC8311176B5', 'Xochimilco'           , 15674.00, 8990.00  );

INSERT INTO Proveedor( IdProveedor,  Nombre                        )
VALUES               ( 1 ,           'MEX Electrónica'             ),
                     ( 2 ,           'MotosDF'                     ),
                     ( 3 ,           'Champion PC'                 ),
                     ( 4 ,           'Obregon VGA'                 ),
                     ( 5 ,           'GAMEX'                       ),
                     ( 6 ,           'Aparatos Electrónica Miguel' ),
                     ( 7 ,           'Computadoras RFX'            ),
                     ( 8 ,           'ASUS'                        ),
                     ( 9 ,           'XFX'                         ),
                     ( 10,           'Motorola'                    ),
                     ( 11,           'Redes Enterprice'            ),
                     ( 12,           'PCX'                         );
	  
INSERT INTO Producto( Idproducto, IdProveedor,   Nombre,                                   PrecioCompra, PrecioVenta, PrecioMinimo, Existencia, Fabricante  )
VALUES              ( 1 ,         1   ,          'Televisor SMART LED de 43'             , 6500 ,        9000 ,       9000 ,        50,         'LG'        ),
                    ( 2 ,         1   ,          'Celular G4'                            , 5000 ,        5499 ,       5399 ,        12,         'LG'        ),
                    ( 3 ,         2   ,          'Motocicleta Tw200'                     , 50000,        52500,       52500,        3 ,         'Yamaha'    ),
                    ( 4 ,         2   ,          'Teclado Psr E253'                      , 2700 ,        2900 ,       2900 ,        8 ,         'Yamaha'    ),
                    ( 5 ,         3   ,          'Celular Galaxy Grand Prime'            , 2699 ,        2899 ,       2899 ,        21,         'Samsung'   ),
                    ( 6 ,         3   ,          'Lavadora Wa18j6710lw'                  , 7500 ,        8900 ,       8800 ,        1 ,         'Samsung'   ),
                    ( 7 ,         4   ,          'Celular Z5 Premium'                    , 11500,        12300,       12300,        4 ,         'Sony'      ),
                    ( 8 ,         4   ,          'Reproductor de DVD Dvpsr210p'          , 1500 ,        1782 ,       1700 ,        9 ,         'Sony'      ),
                    ( 9 ,         5   ,          'Computadora Inspiron 7568 2 En 1'      , 17300,        19000,       18900,        6 ,         'Dell'      ),
                    ( 10,         5   ,          'Monitor 27 Fhd S2715h'                 , 5000 ,        5500 ,       5500 ,        2 ,         'Dell'      ),
                    ( 11,         6   ,          'Computadora 655 G1'                    , 7300 ,        7599 ,       7549 ,        28,         'HP'        ),
                    ( 12,         6   ,          'Monitor Elite E221'                    , 3499 ,        3999 ,       3899 ,        16,         'HP'        ),
                    ( 13,         7   ,          'Computadora L75'                       , 10000,        10999,       18999,        20,         'Toshiba'   ),
                    ( 14,         7   ,          'Disco Duro 2 TB 5400 RPM'              , 1600 ,        1795 ,       1795 ,        8 ,         'Toshiba'   ),
                    ( 15,         8   ,          'Computadora F553ma'                    , 8000 ,        8399 ,       8399 ,        2 ,         'ASUS'      ),
                    ( 16,         8   ,          'Router Rt-ac68u'                       , 5000 ,        5349 ,       5339 ,        58,         'ASUS'      ),
                    ( 17,         9   ,          'Tarjeta de Video AMD R9 380 2 GB'      , 3950 ,        4100 ,       4100 ,        33,         'XFX'       ),
                    ( 18,         9   ,          'Fuente de Poder XTS520'                , 980  ,        1100 ,       1100 ,        12,         'XFX'       ),
                    ( 19,         10  ,          'Celular Moto E 2'                      , 1300 ,        1600 ,       1600 ,        16,         'Motorola'  ),
                    ( 20,         10  ,          'Cámara Wifi HD Scout 66'               , 2000 ,        2591 ,       2580 ,        7 ,         'Motorola'  ),
                    ( 21,         11  ,          'Router Ac1750'                         , 2900 ,        3199 ,       3189 ,        64,         'TP-Link'   ),
                    ( 22,         NULL,          'Impresora Officejet Pro 8100'          , 700  ,        800  ,       800  ,        9 ,         'HP'        ),
                    ( 23,         NULL,          'Antivirus Internet Security 2016 1 Año', 200  ,        300  ,       300  ,        15,         'Kaspersky' );
	  
INSERT INTO Venta( IdVenta,  IdCliente, FechaVenta   , FormaPago  )
VALUES           ( 1 ,       1 ,        '2010/09/15' , 'Efectivo' ),
                 ( 2 ,       1 ,        '2010/09/17' , 'Crédito'  ),
                 ( 3 ,       1 ,        '2010/11/11' , 'Crédito'  ),
                 ( 4 ,       2 ,        '2010/09/15' , 'Efectivo' ),
                 ( 5 ,       2 ,        '2010/02/21' , 'Crédito'  ),
                 ( 6 ,       3 ,        '2010/02/22' , 'Efectivo' ),
                 ( 7 ,       3 ,        '2010/09/16' , 'Efectivo' ),
                 ( 8 ,       4 ,        '2010/09/17' , 'Crédito'  ),
                 ( 9 ,       4 ,        '2010/09/18' , 'Crédito'  ),
                 ( 10,       5 ,        '2011/07/13' , 'Efectivo' ),
                 ( 11,       5 ,        '2011/07/14' , 'Efectivo' ),
                 ( 12,       6 ,        '2011/08/20' , 'Efectivo' ),
                 ( 13,       6 ,        '2011/08/21' , 'Crédito'  ),
                 ( 14,       7 ,        '2011/09/15' , 'Crédito'  ),
                 ( 15,       7 ,        '2011/09/17' , 'Crédito'  ),
                 ( 16,       8 ,        '2012/03/11' , 'Efectivo' ),
                 ( 17,       8 ,        '2012/03/12' , 'Crédito'  ),
                 ( 18,       9 ,        '2012/04/04' , 'Efectivo' ),
                 ( 19,       9 ,        '2012/04/07' , 'Crédito'  ),
                 ( 20,       10,        '2012/08/08' , 'Crédito'  ),
                 ( 21,       10,        '2012/08/14' , 'Efectivo' ),
                 ( 22,       11,        '2012/11/17' , 'Efectivo' ),
                 ( 23,       11,        '2013/11/25' , 'Efectivo' ),
                 ( 24,       12,        '2013/12/12' , 'Crédito'  ),
                 ( 25,       12,        '2013/12/13' , 'Crédito'  ),
                 ( 26,       13,        '2013/12/14' , 'Efectivo' ),
                 ( 27,       13,        '2013/12/14' , 'Crédito'  ),
                 ( 28,       14,        '2013/12/15' , 'Efectivo' ),
                 ( 29,       14,        '2014/01/15' , 'Efectivo' ),
                 ( 30,       15,        '2014/01/16' , 'Crédito'  ),
                 ( 31,       15,        '2014/01/17' , 'Crédito'  ),
                 ( 32,       16,        '2014/01/18' , 'Efectivo' ),
                 ( 33,       16,        '2014/01/19' , 'Efectivo' ),
                 ( 34,       17,        '2014/01/20' , 'Efectivo' ),
                 ( 35,       17,        '2014/02/05' , 'Crédito'  ),
                 ( 36,       18,        '2014/02/06' , 'Efectivo' ),
                 ( 37,       18,        '2014/02/16' , 'Crédito'  ),
                 ( 38,       19,        '2014/02/19' , 'Efectivo' ),
                 ( 39,       19,        '2014/02/23' , 'Crédito'  ),
                 ( 40,       20,        '2014/02/25' , 'Efectivo' ),
                 ( 41,       20,        '2014/03/12' , 'Crédito'  ),
                 ( 42,       21,        '2014/03/13' , 'Crédito'  ),
                 ( 43,       21,        '2014/03/18' , 'Efectivo' ),
                 ( 44,       22,        '2014/03/27' , 'Efectivo' ),
                 ( 45,       22,        '2015/02/02' , 'Crédito'  ),
                 ( 46,       23,        '2015/02/03' , 'Efectivo' ),
                 ( 47,       23,        '2015/04/06' , 'Crédito'  ),
                 ( 48,       24,        '2015/04/08' , 'Crédito'  ),
                 ( 49,       24,        '2015/04/10' , 'Crédito'  ),
                 ( 50,       25,        '2015/04/12' , 'Efectivo' ),
                 ( 51,       25,        '2016/01/01' , 'Efectivo' ),
                 ( 52,       26,        '2016/01/02' , 'Efectivo' ),
                 ( 53,       26,        '2016/01/03' , 'Crédito'  ),
                 ( 54,       27,        '2016/01/04' , 'Efectivo' ),
                 ( 55,       27,        '2016/01/05' , 'Crédito'  ),
                 ( 56,       28,        '2016/02/15' , 'Crédito'  ),
                 ( 57,       28,        '2016/02/17' , 'Efectivo' ),
                 ( 58,       29,        '2016/03/01' , 'Crédito'  );

INSERT INTO DetalleVenta( IdDetalle, IdVenta, IdProducto, Cantidad )
VALUES                  ( 1 ,        1 ,      1 ,         1        ),
                        ( 2 ,        2 ,      2 ,         2        ),
                        ( 3 ,        3 ,      3 ,         3        ),
                        ( 4 ,        4 ,      4 ,         4        ),
                        ( 5 ,        5 ,      5 ,         5        ),
                        ( 6 ,        6 ,      6 ,         6        ),
                        ( 7 ,        7 ,      7 ,         7        ),
                        ( 8 ,        8 ,      8 ,         8        ),
                        ( 9 ,        9 ,      9 ,         9        ),
                        ( 10,        10,      10,         10       ),
                        ( 11,        11,      11,         11       ),
                        ( 12,        12,      12,         12       ),
                        ( 13,        13,      13,         13       ),
                        ( 14,        14,      14,         14       ),
                        ( 15,        15,      15,         15       ),
                        ( 16,        16,      16,         16       ),
                        ( 17,        17,      17,         17       ),
                        ( 18,        18,      18,         18       ),
                        ( 19,        19,      19,         19       ),
                        ( 20,        20,      20,         20       ),
                        ( 21,        21,      21,         21       ),
                        ( 22,        22,      22,         22       ),
                        ( 23,        23,      22,         23       ),
                        ( 24,        24,      21,         24       ),
                        ( 25,        25,      20,         13       ),
                        ( 26,        26,      19,         11       ),
                        ( 27,        27,      18,         9        ),
                        ( 28,        28,      17,         7        ),
                        ( 29,        29,      16,         3        ),
                        ( 30,        30,      15,         1        ),
                        ( 31,        31,      14,         2        ),
                        ( 32,        32,      13,         3        ),
                        ( 33,        33,      12,         4        ),
                        ( 34,        34,      11,         5        ),
                        ( 35,        35,      10,         6        ),
                        ( 36,        36,      9 ,         7        ),
                        ( 37,        37,      8 ,         8        ),
                        ( 38,        38,      7 ,         9        ),
                        ( 39,        39,      6 ,         10       ),
                        ( 40,        40,      5 ,         11       ),
                        ( 41,        41,      4 ,         12       ),
                        ( 42,        42,      3 ,         13       ),
                        ( 43,        43,      2 ,         14       ),
                        ( 44,        44,      1 ,         15       ),
                        ( 45,        45,      22,         16,      ),
                        ( 46,        46,      21,         17,      ),
                        ( 47,        47,      17,         11,      ),
                        ( 48,        48,      16,         15,      ),
                        ( 49,        49,      11,         20,      ),
                        ( 50,        50,      15,         23,      ),
                        ( 51,        51,      14,         30,      ),
                        ( 52,        52       9 ,         9 ,      ),
                        ( 53,        53,      8 ,         8 ,      ),
                        ( 54,        54,      7 ,         7 ,      ),
                        ( 55,        55,      6 ,         6 ,      ),
                        ( 56,        56,      5 ,         5 ,      ),
                        ( 57,        57,      4 ,         4 ,      ),
                        ( 58,        58,      3 ,         3 ,      );
