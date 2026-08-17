!classDefinition: #BibliotecaTests category: #'TrabajoFinal-Grupo-7'!
TestCase subclass: #BibliotecaTests
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-Grupo-7'!

!BibliotecaTests methodsFor: 'as yet unclassified' stamp: 'JR 12/1/2025 12:23:52'!
test001_alCrearLaBibliotecaEstaNoTieneSociosNiLibrosRegistrados

	| biblioteca |
	
	biblioteca := Biblioteca new.
	
	Assert isTrue: biblioteca socios isEmpty.
	
	Assert isTrue: biblioteca libros isEmpty.! !

!BibliotecaTests methodsFor: 'as yet unclassified' stamp: 'JR 12/1/2025 12:24:04'!
test002_laBibliotecaIncribeAUnSocio

	| biblioteca socio1 |
	
	biblioteca := Biblioteca new.
	
	socio1 := Socio nombreYApellido: 'Julieta Rodriguez' dni: '47260474' fechaDeRegistracion: (FixedGregorianDate yearNumber: 2024 monthNumber: 4 dayNumber:8).
	
	biblioteca inscribir: socio1.
	
	Assert isTrue: biblioteca socios notEmpty.
	
	Assert that: socio1 nombreYApellido isEqualTo: 'Julieta Rodriguez'.
	
	Assert that: socio1 dni isEqualTo: '47260474'.
	
	Assert that: socio1 fechaDeRegistracion isEqualTo: (FixedGregorianDate yearNumber: 2024 monthNumber: 4 dayNumber:8 ).
	! !

!BibliotecaTests methodsFor: 'as yet unclassified' stamp: 'JR 11/30/2025 17:06:13'!
test003_comprobarSiSocioTieneMembresiaAlDia

	| biblioteca socio1 |
	
	biblioteca := Biblioteca new.
	
	socio1 := Socio nombreYApellido: 'Julieta Rodriguez' dni: '47260474' fechaDeRegistracion: (FixedGregorianDate yearNumber: 2025 monthNumber: 4 dayNumber:8).
	
	biblioteca inscribir: socio1.
	
	Assert that: (socio1 tieneMembresiaAlDia) isEqualTo: true.! !

!BibliotecaTests methodsFor: 'as yet unclassified' stamp: 'JR 12/1/2025 12:24:20'!
test004_laBibliotecaRegistraUnLibroConUnEjemplar

	| biblioteca elPrincipito prestamoRenovablePorUnaSemana |
	
	prestamoRenovablePorUnaSemana := PrestamoRenovablePor1Semana new.
	biblioteca := Biblioteca new.
	
	elPrincipito := Libro iSBN: '978-987-674-799-8'titulo: 'El Principito' autor: 'Antoine de Saint-Exupéry' fechaDePublicacion: (FixedGregorianDate yearNumber: 1943 monthNumber: 4 dayNumber:6) idioma: 'ingles' listaDeTemas: #('Amistad', 'Amor').
	
	biblioteca registrar: elPrincipito conTipoDePrestamo: prestamoRenovablePorUnaSemana.
	biblioteca agregarEjemplar: elPrincipito conFechaDeIngreso: (FixedGregorianDate yearNumber: 2025 monthNumber: 4 dayNumber:8).
	
	Assert isTrue: biblioteca libros notEmpty.
	
	Assert that: ((biblioteca libros) at: 0) isEqualTo: elPrincipito.
	
	Assert that: elPrincipito iSBN isEqualTo: '978-987-674-799-8'.
	
	Assert that: elPrincipito titulo isEqualTo: 'El Principito'.
	
	Assert that: elPrincipito autor isEqualTo: 'Antoine de Saint-Exupéry'.
	
	Assert that: elPrincipito idioma isEqualTo: 'ingles'.
	
	Assert that: elPrincipito fechaDePublicacion isEqualTo: (FixedGregorianDate yearNumber: 1943 monthNumber: 4 dayNumber:6).
	
	Assert that: elPrincipito cantidadDeEjemplares isEqualTo: 1.
	
	! !

!BibliotecaTests methodsFor: 'as yet unclassified' stamp: 'FD 11/22/2025 19:44:18'!
test005_laBibliotecaNoRegistraUnLibroConElMismoISBNQueOtro

	| biblioteca elPrincipito elPrincipito1 prestamoRenovablePorUnaSemana |
	
	prestamoRenovablePorUnaSemana := PrestamoRenovablePor1Semana new.
	
	biblioteca := Biblioteca new.
	
	elPrincipito := Libro iSBN: '978-987-674-799-8' titulo:'El Principito' autor: 'Antoine de Saint-Exupéry' fechaDePublicacion: (FixedGregorianDate yearNumber: 1943 monthNumber: 4 dayNumber:6) idioma: 'ingles' listaDeTemas: #('Amistad', 'Amor').
	
	elPrincipito1 := Libro iSBN: '978-987-674-799-8' titulo:'El Principito'  autor: 'Antoine de Saint-Exupéry' fechaDePublicacion: (FixedGregorianDate yearNumber: 1943 monthNumber: 4 dayNumber:6) idioma: 'ingles' listaDeTemas: #('Amistad', 'Amor').
	
	biblioteca registrar: elPrincipito conTipoDePrestamo: prestamoRenovablePorUnaSemana..
	
	Assert should: [biblioteca registrar: elPrincipito1 conTipoDePrestamo: prestamoRenovablePorUnaSemana.] signal: PreconditionFailure withDescription: 'ISBN ya utilizado en otro libro'
	
	! !

!BibliotecaTests methodsFor: 'as yet unclassified' stamp: 'JR 12/1/2025 12:24:30'!
test006_laBibliotecaPuedeAgregarEjemplaresDeUnMismoLibro

	| biblioteca prestamoRenovablePorUnaSemana elPrincipito |
	
	prestamoRenovablePorUnaSemana := PrestamoRenovablePor1Semana new.
	biblioteca := Biblioteca new.
	
	elPrincipito := Libro iSBN: '978-987-674-799-8'titulo: 'El Principito' autor: 'Antoine de Saint-Exupéry' fechaDePublicacion: (FixedGregorianDate yearNumber: 1943 monthNumber: 4 dayNumber:6) idioma: 'ingles' listaDeTemas: #('Amistad', 'Amor').
	
	biblioteca registrar: elPrincipito conTipoDePrestamo: prestamoRenovablePorUnaSemana.
	
	biblioteca agregarEjemplar: elPrincipito conFechaDeIngreso: (FixedGregorianDate yearNumber: 2025 monthNumber: 4 dayNumber:8).
	
	biblioteca agregarEjemplar: elPrincipito conFechaDeIngreso: (FixedGregorianDate yearNumber: 2025 monthNumber: 4 dayNumber:8).
	
	Assert that: (elPrincipito cantidadDeEjemplares) isEqualTo: 2.
	
	
	! !

!BibliotecaTests methodsFor: 'as yet unclassified' stamp: 'JR 11/30/2025 17:06:40'!
test007_unSocioRenuevaSuMembresia

	| biblioteca socio1 |
	
	biblioteca := Biblioteca new.
	
	socio1 := Socio nombreYApellido: 'Julieta Rodriguez' dni: '47260474' fechaDeRegistracion: (FixedGregorianDate yearNumber: 2024 monthNumber: 4 dayNumber:8).
	
	biblioteca inscribir: socio1.
	
	socio1 renovarMembresia. 
	
	Assert that: socio1 fechaDeUltimaRenovacionDeMembresia isEqualTo: (FixedGregorianDate yearNumber: 2025 monthNumber: 4 dayNumber:8).
	! !

!BibliotecaTests methodsFor: 'as yet unclassified' stamp: 'JR 12/3/2025 15:05:12'!
test008_unSocioNoPuedePedirUnPrestamoSiNoRenovoSuMembresiaAnual

	| biblioteca socio1 elPrincipito prestamoRenovablePorUnaSemana |
	
	prestamoRenovablePorUnaSemana := PrestamoRenovablePor1Semana new.
	
	biblioteca := Biblioteca new.
	
	socio1 := Socio nombreYApellido: 'Julieta Rodriguez' dni: '47260474' fechaDeRegistracion: (FixedGregorianDate yearNumber: 2024 monthNumber: 4 dayNumber:8).
	
	elPrincipito := Libro iSBN: '978-987-674-799-8'titulo: 'El Principito' autor: 'Antoine de Saint-Exupéry' fechaDePublicacion: (FixedGregorianDate yearNumber: 1943 monthNumber: 4 dayNumber:6) idioma: 'ingles' listaDeTemas: #('Amistad', 'Amor').
	
	biblioteca registrar: elPrincipito conTipoDePrestamo: prestamoRenovablePorUnaSemana.
	
	biblioteca inscribir: socio1.
	
	biblioteca agregarEjemplar: elPrincipito conFechaDeIngreso: (FixedGregorianDate yearNumber: 2025 monthNumber: 4 dayNumber:8).
	
	Assert should: [socio1 pedirPrestamoDeLibro: elPrincipito conFecha: (FixedGregorianDate yearNumber: 2025 monthNumber: 11 dayNumber: 20) HastaFecha: (FixedGregorianDate yearNumber: 2025 monthNumber: 11 dayNumber: 29) deBiblioteca: biblioteca.] signal: PreconditionFailure withDescription: 'No renovo su membresia anual'.
	! !

!BibliotecaTests methodsFor: 'as yet unclassified' stamp: 'JR 12/3/2025 15:13:05'!
test009_unSocioPidePrestamoDelPrincipito
	| biblioteca socio1 elPrincipito prestamoRenovablePorUnaSemana |
	
	prestamoRenovablePorUnaSemana := PrestamoRenovablePor1Semana new.
	
	biblioteca := Biblioteca new.
	
	socio1 := Socio nombreYApellido: 'Julieta Rodriguez' dni: '47260474' fechaDeRegistracion: (FixedGregorianDate yearNumber: 2025 monthNumber: 4 dayNumber:8).
	
	elPrincipito := Libro iSBN: '978-987-674-799-8'titulo: 'El Principito' autor: 'Antoine de Saint-Exupéry' fechaDePublicacion: (FixedGregorianDate yearNumber: 1943 monthNumber: 4 dayNumber:6) idioma: 'ingles' listaDeTemas: #('Amistad', 'Amor').
	
	biblioteca registrar: elPrincipito conTipoDePrestamo: prestamoRenovablePorUnaSemana.
	
	biblioteca agregarEjemplar: elPrincipito conFechaDeIngreso: (FixedGregorianDate yearNumber: 2025 monthNumber: 4 dayNumber:8).
	
	biblioteca inscribir: socio1.
	
	socio1 pedirPrestamoDeLibro: elPrincipito conFecha: (FixedGregorianDate yearNumber: 2025 monthNumber: 11 dayNumber: 20) HastaFecha: (FixedGregorianDate yearNumber: 2025 monthNumber: 12 dayNumber: 3) deBiblioteca: biblioteca.
	
	Assert isTrue: (socio1 tienePrestamoDe: elPrincipito).
	Assert isTrue: (biblioteca presto: elPrincipito).
	Assert that: (elPrincipito cantidadDeEjemplares) isEqualTo: 0.
	
	! !

!BibliotecaTests methodsFor: 'as yet unclassified' stamp: 'JR 12/3/2025 15:14:32'!
test010_unSocioNoPuedePedirPrestadoMasDe5LibroslMismoTiempo

	| biblioteca socio1 elPrincipito harryPotter sherlockHolmes percyJackson elSeñorDeLosAnillos lasBrujas prestamoRenovablePorUnaSemana |
	
	biblioteca := Biblioteca new.
	
	socio1 := Socio nombreYApellido: 'Julieta Rodriguez' dni: '47260474' fechaDeRegistracion: (FixedGregorianDate yearNumber: 2025 monthNumber: 4 dayNumber:8).
	
	elPrincipito := Libro iSBN: '978-987-674-799-8'titulo: 'El Principito' autor: 'Antoine de Saint-Exupéry' fechaDePublicacion: (FixedGregorianDate yearNumber: 1943 monthNumber: 4 dayNumber:6) idioma: 'ingles' listaDeTemas: #('Amistad', 'Amor').
	
	harryPotter := Libro iSBN: '978-84-7888-445-2'titulo: 'Harry Potter' autor: 'Jk Rowling' fechaDePublicacion: (FixedGregorianDate yearNumber: 1997 monthNumber: 6 dayNumber:26) idioma: 'ingles' listaDeTemas: #('Fantasia', 'Amistad').
	
	sherlockHolmes := Libro iSBN: '1-85326-896-8'titulo: 'Un estudio en Escarlata' autor: 'Arthur Ignatius Conan Doyle' fechaDePublicacion: (FixedGregorianDate yearNumber: 1892 monthNumber: 10 dayNumber:14) idioma: 'ingles' listaDeTemas: #('Policial', 'Misterio').
	
	percyJackson := Libro iSBN: '0-6868-7865-5'titulo: 'El Ladron del rayo' autor: 'Rick Riordan' fechaDePublicacion: (FixedGregorianDate yearNumber: 2010 monthNumber: 1 dayNumber:18) idioma: 'ingles' listaDeTemas: #('Fantasia', 'Amistad').
	
	elSeñorDeLosAnillos := Libro iSBN: '978-950-547-067-9'titulo: 'La Comunidad Del Anillo' autor: 'Jrr Tolkien' fechaDePublicacion: (FixedGregorianDate yearNumber: 1954 monthNumber: 7 dayNumber:29) idioma: 'ingles' listaDeTemas: #('Fantasia', 'Drama').
	
	lasBrujas := Libro iSBN: '978014031730'titulo: 'Las Brujas' autor: 'Roal Dahl' fechaDePublicacion: (FixedGregorianDate yearNumber: 1983 monthNumber: 9 dayNumber:10) idioma: 'ingles' listaDeTemas: #('Ficcion', 'Terror').
	
	prestamoRenovablePorUnaSemana := PrestamoRenovablePor1Semana new.
	
	biblioteca registrar: elPrincipito conTipoDePrestamo: prestamoRenovablePorUnaSemana .
	biblioteca registrar: harryPotter conTipoDePrestamo: prestamoRenovablePorUnaSemana .
	biblioteca registrar: sherlockHolmes conTipoDePrestamo: prestamoRenovablePorUnaSemana .
	biblioteca registrar: percyJackson conTipoDePrestamo: prestamoRenovablePorUnaSemana . 
	biblioteca registrar: elSeñorDeLosAnillos conTipoDePrestamo: prestamoRenovablePorUnaSemana .
	biblioteca registrar: lasBrujas conTipoDePrestamo: prestamoRenovablePorUnaSemana .
	
	biblioteca inscribir: socio1.
	
	biblioteca agregarEjemplar: elPrincipito conFechaDeIngreso: (FixedGregorianDate yearNumber: 2025 monthNumber: 4 dayNumber:8).
	biblioteca agregarEjemplar: harryPotter conFechaDeIngreso: (FixedGregorianDate yearNumber: 2025 monthNumber: 4 dayNumber:8).
	biblioteca agregarEjemplar: sherlockHolmes conFechaDeIngreso: (FixedGregorianDate yearNumber: 2025 monthNumber: 4 dayNumber:8).
	biblioteca agregarEjemplar: percyJackson conFechaDeIngreso: (FixedGregorianDate yearNumber: 2025 monthNumber: 4 dayNumber:8).
	biblioteca agregarEjemplar: elSeñorDeLosAnillos conFechaDeIngreso: (FixedGregorianDate yearNumber: 2025 monthNumber: 4 dayNumber:8).
	biblioteca agregarEjemplar: lasBrujas conFechaDeIngreso: (FixedGregorianDate yearNumber: 2025 monthNumber: 4 dayNumber:8).
	
	socio1 pedirPrestamoDeLibro: elPrincipito conFecha: (FixedGregorianDate yearNumber: 2025 monthNumber: 11 dayNumber: 20) HastaFecha: (FixedGregorianDate yearNumber: 2025 monthNumber: 12 dayNumber: 3) deBiblioteca: biblioteca.
	
	socio1 pedirPrestamoDeLibro: harryPotter conFecha: (FixedGregorianDate yearNumber: 2025 monthNumber: 11 dayNumber: 20) HastaFecha: (FixedGregorianDate yearNumber: 2025 monthNumber: 12 dayNumber: 3) deBiblioteca: biblioteca.
	
	socio1 pedirPrestamoDeLibro: sherlockHolmes conFecha: (FixedGregorianDate yearNumber: 2025 monthNumber: 11 dayNumber: 20) HastaFecha: (FixedGregorianDate yearNumber: 2025 monthNumber: 12 dayNumber: 3) deBiblioteca: biblioteca.
	
	socio1 pedirPrestamoDeLibro: percyJackson conFecha: (FixedGregorianDate yearNumber: 2025 monthNumber: 11 dayNumber: 20) HastaFecha: (FixedGregorianDate yearNumber: 2025 monthNumber: 12 dayNumber: 3) deBiblioteca: biblioteca.
	
	socio1 pedirPrestamoDeLibro: elSeñorDeLosAnillos conFecha: (FixedGregorianDate yearNumber: 2025 monthNumber: 11 dayNumber: 20) HastaFecha: (FixedGregorianDate yearNumber: 2025 monthNumber: 12 dayNumber: 3) deBiblioteca: biblioteca.
	
	
	Assert should: [socio1 pedirPrestamoDeLibro: lasBrujas conFecha: (FixedGregorianDate yearNumber: 2025 monthNumber: 11 dayNumber: 20) HastaFecha: (FixedGregorianDate yearNumber: 2025 monthNumber: 12 dayNumber: 3) deBiblioteca: biblioteca.] signal: PreconditionFailure withDescription: 'Ya tiene 5 prestamos'.
	! !

!BibliotecaTests methodsFor: 'as yet unclassified' stamp: 'JR 12/3/2025 15:15:02'!
test011_unSocioNoPuedePedirPrestadoDosEjemplaresDeUnMismoLibro

	| biblioteca socio1 elPrincipito prestamoRenovablePorUnaSemana |
	
	prestamoRenovablePorUnaSemana := PrestamoRenovablePor1Semana new.
	
	biblioteca := Biblioteca new.
	
	socio1 := Socio nombreYApellido: 'Julieta Rodriguez' dni: '47260474' fechaDeRegistracion: (FixedGregorianDate yearNumber: 2025 monthNumber: 4 dayNumber:8).
	
	elPrincipito := Libro iSBN: '978-987-674-799-8'titulo: 'El Principito' autor: 'Antoine de Saint-Exupéry' fechaDePublicacion: (FixedGregorianDate yearNumber: 1943 monthNumber: 4 dayNumber:6) idioma: 'ingles' listaDeTemas: #('Amistad', 'Amor').
	
	biblioteca registrar: elPrincipito conTipoDePrestamo: prestamoRenovablePorUnaSemana.
	
	biblioteca inscribir: socio1.
	
	biblioteca agregarEjemplar: elPrincipito conFechaDeIngreso: (FixedGregorianDate yearNumber: 2025 monthNumber: 4 dayNumber:8).
	biblioteca agregarEjemplar: elPrincipito conFechaDeIngreso: (FixedGregorianDate yearNumber: 2025 monthNumber: 4 dayNumber:8).
	
	socio1 pedirPrestamoDeLibro: elPrincipito conFecha: (FixedGregorianDate yearNumber: 2025 monthNumber: 11 dayNumber: 20) HastaFecha: (FixedGregorianDate yearNumber: 2025 monthNumber: 12 dayNumber: 3) deBiblioteca: biblioteca.
	
	Assert should: [socio1 pedirPrestamoDeLibro: elPrincipito conFecha: (FixedGregorianDate yearNumber: 2025 monthNumber: 11 dayNumber: 20) HastaFecha: (FixedGregorianDate yearNumber: 2025 monthNumber: 12 dayNumber: 3) deBiblioteca: biblioteca.] signal: PreconditionFailure withDescription: 'Ya tiene ejemplar de este libro'.
	! !

!BibliotecaTests methodsFor: 'as yet unclassified' stamp: 'JR 12/3/2025 15:15:13'!
test012_unSocioNoPuedePedirUnLibroNoRegistradoEnLaBiblioteca

	| biblioteca socio1 elPrincipito |
	
	biblioteca := Biblioteca new.
	
	socio1 := Socio nombreYApellido: 'Julieta Rodriguez' dni: '47260474' fechaDeRegistracion: (FixedGregorianDate yearNumber: 2025 monthNumber: 4 dayNumber:8).
	
	biblioteca inscribir: socio1.
	
	Assert should: [socio1 pedirPrestamoDeLibro: elPrincipito conFecha: (FixedGregorianDate yearNumber: 2025 monthNumber: 11 dayNumber: 20) HastaFecha: (FixedGregorianDate yearNumber: 2025 monthNumber: 12 dayNumber: 3) deBiblioteca: biblioteca.] signal: PreconditionFailure withDescription: 'La biblioteca no posee este libro'.
	! !

!BibliotecaTests methodsFor: 'as yet unclassified' stamp: 'JR 12/3/2025 15:09:23'!
test013_unSocioNoPuedePedirPrestadoUnLibroConLaBibliotecaCerrada

	| biblioteca socio1 elPrincipito prestamoRenovablePorUnaSemana |
	
	prestamoRenovablePorUnaSemana := PrestamoRenovablePor1Semana new.
	
	biblioteca := Biblioteca new.
	
	socio1 := Socio nombreYApellido: 'Julieta Rodriguez' dni: '47260474' fechaDeRegistracion: (FixedGregorianDate yearNumber: 2025 monthNumber: 4 dayNumber:8).
	
	elPrincipito := Libro iSBN: '978-987-674-799-8'titulo: 'El Principito' autor: 'Antoine de Saint-Exupéry' fechaDePublicacion: (FixedGregorianDate yearNumber: 1943 monthNumber: 4 dayNumber:6) idioma: 'ingles' listaDeTemas: #('Amistad', 'Amor').
	
	biblioteca registrar: elPrincipito conTipoDePrestamo: prestamoRenovablePorUnaSemana.
	
	biblioteca agregarEjemplar: elPrincipito conFechaDeIngreso: (FixedGregorianDate yearNumber: 2025 monthNumber: 4 dayNumber:8).
	
	biblioteca inscribir: socio1.
	
	Assert should: [socio1 pedirPrestamoDeLibro: elPrincipito conFecha: (FixedGregorianDate yearNumber: 2025 monthNumber: 11 dayNumber: 30) HastaFecha: (FixedGregorianDate yearNumber: 2025 monthNumber: 12 dayNumber: 30) deBiblioteca: biblioteca.] signal: PreconditionFailure withDescription: 'La biblioteca esta cerrada'.
	! !

!BibliotecaTests methodsFor: 'as yet unclassified' stamp: 'JR 12/3/2025 15:16:41'!
test014_unSocioNoPuedePedirPrestadoUnLibroSiTodosSusEjemplaresFueronPrestados

	| biblioteca socio1 elPrincipito prestamoRenovablePorUnaSemana socio2 |
	
	prestamoRenovablePorUnaSemana := PrestamoRenovablePor1Semana new.
	
	biblioteca := Biblioteca new.
	
	socio1 := Socio nombreYApellido: 'Julieta Rodriguez' dni: '47260474' fechaDeRegistracion: (FixedGregorianDate yearNumber: 2025 monthNumber: 4 dayNumber:8).
	
	socio2 := Socio nombreYApellido: 'Francisco Demartino' dni: '44958916' fechaDeRegistracion: (FixedGregorianDate yearNumber: 2025 monthNumber: 4 dayNumber:8).
	
	elPrincipito := Libro iSBN: '978-987-674-799-8'titulo: 'El Principito' autor: 'Antoine de Saint-Exupéry' fechaDePublicacion: (FixedGregorianDate yearNumber: 1943 monthNumber: 4 dayNumber:6) idioma: 'ingles' listaDeTemas: #('Amistad', 'Amor').
	
	biblioteca registrar: elPrincipito conTipoDePrestamo: prestamoRenovablePorUnaSemana.
	
	biblioteca agregarEjemplar: elPrincipito conFechaDeIngreso: (FixedGregorianDate yearNumber: 2025 monthNumber: 4 dayNumber:8).
	
	biblioteca inscribir: socio1.
	
	biblioteca inscribir: socio2.
	
	socio1 pedirPrestamoDeLibro: elPrincipito conFecha: (FixedGregorianDate yearNumber: 2025 monthNumber: 11 dayNumber: 20) HastaFecha: (FixedGregorianDate yearNumber: 2025 monthNumber: 12 dayNumber: 3) deBiblioteca: biblioteca.
	
	Assert should: [socio2 pedirPrestamoDeLibro: elPrincipito conFecha: (FixedGregorianDate yearNumber: 2025 monthNumber: 11 dayNumber: 20) HastaFecha: (FixedGregorianDate yearNumber: 2025 monthNumber: 12 dayNumber: 3) deBiblioteca: biblioteca.] signal: PreconditionFailure withDescription: 'No hay ejemplares disponibles'.
	! !

!BibliotecaTests methodsFor: 'as yet unclassified' stamp: 'JR 12/3/2025 15:17:25'!
test015_unSocioNoPuedePedirPrestadoUnLibroSiElPrestamoTieneFechaDeVencimientoAnteriorALaFechaDePedido

	| biblioteca socio1 elPrincipito prestamoRenovablePorUnaSemana |
	
	prestamoRenovablePorUnaSemana := PrestamoRenovablePor1Semana new.
	
	biblioteca := Biblioteca new.
	
	socio1 := Socio nombreYApellido: 'Julieta Rodriguez' dni: '47260474' fechaDeRegistracion: (FixedGregorianDate yearNumber: 2025 monthNumber: 4 dayNumber:8).
	
	elPrincipito := Libro iSBN: '978-987-674-799-8'titulo: 'El Principito' autor: 'Antoine de Saint-Exupéry' fechaDePublicacion: (FixedGregorianDate yearNumber: 1943 monthNumber: 4 dayNumber:6) idioma: 'ingles' listaDeTemas: #('Amistad', 'Amor').
	
	biblioteca registrar: elPrincipito conTipoDePrestamo: prestamoRenovablePorUnaSemana.
	
	biblioteca agregarEjemplar: elPrincipito conFechaDeIngreso: (FixedGregorianDate yearNumber: 2025 monthNumber: 4 dayNumber:8).
	
	biblioteca inscribir: socio1.
	
	Assert should: [socio1 pedirPrestamoDeLibro: elPrincipito conFecha: (FixedGregorianDate yearNumber: 2025 monthNumber: 12 dayNumber: 3) HastaFecha: (FixedGregorianDate yearNumber: 2025 monthNumber: 11 dayNumber: 20) deBiblioteca: biblioteca.] signal: PreconditionFailure withDescription: 'La fecha de vencimiento es mayor a la de pedido del prestamo'.
	! !

!BibliotecaTests methodsFor: 'as yet unclassified' stamp: 'JR 12/3/2025 15:32:59'!
test016_unSocioRenuevaSuPrestamoPorUnaSemana

	| biblioteca socio1 elPrincipito prestamoRenovablePorUnaSemana |
	
	prestamoRenovablePorUnaSemana := PrestamoRenovablePor1Semana new.
	 
	biblioteca := Biblioteca new.
	
	socio1 := Socio nombreYApellido: 'Julieta Rodriguez' dni: '47260474' fechaDeRegistracion: (FixedGregorianDate yearNumber: 2025 monthNumber: 4          dayNumber:8).
	
	elPrincipito := Libro iSBN: '978-987-674-799-8'titulo: 'El Principito' autor: 'Antoine de Saint-Exupéry' fechaDePublicacion: (FixedGregorianDate yearNumber: 1943 monthNumber: 4 dayNumber:6) idioma: 'ingles' listaDeTemas: #('Amistad', 'Amor').
	
	biblioteca registrar: elPrincipito conTipoDePrestamo: prestamoRenovablePorUnaSemana.
	
	biblioteca inscribir: socio1.
	
	biblioteca agregarEjemplar: elPrincipito conFechaDeIngreso: (FixedGregorianDate yearNumber: 2025 monthNumber: 4 dayNumber:8).
	
	socio1 pedirPrestamoDeLibro: elPrincipito conFecha: (FixedGregorianDate yearNumber: 2025 monthNumber: 11 dayNumber: 20) HastaFecha: (FixedGregorianDate yearNumber: 2025 monthNumber: 12 dayNumber: 3) deBiblioteca: biblioteca.
	
	socio1 pideRenovacionDePrestamoParaLibro: elPrincipito fechaDeRenovacion: (FixedGregorianDate yearNumber: 2025 monthNumber: 12 dayNumber: 3).
	
	Assert that: (socio1 fechaLimiteDePrestamoPara: elPrincipito) isEqualTo: (FixedGregorianDate yearNumber: 2025 monthNumber: 12 dayNumber: 10).
	
	
	
	
	
	! !

!BibliotecaTests methodsFor: 'as yet unclassified' stamp: 'JR 12/3/2025 15:33:55'!
test017_unSocioRenuevaSuPrestamoPorUnDia

	| biblioteca socio1 elPrincipito prestamoRenovablePorUndia |
	
	prestamoRenovablePorUndia:= PrestamoRenovablePor1Dia new.
	 
	biblioteca := Biblioteca new.
	
	socio1 := Socio nombreYApellido: 'Julieta Rodriguez' dni: '47260474' fechaDeRegistracion: (FixedGregorianDate yearNumber: 2025 monthNumber: 4          dayNumber:8).
	
	elPrincipito := Libro iSBN: '978-987-674-799-8'titulo: 'El Principito' autor: 'Antoine de Saint-Exupéry' fechaDePublicacion: (FixedGregorianDate yearNumber: 1943 monthNumber: 4 dayNumber:6) idioma: 'ingles' listaDeTemas: #('Amistad', 'Amor').
	
	biblioteca registrar: elPrincipito conTipoDePrestamo: prestamoRenovablePorUndia .
	
	biblioteca inscribir: socio1.
	
	biblioteca agregarEjemplar: elPrincipito conFechaDeIngreso: (FixedGregorianDate yearNumber: 2025 monthNumber: 4 dayNumber:8).
	
	socio1 pedirPrestamoDeLibro: elPrincipito conFecha: (FixedGregorianDate yearNumber: 2025 monthNumber: 11 dayNumber: 20) HastaFecha: (FixedGregorianDate yearNumber: 2025 monthNumber: 12 dayNumber: 3) deBiblioteca: biblioteca.
	
	socio1 pideRenovacionDePrestamoParaLibro: elPrincipito fechaDeRenovacion: (FixedGregorianDate yearNumber: 2025 monthNumber: 12 dayNumber: 3).
	
	Assert that: (socio1 fechaLimiteDePrestamoPara: elPrincipito) isEqualTo: (FixedGregorianDate yearNumber: 2025 monthNumber: 12 dayNumber: 4).
	
	
	
	
	
	! !

!BibliotecaTests methodsFor: 'as yet unclassified' stamp: 'JR 12/3/2025 15:34:33'!
test018_unSocioIntentaRenovarSuPrestamoPeroElLibroTieneTipoDePrestamoExtendido

	| biblioteca socio1 elPrincipito prestamoExtendido |
	
	prestamoExtendido:= PrestamoExtendido new.
	 
	biblioteca := Biblioteca new.
	
	socio1 := Socio nombreYApellido: 'Julieta Rodriguez' dni: '47260474' fechaDeRegistracion: (FixedGregorianDate yearNumber: 2025 monthNumber: 4          dayNumber:8).
	
	elPrincipito := Libro iSBN: '978-987-674-799-8'titulo: 'El Principito' autor: 'Antoine de Saint-Exupéry' fechaDePublicacion: (FixedGregorianDate yearNumber: 1943 monthNumber: 4 dayNumber:6) idioma: 'ingles' listaDeTemas: #('Amistad', 'Amor').
	
	biblioteca registrar: elPrincipito conTipoDePrestamo: prestamoExtendido .
	
	biblioteca inscribir: socio1.
	
	biblioteca agregarEjemplar: elPrincipito conFechaDeIngreso: (FixedGregorianDate yearNumber: 2025 monthNumber: 4 dayNumber:8).
	
	socio1 pedirPrestamoDeLibro: elPrincipito conFecha: (FixedGregorianDate yearNumber: 2025 monthNumber: 11 dayNumber: 20) HastaFecha: (FixedGregorianDate yearNumber: 2025 monthNumber: 12 dayNumber: 3) deBiblioteca: biblioteca.
	
	Assert should: [socio1 pideRenovacionDePrestamoParaLibro: elPrincipito fechaDeRenovacion: (FixedGregorianDate yearNumber: 2025 monthNumber: 11 dayNumber: 13)] signal: PreconditionFailure withDescription:'Este libro no permite renovacion de prestamo'
	
	
	
	
	
	! !

!BibliotecaTests methodsFor: 'as yet unclassified' stamp: 'JR 12/3/2025 15:35:43'!
test019_unSocioIntentaRenovarSuPrestamoPeroLaFechaDeVencimientoDelPrestamoExpiro

	| biblioteca socio1 elPrincipito prestamoRenovablePor1Dia |
	
	prestamoRenovablePor1Dia:= PrestamoRenovablePor1Dia new.
	 
	biblioteca := Biblioteca new.
	
	socio1 := Socio nombreYApellido: 'Julieta Rodriguez' dni: '47260474' fechaDeRegistracion: (FixedGregorianDate yearNumber: 2025 monthNumber: 4          dayNumber:8).
	
	elPrincipito := Libro iSBN: '978-987-674-799-8'titulo: 'El Principito' autor: 'Antoine de Saint-Exupéry' fechaDePublicacion: (FixedGregorianDate yearNumber: 1943 monthNumber: 4 dayNumber:6) idioma: 'ingles' listaDeTemas: #('Amistad', 'Amor').
	
	biblioteca registrar: elPrincipito conTipoDePrestamo: prestamoRenovablePor1Dia .
	
	biblioteca inscribir: socio1.
	
	biblioteca agregarEjemplar: elPrincipito conFechaDeIngreso: (FixedGregorianDate yearNumber: 2025 monthNumber: 4 dayNumber:8).
	
	socio1 pedirPrestamoDeLibro: elPrincipito conFecha: (FixedGregorianDate yearNumber: 2025 monthNumber: 11 dayNumber: 20) HastaFecha: (FixedGregorianDate yearNumber: 2025 monthNumber: 12 dayNumber: 3) deBiblioteca: biblioteca.
	
	Assert should: [socio1 pideRenovacionDePrestamoParaLibro: elPrincipito fechaDeRenovacion: (FixedGregorianDate yearNumber: 2025 monthNumber: 12 dayNumber: 4)] signal: PreconditionFailure withDescription:'Te extendiste de la fecha limite de devolucion, no podras renovar'
	
	
	
	
	
	! !

!BibliotecaTests methodsFor: 'as yet unclassified' stamp: 'JR 12/3/2025 15:35:54'!
test020_unSocioDevuelveElLibroPrestadoEnTiempo

	| biblioteca socio1 elPrincipito prestamoRenovablePor1Dia |
	
	prestamoRenovablePor1Dia:= PrestamoRenovablePor1Dia new.
	 
	biblioteca := Biblioteca new.
	
	socio1 := Socio nombreYApellido: 'Julieta Rodriguez' dni: '47260474' fechaDeRegistracion: (FixedGregorianDate yearNumber: 2025 monthNumber: 4          dayNumber:8).
	
	elPrincipito := Libro iSBN: '978-987-674-799-8'titulo: 'El Principito' autor: 'Antoine de Saint-Exupéry' fechaDePublicacion: (FixedGregorianDate yearNumber: 1943 monthNumber: 4 dayNumber:6) idioma: 'ingles' listaDeTemas: #('Amistad', 'Amor').
	
	biblioteca registrar: elPrincipito conTipoDePrestamo: prestamoRenovablePor1Dia .
	
	biblioteca inscribir: socio1.
	
	biblioteca agregarEjemplar: elPrincipito conFechaDeIngreso: (FixedGregorianDate yearNumber: 2025 monthNumber: 4 dayNumber:8).
	
	socio1 pedirPrestamoDeLibro: elPrincipito conFecha: (FixedGregorianDate yearNumber: 2025 monthNumber: 11 dayNumber: 20) HastaFecha: (FixedGregorianDate yearNumber: 2025 monthNumber: 12 dayNumber: 3) deBiblioteca: biblioteca.
	
	socio1 devolver: elPrincipito conFecha:(FixedGregorianDate yearNumber: 2025 monthNumber: 11 dayNumber: 13) aBiblioteca: biblioteca.
	
	Assert isFalse: (socio1 tienePrestamoDe: elPrincipito).
	Assert isFalse: (biblioteca presto: elPrincipito).
	
	Assert that: (elPrincipito cantidadDeEjemplares) isEqualTo: 1.
	
	
	
	
	
	! !

!BibliotecaTests methodsFor: 'as yet unclassified' stamp: 'JR 12/3/2025 15:36:03'!
test021_unSocioNoPuedeDevolverUnLibroQueNoTienePrestado

	| biblioteca socio1 elPrincipito prestamoRenovablePor1Dia lasBrujas |
	
	prestamoRenovablePor1Dia:= PrestamoRenovablePor1Dia new.
	 
	biblioteca := Biblioteca new.
	
	socio1 := Socio nombreYApellido: 'Julieta Rodriguez' dni: '47260474' fechaDeRegistracion: (FixedGregorianDate yearNumber: 2025 monthNumber: 4          dayNumber:8).
	
	elPrincipito := Libro iSBN: '978-987-674-799-8'titulo: 'El Principito' autor: 'Antoine de Saint-Exupéry' fechaDePublicacion: (FixedGregorianDate yearNumber: 1943 monthNumber: 4 dayNumber:6) idioma: 'ingles' listaDeTemas: #('Amistad', 'Amor').
	
	lasBrujas := Libro iSBN: '978014031730'titulo: 'Las Brujas' autor: 'Roal Dahl' fechaDePublicacion: (FixedGregorianDate yearNumber: 1983 monthNumber: 9 dayNumber:10) idioma: 'ingles' listaDeTemas: #('Ficcion', 'Terror').
	
	biblioteca registrar: elPrincipito conTipoDePrestamo: prestamoRenovablePor1Dia .
	
	biblioteca inscribir: socio1.
	
	biblioteca agregarEjemplar: elPrincipito conFechaDeIngreso: (FixedGregorianDate yearNumber: 2025 monthNumber: 4 dayNumber:8).
	
	socio1 pedirPrestamoDeLibro: elPrincipito conFecha: (FixedGregorianDate yearNumber: 2025 monthNumber: 11 dayNumber: 20) HastaFecha: (FixedGregorianDate yearNumber: 2025 monthNumber: 12 dayNumber: 3) deBiblioteca: biblioteca.
	
	
	Assert should: [socio1 devolver: lasBrujas conFecha: (FixedGregorianDate yearNumber: 2025 monthNumber: 11 dayNumber: 13) aBiblioteca: biblioteca .]	 signal: PreconditionFailure withDescription: 'No tiene ese libro prestado'.
	
	
	
	
	
	! !

!BibliotecaTests methodsFor: 'as yet unclassified' stamp: 'JR 12/3/2025 15:36:35'!
test022_unSocioDevuelveElLibroPrestadoFueraDeTiempoYDebeSerSancionado

	| biblioteca socio1 elPrincipito prestamoRenovablePor1Dia |
	
	prestamoRenovablePor1Dia:= PrestamoRenovablePor1Dia new.
	 
	biblioteca := Biblioteca new.
	
	socio1 := Socio nombreYApellido: 'Julieta Rodriguez' dni: '47260474' fechaDeRegistracion: (FixedGregorianDate yearNumber: 2025 monthNumber: 4          dayNumber:8).
	
	elPrincipito := Libro iSBN: '978-987-674-799-8'titulo: 'El Principito' autor: 'Antoine de Saint-Exupéry' fechaDePublicacion: (FixedGregorianDate yearNumber: 1943 monthNumber: 4 dayNumber:6) idioma: 'ingles' listaDeTemas: #('Amistad', 'Amor').
	
	biblioteca registrar: elPrincipito conTipoDePrestamo: prestamoRenovablePor1Dia .
	
	biblioteca inscribir: socio1.
	
	biblioteca agregarEjemplar: elPrincipito conFechaDeIngreso: (FixedGregorianDate yearNumber: 2025 monthNumber: 4 dayNumber:8).
	
	socio1 pedirPrestamoDeLibro: elPrincipito conFecha: (FixedGregorianDate yearNumber: 2025 monthNumber: 11 dayNumber: 20) HastaFecha: (FixedGregorianDate yearNumber: 2025 monthNumber: 12 dayNumber: 3) deBiblioteca: biblioteca.
	
	socio1 devolver: elPrincipito conFecha:(FixedGregorianDate yearNumber: 2025 monthNumber: 12 dayNumber: 14) aBiblioteca: biblioteca.
	
	Assert that: socio1 sanciones isEqualTo: 1.
	
	
	
	
	
	! !

!BibliotecaTests methodsFor: 'as yet unclassified' stamp: 'JR 12/3/2025 15:38:36'!
test023_unSocioDevuelveElLibroPrestadoFueraDeTiempoMasDeTresVecesPorLoTantoEsVetadoDePorVida

	| biblioteca socio1 elPrincipito prestamoRenovablePor1Dia harryPotter percyJackson sherlockHolmes |
	
	prestamoRenovablePor1Dia:= PrestamoRenovablePor1Dia new.
	 
	biblioteca := Biblioteca new.
	
	socio1 := Socio nombreYApellido: 'Julieta Rodriguez' dni: '47260474' fechaDeRegistracion: (FixedGregorianDate yearNumber: 2025 monthNumber: 4          dayNumber:8).
	
	elPrincipito := Libro iSBN: '978-987-674-799-8'titulo: 'El Principito' autor: 'Antoine de Saint-Exupéry' fechaDePublicacion: (FixedGregorianDate yearNumber: 1943 monthNumber: 4 dayNumber:6) idioma: 'ingles' listaDeTemas: #('Amistad', 'Amor').
	
	harryPotter := Libro iSBN: '978-84-7888-445-2'titulo: 'Harry Potter' autor: 'Jk Rowling' fechaDePublicacion: (FixedGregorianDate yearNumber: 1997 monthNumber: 6 dayNumber:26) idioma: 'ingles' listaDeTemas: #('Fantasia', 'Amistad').
	
	sherlockHolmes := Libro iSBN: '1-85326-896-8'titulo: 'Un estudio en Escarlata' autor: 'Arthur Ignatius Conan Doyle' fechaDePublicacion: (FixedGregorianDate yearNumber: 1892 monthNumber: 10 dayNumber:14) idioma: 'ingles' listaDeTemas: #('Policial', 'Misterio').
	
	percyJackson := Libro iSBN: '0-6868-7865-5'titulo: 'El Ladron del rayo' autor: 'Rick Riordan' fechaDePublicacion: (FixedGregorianDate yearNumber: 2010 monthNumber: 1 dayNumber:18) idioma: 'ingles' listaDeTemas: #('Fantasia', 'Amistad').
	
	biblioteca registrar: elPrincipito conTipoDePrestamo: prestamoRenovablePor1Dia .
	biblioteca registrar: harryPotter conTipoDePrestamo: prestamoRenovablePor1Dia .
	biblioteca registrar: sherlockHolmes conTipoDePrestamo: prestamoRenovablePor1Dia .
	biblioteca registrar: percyJackson conTipoDePrestamo: prestamoRenovablePor1Dia . 
	
	biblioteca inscribir: socio1.
	
	biblioteca agregarEjemplar: elPrincipito conFechaDeIngreso: (FixedGregorianDate yearNumber: 2025 monthNumber: 4 dayNumber:8).
	biblioteca agregarEjemplar: harryPotter conFechaDeIngreso: (FixedGregorianDate yearNumber: 2025 monthNumber: 4 dayNumber:8).
	biblioteca agregarEjemplar: sherlockHolmes conFechaDeIngreso: (FixedGregorianDate yearNumber: 2025 monthNumber: 4 dayNumber:8).
	biblioteca agregarEjemplar: percyJackson conFechaDeIngreso: (FixedGregorianDate yearNumber: 2025 monthNumber: 4 dayNumber:8).
	
	socio1 pedirPrestamoDeLibro: elPrincipito conFecha: (FixedGregorianDate yearNumber: 2025 monthNumber: 11 dayNumber: 20) HastaFecha: (FixedGregorianDate yearNumber: 2025 monthNumber: 12 dayNumber: 3) deBiblioteca: biblioteca.
	
	socio1 pedirPrestamoDeLibro: harryPotter conFecha: (FixedGregorianDate yearNumber: 2025 monthNumber: 11 dayNumber: 20) HastaFecha: (FixedGregorianDate yearNumber: 2025 monthNumber: 12 dayNumber: 3) deBiblioteca: biblioteca.
	
	socio1 pedirPrestamoDeLibro: sherlockHolmes conFecha: (FixedGregorianDate yearNumber: 2025 monthNumber: 11 dayNumber: 20) HastaFecha: (FixedGregorianDate yearNumber: 2025 monthNumber: 12 dayNumber: 3) deBiblioteca: biblioteca.
	
	socio1 pedirPrestamoDeLibro: percyJackson conFecha: (FixedGregorianDate yearNumber: 2025 monthNumber: 11 dayNumber: 20) HastaFecha: (FixedGregorianDate yearNumber: 2025 monthNumber: 12 dayNumber: 3) deBiblioteca: biblioteca.
	
	socio1 devolver: elPrincipito conFecha:(FixedGregorianDate yearNumber: 2026 monthNumber: 12 dayNumber: 4) aBiblioteca: biblioteca.
	socio1 devolver: harryPotter conFecha:(FixedGregorianDate yearNumber: 2026 monthNumber: 12 dayNumber: 4) aBiblioteca: biblioteca.
	socio1 devolver: sherlockHolmes conFecha:(FixedGregorianDate yearNumber: 2026 monthNumber: 12 dayNumber: 4) aBiblioteca: biblioteca.
	socio1 devolver: percyJackson conFecha:(FixedGregorianDate yearNumber: 2026 monthNumber: 12 dayNumber: 4) aBiblioteca: biblioteca.
	
	Assert isTrue: socio1 estaVetado. 
	
	
	
	
	
	! !

!BibliotecaTests methodsFor: 'as yet unclassified' stamp: 'JR 12/3/2025 15:39:42'!
test024_unSocioNoPuedePedirUnPrestamoSiEstaVetado

	| biblioteca socio1 elPrincipito prestamoRenovablePor1Dia harryPotter percyJackson sherlockHolmes |
	
	prestamoRenovablePor1Dia:= PrestamoRenovablePor1Dia new.
	 
	biblioteca := Biblioteca new.
	
	socio1 := Socio nombreYApellido: 'Julieta Rodriguez' dni: '47260474' fechaDeRegistracion: (FixedGregorianDate yearNumber: 2025 monthNumber: 4          dayNumber:8).
	
	elPrincipito := Libro iSBN: '978-987-674-799-8'titulo: 'El Principito' autor: 'Antoine de Saint-Exupéry' fechaDePublicacion: (FixedGregorianDate yearNumber: 1943 monthNumber: 4 dayNumber:6) idioma: 'ingles' listaDeTemas: #('Amistad', 'Amor').
	
	harryPotter := Libro iSBN: '978-84-7888-445-2'titulo: 'Harry Potter' autor: 'Jk Rowling' fechaDePublicacion: (FixedGregorianDate yearNumber: 1997 monthNumber: 6 dayNumber:26) idioma: 'ingles' listaDeTemas: #('Fantasia', 'Amistad').
	
	sherlockHolmes := Libro iSBN: '1-85326-896-8'titulo: 'Un estudio en Escarlata' autor: 'Arthur Ignatius Conan Doyle' fechaDePublicacion: (FixedGregorianDate yearNumber: 1892 monthNumber: 10 dayNumber:14) idioma: 'ingles' listaDeTemas: #('Policial', 'Misterio').
	
	percyJackson := Libro iSBN: '0-6868-7865-5'titulo: 'El Ladron del rayo' autor: 'Rick Riordan' fechaDePublicacion: (FixedGregorianDate yearNumber: 2010 monthNumber: 1 dayNumber:18) idioma: 'ingles' listaDeTemas: #('Fantasia', 'Amistad').
	
	biblioteca registrar: elPrincipito conTipoDePrestamo: prestamoRenovablePor1Dia .
	biblioteca registrar: harryPotter conTipoDePrestamo: prestamoRenovablePor1Dia .
	biblioteca registrar: sherlockHolmes conTipoDePrestamo: prestamoRenovablePor1Dia .
	biblioteca registrar: percyJackson conTipoDePrestamo: prestamoRenovablePor1Dia . 
	
	biblioteca inscribir: socio1.
	
	biblioteca agregarEjemplar: elPrincipito conFechaDeIngreso: (FixedGregorianDate yearNumber: 2025 monthNumber: 4 dayNumber:8).
	biblioteca agregarEjemplar: harryPotter conFechaDeIngreso: (FixedGregorianDate yearNumber: 2025 monthNumber: 4 dayNumber:8).
	biblioteca agregarEjemplar: sherlockHolmes conFechaDeIngreso: (FixedGregorianDate yearNumber: 2025 monthNumber: 4 dayNumber:8).
	biblioteca agregarEjemplar: percyJackson conFechaDeIngreso: (FixedGregorianDate yearNumber: 2025 monthNumber: 4 dayNumber:8).
	
	socio1 pedirPrestamoDeLibro: elPrincipito conFecha: (FixedGregorianDate yearNumber: 2025 monthNumber: 11 dayNumber: 20) HastaFecha: (FixedGregorianDate yearNumber: 2025 monthNumber: 12 dayNumber: 3) deBiblioteca: biblioteca.
	
	socio1 pedirPrestamoDeLibro: harryPotter conFecha: (FixedGregorianDate yearNumber: 2025 monthNumber: 11 dayNumber: 20) HastaFecha: (FixedGregorianDate yearNumber: 2025 monthNumber: 12 dayNumber: 3) deBiblioteca: biblioteca.
	
	socio1 pedirPrestamoDeLibro: sherlockHolmes conFecha: (FixedGregorianDate yearNumber: 2025 monthNumber: 11 dayNumber: 20) HastaFecha: (FixedGregorianDate yearNumber: 2025 monthNumber: 12 dayNumber: 3) deBiblioteca: biblioteca.
	
	socio1 pedirPrestamoDeLibro: percyJackson conFecha: (FixedGregorianDate yearNumber: 2025 monthNumber: 11 dayNumber: 20) HastaFecha: (FixedGregorianDate yearNumber: 2025 monthNumber: 12 dayNumber: 3) deBiblioteca: biblioteca.
	
	socio1 devolver: elPrincipito conFecha:(FixedGregorianDate yearNumber: 2026 monthNumber: 12 dayNumber: 4) aBiblioteca: biblioteca.
	socio1 devolver: harryPotter conFecha:(FixedGregorianDate yearNumber: 2026 monthNumber: 12 dayNumber: 4) aBiblioteca: biblioteca.
	socio1 devolver: sherlockHolmes conFecha:(FixedGregorianDate yearNumber: 2026 monthNumber: 12 dayNumber: 4) aBiblioteca: biblioteca.
	socio1 devolver: percyJackson conFecha:(FixedGregorianDate yearNumber: 2026 monthNumber: 12 dayNumber: 4) aBiblioteca: biblioteca.
	
	Assert should: [socio1 pedirPrestamoDeLibro: percyJackson conFecha: (FixedGregorianDate yearNumber: 2025 monthNumber: 11 dayNumber: 20) HastaFecha: (FixedGregorianDate yearNumber: 2025 monthNumber: 12 dayNumber: 5) deBiblioteca: biblioteca.] signal: PreconditionFailure withDescription: 'El socio esta vetado'
	
	
	
	
	
	! !

!BibliotecaTests methodsFor: 'as yet unclassified' stamp: 'JR 11/30/2025 16:50:52'!
test025_laBibliotecaNoPuedeAgregarEjemplaresSiEstaCerrada

	| biblioteca elPrincipito prestamoRenovablePor1Dia |
	
	prestamoRenovablePor1Dia:= PrestamoRenovablePor1Dia new.
	 
	biblioteca := Biblioteca new.
	
	elPrincipito := Libro iSBN: '978-987-674-799-8'titulo: 'El Principito' autor: 'Antoine de Saint-Exupéry' fechaDePublicacion: (FixedGregorianDate yearNumber: 1943 monthNumber: 4 dayNumber:6) idioma: 'ingles' listaDeTemas: #('Amistad', 'Amor').
	
	biblioteca registrar: elPrincipito conTipoDePrestamo: prestamoRenovablePor1Dia .
	
	Assert should: [biblioteca agregarEjemplar: elPrincipito conFechaDeIngreso: (FixedGregorianDate yearNumber: 2025 monthNumber: 11 dayNumber:30).] signal: PreconditionFailure withDescription: 'La biblioteca esta cerrada'.
	
	
	
	
	
	! !

!BibliotecaTests methodsFor: 'as yet unclassified' stamp: 'JR 11/30/2025 17:03:47'!
test026_laBibliotecaNoPuedeIncribirAUnSocioEnFinDeSemana

	| biblioteca socio1 |
	
	biblioteca := Biblioteca new.
	
	socio1 := Socio nombreYApellido: 'Julieta Rodriguez' dni: '47260474' fechaDeRegistracion: (FixedGregorianDate yearNumber: 2024 monthNumber: 11 dayNumber:2).
	
	Assert should: [biblioteca inscribir: socio1] signal: PreconditionFailure withDescription: 'Solo pueden inscribirse cuando la biblioteca esta abierta'.
	! !

!BibliotecaTests methodsFor: 'as yet unclassified' stamp: 'JR 12/3/2025 15:40:48'!
test027_unSocioNoPuedePedirUnPrestamoSiEstaVetado

	| biblioteca socio1 elPrincipito prestamoRenovablePor1Dia harryPotter percyJackson sherlockHolmes socio2 |
	
	prestamoRenovablePor1Dia:= PrestamoRenovablePor1Dia new.
	 
	biblioteca := Biblioteca new.
	
	socio1 := Socio nombreYApellido: 'Julieta Rodriguez' dni: '47260474' fechaDeRegistracion: (FixedGregorianDate yearNumber: 2025 monthNumber: 4          dayNumber:8).
	
	socio2 := Socio nombreYApellido: 'Francisco Demartino' dni: '44958916' fechaDeRegistracion: (FixedGregorianDate yearNumber: 2025 monthNumber: 4 dayNumber:8).
	
	elPrincipito := Libro iSBN: '978-987-674-799-8'titulo: 'El Principito' autor: 'Antoine de Saint-Exupéry' fechaDePublicacion: (FixedGregorianDate yearNumber: 1943 monthNumber: 4 dayNumber:6) idioma: 'ingles' listaDeTemas: #('Amistad', 'Amor').
	
	harryPotter := Libro iSBN: '978-84-7888-445-2'titulo: 'Harry Potter' autor: 'Jk Rowling' fechaDePublicacion: (FixedGregorianDate yearNumber: 1997 monthNumber: 6 dayNumber:26) idioma: 'ingles' listaDeTemas: #('Fantasia', 'Amistad').
	
	sherlockHolmes := Libro iSBN: '1-85326-896-8'titulo: 'Un estudio en Escarlata' autor: 'Arthur Ignatius Conan Doyle' fechaDePublicacion: (FixedGregorianDate yearNumber: 1892 monthNumber: 10 dayNumber:14) idioma: 'ingles' listaDeTemas: #('Policial', 'Misterio').
	
	percyJackson := Libro iSBN: '0-6868-7865-5'titulo: 'El Ladron del rayo' autor: 'Rick Riordan' fechaDePublicacion: (FixedGregorianDate yearNumber: 2010 monthNumber: 1 dayNumber:18) idioma: 'ingles' listaDeTemas: #('Fantasia', 'Amistad').
	
	biblioteca registrar: elPrincipito conTipoDePrestamo: prestamoRenovablePor1Dia .
	biblioteca registrar: harryPotter conTipoDePrestamo: prestamoRenovablePor1Dia .
	biblioteca registrar: sherlockHolmes conTipoDePrestamo: prestamoRenovablePor1Dia .
	biblioteca registrar: percyJackson conTipoDePrestamo: prestamoRenovablePor1Dia . 
	
	biblioteca inscribir: socio1.
	
	biblioteca inscribir: socio2.
	
	biblioteca agregarEjemplar: elPrincipito conFechaDeIngreso: (FixedGregorianDate yearNumber: 2025 monthNumber: 4 dayNumber:8).
	biblioteca agregarEjemplar: harryPotter conFechaDeIngreso: (FixedGregorianDate yearNumber: 2025 monthNumber: 4 dayNumber:8).
	biblioteca agregarEjemplar: sherlockHolmes conFechaDeIngreso: (FixedGregorianDate yearNumber: 2025 monthNumber: 4 dayNumber:8).
	biblioteca agregarEjemplar: percyJackson conFechaDeIngreso: (FixedGregorianDate yearNumber: 2025 monthNumber: 4 dayNumber:8).
	
	socio1 pedirPrestamoDeLibro: elPrincipito conFecha: (FixedGregorianDate yearNumber: 2025 monthNumber: 11 dayNumber: 20) HastaFecha: (FixedGregorianDate yearNumber: 2025 monthNumber: 12 dayNumber: 3) deBiblioteca: biblioteca.
	
	socio1 pedirPrestamoDeLibro: harryPotter conFecha: (FixedGregorianDate yearNumber: 2025 monthNumber: 11 dayNumber: 20) HastaFecha: (FixedGregorianDate yearNumber: 2025 monthNumber: 12 dayNumber: 3) deBiblioteca: biblioteca.
	
	socio1 pedirPrestamoDeLibro: sherlockHolmes conFecha: (FixedGregorianDate yearNumber: 2025 monthNumber: 11 dayNumber: 20) HastaFecha: (FixedGregorianDate yearNumber: 2025 monthNumber: 12 dayNumber: 3) deBiblioteca: biblioteca.
	
	socio1 pedirPrestamoDeLibro: percyJackson conFecha: (FixedGregorianDate yearNumber: 2025 monthNumber: 11 dayNumber: 20) HastaFecha: (FixedGregorianDate yearNumber: 2025 monthNumber: 12 dayNumber: 3) deBiblioteca: biblioteca.
	
	socio1 devolver: elPrincipito conFecha:(FixedGregorianDate yearNumber: 2026 monthNumber: 12 dayNumber: 4) aBiblioteca: biblioteca.
	socio1 devolver: harryPotter conFecha:(FixedGregorianDate yearNumber: 2026 monthNumber: 12 dayNumber: 4) aBiblioteca: biblioteca.
	socio1 devolver: sherlockHolmes conFecha:(FixedGregorianDate yearNumber: 2026 monthNumber: 12 dayNumber: 4) aBiblioteca: biblioteca.
	socio1 devolver: percyJackson conFecha:(FixedGregorianDate yearNumber: 2026 monthNumber: 12 dayNumber: 4) aBiblioteca: biblioteca.
	
	Assert should: [socio1 pedirPrestamoDeLibro: percyJackson conFecha: (FixedGregorianDate yearNumber: 2025 monthNumber: 11 dayNumber: 20) HastaFecha: (FixedGregorianDate yearNumber: 2025 monthNumber: 12 dayNumber: 5) deBiblioteca: biblioteca.] signal: PreconditionFailure withDescription: 'El socio esta vetado'
	
	
	
	
	
	! !

!BibliotecaTests methodsFor: 'as yet unclassified' stamp: 'JR 12/3/2025 15:42:20'!
test028_laBibliotecaConoceLosSociosSancionados

	| biblioteca socio1 elPrincipito prestamoRenovablePor1Dia socio2 |
	
	prestamoRenovablePor1Dia:= PrestamoRenovablePor1Dia new.
	 
	biblioteca := Biblioteca new.
	
	socio1 := Socio nombreYApellido: 'Julieta Rodriguez' dni: '47260474' fechaDeRegistracion: (FixedGregorianDate yearNumber: 2025 monthNumber: 4          dayNumber:8).
	
	socio2 := Socio nombreYApellido: 'Francisco Demartino' dni: '44958916' fechaDeRegistracion: (FixedGregorianDate yearNumber: 2025 monthNumber: 4 dayNumber:8).
	
	elPrincipito := Libro iSBN: '978-987-674-799-8'titulo: 'El Principito' autor: 'Antoine de Saint-Exupéry' fechaDePublicacion: (FixedGregorianDate yearNumber: 1943 monthNumber: 4 dayNumber:6) idioma: 'ingles' listaDeTemas: #('Amistad', 'Amor').
	
	biblioteca registrar: elPrincipito conTipoDePrestamo: prestamoRenovablePor1Dia .
	
	biblioteca inscribir: socio1.
	
	biblioteca inscribir: socio2.
	
	biblioteca agregarEjemplar: elPrincipito conFechaDeIngreso: (FixedGregorianDate yearNumber: 2025 monthNumber: 4 dayNumber:8).
	
	biblioteca agregarEjemplar: elPrincipito conFechaDeIngreso: (FixedGregorianDate yearNumber: 2025 monthNumber: 4 dayNumber:8).
	
	socio1 pedirPrestamoDeLibro: elPrincipito conFecha: (FixedGregorianDate yearNumber: 2025 monthNumber: 11 dayNumber: 20) HastaFecha: (FixedGregorianDate yearNumber: 2025 monthNumber: 12 dayNumber: 3) deBiblioteca: biblioteca.
	
	socio2 pedirPrestamoDeLibro: elPrincipito conFecha: (FixedGregorianDate yearNumber: 2025 monthNumber: 11 dayNumber: 20) HastaFecha: (FixedGregorianDate yearNumber: 2025 monthNumber: 12 dayNumber: 3) deBiblioteca: biblioteca.
	
	socio1 devolver: elPrincipito conFecha:(FixedGregorianDate yearNumber: 2026 monthNumber: 12 dayNumber: 14) aBiblioteca: biblioteca.
	
	socio2 devolver: elPrincipito conFecha:(FixedGregorianDate yearNumber: 2026 monthNumber: 12 dayNumber: 14) aBiblioteca: biblioteca.
	
	Assert isTrue: (biblioteca sociosSancionados includes: socio1).
	Assert isTrue: (biblioteca sociosSancionados includes: socio2).
	Assert that: (biblioteca cantidadDeSociosSancionados) isEqualTo: 2.
	
	
	
	
	
	
	
	! !

!BibliotecaTests methodsFor: 'as yet unclassified' stamp: 'JR 12/3/2025 15:43:50'!
test029_unSocioNoPuedeRenovarSuMembresiaSiEstaVetado

	| biblioteca socio1 elPrincipito prestamoRenovablePor1Dia harryPotter percyJackson sherlockHolmes socio2 |
	
	prestamoRenovablePor1Dia:= PrestamoRenovablePor1Dia new.
	 
	biblioteca := Biblioteca new.
	
	socio1 := Socio nombreYApellido: 'Julieta Rodriguez' dni: '47260474' fechaDeRegistracion: (FixedGregorianDate yearNumber: 2025 monthNumber: 4          dayNumber:8).
	
	socio2 := Socio nombreYApellido: 'Francisco Demartino' dni: '44958916' fechaDeRegistracion: (FixedGregorianDate yearNumber: 2025 monthNumber: 4 dayNumber:8).
	
	elPrincipito := Libro iSBN: '978-987-674-799-8'titulo: 'El Principito' autor: 'Antoine de Saint-Exupéry' fechaDePublicacion: (FixedGregorianDate yearNumber: 1943 monthNumber: 4 dayNumber:6) idioma: 'ingles' listaDeTemas: #('Amistad', 'Amor').
	
	harryPotter := Libro iSBN: '978-84-7888-445-2'titulo: 'Harry Potter' autor: 'Jk Rowling' fechaDePublicacion: (FixedGregorianDate yearNumber: 1997 monthNumber: 6 dayNumber:26) idioma: 'ingles' listaDeTemas: #('Fantasia', 'Amistad').
	
	sherlockHolmes := Libro iSBN: '1-85326-896-8'titulo: 'Un estudio en Escarlata' autor: 'Arthur Ignatius Conan Doyle' fechaDePublicacion: (FixedGregorianDate yearNumber: 1892 monthNumber: 10 dayNumber:14) idioma: 'ingles' listaDeTemas: #('Policial', 'Misterio').
	
	percyJackson := Libro iSBN: '0-6868-7865-5'titulo: 'El Ladron del rayo' autor: 'Rick Riordan' fechaDePublicacion: (FixedGregorianDate yearNumber: 2010 monthNumber: 1 dayNumber:18) idioma: 'ingles' listaDeTemas: #('Fantasia', 'Amistad').
	
	biblioteca registrar: elPrincipito conTipoDePrestamo: prestamoRenovablePor1Dia .
	biblioteca registrar: harryPotter conTipoDePrestamo: prestamoRenovablePor1Dia .
	biblioteca registrar: sherlockHolmes conTipoDePrestamo: prestamoRenovablePor1Dia .
	biblioteca registrar: percyJackson conTipoDePrestamo: prestamoRenovablePor1Dia . 
	
	biblioteca inscribir: socio1.
	
	biblioteca inscribir: socio2.
	
	biblioteca agregarEjemplar: elPrincipito conFechaDeIngreso: (FixedGregorianDate yearNumber: 2025 monthNumber: 4 dayNumber:8).
	biblioteca agregarEjemplar: harryPotter conFechaDeIngreso: (FixedGregorianDate yearNumber: 2025 monthNumber: 4 dayNumber:8).
	biblioteca agregarEjemplar: sherlockHolmes conFechaDeIngreso: (FixedGregorianDate yearNumber: 2025 monthNumber: 4 dayNumber:8).
	biblioteca agregarEjemplar: percyJackson conFechaDeIngreso: (FixedGregorianDate yearNumber: 2025 monthNumber: 4 dayNumber:8).
	
	socio1 pedirPrestamoDeLibro: elPrincipito conFecha: (FixedGregorianDate yearNumber: 2025 monthNumber: 11 dayNumber: 20) HastaFecha: (FixedGregorianDate yearNumber: 2025 monthNumber: 12 dayNumber: 3) deBiblioteca: biblioteca.
	
	socio1 pedirPrestamoDeLibro: harryPotter conFecha: (FixedGregorianDate yearNumber: 2025 monthNumber: 11 dayNumber: 20) HastaFecha: (FixedGregorianDate yearNumber: 2025 monthNumber: 12 dayNumber: 3) deBiblioteca: biblioteca.
	
	socio1 pedirPrestamoDeLibro: sherlockHolmes conFecha: (FixedGregorianDate yearNumber: 2025 monthNumber: 11 dayNumber: 20) HastaFecha: (FixedGregorianDate yearNumber: 2025 monthNumber: 12 dayNumber: 3) deBiblioteca: biblioteca.
	
	socio1 pedirPrestamoDeLibro: percyJackson conFecha: (FixedGregorianDate yearNumber: 2025 monthNumber: 11 dayNumber: 20) HastaFecha: (FixedGregorianDate yearNumber: 2025 monthNumber: 12 dayNumber: 3) deBiblioteca: biblioteca.
	
	socio1 devolver: elPrincipito conFecha:(FixedGregorianDate yearNumber: 2026 monthNumber: 12 dayNumber: 4) aBiblioteca: biblioteca.
	socio1 devolver: harryPotter conFecha:(FixedGregorianDate yearNumber: 2026 monthNumber: 12 dayNumber: 4) aBiblioteca: biblioteca.
	socio1 devolver: sherlockHolmes conFecha:(FixedGregorianDate yearNumber: 2026 monthNumber: 12 dayNumber: 4) aBiblioteca: biblioteca.
	socio1 devolver: percyJackson conFecha:(FixedGregorianDate yearNumber: 2026 monthNumber: 12 dayNumber: 4) aBiblioteca: biblioteca.
	
	Assert should: [socio1 renovarMembresia] signal: PreconditionFailure withDescription: 'El socio esta vetado'
	
	
	
	
	
	! !

!BibliotecaTests methodsFor: 'as yet unclassified' stamp: 'JR 12/3/2025 15:44:09'!
test030_unSocioNoPuedeRegistrarseConSuDniSiEstaVetado

	| biblioteca socio1 elPrincipito prestamoRenovablePor1Dia harryPotter percyJackson sherlockHolmes socio2 |
	
	prestamoRenovablePor1Dia:= PrestamoRenovablePor1Dia new.
	 
	biblioteca := Biblioteca new.
	
	socio1 := Socio nombreYApellido: 'Julieta Rodriguez' dni: '47260474' fechaDeRegistracion: (FixedGregorianDate yearNumber: 2025 monthNumber: 4          dayNumber:8).
	
	socio2 := Socio nombreYApellido: 'Micaela Rodriguez' dni: '47260474' fechaDeRegistracion: (FixedGregorianDate yearNumber: 2025 monthNumber: 4 dayNumber:8).
	
	elPrincipito := Libro iSBN: '978-987-674-799-8'titulo: 'El Principito' autor: 'Antoine de Saint-Exupéry' fechaDePublicacion: (FixedGregorianDate yearNumber: 1943 monthNumber: 4 dayNumber:6) idioma: 'ingles' listaDeTemas: #('Amistad', 'Amor').
	
	harryPotter := Libro iSBN: '978-84-7888-445-2'titulo: 'Harry Potter' autor: 'Jk Rowling' fechaDePublicacion: (FixedGregorianDate yearNumber: 1997 monthNumber: 6 dayNumber:26) idioma: 'ingles' listaDeTemas: #('Fantasia', 'Amistad').
	
	sherlockHolmes := Libro iSBN: '1-85326-896-8'titulo: 'Un estudio en Escarlata' autor: 'Arthur Ignatius Conan Doyle' fechaDePublicacion: (FixedGregorianDate yearNumber: 1892 monthNumber: 10 dayNumber:14) idioma: 'ingles' listaDeTemas: #('Policial', 'Misterio').
	
	percyJackson := Libro iSBN: '0-6868-7865-5'titulo: 'El Ladron del rayo' autor: 'Rick Riordan' fechaDePublicacion: (FixedGregorianDate yearNumber: 2010 monthNumber: 1 dayNumber:18) idioma: 'ingles' listaDeTemas: #('Fantasia', 'Amistad').
	
	biblioteca registrar: elPrincipito conTipoDePrestamo: prestamoRenovablePor1Dia .
	
	biblioteca registrar: harryPotter conTipoDePrestamo: prestamoRenovablePor1Dia .
	
	biblioteca registrar: sherlockHolmes conTipoDePrestamo: prestamoRenovablePor1Dia .
	
	biblioteca registrar: percyJackson conTipoDePrestamo: prestamoRenovablePor1Dia . 
	
	biblioteca inscribir: socio1.
	
	biblioteca agregarEjemplar: elPrincipito conFechaDeIngreso: (FixedGregorianDate yearNumber: 2025 monthNumber: 4 dayNumber:8).
	
	biblioteca agregarEjemplar: harryPotter conFechaDeIngreso: (FixedGregorianDate yearNumber: 2025 monthNumber: 4 dayNumber:8).
	
	biblioteca agregarEjemplar: sherlockHolmes conFechaDeIngreso: (FixedGregorianDate yearNumber: 2025 monthNumber: 4 dayNumber:8).
	
	biblioteca agregarEjemplar: percyJackson conFechaDeIngreso: (FixedGregorianDate yearNumber: 2025 monthNumber: 4 dayNumber:8).
	
	socio1 pedirPrestamoDeLibro: elPrincipito conFecha: (FixedGregorianDate yearNumber: 2025 monthNumber: 11 dayNumber: 20) HastaFecha: (FixedGregorianDate yearNumber: 2025 monthNumber: 12 dayNumber: 3) deBiblioteca: biblioteca.
	
	socio1 pedirPrestamoDeLibro: harryPotter conFecha: (FixedGregorianDate yearNumber: 2025 monthNumber: 11 dayNumber: 20) HastaFecha: (FixedGregorianDate yearNumber: 2025 monthNumber: 12 dayNumber: 3) deBiblioteca: biblioteca.
	
	socio1 pedirPrestamoDeLibro: sherlockHolmes conFecha: (FixedGregorianDate yearNumber: 2025 monthNumber: 11 dayNumber: 20) HastaFecha: (FixedGregorianDate yearNumber: 2025 monthNumber: 12 dayNumber: 3) deBiblioteca: biblioteca.
	
	socio1 pedirPrestamoDeLibro: percyJackson conFecha: (FixedGregorianDate yearNumber: 2025 monthNumber: 11 dayNumber: 20) HastaFecha: (FixedGregorianDate yearNumber: 2025 monthNumber: 12 dayNumber: 3) deBiblioteca: biblioteca.
	
	socio1 devolver: elPrincipito conFecha:(FixedGregorianDate yearNumber: 2026 monthNumber: 12 dayNumber: 4) aBiblioteca: biblioteca.
	socio1 devolver: harryPotter conFecha:(FixedGregorianDate yearNumber: 2026 monthNumber: 12 dayNumber: 4) aBiblioteca: biblioteca.
	socio1 devolver: sherlockHolmes conFecha:(FixedGregorianDate yearNumber: 2026 monthNumber: 12 dayNumber: 4) aBiblioteca: biblioteca.
	socio1 devolver: percyJackson conFecha:(FixedGregorianDate yearNumber: 2026 monthNumber: 12 dayNumber: 4) aBiblioteca: biblioteca.
	
	Assert should: [biblioteca inscribir: socio2] signal: PreconditionFailure withDescription: 'El socio esta vetado'.
	
	
	
	
	
	! !

!BibliotecaTests methodsFor: 'as yet unclassified' stamp: 'JR 11/30/2025 17:42:49'!
test031_laBibliotecaConoceLosSociosSolidarios

	| biblioteca socio1 socio2 |
	 
	biblioteca := Biblioteca new.
	
	socio1 := Socio nombreYApellido: 'Julieta Rodriguez' dni: '47260474' fechaDeRegistracion: (FixedGregorianDate yearNumber: 2025 monthNumber: 4          dayNumber:8).
	
	socio2 := Socio nombreYApellido: 'Francisco Demartino' dni: '44958916' fechaDeRegistracion: (FixedGregorianDate yearNumber: 2025 monthNumber: 4 dayNumber:8).
	
	biblioteca inscribir: socio1.
	
	biblioteca inscribir: socio2.
	
	Assert isTrue: (biblioteca sociosSolidarios includes: socio1).
	Assert isTrue: (biblioteca sociosSolidarios includes: socio2).
	Assert that: (biblioteca cantidadDeSociosSolidarios) isEqualTo: 2.
	
	
	
	
	
	
	
	! !

!BibliotecaTests methodsFor: 'as yet unclassified' stamp: 'JR 12/3/2025 15:44:35'!
test032_laBibliotecaConoceLaCantidadDeEjemplaresDisponiblesYPrestados

	| biblioteca socio1 elPrincipito prestamoRenovablePor1Dia |
	
	prestamoRenovablePor1Dia:= PrestamoRenovablePor1Dia new.
	 
	biblioteca := Biblioteca new.
	
	socio1 := Socio nombreYApellido: 'Julieta Rodriguez' dni: '47260474' fechaDeRegistracion: (FixedGregorianDate yearNumber: 2025 monthNumber: 4          dayNumber:8).
	
	elPrincipito := Libro iSBN: '978-987-674-799-8'titulo: 'El Principito' autor: 'Antoine de Saint-Exupéry' fechaDePublicacion: (FixedGregorianDate yearNumber: 1943 monthNumber: 4 dayNumber:6) idioma: 'ingles' listaDeTemas: #('Amistad', 'Amor').
	
	biblioteca registrar: elPrincipito conTipoDePrestamo: prestamoRenovablePor1Dia .
	
	biblioteca inscribir: socio1.
	
	biblioteca agregarEjemplar: elPrincipito conFechaDeIngreso: (FixedGregorianDate yearNumber: 2025 monthNumber: 4 dayNumber:8).
	biblioteca agregarEjemplar: elPrincipito conFechaDeIngreso: (FixedGregorianDate yearNumber: 2025 monthNumber: 4 dayNumber:8).

	socio1 pedirPrestamoDeLibro: elPrincipito conFecha: (FixedGregorianDate yearNumber: 2025 monthNumber: 11 dayNumber: 20) HastaFecha: (FixedGregorianDate yearNumber: 2025 monthNumber: 12 dayNumber: 3) deBiblioteca: biblioteca.
	
	Assert that: biblioteca cantidadDeEjemplaresPrestados isEqualTo: 1.
	Assert that: biblioteca cantidadDeEjemplaresDisponibles isEqualTo: 1.
	
	
	
	
	
	! !

!BibliotecaTests methodsFor: 'as yet unclassified' stamp: 'JR 12/3/2025 15:45:29'!
test033_laBibliotecaConoceLosSociosQueRealizaronAlMenosUnPrestamo

	| biblioteca socio1 elPrincipito prestamoRenovablePor1Dia socio2 |
	
	prestamoRenovablePor1Dia:= PrestamoRenovablePor1Dia new.
	 
	biblioteca := Biblioteca new.
	
	socio1 := Socio nombreYApellido: 'Julieta Rodriguez' dni: '47260474' fechaDeRegistracion: (FixedGregorianDate yearNumber: 2025 monthNumber: 4          dayNumber:8).
	
	socio2 := Socio nombreYApellido: 'Francisco Demartino' dni: '44958916' fechaDeRegistracion: (FixedGregorianDate yearNumber: 2025 monthNumber: 4 dayNumber:8).
	
	
	elPrincipito := Libro iSBN: '978-987-674-799-8'titulo: 'El Principito' autor: 'Antoine de Saint-Exupéry' fechaDePublicacion: (FixedGregorianDate yearNumber: 1943 monthNumber: 4 dayNumber:6) idioma: 'ingles' listaDeTemas: #('Amistad', 'Amor').
	
	biblioteca registrar: elPrincipito conTipoDePrestamo: prestamoRenovablePor1Dia .
	
	biblioteca inscribir: socio1.
	biblioteca inscribir: socio2.
	
	biblioteca agregarEjemplar: elPrincipito conFechaDeIngreso: (FixedGregorianDate yearNumber: 2025 monthNumber: 4 dayNumber:8).
	biblioteca agregarEjemplar: elPrincipito conFechaDeIngreso: (FixedGregorianDate yearNumber: 2025 monthNumber: 4 dayNumber:8).

	socio1 pedirPrestamoDeLibro: elPrincipito conFecha: (FixedGregorianDate yearNumber: 2025 monthNumber: 11 dayNumber: 20) HastaFecha: (FixedGregorianDate yearNumber: 2025 monthNumber: 12 dayNumber: 3) deBiblioteca: biblioteca.
	
	socio2 pedirPrestamoDeLibro: elPrincipito conFecha: (FixedGregorianDate yearNumber: 2025 monthNumber: 11 dayNumber: 20) HastaFecha: (FixedGregorianDate yearNumber: 2025 monthNumber: 12 dayNumber: 3) deBiblioteca: biblioteca.
	
	socio1 devolver: elPrincipito conFecha:(FixedGregorianDate yearNumber: 2026 monthNumber: 12 dayNumber: 3) aBiblioteca: biblioteca.
	
	Assert that: biblioteca cantidadDeSociosQueRealizaronAlMenosUnPrestamo isEqualTo: 2.
	
	
	
	
	
	
	! !

!BibliotecaTests methodsFor: 'as yet unclassified' stamp: 'JR 12/3/2025 15:45:54'!
test034_laBibliotecaConoceLosSociosQueTienenPrestamosEnCurso

	| biblioteca socio1 elPrincipito prestamoRenovablePor1Dia socio2 |
	
	prestamoRenovablePor1Dia:= PrestamoRenovablePor1Dia new.
	 
	biblioteca := Biblioteca new.
	
	socio1 := Socio nombreYApellido: 'Julieta Rodriguez' dni: '47260474' fechaDeRegistracion: (FixedGregorianDate yearNumber: 2025 monthNumber: 4          dayNumber:8).
	
	socio2 := Socio nombreYApellido: 'Francisco Demartino' dni: '44958916' fechaDeRegistracion: (FixedGregorianDate yearNumber: 2025 monthNumber: 4 dayNumber:8).
	
	elPrincipito := Libro iSBN: '978-987-674-799-8'titulo: 'El Principito' autor: 'Antoine de Saint-Exupéry' fechaDePublicacion: (FixedGregorianDate yearNumber: 1943 monthNumber: 4 dayNumber:6) idioma: 'ingles' listaDeTemas: #('Amistad', 'Amor').
	
	biblioteca registrar: elPrincipito conTipoDePrestamo: prestamoRenovablePor1Dia .
	
	biblioteca inscribir: socio1.
	biblioteca inscribir: socio2.
	
	biblioteca agregarEjemplar: elPrincipito conFechaDeIngreso: (FixedGregorianDate yearNumber: 2025 monthNumber: 4 dayNumber:8).
	biblioteca agregarEjemplar: elPrincipito conFechaDeIngreso: (FixedGregorianDate yearNumber: 2025 monthNumber: 4 dayNumber:8).

	socio1 pedirPrestamoDeLibro: elPrincipito conFecha: (FixedGregorianDate yearNumber: 2025 monthNumber: 11 dayNumber: 20) HastaFecha: (FixedGregorianDate yearNumber: 2025 monthNumber: 12 dayNumber: 3) deBiblioteca: biblioteca.
	
	socio2 pedirPrestamoDeLibro: elPrincipito conFecha: (FixedGregorianDate yearNumber: 2025 monthNumber: 11 dayNumber: 20) HastaFecha: (FixedGregorianDate yearNumber: 2025 monthNumber: 12 dayNumber: 3) deBiblioteca: biblioteca.
	
	Assert isTrue: (biblioteca sociosQueTienenPrestamosEnCurso includes: socio1).
	
	Assert isTrue: (biblioteca sociosQueTienenPrestamosEnCurso includes: socio2).
	
	
	
	
	
	
	! !

!BibliotecaTests methodsFor: 'as yet unclassified' stamp: 'JR 12/3/2025 15:47:16'!
test035_laBibliotecaDevuelveUnaListaDeLibrosUtilizandoUnFiltroPorAutor

	| biblioteca elPrincipito prestamoRenovablePorUnaSemana unfiltroPorAutor resultado unfiltroTotal harryPotter sherlockHolmes |
	
	prestamoRenovablePorUnaSemana := PrestamoRenovablePor1Semana new.
	biblioteca := Biblioteca new.
	
	elPrincipito := Libro iSBN: '978-987-674-799-8'titulo: 'El Principito' autor: 'Antoine de Saint-Exupéry' fechaDePublicacion: (FixedGregorianDate yearNumber: 1943 monthNumber: 4 dayNumber:6) idioma: 'ingles' listaDeTemas: #('Amistad', 'Amor').
	
	harryPotter := Libro iSBN: '978-84-7888-445-2'titulo: 'Harry Potter' autor: 'Jk Rowling' fechaDePublicacion: (FixedGregorianDate yearNumber: 1997 monthNumber: 6 dayNumber:26) idioma: 'ingles' listaDeTemas: #('Fantasia', 'Amistad').
	
	sherlockHolmes := Libro iSBN: '1-85326-896-8'titulo: 'Un estudio en Escarlata' autor: 'Antoine de Saint-Exupéry' fechaDePublicacion: (FixedGregorianDate yearNumber: 1892 monthNumber: 10 dayNumber:14) idioma: 'ingles' listaDeTemas: #('Policial', 'Misterio').
	
	biblioteca registrar: elPrincipito conTipoDePrestamo: prestamoRenovablePorUnaSemana.
	biblioteca registrar: harryPotter conTipoDePrestamo: prestamoRenovablePorUnaSemana .
	biblioteca registrar: sherlockHolmes conTipoDePrestamo: prestamoRenovablePorUnaSemana .
	
	unfiltroPorAutor := FiltroPorAutor paraAutor: 'Antoine de Saint-Exupéry'.
	
	unfiltroTotal := FiltroCombinado conFiltros: (OrderedCollection with: unfiltroPorAutor ).
	
	resultado := biblioteca buscarLibrosConFiltro: unfiltroTotal.
	
	Assert isTrue: (resultado includes: elPrincipito).
	Assert isFalse: (resultado includes: harryPotter).
	Assert isTrue: (resultado includes: sherlockHolmes).

	! !

!BibliotecaTests methodsFor: 'as yet unclassified' stamp: 'JR 12/3/2025 15:47:07'!
test036_laBibliotecaDevuelveUnaListaDeLibrosUtilizandoUnFiltroPorFechas

	| biblioteca elPrincipito prestamoRenovablePorUnaSemana resultado unfiltroTotal harryPotter sherlockHolmes unfiltroPorFechas |
	
	prestamoRenovablePorUnaSemana := PrestamoRenovablePor1Semana new.
	biblioteca := Biblioteca new.
	
	elPrincipito := Libro iSBN: '978-987-674-799-8'titulo: 'El Principito' autor: 'Antoine de Saint-Exupéry' fechaDePublicacion: (FixedGregorianDate yearNumber: 1943 monthNumber: 4 dayNumber:6) idioma: 'ingles' listaDeTemas: #('Amistad', 'Amor').
	
	harryPotter := Libro iSBN: '978-84-7888-445-2'titulo: 'Harry Potter' autor: 'Jk Rowling' fechaDePublicacion: (FixedGregorianDate yearNumber: 1997 monthNumber: 6 dayNumber:26) idioma: 'ingles' listaDeTemas: #('Fantasia', 'Amistad').
	
	sherlockHolmes := Libro iSBN: '1-85326-896-8'titulo: 'Un estudio en Escarlata' autor: 'Arthur Ignatius Conan Doyle' fechaDePublicacion: (FixedGregorianDate yearNumber: 1892 monthNumber: 10 dayNumber:14) idioma: 'ingles' listaDeTemas: #('Policial', 'Misterio').
	
	biblioteca registrar: elPrincipito conTipoDePrestamo: prestamoRenovablePorUnaSemana.
	biblioteca registrar: harryPotter conTipoDePrestamo: prestamoRenovablePorUnaSemana .
	biblioteca registrar: sherlockHolmes conTipoDePrestamo: prestamoRenovablePorUnaSemana .
	
	unfiltroPorFechas := FiltroPorFechas fechaDeInicio: (FixedGregorianDate yearNumber: 1943 monthNumber: 4 dayNumber:6) fechaDeFin:              (FixedGregorianDate yearNumber: 1997 monthNumber: 6 dayNumber:26).
	
	unfiltroTotal := FiltroCombinado conFiltros: (OrderedCollection with: unfiltroPorFechas ).
	
	resultado := biblioteca buscarLibrosConFiltro: unfiltroTotal.
	
	Assert isTrue: (resultado includes: elPrincipito).
	Assert isTrue: (resultado includes: harryPotter).
	Assert isFalse: (resultado includes: sherlockHolmes).

	! !

!BibliotecaTests methodsFor: 'as yet unclassified' stamp: 'JR 12/3/2025 15:46:57'!
test037_laBibliotecaDevuelveUnaListaDeLibrosUtilizandoUnFiltroPorListaDeTemas

	| biblioteca elPrincipito prestamoRenovablePorUnaSemana resultado unfiltroTotal harryPotter sherlockHolmes unfiltroPorTemas |
	
	prestamoRenovablePorUnaSemana := PrestamoRenovablePor1Semana new.
	biblioteca := Biblioteca new.
	
	elPrincipito := Libro iSBN: '978-987-674-799-8'titulo: 'El Principito' autor: 'Antoine de Saint-Exupéry' fechaDePublicacion: (FixedGregorianDate yearNumber: 1943 monthNumber: 4 dayNumber:6) idioma: 'ingles' listaDeTemas: #('Amistad', 'Amor').
	
	harryPotter := Libro iSBN: '978-84-7888-445-2'titulo: 'Harry Potter' autor: 'Jk Rowling' fechaDePublicacion: (FixedGregorianDate yearNumber: 1997 monthNumber: 6 dayNumber:26) idioma: 'ingles' listaDeTemas: #('Amistad', 'Amor').
	
	sherlockHolmes := Libro iSBN: '1-85326-896-8'titulo: 'Un estudio en Escarlata' autor: 'Arthur Ignatius Conan Doyle' fechaDePublicacion: (FixedGregorianDate yearNumber: 1892 monthNumber: 10 dayNumber:14) idioma: 'ingles' listaDeTemas: #('Policial', 'Misterio').
	
	biblioteca registrar: elPrincipito conTipoDePrestamo: prestamoRenovablePorUnaSemana.
	biblioteca registrar: harryPotter conTipoDePrestamo: prestamoRenovablePorUnaSemana .
	biblioteca registrar: sherlockHolmes conTipoDePrestamo: prestamoRenovablePorUnaSemana .
	
	
	unfiltroPorTemas := FiltroPorTemas conTemas: #('Amistad', 'Amor').
	
	unfiltroTotal := FiltroCombinado conFiltros: (OrderedCollection with: unfiltroPorTemas ).
	
	resultado := biblioteca buscarLibrosConFiltro: unfiltroTotal.
	
	Assert isTrue: (resultado includes: elPrincipito).
	Assert isTrue: (resultado includes: harryPotter).
	Assert isFalse: (resultado includes: sherlockHolmes).

	! !

!BibliotecaTests methodsFor: 'as yet unclassified' stamp: 'JR 12/3/2025 15:46:46'!
test038_laBibliotecaDevuelveUnaListaDeLibrosUtilizandoUnFiltroPorFecha

	| biblioteca elPrincipito prestamoRenovablePorUnaSemana resultado unfiltroTotal harryPotter sherlockHolmes unfiltroPorFecha |
	
	prestamoRenovablePorUnaSemana := PrestamoRenovablePor1Semana new.
	biblioteca := Biblioteca new.
	
	elPrincipito := Libro iSBN: '978-987-674-799-8'titulo: 'El Principito' autor: 'Antoine de Saint-Exupéry' fechaDePublicacion: (FixedGregorianDate yearNumber: 1943 monthNumber: 4 dayNumber:6) idioma: 'ingles' listaDeTemas: #('Amistad', 'Amor').
	
	harryPotter := Libro iSBN: '978-84-7888-445-2'titulo: 'Harry Potter' autor: 'Jk Rowling' fechaDePublicacion: (FixedGregorianDate yearNumber: 1997 monthNumber: 6 dayNumber:26) idioma: 'ingles' listaDeTemas: #('Fantasia', 'Amistad').
	
	sherlockHolmes := Libro iSBN: '1-85326-896-8'titulo: 'Un estudio en Escarlata' autor: 'Arthur Ignatius Conan Doyle' fechaDePublicacion: (FixedGregorianDate yearNumber: 1943 monthNumber: 4 dayNumber:6) idioma: 'ingles' listaDeTemas: #('Policial', 'Misterio').
	
	biblioteca registrar: elPrincipito conTipoDePrestamo: prestamoRenovablePorUnaSemana.
	biblioteca registrar: harryPotter conTipoDePrestamo: prestamoRenovablePorUnaSemana .
	biblioteca registrar: sherlockHolmes conTipoDePrestamo: prestamoRenovablePorUnaSemana .
	
	
	unfiltroPorFecha := FiltroPorFecha fecha: (FixedGregorianDate yearNumber: 1943 monthNumber: 4 dayNumber:6).
	
	unfiltroTotal := FiltroCombinado conFiltros: (OrderedCollection with: unfiltroPorFecha ).
	
	resultado := biblioteca buscarLibrosConFiltro: unfiltroTotal.
	
	Assert isTrue: (resultado includes: elPrincipito).
	Assert isFalse: (resultado includes: harryPotter).
	Assert isTrue: (resultado includes: sherlockHolmes).

	! !

!BibliotecaTests methodsFor: 'as yet unclassified' stamp: 'JR 12/3/2025 15:47:53'!
test039_laBibliotecaNoPoseeLibrosConDichosFiltros

	| biblioteca elPrincipito prestamoRenovablePorUnaSemana resultado unfiltroTotal harryPotter sherlockHolmes unfiltroPorFecha unfiltroPorAutor unfiltroPorFechas unfiltroPorTemas |
	
	prestamoRenovablePorUnaSemana := PrestamoRenovablePor1Semana new.
	biblioteca := Biblioteca new.
	
	elPrincipito := Libro iSBN: '978-987-674-799-8'titulo: 'El Principito' autor: 'Antoine de Saint-Exupéry' fechaDePublicacion: (FixedGregorianDate yearNumber: 1943 monthNumber: 4 dayNumber:6) idioma: 'ingles' listaDeTemas: #('Amistad', 'Amor').
	
	harryPotter := Libro iSBN: '978-84-7888-445-2'titulo: 'Harry Potter' autor: 'Jk Rowling' fechaDePublicacion: (FixedGregorianDate yearNumber: 1997 monthNumber: 6 dayNumber:26) idioma: 'ingles' listaDeTemas: #('Fantasia', 'Amistad').
	
	sherlockHolmes := Libro iSBN: '1-85326-896-8'titulo: 'Un estudio en Escarlata' autor: 'Arthur Ignatius Conan Doyle' fechaDePublicacion: (FixedGregorianDate yearNumber: 1943 monthNumber: 4 dayNumber:6) idioma: 'ingles' listaDeTemas: #('Policial', 'Misterio').
	
	biblioteca registrar: elPrincipito conTipoDePrestamo: prestamoRenovablePorUnaSemana.
	biblioteca registrar: harryPotter conTipoDePrestamo: prestamoRenovablePorUnaSemana .
	biblioteca registrar: sherlockHolmes conTipoDePrestamo: prestamoRenovablePorUnaSemana .
	
	unfiltroPorAutor := FiltroPorAutor paraAutor: 'Antoine de Saint-Exupéry'.
	
	unfiltroPorFechas := FiltroPorFechas fechaDeInicio: (FixedGregorianDate yearNumber: 1943 monthNumber: 4 dayNumber:6) fechaDeFin:              (FixedGregorianDate yearNumber: 1943 monthNumber: 4 dayNumber:6).
	
	unfiltroPorTemas := FiltroPorTemas conTemas: #('Amistad', 'Amor').
	
	unfiltroPorFecha := FiltroPorFecha fecha: (FixedGregorianDate yearNumber: 43 monthNumber: 4 dayNumber:6).
	
	unfiltroTotal := FiltroCombinado conFiltros: (OrderedCollection with: unfiltroPorAutor with: unfiltroPorFechas with: unfiltroPorTemas with: unfiltroPorFecha).
	
	resultado := biblioteca buscarLibrosConFiltro: unfiltroTotal.
	
	Assert isTrue: (resultado isEmpty).

	! !

!BibliotecaTests methodsFor: 'as yet unclassified' stamp: 'JR 12/3/2025 15:48:27'!
test040_laBibliotecaDevuelveUnaListaDeLibrosUtilizandoTodosLosFiltros

	| biblioteca elPrincipito prestamoRenovablePorUnaSemana resultado unfiltroTotal harryPotter sherlockHolmes unfiltroPorFecha unfiltroPorAutor unfiltroPorFechas unfiltroPorTemas |
	
	prestamoRenovablePorUnaSemana := PrestamoRenovablePor1Semana new.
	biblioteca := Biblioteca new.
	
	elPrincipito := Libro iSBN: '978-987-674-799-8'titulo: 'El Principito' autor: 'Antoine de Saint-Exupéry' fechaDePublicacion: (FixedGregorianDate yearNumber: 1943 monthNumber: 4 dayNumber:6) idioma: 'ingles' listaDeTemas: #('Amistad', 'Amor').
	
	harryPotter := Libro iSBN: '978-84-7888-445-2'titulo: 'Harry Potter' autor: 'Jk Rowling' fechaDePublicacion: (FixedGregorianDate yearNumber: 1997 monthNumber: 6 dayNumber:26) idioma: 'ingles' listaDeTemas: #('Fantasia', 'Amistad').
	
	sherlockHolmes := Libro iSBN: '1-85326-896-8'titulo: 'Un estudio en Escarlata' autor: 'Arthur Ignatius Conan Doyle' fechaDePublicacion: (FixedGregorianDate yearNumber: 1943 monthNumber: 4 dayNumber:6) idioma: 'ingles' listaDeTemas: #('Policial', 'Misterio').
	
	biblioteca registrar: elPrincipito conTipoDePrestamo: prestamoRenovablePorUnaSemana.
	biblioteca registrar: harryPotter conTipoDePrestamo: prestamoRenovablePorUnaSemana .
	biblioteca registrar: sherlockHolmes conTipoDePrestamo: prestamoRenovablePorUnaSemana .
	
	unfiltroPorAutor := FiltroPorAutor paraAutor: 'Antoine de Saint-Exupéry'.
	
	unfiltroPorFechas := FiltroPorFechas fechaDeInicio: (FixedGregorianDate yearNumber: 1943 monthNumber: 4 dayNumber:6) fechaDeFin:              (FixedGregorianDate yearNumber: 1943 monthNumber: 4 dayNumber:6).
	
	unfiltroPorTemas := FiltroPorTemas conTemas: #('Amistad', 'Amor').
	
	unfiltroPorFecha := FiltroPorFecha fecha: (FixedGregorianDate yearNumber: 1943 monthNumber: 4 dayNumber:6).
	
	unfiltroTotal := FiltroCombinado conFiltros: (OrderedCollection with: unfiltroPorAutor with: unfiltroPorFechas with: unfiltroPorTemas with: unfiltroPorFecha).
	
	resultado := biblioteca buscarLibrosConFiltro: unfiltroTotal.
	
	Assert isTrue: (resultado includes: elPrincipito).

	! !

!BibliotecaTests methodsFor: 'as yet unclassified' stamp: 'JR 12/3/2025 14:48:36'!
test041_unSocioNoPuedeRenovarUnLibroQueNoTienePrestado

	| biblioteca socio1 elPrincipito prestamoRenovablePor1Dia lasBrujas |
	
	prestamoRenovablePor1Dia:= PrestamoRenovablePor1Dia new.
	 
	biblioteca := Biblioteca new.
	
	socio1 := Socio nombreYApellido: 'Julieta Rodriguez' dni: '47260474' fechaDeRegistracion: (FixedGregorianDate yearNumber: 2025 monthNumber: 4          dayNumber:8).
	
	elPrincipito := Libro iSBN: '978-987-674-799-8'titulo: 'El Principito' autor: 'Antoine de Saint-Exupéry' fechaDePublicacion: (FixedGregorianDate yearNumber: 1943 monthNumber: 4 dayNumber:6) idioma: 'ingles' listaDeTemas: #('Amistad', 'Amor').
	
	lasBrujas := Libro iSBN: '978014031730'titulo: 'Las Brujas' autor: 'Roal Dahl' fechaDePublicacion: (FixedGregorianDate yearNumber: 1983 monthNumber: 9 dayNumber:10) idioma: 'ingles' listaDeTemas: #('Ficcion', 'Terror').
	
	biblioteca registrar: elPrincipito conTipoDePrestamo: prestamoRenovablePor1Dia .
	
	biblioteca inscribir: socio1.
	
	biblioteca agregarEjemplar: elPrincipito conFechaDeIngreso: (FixedGregorianDate yearNumber: 2025 monthNumber: 4 dayNumber:8).
	
	Assert should: [socio1 pideRenovacionDePrestamoParaLibro: elPrincipito fechaDeRenovacion: (FixedGregorianDate yearNumber: 2025 monthNumber: 11 dayNumber: 12) ]	 signal: PreconditionFailure withDescription: 'No tiene ese libro prestado'.
	
	
	
	
	
	! !

!BibliotecaTests methodsFor: 'as yet unclassified' stamp: 'JR 12/3/2025 15:12:21'!
test042_laFechaDeDevolucionDebeSerUnDiaHabil

	| biblioteca socio1 elPrincipito prestamoRenovablePorUnaSemana |
	
	prestamoRenovablePorUnaSemana := PrestamoRenovablePor1Semana new.
	
	biblioteca := Biblioteca new.
	
	socio1 := Socio nombreYApellido: 'Julieta Rodriguez' dni: '47260474' fechaDeRegistracion: (FixedGregorianDate yearNumber: 2025 monthNumber: 4 dayNumber:8).
	
	elPrincipito := Libro iSBN: '978-987-674-799-8'titulo: 'El Principito' autor: 'Antoine de Saint-Exupéry' fechaDePublicacion: (FixedGregorianDate yearNumber: 1943 monthNumber: 4 dayNumber:6) idioma: 'ingles' listaDeTemas: #('Amistad', 'Amor').
	
	biblioteca registrar: elPrincipito conTipoDePrestamo: prestamoRenovablePorUnaSemana.
	
	biblioteca agregarEjemplar: elPrincipito conFechaDeIngreso: (FixedGregorianDate yearNumber: 2025 monthNumber: 4 dayNumber:8).
	
	biblioteca inscribir: socio1.
	
	Assert should: [socio1 pedirPrestamoDeLibro: elPrincipito conFecha: (FixedGregorianDate yearNumber: 2025 monthNumber: 11 dayNumber: 30) HastaFecha: (FixedGregorianDate yearNumber: 2025 monthNumber: 12 dayNumber: 13) deBiblioteca: biblioteca.] signal: PreconditionFailure withDescription: 'La biblioteca esta cerrada'.
	! !

!BibliotecaTests methodsFor: 'as yet unclassified' stamp: 'JR 12/3/2025 15:31:48'!
test043_unSocioNoPuedeRenovarSuPrestamoSiLaFechaDeInicioDelPrestamoEsAnteriorLaDeRenovacion

	| biblioteca socio1 elPrincipito prestamoRenovablePorUnaSemana |
	
	prestamoRenovablePorUnaSemana := PrestamoRenovablePor1Semana new.
	 
	biblioteca := Biblioteca new.
	
	socio1 := Socio nombreYApellido: 'Julieta Rodriguez' dni: '47260474' fechaDeRegistracion: (FixedGregorianDate yearNumber: 2025 monthNumber: 4          dayNumber:8).
	
	elPrincipito := Libro iSBN: '978-987-674-799-8'titulo: 'El Principito' autor: 'Antoine de Saint-Exupéry' fechaDePublicacion: (FixedGregorianDate yearNumber: 1943 monthNumber: 4 dayNumber:6) idioma: 'ingles' listaDeTemas: #('Amistad', 'Amor').
	
	biblioteca registrar: elPrincipito conTipoDePrestamo: prestamoRenovablePorUnaSemana.
	
	biblioteca inscribir: socio1.
	
	biblioteca agregarEjemplar: elPrincipito conFechaDeIngreso: (FixedGregorianDate yearNumber: 2025 monthNumber: 4 dayNumber:8).
	
	socio1 pedirPrestamoDeLibro: elPrincipito conFecha: (FixedGregorianDate yearNumber: 2025 monthNumber: 11 dayNumber: 20) HastaFecha: (FixedGregorianDate yearNumber: 2025 monthNumber: 12 dayNumber: 3) deBiblioteca: biblioteca.
	
	Assert should: [socio1 pideRenovacionDePrestamoParaLibro: elPrincipito fechaDeRenovacion: (FixedGregorianDate yearNumber: 2025 monthNumber: 11 dayNumber: 13).] signal: PreconditionFailure withDescription: 'la fecha de renovacion debe ser posterior a la de inicio'
	
	
	
	
	
	! !


!classDefinition: #Biblioteca category: #'TrabajoFinal-Grupo-7'!
Object subclass: #Biblioteca
	instanceVariableNames: 'socios libros isbnLibros prestamosEnCurso'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-Grupo-7'!

!Biblioteca methodsFor: 'initialization' stamp: 'JR 12/3/2025 14:49:36'!
initialize

	socios := Set new.
	
	libros := Dictionary new.
	
	prestamosEnCurso := Set new.
	
	isbnLibros := Set new.
	
	! !


!Biblioteca methodsFor: 'testing' stamp: 'FD 11/21/2025 17:22:23'!
presto: unLibro
	
	^ (self librosPedidos ) includes: unLibro.! !


!Biblioteca methodsFor: 'action' stamp: 'JR 11/30/2025 16:46:54'!
agregarEjemplar: unLibro conFechaDeIngreso: unaFecha 
	
	| ejemplarNuevo |
	
	self require: ((unaFecha isSunday | unaFecha isSaturday) not) otherwiseReport:  'La biblioteca esta cerrada'.
	
	ejemplarNuevo := Ejemplar de:unLibro confechaDeIngreso: unaFecha numeroDeInventario: ((unLibro ejemplares) size)+1.
	
	unLibro ejemplares at: (ejemplarNuevo numeroDeInventario) put: ejemplarNuevo.! !

!Biblioteca methodsFor: 'action' stamp: 'FD 11/21/2025 17:18:46'!
agregarPrestamo: unPrestamo

	 prestamosEnCurso add:​ unPrestamo.! !

!Biblioteca methodsFor: 'action' stamp: 'JR 12/1/2025 12:29:59'!
inscribir: unSocio 

	| dniSociosVetados sociosVetados |
	
	sociosVetados := socios select: [:socio|socio estaVetado].
	
	dniSociosVetados := sociosVetados collect: [:socio|socio dni].

	self require: ((dniSociosVetados includes: unSocio dni)not) otherwiseReport: 'El socio esta vetado'.

	self require: (((unSocio fechaDeRegistracion) isSunday | (unSocio fechaDeRegistracion) isSaturday) not) otherwiseReport: 'Solo pueden inscribirse cuando la biblioteca esta abierta'.

	socios add: unSocio.! !

!Biblioteca methodsFor: 'action' stamp: 'FD 11/22/2025 19:57:33'!
registrar: unLibro conTipoDePrestamo: unTipoDePrestamo
	
	self require:  ((isbnLibros includes: (unLibro iSBN)) not)  otherwiseReport: 'ISBN ya utilizado en otro libro'.
	
	isbnLibros add: (unLibro iSBN).
	
	libros at: (libros size) put: unLibro.
	
	unLibro agregarTipoDePrestamo: unTipoDePrestamo.! !

!Biblioteca methodsFor: 'action' stamp: 'FD 11/23/2025 18:04:05'!
registrarDevolucionDe: unLibro de: unSocio conFecha: unaFecha

	| prestamoDevuelto |
	
	self require: ((unaFecha isSunday | unaFecha isSaturday) not) otherwiseReport: 'Biblioteca cerrada'.

	prestamoDevuelto := unSocio devolver: unLibro conFecha: unaFecha.

	prestamosEnCurso remove: prestamoDevuelto.! !

!Biblioteca methodsFor: 'action' stamp: 'JR 12/1/2025 12:30:15'!
sacarPrestamo: unPrestamo 

	prestamosEnCurso remove:  unPrestamo.! !


!Biblioteca methodsFor: 'accessing' stamp: 'FD 12/1/2025 19:29:42'!
buscarLibrosConFiltro: unFiltro

	^ libros values select: [ :libro | unFiltro cumplePara: libro ].! !

!Biblioteca methodsFor: 'accessing' stamp: 'JR 12/1/2025 12:29:22'!
cantidadDe: unTitulo 
  
	| librosConTituloBuscado |
	librosConTituloBuscado := libros collect: [: libro| libro tieneTitulo: unTitulo ].

	^ librosConTituloBuscado size.! !

!Biblioteca methodsFor: 'accessing' stamp: 'JR 11/30/2025 18:07:06'!
cantidadDeEjemplaresDisponibles

	| cantidadDeEjemplaresDisponibles |
	cantidadDeEjemplaresDisponibles := libros sum: [:libro|libro cantidadDeEjemplares] .

	^cantidadDeEjemplaresDisponibles! !

!Biblioteca methodsFor: 'accessing' stamp: 'JR 12/1/2025 12:29:31'!
cantidadDeEjemplaresPrestados

	^prestamosEnCurso size.! !

!Biblioteca methodsFor: 'accessing' stamp: 'JR 12/1/2025 12:41:22'!
cantidadDeSociosQueRealizaronAlMenosUnPrestamo

	| sociosQueRealizaronAlMenosUnPrestamo |
	sociosQueRealizaronAlMenosUnPrestamo := socios select:[:socio|socio realizoAlMenosUnPrestamo].

	^ sociosQueRealizaronAlMenosUnPrestamo size ! !

!Biblioteca methodsFor: 'accessing' stamp: 'JR 12/3/2025 14:51:30'!
cantidadDeSociosSancionados

	^ (self sociosSancionados) size.! !

!Biblioteca methodsFor: 'accessing' stamp: 'JR 12/3/2025 14:51:45'!
cantidadDeSociosSolidarios

	^(self sociosSolidarios) size! !

!Biblioteca methodsFor: 'accessing' stamp: 'JR 12/1/2025 12:30:04'!
libros

	^libros! !

!Biblioteca methodsFor: 'accessing' stamp: 'FD 11/29/2025 19:21:49'!
librosPedidos

	^ prestamosEnCurso collect: [:prestamo | (prestamo ejemplar) libro].! !

!Biblioteca methodsFor: 'accessing' stamp: 'JR 12/1/2025 12:30:19'!
socios

	^socios! !

!Biblioteca methodsFor: 'accessing' stamp: 'JR 12/1/2025 12:46:38'!
sociosQueTienenPrestamosEnCurso
	
	| sociosQueTienenPrestamosEnCurso |
	
	sociosQueTienenPrestamosEnCurso := socios select:[:socio|socio tienePrestamoEnCurso].
	
	^ sociosQueTienenPrestamosEnCurso.! !

!Biblioteca methodsFor: 'accessing' stamp: 'JR 12/3/2025 14:50:42'!
sociosSancionados
	
	^socios select: [:socio|socio estaSancionado].! !

!Biblioteca methodsFor: 'accessing' stamp: 'JR 12/3/2025 14:50:20'!
sociosSolidarios

	^socios select: [:socio|socio esSolidario]! !


!classDefinition: #Ejemplar category: #'TrabajoFinal-Grupo-7'!
Object subclass: #Ejemplar
	instanceVariableNames: 'fecha numeroDeInventario libro'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-Grupo-7'!

!Ejemplar methodsFor: 'initialization' stamp: 'JR 12/1/2025 12:30:36'!
initializeDe: unLibro confechaDeIngreso: unaFecha numeroDeInventario: unNumero 
	
	libro := unLibro.
	
	fecha := unaFecha.
	
	numeroDeInventario := unNumero.! !


!Ejemplar methodsFor: 'accessing' stamp: 'JR 12/1/2025 12:30:41'!
libro

	^libro.! !

!Ejemplar methodsFor: 'accessing' stamp: 'JR 12/1/2025 12:30:45'!
numeroDeInventario

	^numeroDeInventario! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Ejemplar class' category: #'TrabajoFinal-Grupo-7'!
Ejemplar class
	instanceVariableNames: ''!

!Ejemplar class methodsFor: 'instance creation' stamp: 'JR 11/29/2025 15:45:09'!
de: unLibro confechaDeIngreso: unaFecha numeroDeInventario: unNumero 
	
	^self new initializeDe: unLibro confechaDeIngreso: unaFecha numeroDeInventario: unNumero ! !


!classDefinition: #EstadoDeDevolucion category: #'TrabajoFinal-Grupo-7'!
Object subclass: #EstadoDeDevolucion
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-Grupo-7'!

!EstadoDeDevolucion methodsFor: 'action' stamp: 'FD 11/23/2025 17:34:25'!
aplicarSancionSiCorrespondeA: unSocio

	^ self subclassResponsibility.! !


!classDefinition: #DevolucionATiempo category: #'TrabajoFinal-Grupo-7'!
EstadoDeDevolucion subclass: #DevolucionATiempo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-Grupo-7'!

!DevolucionATiempo methodsFor: 'as yet unclassified' stamp: 'FD 11/23/2025 17:34:07'!
aplicarSancionSiCorrespondeA: unSocio

	^ self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DevolucionATiempo class' category: #'TrabajoFinal-Grupo-7'!
DevolucionATiempo class
	instanceVariableNames: ''!

!DevolucionATiempo class methodsFor: 'as yet unclassified' stamp: 'JR 11/30/2025 16:32:53'!
cumpleParaPrestamo: unPrestamo conFechaDevolucion: unaFechaDeDevolucion

	^(unPrestamo fechaDeVencimiento)  >= unaFechaDeDevolucion.! !


!classDefinition: #DevolucionTardia category: #'TrabajoFinal-Grupo-7'!
EstadoDeDevolucion subclass: #DevolucionTardia
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-Grupo-7'!

!DevolucionTardia methodsFor: 'as yet unclassified' stamp: 'FD 11/23/2025 17:34:58'!
aplicarSancionSiCorrespondeA: unSocio

	unSocio registrarSancion.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DevolucionTardia class' category: #'TrabajoFinal-Grupo-7'!
DevolucionTardia class
	instanceVariableNames: ''!

!DevolucionTardia class methodsFor: 'as yet unclassified' stamp: 'JR 11/30/2025 16:30:58'!
cumpleParaPrestamo: unPrestamo conFechaDevolucion: unaFechaDeDevolucion

	^(unPrestamo fechaDeVencimiento) < unaFechaDeDevolucion.! !


!classDefinition: #Filtro category: #'TrabajoFinal-Grupo-7'!
Object subclass: #Filtro
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-Grupo-7'!

!Filtro methodsFor: 'as yet unclassified' stamp: 'FD 12/1/2025 19:26:21'!
cumplePara: unLibro
    ^ self subclassResponsibility.! !


!classDefinition: #FiltroCombinado category: #'TrabajoFinal-Grupo-7'!
Filtro subclass: #FiltroCombinado
	instanceVariableNames: 'filtros'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-Grupo-7'!

!FiltroCombinado methodsFor: 'as yet unclassified' stamp: 'FD 12/1/2025 19:29:08'!
cumplePara: unLibro

	^ filtros allSatisfy: [ :filtro | filtro cumplePara: unLibro ].! !

!FiltroCombinado methodsFor: 'as yet unclassified' stamp: 'FD 12/1/2025 19:28:42'!
initializeConFiltros: unaColeccionDeFiltros
    filtros := unaColeccionDeFiltros.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'FiltroCombinado class' category: #'TrabajoFinal-Grupo-7'!
FiltroCombinado class
	instanceVariableNames: ''!

!FiltroCombinado class methodsFor: 'instance creation' stamp: 'FD 12/1/2025 19:33:31'!
conFiltros: unaListaDeFiltros 
	
	^self new initializeConFiltros: unaListaDeFiltros.! !


!classDefinition: #FiltroPorAutor category: #'TrabajoFinal-Grupo-7'!
Filtro subclass: #FiltroPorAutor
	instanceVariableNames: 'autor'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-Grupo-7'!

!FiltroPorAutor methodsFor: 'initialization' stamp: 'FD 12/1/2025 19:09:53'!
initializeParaAutor: unAutor 

	autor := unAutor.! !


!FiltroPorAutor methodsFor: 'as yet unclassified' stamp: 'FD 12/1/2025 19:26:51'!
cumplePara: unLibro
    ^ unLibro deAutor: autor! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'FiltroPorAutor class' category: #'TrabajoFinal-Grupo-7'!
FiltroPorAutor class
	instanceVariableNames: ''!

!FiltroPorAutor class methodsFor: 'instance creation' stamp: 'FD 12/1/2025 19:09:21'!
paraAutor: unAutor

	^self new initializeParaAutor: unAutor. ! !


!classDefinition: #FiltroPorFecha category: #'TrabajoFinal-Grupo-7'!
Filtro subclass: #FiltroPorFecha
	instanceVariableNames: 'fecha'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-Grupo-7'!

!FiltroPorFecha methodsFor: 'as yet unclassified' stamp: 'FD 12/1/2025 19:44:32'!
cumplePara: unLibro
    ^ unLibro tieneFechaDePublicacion: fecha.! !

!FiltroPorFecha methodsFor: 'as yet unclassified' stamp: 'FD 12/1/2025 19:43:44'!
initializeFecha: unaFecha

	fecha := unaFecha.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'FiltroPorFecha class' category: #'TrabajoFinal-Grupo-7'!
FiltroPorFecha class
	instanceVariableNames: ''!

!FiltroPorFecha class methodsFor: 'as yet unclassified' stamp: 'FD 12/1/2025 19:43:09'!
fecha: unaFecha

	^self new initializeFecha: unaFecha.! !


!classDefinition: #FiltroPorFechas category: #'TrabajoFinal-Grupo-7'!
Filtro subclass: #FiltroPorFechas
	instanceVariableNames: 'fechaDeInicio fechaDeFin'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-Grupo-7'!

!FiltroPorFechas methodsFor: 'initialization' stamp: 'FD 12/1/2025 19:11:49'!
initializeFechaDeInicio: unaFechaDeInicio fechaDeFin: unaFechaDeFin 

	fechaDeInicio := unaFechaDeInicio.
	fechaDeFin := unaFechaDeFin.! !


!FiltroPorFechas methodsFor: 'as yet unclassified' stamp: 'FD 12/1/2025 19:27:49'!
cumplePara: unLibro
    ^ unLibro tieneFechaPosteriorOIgualA: fechaDeInicio yAnteriorOIgualA: fechaDeFin! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'FiltroPorFechas class' category: #'TrabajoFinal-Grupo-7'!
FiltroPorFechas class
	instanceVariableNames: ''!

!FiltroPorFechas class methodsFor: 'instance creation' stamp: 'FD 12/1/2025 19:11:36'!
fechaDeInicio: unaFechaDeInicio fechaDeFin: unaFechaDeFin 

	^self new initializeFechaDeInicio: unaFechaDeInicio fechaDeFin: unaFechaDeFin ! !


!classDefinition: #FiltroPorTemas category: #'TrabajoFinal-Grupo-7'!
Filtro subclass: #FiltroPorTemas
	instanceVariableNames: 'listaDeTemas'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-Grupo-7'!

!FiltroPorTemas methodsFor: 'initialization' stamp: 'FD 12/1/2025 19:12:49'!
initializeConTemas: unaListaDeTemas 

	listaDeTemas := unaListaDeTemas.! !


!FiltroPorTemas methodsFor: 'as yet unclassified' stamp: 'FD 12/1/2025 19:27:23'!
cumplePara: unLibro
    ^ unLibro tieneListaDeTemas: listaDeTemas! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'FiltroPorTemas class' category: #'TrabajoFinal-Grupo-7'!
FiltroPorTemas class
	instanceVariableNames: ''!

!FiltroPorTemas class methodsFor: 'instance creation' stamp: 'FD 12/1/2025 19:12:31'!
conTemas: unaListaDeTemas 

	^self new initializeConTemas: unaListaDeTemas ! !


!classDefinition: #Libro category: #'TrabajoFinal-Grupo-7'!
Object subclass: #Libro
	instanceVariableNames: 'iSBN autor listaDeTemas fechaDePublicacion idioma titulo tipoDePrestamo ejemplares'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-Grupo-7'!

!Libro methodsFor: 'initialization' stamp: 'JR 12/1/2025 12:31:56'!
initializeISBN: unISBN titulo: unTitulo autor: unAutor fechaDePublicacion: unaFechaDePublicacion idioma: unIdioma listaDeTemas: unaListaDeTemas 

	iSBN := unISBN.
	
	titulo := unTitulo.
	
	autor := unAutor.
	
	fechaDePublicacion := unaFechaDePublicacion.
	
	idioma := unIdioma.
	
	listaDeTemas := unaListaDeTemas.
	
	ejemplares := Dictionary new.! !


!Libro methodsFor: 'testing' stamp: 'FD 12/1/2025 19:45:46'!
tieneFechaDePublicacion: unaFecha

	^ fechaDePublicacion = unaFecha.! !

!Libro methodsFor: 'testing' stamp: 'FD 12/1/2025 18:51:59'!
tieneFechaPosteriorOIgualA: FechaDeInicio yAnteriorOIgualA: FechaDeFin 
	
	^ ((fechaDePublicacion >= FechaDeInicio) & (fechaDePublicacion <= FechaDeFin)).! !

!Libro methodsFor: 'testing' stamp: 'FD 12/1/2025 18:54:09'!
tieneListaDeTemas: Temas 
	
	^ listaDeTemas includesAllOf: Temas.! !

!Libro methodsFor: 'testing' stamp: 'JR 12/1/2025 12:32:07'!
tieneTitulo: unTitulo 

	^ titulo = unTitulo ! !


!Libro methodsFor: 'accessing' stamp: 'JR 12/1/2025 12:31:15'!
autor

	^autor! !

!Libro methodsFor: 'accessing' stamp: 'JR 12/1/2025 12:31:20'!
cantidadDeEjemplares

	^ ejemplares size! !

!Libro methodsFor: 'accessing' stamp: 'FD 12/1/2025 18:50:22'!
deAutor: unAutor 
	
	^ autor = unAutor.! !

!Libro methodsFor: 'accessing' stamp: 'FD 11/29/2025 18:51:42'!
ejemplarAPrestar

	^ (( ejemplares values)first).! !

!Libro methodsFor: 'accessing' stamp: 'JR 12/1/2025 12:31:28'!
ejemplares

	^ejemplares! !

!Libro methodsFor: 'accessing' stamp: 'JR 12/1/2025 12:31:35'!
fechaDePublicacion

	^ fechaDePublicacion ! !

!Libro methodsFor: 'accessing' stamp: 'JR 12/1/2025 12:31:40'!
iSBN

	^iSBN! !

!Libro methodsFor: 'accessing' stamp: 'JR 12/1/2025 12:31:44'!
idioma

	^idioma! !

!Libro methodsFor: 'accessing' stamp: 'FD 11/21/2025 16:37:08'!
tipoDePrestamo
	
	^tipoDePrestamo! !

!Libro methodsFor: 'accessing' stamp: 'JR 12/1/2025 12:32:13'!
titulo

	^titulo! !


!Libro methodsFor: 'action' stamp: 'FD 11/21/2025 15:46:44'!
agregarTipoDePrestamo: unTipoDePrestamo 
	
	tipoDePrestamo := unTipoDePrestamo.! !

!Libro methodsFor: 'action' stamp: 'FD 11/29/2025 19:48:35'!
devolverEjemplar: unEjemplar

	ejemplares at: (unEjemplar numeroDeInventario) put: unEjemplar.
	
	! !

!Libro methodsFor: 'action' stamp: 'JR 12/1/2025 12:32:02'!
prestarEjemplar

	^ ejemplares removeKey: ((ejemplares keys)first).! !

!Libro methodsFor: 'action' stamp: 'FD 11/29/2025 19:07:06'!
sacarEjemplar: unEjemplar
    
    ejemplares removeKey: unEjemplar numeroDeInventario.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Libro class' category: #'TrabajoFinal-Grupo-7'!
Libro class
	instanceVariableNames: ''!

!Libro class methodsFor: 'instance creation' stamp: 'JR 11/20/2025 15:59:02'!
iSBN: unISBN titulo: unTitulo autor: unAutor fechaDePublicacion: unaFechaDePublicacion idioma: unIdioma listaDeTemas: unaListaDeTemas 
	^self new initializeISBN: unISBN titulo: unTitulo autor: unAutor fechaDePublicacion: unaFechaDePublicacion idioma: unIdioma listaDeTemas: unaListaDeTemas ! !


!classDefinition: #Prestamo category: #'TrabajoFinal-Grupo-7'!
Object subclass: #Prestamo
	instanceVariableNames: 'fechaInicio fechaVencimiento tipoDePrestamo ejemplar'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-Grupo-7'!

!Prestamo methodsFor: 'action' stamp: 'JR 11/26/2025 17:39:53'!
renovar

	| diasExtra |
	
	self require: (tipoDePrestamo esRenovable) otherwiseReport: 'Este préstamo no se puede renovar'.
         
	diasExtra := tipoDePrestamo plazoDeRenovacion.
    
	fechaVencimiento := fechaVencimiento next: diasExtra.! !


!Prestamo methodsFor: 'initialization' stamp: 'FD 12/2/2025 20:33:58'!
inicializarDelEjemplar: unEjemplarParaPrestar conFecha: unaFecha hastaFecha: otraFecha conTipoDePrestamo: unTipoDePrestamo
	
	ejemplar := unEjemplarParaPrestar.
	
	fechaInicio := unaFecha.
	
	fechaVencimiento := otraFecha.
	
	tipoDePrestamo := unTipoDePrestamo.! !


!Prestamo methodsFor: 'testing' stamp: 'FD 11/29/2025 19:25:51'!
esPrestamoDeLibro: unLibro 
	
	^(ejemplar libro) == unLibro ! !


!Prestamo methodsFor: 'accessing' stamp: 'FD 11/29/2025 19:17:56'!
ejemplar

	^ejemplar.! !

!Prestamo methodsFor: 'accessing' stamp: 'JR 12/3/2025 15:28:35'!
fechaDeInicio

	^fechaInicio ! !

!Prestamo methodsFor: 'accessing' stamp: 'JR 11/26/2025 17:54:40'!
fechaDeVencimiento
	^fechaVencimiento.! !

!Prestamo methodsFor: 'accessing' stamp: 'FD 12/2/2025 20:44:30'!
libro

	^ (ejemplar libro).	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Prestamo class' category: #'TrabajoFinal-Grupo-7'!
Prestamo class
	instanceVariableNames: ''!

!Prestamo class methodsFor: 'instance creation' stamp: 'FD 12/2/2025 20:33:37'!
delEjemplar: unEjemplarParaPrestar conFecha: unaFecha hastaFecha: otraFecha conTipoDePrestamo: tipoDePrestamo

	^self new inicializarDelEjemplar: unEjemplarParaPrestar conFecha: unaFecha hastaFecha: otraFecha conTipoDePrestamo: tipoDePrestamo.! !


!classDefinition: #PrestamoExtendido category: #'TrabajoFinal-Grupo-7'!
Prestamo subclass: #PrestamoExtendido
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-Grupo-7'!

!PrestamoExtendido methodsFor: 'testing' stamp: 'FD 11/23/2025 16:34:13'!
esRenovable

    ^ false.! !


!classDefinition: #PrestamoRenovablePor1Dia category: #'TrabajoFinal-Grupo-7'!
Prestamo subclass: #PrestamoRenovablePor1Dia
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-Grupo-7'!

!PrestamoRenovablePor1Dia methodsFor: 'accessing' stamp: 'FD 11/23/2025 16:34:52'!
plazoDeRenovacion

    ^ 1 * day.! !


!PrestamoRenovablePor1Dia methodsFor: 'testing' stamp: 'FD 11/23/2025 16:33:53'!
esRenovable

    ^ true.! !


!classDefinition: #PrestamoRenovablePor1Semana category: #'TrabajoFinal-Grupo-7'!
Prestamo subclass: #PrestamoRenovablePor1Semana
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-Grupo-7'!

!PrestamoRenovablePor1Semana methodsFor: 'accessing' stamp: 'FD 11/23/2025 16:34:36'!
plazoDeRenovacion

    ^ 7 * day.! !


!PrestamoRenovablePor1Semana methodsFor: 'testing' stamp: 'FD 11/23/2025 16:33:33'!
esRenovable

    ^ true.! !


!classDefinition: #Socio category: #'TrabajoFinal-Grupo-7'!
Object subclass: #Socio
	instanceVariableNames: 'nombreYApellido dNI fechaDeRegistracion fechaDeUltimaRenovacionDeMembresia prestamosEnCurso historialDePrestamos cantidadDeSanciones cantidadDePrestamosRealizados'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-Grupo-7'!

!Socio methodsFor: 'initialization' stamp: 'FD 12/2/2025 20:08:35'!
initializeNombreYApellido: unNombreYApellido dni: unDNI fechaDeRegistracion: laFechaDeRegistracion 
	
	nombreYApellido := unNombreYApellido.
	
	dNI := unDNI.
	
	fechaDeRegistracion := laFechaDeRegistracion.
	
	fechaDeUltimaRenovacionDeMembresia := laFechaDeRegistracion.
	
	prestamosEnCurso := Set new.
	
	historialDePrestamos := Set new.
	
	cantidadDeSanciones := 0.
	
	cantidadDePrestamosRealizados := 0.
	
	 
	! !


!Socio methodsFor: 'testing' stamp: 'JR 12/1/2025 12:33:53'!
esSolidario

	^cantidadDeSanciones =0! !

!Socio methodsFor: 'testing' stamp: 'JR 12/1/2025 12:33:57'!
estaSancionado

	^ cantidadDeSanciones >0! !

!Socio methodsFor: 'testing' stamp: 'FD 11/23/2025 17:38:28'!
estaVetado

	^ cantidadDeSanciones > 3.! !

!Socio methodsFor: 'testing' stamp: 'JR 12/1/2025 12:42:12'!
realizoAlMenosUnPrestamo
	
	^cantidadDePrestamosRealizados > 0! !

!Socio methodsFor: 'testing' stamp: 'JR 11/21/2025 12:04:52'!
tieneMembresiaAlDia
	
    | fechaVencimiento |

    fechaVencimiento := fechaDeUltimaRenovacionDeMembresia distanceTo: (FixedGregorianDate today).

    ^ fechaVencimiento< (366 * día).! !

!Socio methodsFor: 'testing' stamp: 'FD 11/21/2025 17:13:54'!
tienePrestamoDe: unLibro
 
	^ (self librosPedidos) includes: unLibro.! !

!Socio methodsFor: 'testing' stamp: 'JR 12/1/2025 12:48:13'!
tienePrestamoEnCurso
	
	^ (prestamosEnCurso size)>0! !


!Socio methodsFor: 'action' stamp: 'JR 11/30/2025 16:26:51'!
devolver: unLibro conFecha: fechaDeDevolucion aBiblioteca: unaBiblioteca

	|estadoDevolucion prestamoBuscado|

	self require: ((self librosPedidos) includes: unLibro)otherwiseReport: 'No tiene ese libro prestado'.

	prestamoBuscado := prestamosEnCurso detect: [:prestamo | prestamo esPrestamoDeLibro: unLibro].
	
	estadoDevolucion := (EstadoDeDevolucion allSubclasses detect: [:unEstado|unEstado cumpleParaPrestamo: prestamoBuscado conFechaDevolucion: fechaDeDevolucion ])new.
    
	estadoDevolucion aplicarSancionSiCorrespondeA: self.
    
	prestamosEnCurso remove: prestamoBuscado.
	
	historialDePrestamos add: prestamoBuscado.
	
	unLibro devolverEjemplar: (prestamoBuscado ejemplar).
	
	unaBiblioteca sacarPrestamo: prestamoBuscado.
	
	^ prestamoBuscado.! !

!Socio methodsFor: 'action' stamp: 'JR 11/26/2025 17:45:46'!
encontrarPrestamoDe: unLibro

	^prestamosEnCurso detect: [: prestamo|prestamo esPrestamoDeLibro: unLibro] ! !

!Socio methodsFor: 'action' stamp: 'JR 12/3/2025 15:10:27'!
pedirPrestamoDeLibro: unLibro conFecha: unaFecha HastaFecha: otraFecha deBiblioteca: unaBiblioteca 
	| nuevoPrestamo tipoDePrestamo ejemplarParaPrestar |
	
	self require: (self estaVetado not) otherwiseReport: 'El socio esta vetado'.

	self require: ( self tieneMembresiaAlDia ) otherwiseReport: 'No renovo su membresia anual'.
	
	self require: (prestamosEnCurso  size) < 5 otherwiseReport:  'Ya tiene 5 prestamos'.
	
	self require: ((self librosPedidos includes: unLibro) not) otherwiseReport: 'Ya tiene ejemplar de este libro'. 
	
	self require: unaFecha<otraFecha otherwiseReport: 'La fecha de vencimiento es mayor a la de pedido del prestamo'.

	self require: ((unaFecha isSunday | unaFecha isSaturday) not) otherwiseReport:  'La biblioteca esta cerrada'.
	
	self require: ((otraFecha isSunday | otraFecha isSaturday) not) otherwiseReport:  'La biblioteca esta cerrada'.

	self require: ((unaBiblioteca libros)includes: unLibro) otherwiseReport: 'La biblioteca no posee este libro'.
	
	self require: ((unLibro cantidadDeEjemplares) > 0) otherwiseReport: 'No hay ejemplares disponibles'.
	
	ejemplarParaPrestar := unLibro ejemplarAPrestar.
	
	unLibro sacarEjemplar: (unLibro ejemplarAPrestar). 
	
	tipoDePrestamo := unLibro tipoDePrestamo.
	
	nuevoPrestamo := Prestamo delEjemplar: ejemplarParaPrestar  conFecha: unaFecha hastaFecha: otraFecha conTipoDePrestamo:                                tipoDePrestamo.
	
	prestamosEnCurso add: nuevoPrestamo.
	
	cantidadDePrestamosRealizados := cantidadDePrestamosRealizados +1.
	
	unaBiblioteca agregarPrestamo: nuevoPrestamo.! !

!Socio methodsFor: 'action' stamp: 'JR 12/3/2025 15:29:30'!
pideRenovacionDePrestamoParaLibro: unLibro fechaDeRenovacion: unaFecha 

	| prestamoARenovar |
	 
	self require: ((self librosPedidos) includes: unLibro) otherwiseReport:'No tiene ese libro prestado'.
	
	prestamoARenovar := self encontrarPrestamoDe: unLibro.
	
	self require: (self tipoDePrestamoPara: unLibro) esRenovable  otherwiseReport:'Este libro no permite renovacion de prestamo'.
	
	self require: (unaFecha <= (prestamoARenovar fechaDeVencimiento)) otherwiseReport: 'Te extendiste de la fecha limite de devolucion, no podras renovar'.
	
	self require: (unaFecha >= (prestamoARenovar fechaDeInicio)) otherwiseReport: 'la fecha de renovacion debe ser posterior a la de inicio'.
	
	prestamoARenovar renovar.! !

!Socio methodsFor: 'action' stamp: 'FD 11/23/2025 17:37:58'!
registrarSancion

	cantidadDeSanciones := cantidadDeSanciones + 1.! !

!Socio methodsFor: 'action' stamp: 'JR 11/30/2025 17:28:57'!
renovarMembresia
	
	self require: (self estaVetado not) otherwiseReport: 'El socio esta vetado'.
	
	fechaDeUltimaRenovacionDeMembresia := fechaDeUltimaRenovacionDeMembresia next: 365 * day.! !


!Socio methodsFor: 'accessing' stamp: 'JR 12/1/2025 12:33:49'!
dni

	^dNI ! !

!Socio methodsFor: 'accessing' stamp: 'JR 12/1/2025 12:34:05'!
fechaDeRegistracion

	^fechaDeRegistracion! !

!Socio methodsFor: 'accessing' stamp: 'FD 11/20/2025 20:15:25'!
fechaDeUltimaRenovacionDeMembresia

	^fechaDeUltimaRenovacionDeMembresia! !

!Socio methodsFor: 'accessing' stamp: 'JR 12/1/2025 12:34:14'!
fechaLimiteDePrestamoPara: unLibro
 
	^(self encontrarPrestamoDe: unLibro) fechaDeVencimiento .! !

!Socio methodsFor: 'accessing' stamp: 'FD 11/29/2025 19:14:27'!
librosPedidos

	^ prestamosEnCurso collect: [:prestamo | (prestamo ejemplar) libro].! !

!Socio methodsFor: 'accessing' stamp: 'JR 12/1/2025 12:34:34'!
nombreYApellido

	^nombreYApellido! !

!Socio methodsFor: 'accessing' stamp: 'JR 12/1/2025 12:34:52'!
sanciones

	^ cantidadDeSanciones ! !

!Socio methodsFor: 'accessing' stamp: 'JR 11/26/2025 16:12:27'!
tipoDePrestamoPara: unLibro 
	
	^unLibro tipoDePrestamo ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Socio class' category: #'TrabajoFinal-Grupo-7'!
Socio class
	instanceVariableNames: ''!

!Socio class methodsFor: 'instance creation' stamp: 'JR 11/19/2025 21:49:58'!
nombreYApellido: unNombreYApellido dni: unDNI fechaDeRegistracion: laFechaDeRegistracion 

	^self new initializeNombreYApellido: unNombreYApellido dni: unDNI fechaDeRegistracion: laFechaDeRegistracion ! !
