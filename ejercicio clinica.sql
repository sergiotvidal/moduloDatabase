Un veterinario tiene como paciente
animales como cliente familias, un cliente es un conjunto de persona
que suele corresponderse con una familia.

Cada cliente tiene un código 
primer apellido es la cabeza de la familia 
un num de cuenta bancaria, 
una dirección, 
un teléfono 
y los nombres, 

la identificación de la personas correspondiente no existe el limite de
personas asociadas a un cliente además, una persona puede estar dado
de alta en varios clientes ( Ejemplo: Un hombre que vive con su
esposa tiene un gato y como tal pertenece a un cliente, pero también
esta dado de alta en el cliente asociado con el perro de sus
padres.) 

Los cliente pueden tener varias mascotas, 
cada mascota tiene
un código, 
un alias, 
una especies, 
una raza, 
color de pelo, 
fecha de nacimiento, 
peso del paciente : se debe llevar el historial de peso
durante las 10 ultimas visitas y el peso actual

Así mismo se
guarda un historial médico con cada enfermedad que tuvo y la fecha
en la que se enfermo y adicional mente cada mascota tiene un
calendario de vacunación, en la que se llama el registro de cada
vacuna, y la enfermedad de la que se esta vacunado.



Familia - Cliente
	idcliente
    nombre: apellidos
    dni
    direccion
    tlfn
	
Miembro
	idmiembro
    nombre/apellidos
    email
    
Cliente-miembro
	idmiembro
    idcliente
    fecha de alta

Cliente-paciente
	idcliente
    idpaciente
    
    
Paciente - Animal
	idPaciente
	idraza
    idespecie
    color de pelo
    nombre / alias
    codigo id
    fecha nacimiento (not nullable)
    fecha de amoche (nullable)

Historial de peso
	idpaciente
    fecha
    peso

raza
	idraza
    nombre
    
especie
	idespecie
    nombre
    
direcciones
	iddireccion
    calle
    municipio

Ingresos
	idingreso
    idpaciente
    fecha
    idmiembro
    motivo consulta
    idtipoconsulta
    
    
tipos consulta
	idtipoconsulta
    nombre

Historia enfermedades
	idhistoriaenfermedad
    idpaciente
    fecha deteccion
    fecha alta
    diagnostico
    tratamiento
    idtipoenfermedad
    
Enfermedades
	idtipoenfermedad
    descripción
    
Vacunación
	idVacunación
    idVacuna
    fecha
    idPaciente
    idcalendario
    dosis
    Notas

Vacunas
	idvacuna
    idespecie
    nombre
    dosis
    
Calendario de vacunas
	idcalendario
	idVacuna
    edad
    dosis
