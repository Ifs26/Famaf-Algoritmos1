type Altura = Int
data Modalidad = Carretera | Pista deriving(Show)

data Deportista = Velocista Altura |Ciclista Modalidad deriving(Show)

juan :: Deportista 
juan = Velocista 172
pedro = Ciclista Pista

esVelocistaAlto :: Deportista -> Int -> Bool
esVelocistaAlto (Velocista alt) n = alt > n                
esVelocistaAlto _ n = False                                       

contarVelocistas :: [Deportista] -> Int
contarVelocistas [] = 0
contarVelocistas ((Velocista n):xs) = 1 + contarVelocistas xs 
contarVelocistas (x:xs) = contarVelocistas xs

esCiclista :: Deportista -> Bool
esCiclista (Ciclista mod) = True
esCiclista _ = False

data Cola = VaciaC | Encolada Deportista Cola deriving Show

encolar :: Deportista -> Cola -> Cola
encolar dep VaciaC = Encolada dep VaciaC
encolar dep (Encolada deps col) = (Encolada deps (encolar dep col))

co1 = (Encolada (Velocista 210) (Encolada (Velocista 140) VaciaC))


----------------------------------------------------------------------------

data Producto = Pan | PanNegro | Factura | Criollo deriving (Eq, Show)
type Unidades = Int

data Panaderia = VaciaP | Productos Producto Unidades Panaderia deriving Show
-- type Panaderia = ListaAsoc

pan1 = Productos Pan 20 (Productos PanNegro 30 (Productos Factura 0 VaciaP))

agregarProducto :: Panaderia -> Producto -> Unidades -> Panaderia
agregarProducto VaciaP prod_tc uni_ts =  Productos prod_tc uni_ts VaciaP
agregarProducto (Productos prod uni panad) prod_tc uni_ts | prod == prod_tc = Productos prod (uni+uni_ts) panad
                                                          |otherwise = Productos prod uni (agregarProducto panad prod_tc uni_ts)

hayStock :: Panaderia -> Producto -> Bool
hayStock VaciaP prod_tc = False
hayStock (Productos prod uni panad) prod_tc | prod == prod_tc && uni > 0 = True
                                            | otherwise = hayStock panad prod_tc

venderProducto :: Panaderia -> Producto -> Panaderia
venderProducto VaciaP prod_s = VaciaP
venderProducto (Productos prod uni panad) prod_s | prod == prod_s && (hayStock (Productos prod uni panad) prod_s) = Productos prod (uni-1) (venderProducto panad prod_s)      
                                                 | otherwise =  Productos prod uni (venderProducto panad prod_s)                                                                                            

----------------------------------------------------------------------------    

type Letras = (Char,Char,Char)
type Numeracion = Int

data Matricula = Patente Letras Numeracion deriving(Eq,Ord,Show)

letra_valida :: Char -> Bool
letra_valida c = 'A' <= c && c <= 'Z' 

letras_validas :: Letras -> Bool
letras_validas (t1,t2,t3) = letra_valida t1 && letra_valida t2 && letra_valida t3

matricula_valida :: Matricula -> Bool
matricula_valida (Patente ltr num) = letras_validas ltr && 0<=num && num<=999 


type Titular = String
data Estado = SinDeuda | ConDeuda deriving(Show)

data Registro = SinRegs | AgregaReg Matricula Estado Titular Registro deriving(Show)

mismo_estado :: Estado -> Estado -> Bool
mismo_estado SinDeuda SinDeuda = True
mismo_estado ConDeuda ConDeuda = True
mismo_estado _ _ = False

consulta :: Registro -> Titular -> Estado -> [Matricula]
consulta SinRegs ti ei = []
consulta (AgregaReg mat est tit reg) ti ei | tit == ti && mismo_estado est ei = mat: consulta reg ti ei
                                           | otherwise = consulta reg ti ei

re1 = AgregaReg (Patente ('A','B','C') 123) SinDeuda "Sigmund Freud" (AgregaReg (Patente ('A','B','D') 123) ConDeuda "Armando Estebanquito" (AgregaReg (Patente ('A','B','D') 456) SinDeuda "Armando Estebanquito" SinRegs))


----------------------------------------------------------------------------  

data Forma = Piedra | Papel | Tijera 

leGana :: Forma -> Forma -> Bool
leGana Piedra Tijera = True
leGana Papel Piedra = True
leGana Tijera Papel = True
leGana _ _ = False

type Nombre = String
data Jugador = Mano Nombre Forma

ganador :: Jugador -> Jugador -> Maybe Nombre
ganador (Mano n1 f1) (Mano n2 f2) | leGana f1 f2 = Just n1
                                  | leGana f2 f1 = Just n2
                                  | otherwise = Nothing
                                 
mark = Mano "Mark" Piedra
eliz = Mano "Elizabeth" Tijera
rebe = Mano "Rebecca" Papel

quienJugo :: Forma -> [Jugador] -> [Nombre]
quienJugo Piedra ((Mano name Piedra):xs) = name : quienJugo Piedra xs
quienJugo Papel ((Mano name Papel):xs) = name : quienJugo Papel xs
quienJugo Tijera ((Mano name Tijera):xs) = name : quienJugo Tijera xs
quienJugo form ((Mano name _):xs) = quienJugo form xs
quienJugo _ [] = []

-- quienJugo Papel [ mark , eliz , rebe] 
-- >>["Rebecca"] asdadadas