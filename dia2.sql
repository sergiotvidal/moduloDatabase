-- 1 Obtener todos las marcas
select * from Marca;

-- 2 Obtener todos los modelos y su consumo
select Consumo, Nombre from Modelo;

-- 3 Obtener todos los modelos que tengan un consumo >10
select Nombre, Consumo from Modelo
where Consumo > 10;

-- 4 Obtener todos los modelos que tenga un consumo entre 8 y 12
select Nombre, Consumo from Modelo
where Consumo between 8 and 12; -- between >= 8 and <= 12

-- 5 Obtener el consumo por modelo cada 1000 km
select Nombre, Consumo, Consumo*10 as Consumo1000 from Modelo; -- Si queremos limitar a dos decimales el resultado: cast(avg(Consumo) as decimal(5,2))

-- 6 Obtener la media de consumo
select avg(Consumo) as 'Consumo Medio' from Modelo;

-- 7 Obtener la media de consumo de los modelos de Seat
select cast(avg(Consumo) as decimal(5,2)) as 'Consumo Medio Seat' from Modelo
where idMarca = 2;

select t2.Nombre, avg(t1.Consumo) from Modelo t1
inner join Marca t2 on t1.idMarca = t2.idMarca
where t2.Nombre = 'Seat'
group by t2.Nombre;

-- 7 Contar cuantos modelos que tengan un consumo >10
select count(*) from Modelo
where Consumo > 10;

-- 8 Obtener el modelo y el consumo de los modelos ordenados por mayor a menor consumo y luego por ordenado por nombre de modelo
select Nombre, Consumo from Modelo
order by Consumo desc, Nombre asc;

select Nombre, Consumo from Modelo
order by Nombre asc, Consumo desc;

select Nombre, Consumo from Modelo
order by Nombre,Consumo;

-- 9 Obtener la tabla original : Matrícula, Marca, Modelo, Consumo y Kilómetros
select Matricula, Ma.Nombre as Marca, Mo.Nombre as Modelo, Consumo, Kilometros
from Vehiculos V
inner join Modelo Mo on V.idModelo = Mo.idModelo
inner join Marca Ma on Mo.idMarca = Ma.idMarca;

-- 10 Obtener el consumo medio por marcas
select Marca.Nombre as Marcas, avg(Consumo)
from Modelo as t1
inner join Marca
on t1.idMarca = Marca.idMarca
group by Marca.Nombre;

-- 11 Obtener el kilometraje medio por marca.
select Ma.Nombre as Marca, avg(Kilometros) as Media
from Vehiculos V
inner join Modelo Mo on Mo.idModelo = V.idModelo
inner join Marca Ma on Ma.idMarca = Mo.idMarca
group by Ma.Nombre;

-- 12 Obtener la matricula del coche con menor kilometraje
select Matricula, Kilometros from Vehiculos
order by Kilometros asc
limit 0,1; -- empieza por el valor 0 y toma 1

select Matricula, Kilometros from Vehiculos
where Kilometros = (select min(Kilometros) from Vehiculos);

-- 13 Obtener los modelos con menos consumo de cada marca
select Ma.Nombre Marca, min(Consumo) from Modelo Mo
inner join Marca Ma on Ma.idMarca = Mo.idMarca
group by Ma.Nombre;

-- 14 Añadir una nueva marca y dos modelos de esa marca
insert into Marca (idMarca, Nombre) values(5, 'Renault');
insert into Modelo (Nombre, Consumo, idMarca) values ('R12', 11.2, 5);
insert into Modelo (Nombre, Consumo, idMarca) values ('Megane', 6.1, 5);

-- 15 Actualizar el modelo 'Carrera' por '911 Carrera'
update Modelo set Nombre = '911 Carrera'
where idModelo = 3; -- otra opción: where Nombre = 'Carrera';

-- 16 Reducir el kilometraje en un 10%
update Vehiculos 
set Kilometros = Kilometros*0.9
where Matricula > '';

-- 17 Aumentar el consumo en un 5% para los consumos menores a 8.0
update Modelo 
set Consumo = Consumo*1.05
where Consumo < 8;

-- 18 Modelos que contenga la letra 'a'
select Nombre
from Modelo
where Nombre not like '%a%'; -- para hacer justo lo contrario not like

-- 19 Modelos que empiecen con la letra 'C'
select Nombre
from Modelo
where Nombre like 'c%'; -- no es case sensitive aunque se podría configurar para que lo fuese

-- 20 Obtener los distintos consumos que hay
select distinct Consumo
from Modelo;

-- 21 Obtener todos los modelos de seat u opel
select Nombre
from Modelo
where idMarca in (1,2); -- podemos escribir también where idMarca = 1 or idMarca = 2

-- 22 Obtener la suma de kilometros por modelo
select Mo.Nombre Modelo , sum(Kilometros)
from Vehiculos V
inner join Modelo Mo on Mo.idModelo = V.idModelo
group by Mo.Nombre;








