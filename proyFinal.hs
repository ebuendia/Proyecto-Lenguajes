-- Proyecto de Lenguajes de Programacion
-- Integrantes: Dimitri Laaz
--		Erick Buendia
--		Keyla Figueroa

import Data.Char
import Data.List
import System.IO
import Data.List.Split

data Vertice = Vertice {codigo::String
			,aeropuerto::String
			,ciudad::String
			,pais::String
			}deriving(Show)

type tiempo = String
type distancia = String

main::IO()
main = do
		putStrLn "\t\t\t+++++++++++++++++++++++++++++"
		putStrLn "\t\t\t+    PROYECTO FINAL HASKELL +"
		putStrLn "\t\t\t+       Dimitri Laaz        +"
		putStrLn "\t\t\t+      Erick Buendia        +"
		putStrLn "\t\t\t+      Keyla Figueroa       +"
		putStrLn "\t\t\t+++++++++++++++++++++++++++++"
	
		codigo <- openFile "AirlineRouteMapper/datosparseados.txt" ReadMode
		menuPrincipal codigo
		hClose codigo

--Funcion que lee Linea a Linea y se ejecuta todas las funciones
menuPrincipal manejable = do
			ineof <- hIsEOF manejable
			if ineof
				then return ()
				else do
					inpStr <- hGetLine manejable
					--putStrLn $ "Linea:        "++show(inpStr)
					--let vertex = Vertice{codigo="abc", aeropuerto="asd", ciudad="GYE", pais="Ecuador"}
					--putStrLn $ "prueba clase:        "++show(vertex)
					menuPrincipal manejable 
					
					let linea = splitOn ":" inpStr
					--putStrLn $ "Linea en lista:        "++show(linea)



--Función que toma la linea en lista y crea los vertices de clase 
--con sus costos en tiempo y distancia
crearElemento :: [String] -> Vertice




