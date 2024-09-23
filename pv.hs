---------Parcial 1 Tema A 2023------------------------------------------------------------------------------
-- 1a = 2
-- 1b = 2
-- 1c = 1 && 4 asdasdasdasdasd
-----------------------------------------------------------------------------------------------
data MaterialesConstruccion = Ladrillo TipoLadrillo UsoDeLadrillo Precio
                            | Vigueta Largo MaterialViga Precio
                            | Cemento MarcaCemento deriving(Show)

--type Precio = Int

data TipoLadrillo = Ceramico | Hormigon | Tradicional deriving(Eq,Show)
data UsoDeLadrillo = Pared | Techo deriving(Show)

type Largo = Int 
data MaterialViga = Hierro|Madera deriving(Show)

data MarcaCemento = Minetti|LomaNegra deriving(Eq,Show)

ladrillosDeMenorPrecio ::  [MaterialesConstruccion] -> Int -> [MaterialesConstruccion]
ladrillosDeMenorPrecio [] n = []
ladrillosDeMenorPrecio ((Ladrillo tl udl pre):xs) n | pre <= n = (Ladrillo tl udl pre): (ladrillosDeMenorPrecio xs n)
                                                    | otherwise = ladrillosDeMenorPrecio xs n
ladrillosDeMenorPrecio (_:xs) n = ladrillosDeMenorPrecio xs n

-- test = [(Ladrillo Ceramico Pared 300),(Cemento LomaNegra),(Ladrillo Hormigon Techo 20)]

instance Eq MaterialViga
    where
        Hierro == Hierro = True
        Madera == Madera = True
        _ == _ = False

instance Eq MaterialesConstruccion
    where
        Ladrillo tl1 udl1 pre1 == Ladrillo tl2 udl2 pre2 
            = (tl1 == tl2) && (pre1 == pre2)
        Vigueta lg1 mv1 pre1 == Vigueta lg2 mv2 pre2 
            = (lg1 == lg2) && (mv1 == mv2)
        Cemento mc1 == Cemento mc2 
            = mc1 == mc2

--lad1 = Ladrillo Ceramico Pared 300
--lad2 = Ladrillo Hormigon Pared 300
--lad3 = Ladrillo Ceramico Pared 300
--vig1 = Vigueta 20 Hierro 400
--vig2 = Vigueta 200 Hierro 400
--vig3 = Vigueta 20 Madera 400
--cem1 = Cemento Minetti
--cem2 = Cemento LomaNegra

---------------------------------------------------------------------------------------

type NombreArb = String
data Estado = Seco|EnFlor|Verde|ConFrutos deriving(Eq)
type Alto = Int
type Diametro = Int
type AprecGen = Int

data ArbolesNativos = NoHayMasArboles | EvolucionDelArbol NombreArb Estado Alto Diametro AprecGen ArbolesNativos

paraVender :: ArbolesNativos -> NombreArb -> Bool
paraVender (EvolucionDelArbol nm est alt diam aprg an) nombArb |(nm == nombArb) && (est == EnFlor) && 
                                                                (diam >= 7 || alt >= 7) &&
                                                                    aprg >= 8  = True
                                                            |(nm == nombArb) && (est == Verde) &&
                                                                alt >= 9 && diam >= 9 && aprg >= 9 = True
                                                            |(nm == nombArb) && (est == ConFrutos) = True
                                                            |otherwise = False

arb1 = EvolucionDelArbol "Alamo" EnFlor 8 8 9 NoHayMasArboles
arb2 = EvolucionDelArbol "Pino" ConFrutos 4 5 6 NoHayMasArboles
arb3 = EvolucionDelArbol "Nogal" Verde 10 10 10 NoHayMasArboles
arb4 = EvolucionDelArbol "Seibo" EnFlor 2 2 2 NoHayMasArboles

devolverAltura :: ArbolesNativos -> String -> Maybe Int
devolverAltura NoHayMasArboles nomb = Nothing
devolverAltura (EvolucionDelArbol nm est alt diam aprg arbNat) nm_tc | nm == nm_tc = Just alt
                                                                    | otherwise= devolverAltura arbNat nm_tc

setarb = (EvolucionDelArbol "Alamo" EnFlor 8 8 9(EvolucionDelArbol "Pino" ConFrutos 4 5 6(EvolucionDelArbol "Nogal" Verde 10 10 10(EvolucionDelArbol "Seibo" EnFlor 2 2 2 NoHayMasArboles))))                                         


---------------------------------------------------------------------------------------

type Nombre = String
data Genero = Drama | Romance | Misterio | Aventura deriving(Show)
type Autor = String
type NumP = Int
type Precio = Int

data Tema = Politica | Filosofia | Ciencia | Historia deriving(Show)

data Estilo = Clasica | Contemporanea | Experimental deriving(Show)

data AreaDE = Astronomia | Fisica | Matematica | Computacion deriving(Show)

data Libro = Novela Nombre Genero Autor NumP Precio 
            | Ensayo Nombre Tema Autor NumP 
            | Poesia Nombre Estilo Autor NumP Precio 
            | Cientifico Nombre AreaDE Autor NumP
            deriving(Show)

cuantasNovelasPorGenero :: [Libro] -> Genero -> Int
cuantasNovelasPorGenero [] gen_tc = 0
cuantasNovelasPorGenero ((Novela nom Drama au num pre):xs) Drama = 1 + cuantasNovelasPorGenero xs Drama 
cuantasNovelasPorGenero ((Novela nom Romance au num pre):xs) Romance = 1 + cuantasNovelasPorGenero xs Romance
cuantasNovelasPorGenero ((Novela nom Misterio au num pre):xs) Misterio = 1 + cuantasNovelasPorGenero xs Misterio
cuantasNovelasPorGenero ((Novela nom Aventura au num pre):xs) Aventura = 1 + cuantasNovelasPorGenero xs Aventura 
cuantasNovelasPorGenero ((Novela nom _ au num pre):xs) gen_tc = cuantasNovelasPorGenero xs gen_tc
cuantasNovelasPorGenero (_:xs) gen_tc = cuantasNovelasPorGenero xs gen_tc

li1 = (Novela "asd" Drama "Juancho" 125 2500)
li2 = (Novela "asd" Romance "Juancho" 250 1000)
li3 = Ensayo "adasd" Politica "Benito" 500

-- cuantasNovelasPorGenero [li3,li2,li1] Drama
-- 1

mismoGenero :: Genero -> Genero -> Bool
mismoGenero Drama Drama = True
mismoGenero Romance Romance = True
mismoGenero Misterio Misterio = True
mismoGenero Aventura Aventura = True
mismoGenero _ _ = False

-- Politica | Filosofia | Ciencia | Historia
mismoTema :: Tema -> Tema -> Bool
mismoTema Politica Politica = True
mismoTema Filosofia Filosofia = True
mismoTema Ciencia Ciencia = True
mismoTema Historia Historia = True
mismoTema _ _ = False

-- Clasica | Contemporanea | Experimental
mismoEstilo :: Estilo -> Estilo -> Bool
mismoEstilo Clasica Clasica = True
mismoEstilo Contemporanea Contemporanea = True
mismoEstilo Experimental Experimental = True
mismoEstilo _ _ = False

-- Astronomia | Fisica | Matematica | Computacion
mismoADE :: AreaDE -> AreaDE -> Bool
mismoADE Astronomia Astronomia = True
mismoADE Fisica Fisica = True
mismoADE Matematica Matematica = True 
mismoADE Computacion Computacion = True
mismoADE _ _ = False

instance Eq Libro 
    where 
        (Novela n1 g1 a1 np1 p1) == (Novela n2 g2 a2 np2 p2) = (a1 == a2) && (mismoGenero g1 g2) && (n1 == n2)
        (Ensayo n1 t1 a1 np1) == (Ensayo n2 t2 a2 np2) = (n1 == n2) && (mismoTema t1 t2) && (a1 == a2)
        (Poesia n1 e1 a1 np1 p1) == (Poesia n2 e2 a2 np2 p2) = (n1 == n2) && (mismoEstilo e1 e2) && (a1 == a2)
        (Cientifico n1 ade1 a1 np1) == (Cientifico n2 ade2 a2 np2) = (n1 == n2) && (mismoADE ade1 ade2)
        _ == _ = False

hayDosDistintosConsecutivos :: [Libro] -> Bool
hayDosDistintosConsecutivos [x] = False
hayDosDistintosConsecutivos (x:y:xs) = x /= y || hayDosDistintosConsecutivos (y:xs) 

--ghci> hayDosDistintosConsecutivos [li1,li2]
--True

--o---------o---------o--
type Edad = Int
-- type Nombre = String ¡Utilizo el type del ejercicio anterior!
type Calificaciones = [Int]


data EstadoEstudiantes = NoHayEstudiantes | EvolucionDeEstudiante Nombre Edad Calificaciones EstadoEstudiantes

avanzarDeAño :: EstadoEstudiantes -> Nombre -> Bool
avanzarDeA NoHayEstudiantes nm_tc = False
avanzarDeAño (EvolucionDeEstudiante nm ed cal estEd) nm_tc | (nm == nm_tc) && (((fromIntegral (sum cal)) / (fromIntegral (length cal))) > 7) = True
                                                           | (nm == nm_tc) && (((fromIntegral (sum cal)) / (fromIntegral (length cal))) <= 7) = False
                                                           | otherwise = avanzarDeAño estEd nm_tc
est1 = EvolucionDeEstudiante "Juancho" 14 [10,10,10] NoHayEstudiantes
est2 = EvolucionDeEstudiante "Sara" 14 [2,5,3] NoHayEstudiantes
est3 = EvolucionDeEstudiante "Rigoberta" 14 [2,5,3] NoHayEstudiantes
lest1 = EvolucionDeEstudiante "Juancho" 14 [10,10,10] (EvolucionDeEstudiante "Sara" 14 [2,5,3] (EvolucionDeEstudiante "Rigoberta" 14 [2,5,3] NoHayEstudiantes))
--ghci> avanzarDeAño lest1 "Sara"
--False

promedioGeneral :: EstadoEstudiantes -> Nombre -> Maybe Float
promedioGeneral NoHayEstudiantes nm_tc = Nothing
promedioGeneral (EvolucionDeEstudiante nm ed cal estEd) nm_tc | nm_tc == nm = Just ((fromIntegral (sum cal)) / (fromIntegral (length cal)))
                                                              | otherwise = promedioGeneral estEd nm_tc

-- ghci> promedioGeneral lest1 "Juancho"
-- Just 10.0
-- ghci> promedioGeneral lest1 "Sara"   
-- Just 3.3333333

-------------------------------------------------------

--type Nombre = String
type CapacidadDeCarga = Int
type CantidadToneladas = Int

type LitrosTransportados = Int
type TemperaturaOperC = Float

data Vagon = Minerales Nombre CapacidadDeCarga CantidadToneladas 
            | Cisterna Nombre LitrosTransportados TemperaturaOperC
                deriving(Show)

vagonCobre :: Vagon
vagonCobre = Minerales "Cobre" 50 35

vagonAgua :: Vagon
vagonAgua = Cisterna "Agua" 25000 15.8


excesoMinerales :: Vagon -> Int -> Bool 
excesoMinerales (Minerales nm cdc ctn) tonMax = (ctn > tonMax)
excesoMinerales _ tonMax = False

-- *Main> excesoMinerales vagonCobre 40
-- False
-- *Main> excesoMinerales vagonCobre 20
-- True

cisternaFrio :: Vagon -> Bool
cisternaFrio (Cisterna nm lTrans temCelcius) = temCelcius < 5
cisternaFrio _ = False

vA1:: Vagon
vA1 = Cisterna "Agua" 25000 4

-- *Main> cisternaFrio vA1
-- True
-- *Main> cisternaFrio vagonAgua 
-- False

minimaCarga :: [Vagon] -> Int
minimaCarga [] = 100
minimaCarga ((Minerales nm cdc ctn):xs) = min ctn (minimaCarga xs)
minimaCarga (_:xs) = minimaCarga xs

vC1 :: Vagon
vC1 = Minerales "Cobre" 50 35

vC2 :: Vagon
vC2 = Minerales "Cobre" 50 38

vC3 :: Vagon
vC3 = Minerales "Cobre" 50 25

lvminer = [vC1,vC2,vC3]

-- *Main> minimaCarga lvminer
-- 25
-- *Main> minimaCarga [vC1,vC2]
-- 35

data Tren = SinVagones | Encadena Vagon Tren deriving(Show)

ejemploTren :: Tren
ejemploTren = Encadena vagonAgua (Encadena vagonCobre (Encadena vC2 SinVagones))

sumarCarga :: Tren -> Int -> Tren
sumarCarga SinVagones k = SinVagones
sumarCarga (Encadena (Minerales nm cdc ctn) cadenaTren) k | (ctn+k) <= cdc = Encadena (Minerales nm cdc (ctn+k)) (sumarCarga cadenaTren k)
                                                          | otherwise = Encadena (Minerales nm cdc (ctn)) (sumarCarga cadenaTren k)
sumarCarga (Encadena vag cadenaTren) k = (Encadena vag (sumarCarga cadenaTren k))

-- *Main> sumarCarga ejemploTren 20
-- Encadena (Cisterna "Agua" 25000 15.8) (Encadena (Minerales "Cobre" 50 35) (Encadena (Minerales "Cobre" 50 38) SinVagones))
-- *Main> sumarCarga ejemploTren 10
-- Encadena (Cisterna "Agua" 25000 15.8) (Encadena (Minerales "Cobre" 50 45) (Encadena (Minerales "Cobre" 50 48) SinVagones))
-- *Main> sumarCarga ejemploTren 13
-- Encadena (Cisterna "Agua" 25000 15.8) (Encadena (Minerales "Cobre" 50 48) (Encadena (Minerales "Cobre" 50 38) SinVagones))