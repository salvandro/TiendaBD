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

INSERT INTO Cliente( IdCliente, Nombre,           ApellidoPaterno, ApellidoMaterno, FechaNacimiento, FechaAlta,    RFC,             CiudadDelegacion,        Credito,  Deuda    )
VALUES             ( 1 ,        'Natalia'       , 'Alcántara',     'Salgado'   ,    '1988/05/03',    '2010/04/18', 'ALSN870926000', 'Álvaro Obregón'       , 11000   , 2451.23  ),
                   ( 2 ,        'Edgar Armando' , 'Catalán'  ,     'Salgado'   ,    '1968/09/11',    '2010/03/11', 'CASE810317000', 'Azcapotzalco'         , 10000   , 55523.57 ),
	               ( 3 ,        'Blanca'        , 'García'   ,     'Salgado'   ,    '1976/02/21',    '2010/05/16', 'GASB850901000', 'Benito Juárez'        , 15000   , 3879.23  ),
	               ( 4 ,        'Raul'          , 'Gallardo' ,     'Castrezana',    '1970/09/09',    '2010/05/16', 'GACR800220000', 'Coyoacán'             , 15000   , 3879.23  ),
	               ( 5 ,        'Patricia'      , 'Bautista' ,     'Bautista'  ,    '1960/07/17',    '2010/12/12', 'BABP780318000', 'Cuajimalpa de Morelos', 9000    , 8879.75  ),
	               ( 6 ,        'Mayra Yazmín'  , 'Alarcón'  ,     'Adame'     ,    '1986/04/16',    '2011/09/21', 'AAAM860416000', 'Cuauhtémoc'           , 12000   , 1753.20  ),
	               ( 7 ,        'Raymundo'      , 'Ayala'    ,     'Bailón'    ,    '1970/03/15',    '2007/01/12', 'AABR700315AU9', 'Gustavo A. Madero'    , 89665.13, 2543.30  ),
	               ( 8 ,        'Clara'         , 'Adame'    ,     'Catalán'   ,    '1981/08/11',    '2008/08/18', 'AACC810811000', 'Iztacalco'            , 5478.80 , 1200.00  ),
	               ( 9 ,        'Lilia'         , 'Ayala'    ,     'González'  ,    '1977/04/25',    '2005/05/25', 'AAGL770425000', 'Iztapalapa'           , 2670.00 , 0.00     ),
	               ( 10,        'Mario Eduardo' , 'Ayala'    ,     'Liquidano' ,    '1972/06/30',    '2007/02/21', 'AALM720630000', 'Magdalena Contreras'  , 1288.08 , 1367.90  ),
	               ( 11,        'Aleida'        , 'Abarca'   ,     'Rodríguez' ,    '1976/06/19',    '2011/06/26', 'AARA790619000', 'Miguel Hidalgo'       , 7456.00 , 2234.40  ),
	               ( 12,        'Elizabeth'     , 'Acatitlan',     'Tecoapa'   ,    '1985/10/18',    '2013/03/23', 'AATE851018000', 'Milpa Alta'           , 6227.00 , 3900.35  ),
	               ( 13,        'Lucio'         , 'Albañil'  ,     'Vázquez'   ,    '1978/12/13',    '2015/06/22', 'AAVL781213J10', 'Tláhuac'              , 5578.90 , 3380.00  ),
	               ( 14,        'Luís Miguel'   , 'Arellanes',     'Bailón'    ,    '1982/08/25',    '2012/11/11', 'AEBL820825000', 'Tlalpan'              , 9240.35 , 1000.00  ),
	               ( 15,        'Yaneth'        , 'Arteaga'  ,     'Hernández' ,    '1983/01/04',    '2016/01/01', 'AEHY8301043KA', 'Venustiano Carranza'  , 10543.20, 5560.00  ),
	               ( 16,        'Claudia Yudith', 'Arteaga'  ,     'lópez'     ,    '1983/11/17',    '2010/10/25', 'AELC8311176B5', 'Xochimilco'           , 15674.00, 8990.00  ),
	               ( 17,        'Alfredo'       , 'Bahena'   ,     'López'     ,    '1985/11/01',    '2012/07/23', 'BALA851101000', 'Xochimilco'           , 6750.32 , 1290.00  );

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
	  
INSERT INTO Venta( IdVenta,  IdCliente, FechaVenta   )
VALUES           ( 1 ,       1 ,        '2010/09/15' ),
                 ( 2 ,       1 ,        '2010/09/17' ),
                 ( 3 ,       2 ,        '2010/09/15' ),
                 ( 4 ,       2 ,        '2010/02/21' ),
                 ( 5 ,       3 ,        '2010/02/22' ),
                 ( 6 ,       3 ,        '2010/09/16' ),
                 ( 7 ,       4 ,        '2010/09/17' ),
                 ( 8 ,       4 ,        '2010/09/18' ),
                 ( 9 ,       5 ,        '2011/07/13' ),
                 ( 10,       5 ,        '2011/07/14' ),
                 ( 11,       6 ,        '2011/08/20' ),
                 ( 12,       6 ,        '2011/08/21' ),
                 ( 13,       7 ,        '2011/09/15' ),
                 ( 14,       7 ,        '2011/09/17' ),
                 ( 15,       8 ,        '2012/03/11' ),
                 ( 16,       8 ,        '2012/03/12' ),
                 ( 17,       9 ,        '2012/04/04' ),
                 ( 18,       9 ,        '2012/04/07' ),
                 ( 19,       10,        '2012/08/08' ),
                 ( 20,       10,        '2012/08/14' ),
                 ( 21,       11,        '2012/11/17' ),
                 ( 22,       11,        '2013/11/25' ),
                 ( 23,       12,        '2013/12/12' ),
                 ( 24,       12,        '2013/12/13' ),
                 ( 25,       13,        '2013/12/14' ),
                 ( 26,       13,        '2013/12/14' ),
                 ( 27,       14,        '2013/12/15' ),
                 ( 28,       14,        '2014/01/15' ),
                 ( 29,       15,        '2014/01/16' ),
                 ( 30,       16,        '2014/01/17' );

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
                        ( 25,        25,      20,         17       ),
                        ( 26,        26,      19,         18       ),
                        ( 27,        27,      18,         16       ),
                        ( 28,        28,      17,         15       ),
                        ( 29,        29,      16,         13       ),
                        ( 30,        30,      15,         6        );
