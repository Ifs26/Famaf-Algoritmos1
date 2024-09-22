---------Parcial 1 Tema A 2023------------------------------------------------------------------------------
-- 1a = 2
-- 1b = 2
-- 1c = 1 && 4 asdasdasd
-----------------------------------------------------------------------------------------------
data MaterialesConstruccion = Ladrillo TipoLadrillo UsoDeLadrillo Precio
                            | Vigueta Largo MaterialViga Precio
                            | Cemento MarcaCemento deriving(Show)

type Precio = Int

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
