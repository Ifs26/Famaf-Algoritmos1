{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use camelCase" #-}
{-# HLINT ignore "Eta reduce" #-}
{-# HLINT ignore "Use newtype instead of data" #-}
import GHC.Natural (Natural)
import Distribution.FieldGrammar (List)

{--Funcion auxiliar--}
esPar :: Int -> Bool
esPar x = (x `mod` 2 == 0)

------------------------------------------- {--PRACTICO_2--} -------------------------------------------

{--Laboratorio 1--} -------------------------------------------

sum_cuad :: [Int] -> Int
sum_cuad [] = 0
sum_cuad (x:xs) = (x*x) + sum_cuad xs

iga :: Eq a => a -> [a] -> Bool
iga e [] = True
iga e (x:xs) = (x == e) && iga e xs

exp' :: Int -> Int -> Int
exp' x 1 = x
exp' x e = x * (exp' x (e-1))

sum_par :: [Int] -> Int
sum_par [] = 0
sum_par (x:xs) | esPar x = x + sum_par xs
               | otherwise = sum_par xs

cuantos :: Eq a => a -> [a] -> Int
cuantos e [] = 0
cuantos e (x:xs) | (x == e) = 1 + cuantos e xs
                 | otherwise = cuantos e xs


{--PIZARRA-} -------------------------------------------

data Dia = Lunes | Martes | Miercoles | Jueves | Viernes | Sabado | Domingo deriving (Show, Eq, Ord, Bounded, Enum)
-- se crea un "tipo de datos" (type class?) para utilizar en funciones
-- para hacer que un tipo sea comparable 
data Tarea = Trabajar | TrabajarPoco | Salir | Descansar


tareaDiaria :: Dia -> Tarea
tareaDiaria Viernes = TrabajarPoco
tareaDiaria Sabado = Salir
tareaDiaria Domingo = Descansar
tareaDiaria _ = Trabajar

-- CASO DE PATTERN MATCHING
horasTrabajo :: Dia -> Int
horasTrabajo d = case tareaDiaria d of
                    Trabajar -> 8
                    TrabajarPoco -> 4
                    _ -> 0

-- El TIPO es Figura y se clasifican en CONSTRUCTORES Circulos y Rectangulos 
data Figura = Circulo (Float,Float) Float
            | Rectangulo (Float,Float) (Float,Float)

area :: Figura -> Float
-- CASO DE PATTERN MATCHING
area(Circulo(x,y)r) = 3.1416*r*r
area(Rectangulo(x,y)(w,z)) = base * altura
                            where base = w-x
                                  altura = z-y

--Sinonimo de tipo, no se pueden usar en el constructor!
type Punto = (Float,Float)
type Radio = Float

data Figura' = Circulo' Punto Radio
             | Rectangulo' Punto Punto

area' :: Figura' -> Float
area'(Circulo' p1 r) = 3.1416 * r * r
area'(Rectangulo' p1 p2) = base * altura
                            where base = fst p2 - fst p1
                                  altura = snd p2 - snd p1

{--Laboratorio 2a--} -------------------------------------------

data Carrera = Matematica|Fisica|Computacion|Astronomia deriving(Eq)

{--Laboratorio 2b--} -------------------------------------------

titulo :: Carrera -> String
titulo Matematica = "Licenciatura en Matematica"
titulo Fisica = "Licenciatura en Fisica"
titulo Computacion = "Licenciatura en Ciencias de la computacion"
titulo Astronomia = "Licenciatura en Astronomia"

{--Laboratorio 2c--} -------------------------------------------

-- data Notas = Do|Re|Mi|Fa|Sol|La|Si deriving (Eq, Ord, Show)

{--Laboratorio 2d--} -------------------------------------------

--cifAmericano :: Notas -> Char
--cifAmericano Do = 'C'
--cifAmericano Re = 'D'
--cifAmericano Mi = 'E'
--cifAmericano Fa = 'F'
--cifAmericano Sol ='G'
--cifAmericano La = 'A'
--cifAmericano Si = 'B'

{--Laboratorio 4a--} -------------------------------------------
minElem:: Ord a => [a] -> a
minElem [z] = z
minElem (x:xs) = min x (minElem xs)

{--Laboratorio 4b--} -------------------------------------------

minElem':: (Bounded a, Ord a) => [a] -> a
minElem' [] = maxBound
minElem' (x:xs) = min x (minElem' xs)
-- si [] = maxbound

{--Laboratorio 5a--} -------------------------------------------
type NumCamiseta = Int
type Altura = Int 

data Zona = Arco | Defensa | Mediocampo | Delantera deriving(Eq,Ord,Show)
data TipoReves = DosManos | UnaMano deriving(Show)
data Modalidad = Carretera | Pista | Monte | BMX deriving(Show)
data PiernaHabil = Izquierda | Derecha deriving(Show)

type ManoHabil = PiernaHabil 

data Deportista = Ajedrezista | Ciclista Modalidad | Velocista Altura | Tenista TipoReves ManoHabil Altura
                | Futbolista Zona NumCamiseta PiernaHabil Altura deriving(Show)

{--Laboratorio 5c--} -------------------------------------------

contar_velocistas :: [Deportista] -> Int
contar_velocistas [] = 0
contar_velocistas ((Velocista alt):xs) = 1 + contar_velocistas xs
contar_velocistas (x:xs) = contar_velocistas xs

{--Laboratorio 5d--} -------------------------------------------

zonaIndic :: Deportista -> Zona
zonaIndic (Futbolista zon numc pierna alt) = zon

siZona :: Deportista -> Zona -> Bool
siZona (Futbolista Arco numc pierna alt) Arco = True
siZona (Futbolista Defensa numc pierna alt) Defensa = True
siZona (Futbolista Mediocampo numc pierna alt) Mediocampo = True
siZona (Futbolista Delantera numc pierna alt) Delantera = True
siZona (Futbolista _ numc pierna alt) _ = False
siZona _ _ = False

contarFutbolista :: [Deportista] -> Zona -> Int
contarFutbolista [] z = 0
contarFutbolista (x:xs) z | siZona x z = 1 + contarFutbolista xs z
                          | otherwise = contarFutbolista xs z

{--Laboratorio 6a--} -------------------------------------------
potDe :: Int -> Natural -> Int
potDe x 0 = 1
potDe x exp = x* potDe x (exp-1)

f :: Int -> Natural -> Int
f x 0 = 0
f x exp = potDe x exp + f x (exp-1)

{--Laboratorio 6b--} -------------------------------------------
pot :: Int -> Natural -> Int
pot x 0 = 1
pot x n = x * pot x (n-1)

piAux :: Int -> Float
piAux 0 = 1 / (0*2+1)
piAux x = (((-1)** fromIntegral x) / (fromIntegral x*2+1)) + piAux (x-1)

pi' :: Natural -> Float
pi' x = 4 * piAux (fromIntegral x)

{--Laboratorio 6c--} -------------------------------------------

sumator :: Int -> Int -> Int
sumator x 0 = 0
sumator x n = x + sumator x (n-1)

cuad :: Int -> Int
cuad x = sumator x x

cub :: Int -> Int
cub x = sumator (cuad x) x

{--Laboratorio 6d--} -------------------------------------------

-- Existe un i: en la lista tal que: (el producto de los j valores del TAIL de xs DESDE la i) 
-- es igual al valor anterior al i que se inspeccionaba 
-- t.[12,2,3,4] es True pero t.[1,2,3,4] es False entonces

t :: [Int] -> Bool
t [] = False
t (x:y:xs) | product (tail (y:xs)) == x = True
           | otherwise = t (y:xs)

t' :: [Int] -> Bool
t' [] = False
t' [x] = False
t' (x:xs) | product (tail xs) == x = True
          | otherwise = t' xs

{--Laboratorio 7a--} -------------------------------------------

iguales:: Eq a => [a] -> Bool
iguales [] = True
iguales (x:y:xs) | x == y = iguales (y:xs)
                 |otherwise = False

{--Laboratorio 7b--} -------------------------------------------

minimo:: [Int] -> Int
minimo [x] = x
minimo (x:y:xs) | x >= y = minimo (y:xs)
                | otherwise = minimo (x:xs)

{--Laboratorio 7c--} -------------------------------------------

creciente :: [Int] -> Bool
creciente [] = True
creciente [x] = True
creciente (x:y:xs) | x <= y = creciente (y:xs)
                   | otherwise = False

{--Laboratorio 7d--} -------------------------------------------

prod :: [Int] -> [Int] -> Int
prod [] [] = 0
prod [] _ = 0
prod _ [] = 0
prod (x:xs) (y:ys) = x*y + prod xs ys



{--Laboratorio 8a--} -------------------------------------------
gpsum :: Int -> [Int] -> Bool
gpsum n [] = n >= 0
gpsum n (x:xs) = (n >= 0) && gpsum (n+x) xs
--gpsum n (x:xs) = gpsum (n+x) xs

{--Laboratorio 8b--} -------------------------------------------

gsumant :: Int -> [Int] -> Bool
gsumant n [] = False
gsumant n (x:xs) = x == n || gsumant (x+n) xs

sumAnt :: [Int] -> Bool
sumAnt xs = gsumant 0 xs

{--Laboratorio 8c--} -------------------------------------------

gsum8 :: Int -> [Int] -> Bool
gsum8 n [] =  n==8
gsum8 n (x:xs) = n==8 || gsum8 (n+x) xs

sum8 :: [Int] -> Bool
sum8 xs = gsum8 0 xs

-- Esto esta mal pero me sirve el ejemplo para ver como se imprime en la consola
-- putStrLn o print me sirven por igual 
gsum8' :: Int -> [Int] -> IO Bool
gsum8' n [] = do
    putStrLn ("Valor actual de n: " ++ show n)
    return (abs n == 8)
gsum8' n (x:xs) = do
    print ("Valor actual de n: " ++ show n)
    gsum8' (abs n + x) xs

sum8' :: [Int] -> IO Bool
sum8' xs = gsum8' 0 xs

{--Laboratorio 8d--} -------------------------------------------

gf :: Int -> Int -> [Int] -> Int
gf n it [] = (n)
gf n it xs | sum (take it xs) == sum (drop it xs) = gf (xs !! it) (it+1) xs
           | otherwise = gf (xs !! it) (it+1) xs
-- NO FUNCIONA

{--Laboratorio 9a--} -------------------------------------------
gcuad :: Int -> Int -> Bool
gcuad m 0 = m == 0
gcuad m n = ((n-1)*(n-1) + (n-1) == m) || gcuad (m+1) (n-1)
cuad' :: Int -> Bool
--cuad' 1 = False
cuad' n = gcuad 0 n
-- Lo anterior no funciona

gEsCuad m 0 = (m==0)
gEsCuad m n = gEsCuad (m+1)(n-1) || ((n-1)*(n-1) + (n-1) == m)
esCuad n = gEsCuad 0 n

{--Laboratorio 10--} -------------------------------------------
data NotaBasica = Do|Re|Mi|Fa|Sol|La|Si

sonidNat :: NotaBasica -> Int
sonidNat Do = 0
sonidNat Re = 2
sonidNat Mi = 4
sonidNat Fa = 5
sonidNat Sol = 7
sonidNat La = 9
sonidNat Si = 11

data Alteracion = Bemol|Natural|Sostenido deriving (Eq,Ord)

data NotaMusical = Nota NotaBasica Alteracion

sonidoCromatico :: NotaMusical -> Int
sonidoCromatico (Nota nta Sostenido) = sonidNat nta + 1
sonidoCromatico (Nota nta Bemol) = sonidNat nta -1
sonidoCromatico (Nota nta Natural) = sonidNat nta

instance Eq NotaMusical
    where
        (Nota nta1 alt1) == (Nota nta2 alt2) 
            = sonidoCromatico (Nota nta1 alt1) == sonidoCromatico (Nota nta2 alt2)

instance Ord NotaMusical
    where
        (Nota nta1 alt1) <= (Nota nta2 alt2) 
            = sonidoCromatico (Nota nta1 alt1) <= sonidoCromatico (Nota nta2 alt2)

{--Laboratorio 11--} -------------------------------------------
primerElemento :: [a] -> Maybe a
primerElemento [] = Nothing
primerElemento (x:xs) = Just x

{--Laboratorio 12--} -------------------------------------------
{--PIZARRA-} -------------------------------------------

data Palabra = PVacia | Agregar Char Palabra

mostrar :: Palabra -> String
mostrar PVacia = ""
mostrar (Agregar l p)  = l : mostrar p

-- mostrar (Agregar 'u' PVacia) <- EJEMPLO
{--FIN PIZARRA-} ----------------------------------------

data Cola  = VaciaC | Encolada Deportista Cola deriving(Show)--Ver ejercicio 5a para Deportista

atender :: Cola -> Maybe Cola
atender VaciaC = Nothing
atender (Encolada dep cla) = atender cla
-- atender (Encolada Ajedrezista (Encolada Ajedrezista VaciaC)) FUNCIONA!!

encolar :: Deportista -> Cola -> Cola 
encolar depor VaciaC = Encolada depor VaciaC
encolar depor (Encolada deps cla) = Encolada deps (encolar depor cla)

busca :: Cola -> Zona -> Maybe Deportista
busca VaciaC zon = Nothing
busca (Encolada (Futbolista Arco it1 it2 it3) cla) Arco = Just (Futbolista Arco it1 it2 it3)
busca (Encolada (Futbolista Defensa it1 it2 it3) cla) Defensa = Just (Futbolista Defensa it1 it2 it3)
busca (Encolada (Futbolista Mediocampo it1 it2 it3) cla) Mediocampo = Just (Futbolista Mediocampo it1 it2 it3)
busca (Encolada (Futbolista Delantera it1 it2 it3) cla) Delantera = Just (Futbolista Delantera it1 it2 it3)                                                 
busca (Encolada _ cla) zon = busca cla zon 
-- busca (Encolada Ajedrezista (Encolada (Futbolista Arco 20 Derecha 1.80) VaciaC)) Arco FUNCIONA!!
--Arco | Defensa | Mediocampo | Delantera --

deporPrueba = (Encolada Ajedrezista (Encolada Ajedrezista VaciaC))
deporPrueba2 = (Encolada Ajedrezista (Encolada (Futbolista Arco 20 Derecha 180) VaciaC))
{--Laboratorio 13--} -------------------------------------------

data ListaAsoc a b = Vacia | Nodo a b (ListaAsoc a b) deriving(Show)
-- "a" es un tipo de dato bien conocido y "b" es la informacion relevante
-- un diccionario de python es similar sino igual

-- Instanciamientos
type Diccionario = ListaAsoc String String --Palabra y Definicion
type Padron = ListaAsoc Int String --DNI y Nombre

--Sinonimos de tipo
type Nombre = String
type NumeroTelef = Int
--Instanciamiento con sinonimos
type GuiaTelefonica = ListaAsoc Nombre NumeroTelef

la_long :: ListaAsoc a b -> Int
la_long Vacia = 0
la_long (Nodo a1 b1 listAsoc) = 1 + la_long listAsoc

nodPrueba = (Nodo 321 "Juan" (Nodo 123 "Mabel" Vacia))
nodPrueba2 = (Nodo 3213 "Juana" (Nodo 1234 "Mabe" Vacia))

la_concat :: ListaAsoc a b -> ListaAsoc a b -> ListaAsoc a b
la_concat Vacia Vacia = Vacia
la_concat Vacia (Nodo a2 b2 la2) = Nodo a2 b2 (la_concat Vacia la2)
la_concat (Nodo a1 b1 la1) la2 = Nodo a1 b1 (la_concat la1 la2)

la_agregar :: Eq a => ListaAsoc a b -> a -> b -> ListaAsoc a b
la_agregar Vacia a b = Nodo a b Vacia
la_agregar (Nodo clv1 b1 la1) clv_tc b_tc | clv1 == clv_tc = (Nodo clv1 b_tc la1)
                                          | otherwise = (Nodo clv1 b1 (la_agregar la1 clv_tc b_tc))

la_pares :: ListaAsoc a b -> [(a, b)]
la_pares Vacia = []                                          
la_pares (Nodo a b la) = (a,b):la_pares la

la_busca :: Eq a => ListaAsoc a b -> a -> Maybe b
la_busca Vacia a = Nothing
la_busca (Nodo clv dta la) clv_tc | clv == clv_tc = Just dta
                                  | otherwise = la_busca la clv_tc

la_borrar :: Eq a => a -> ListaAsoc a b -> ListaAsoc a b
la_borrar a Vacia = Vacia
la_borrar clv_tc (Nodo clv inf la) | clv_tc == clv = la_borrar clv_tc la
                                    | otherwise = (Nodo clv inf (la_borrar clv_tc la))

{--Laboratorio 14--} -------------------------------------------
gsegini :: [Int] -> [Int] -> [Int] -> Bool
gsegini zs xs [] = xs == zs 
-- gsegini zs xs (y:ys) = xs == zs || gsegini (zs++[y]) xs ys 
gsegini zs xs (y:ys) = xs == zs || gsegini (zs++[y]) xs ys 

segini :: [Int] -> [Int] -> Bool
segini xs ys = gsegini [] xs ys

sumip :: [Int] -> Int
sumip [] = 0
sumip (x:xs) = 0 `min` sumip xs

sumin :: [Int] -> Int
sumin [] = 0
sumin (x:xs) = sumip(x:xs) `min` sumin xs