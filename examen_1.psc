// Funcion que permite mostrar el menu
Funcion opc = menu
	Escribir ""
	Escribir "//////////////// Menu ////////////////"	
	Escribir "(1) Registro de estudiantes"
	Escribir "(2) Asignar 3 notas parciales a estudiantes"
	Escribir "(3) Registrar numero de inasistencias"
	Escribir "(4) Mostrar listado de estudiantes"
	Escribir "(5) Calcular nota final"
	Escribir "(0) Salir del programa"
	Escribir "//////////////////////////////////////"
	Escribir ""
	Escribir "Seleccione la opcion que desea:"
	leer opc
FinFuncion

// Funcion que permite asignar las 3 notas de los estudiantes
Funcion notas = asignarNotas(infoEstudiante, notas_Inasistencias, notasParciales, x)
	Escribir "Asignar 3 notas parciales a estudiantes, con un rango de 10 a 100"
	para i = 1 Hasta x Hacer
		si infoEstudiante(i, 1) <> "" Entonces
			Escribir "El estudiante es: "
			Escribir "Codigo:  ", infoEstudiante(i, 1), "		Nombre: ", infoEstudiante(i, 2)
			Escribir "Escriba la primera nota parcial"
			leer notasParciales(i, 1)
			Escribir "Escriba la segunda nota parcial"
			leer notasParciales(i, 2)
			Escribir "Escriba la tercera nota parcial"
			leer notasParciales(i, 3)
			notas_Inasistencias(i, 1) = (notasParciales(i, 1) + notasParciales(i, 2) + notasParciales(i, 1)) / 3
			Escribir "Nota almacenada"
			Escribir ""
		FinSi
	FinPara
FinFuncion

// Funcion que permite registrar las inasistencias de los estudiantes
Funcion registrar = registrarAsistencias(infoEstudiante, notas_Inasistencias, j)
	Escribir "Registrar inasistencias"
	para i = 1 Hasta j Hacer
		Escribir "El estudiante es: "
		Escribir "Codigo:  ", infoEstudiante(i, 1), "		Nombre: ", infoEstudiante(i, 2)
		Escribir "Escriba las inasistencias de ese estudiante"
		leer notas_Inasistencias(i, 2)
	FinPara
FinFuncion

// Funcion que muestra el listado de los estudiantes 
Funcion muestre = motrarListado(infoEstudiante, notas_Inasistencias, notasParciales, j)
	para i = 1 Hasta j Hacer
		si notas_Inasistencias(i, 2) > 10 y notas_Inasistencias(i, 2) < 15 Entonces
			notas_Inasistencias(i, 1) = notas_Inasistencias(i, 1) - 0.5
		sino 
			si notas_Inasistencias(i, 2) >= 15
				notas_Inasistencias(i, 1) = notas_Inasistencias(i, 1) - 1
			FinSi
		FinSi
	FinPara
	Escribir "Mostrar el listado de los estudiantes"
	Escribir ""
	para i = 1 Hasta j hacer
		Escribir "Codigo: ", infoEstudiante(i, 1), "				Nombre: ", infoEstudiante(i, 2)
		Escribir "Nota final: ", notas_Inasistencias(i, 1) , "		Inasistencias: ", notas_Inasistencias(i, 2) 
		Escribir "Nota 1: ", notasParciales(i, 1), "	Nota 2: ", notasParciales(i, 2), "	Nota 3: ", notasParciales(i, 1)
		Escribir ""
	FinPara
FinFuncion

// Funcion que calcula la nota final
Funcion notaFinal = calcularNotaFinal(infoEstudiante, notas_Inasistencias, x)
	Escribir "Escriba el codigo del estudiante del que desea saber la nota final"
	leer code
	para i = 1 Hasta x Hacer
		si code = infoEstudiante(i, 1)
			si notas_Inasistencias(i, 2) > 10 y notas_Inasistencias(i, 2) < 15 Entonces
				notas_Inasistencias(i, 1) = notas_Inasistencias(i, 1) - 0.5
			sino 
				si notas_Inasistencias(i, 2) >= 15
					notas_Inasistencias(i, 1) = notas_Inasistencias(i, 1) - 1
				FinSi
			FinSi
			Escribir "La nota final es ", notas_Inasistencias(i, 1)
		FinSi
	FinPara
FinFuncion


Algoritmo examen_1
	
	// Mediante esta x se puede definir la cantidad de estudiantes maxima:
	x =  3
	Dimension infoEstudiante(x, 2), notas_Inasistencias(x, 2), notasParciales(x, 3)
	//infoEstudiante (i, 1): codigo
	//infoEstudiante (i, 2): nombre
	//notas_Inasistencias(i, 1): nota final
	//notas_Inasistencias(i, 2): inasistencias
	//La ultima matriz la separe para que sea un poco mas ordenado
	//NotasParciales(i, 1): Nota 1
	//NotasParciales(i, 2): Nota 2
	//NotasParciales(i, 3): Nota 3
	
	opc = 1
	mientras opc <> 0 Hacer
		
		//Se llama la funcion menu
		opc = menu 
		
		segun opc Hacer
			1: 
				// Se verifica si el codigo ya existe en la base de datos 
				Escribir "Registro de estudiantes"
				Escribir "Escriba el codigo del estudiante"
				leer code
				para i = 1 Hasta x Hacer
					si code <> infoEstudiante(i, 1)
						registrar = Verdadero
					sino 
						registrar = falso 
						i = x
					FinSi
				FinPara
				// Si no existe se registra, ademas se condiciona para que no se supere el limite permitido 
				si registrar Entonces
					si j < x Entonces
						j = j + 1
						infoEstudiante(j, 1) = code
						Escribir "Escriba el nombre del estudiante"
						leer infoEstudiante(j, 2)
					sino 
						Escribir "No hay mas espacio de almacenamiento disponible"
					FinSi
				sino 
					Escribir "El codigo ya existe"
				FinSi
				
			2:	//Se llama la funcion asignarNotas
				notas = asignarNotas(infoEstudiante, notas_Inasistencias, notasParciales, x)
				
			3: // Se llama la funcion registrarAsistencias
				registrar = registrarAsistencias(infoEstudiante, notas_Inasistencias, j)
				
			4:	// Se llama la funcion mostrarListado
				muestre = motrarListado(infoEstudiante, notas_Inasistencias, notasParciales, j)
				
			5: //Se llama la funcion calcularNotaFinal
				notaFinal = calcularNotaFinal(infoEstudiante, notas_Inasistencias, x)
				
			0: //Se acaba el programa
				Escribir "Saliendo del programa"
				opc = 0
				
			De Otro Modo:
				Escribir "Dato invalido"
			
			
		FinSegun
		
	FinMientras
	
FinAlgoritmo
