select Matricula, Ma.Nombre as Marca, Mo.Nombre as Modelo, 
Consumo, Kilometros, cast((Consumo*Kilometros/100) as decimal(10,0)) LitrosGas
from Vehiculos V
inner join Modelo Mo on V.idModelo = Mo.idModelo
inner join Marca Ma on Mo.idMarca = Ma.idMarca;