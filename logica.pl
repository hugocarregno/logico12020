/* L�gico 1:
Ejercicio 1
Una empresa est� buscando candidatos para varios de sus sectores. Con los
requerimientos de cada sector, se arma este programa Prolog: */
puedeAndar(comercioExterior,P):- habla(ingles,P), habla(frances,P), profesional(P).
puedeAndar(comercioExterior,P):- ambicioso(P).
puedeAndar(contaduria,P):- contador(P), honesto(P).
puedeAndar(ventas,P):- ambicioso(P), conExperiencia(P).
puedeAndar(ventas,lucia).
/* 1d */
puedeAndar(proyectos, P):- ingeniero(P) , conExperiencia(P).
puedeAndar(proyectos, P):- abogado(P) , joven(P).
puedeAndar(logistica, P):- profesional(P), joven(P).
puedeAndar(logistica, P):- profesional(P), trabajoEn(P,omni).
profesional(P):- contador(P).
profesional(P):- abogado(P).
profesional(P):- ingeniero(P).
ambicioso(P):- contador(P), joven(P).
conExperiencia(P):- trabajoEn(P,_).
contador(roque).
joven(roque).
trabajoEn(roque,acme).
habla(roque,frances).
honesto(roque).
ingeniero(ana).
habla(ana,ingles).
habla(ana,frances).
trabajoEn(ana,omni).
habla(lucia,ingles).
habla(lucia,frances).
trabajoEn(lucia,omni).
abogado(cecilia).
ambicioso(cecilia).
habla(cecilia,frances).
/* 1 e */
ingeniero(pepe).
trabajoEn(pepe, acme).

/*
A partir de esta base:
    a. indicar qu� predicados aparecen en este programa.

    Todos son predicados.

    b. indicar qu� predicados aparecen en la primer cl�usula, de ellos
    cu�l se est� definiendo en esta cl�usula, y qu� rol juegan los
    otros.

    Aparecen puedeAndar, habla y profesional
    En esta clausula se define puedeAndar, los otros juegan el rol de
    predicados compuestos.

    c. para cada una de estas consultas, pensar si la respuesta
    de Prolog va a ser "s�" o "no" , justificando si es "no". Verificar
    despu�s con Prolog.
    Roque �puede andar para comercio exterior?
        Si
    Ana �puede andar para comercio exterior?
        No, porque el hecho habla() esta definido al reves.
    Luc�a �puede andar para comercio exterior?
        No por que no es profesional
    Roque �puede andar para contadur�a?
        Si
    Roque �puede andar para ventas?
        Si
    Luc�a �puede andar para ventas?
        Si
    d. agregar la informaci�n para las b�squedas de estas secciones:
    proyectos: pueden andar ingenieros con experiencia y tambi�n
    abogados j�venes.

        puedeAndar(proyectos, P):- ingeniero(P) , conExperiencia(P).
        puedeAndar(proyectos, P):- abogado(P) , joven(P).

    log�stica: pueden andar profesionales que o bien sean j�venes o bien
    hayan trabajado en Omni.

        puedeAndar(logistica, P):- profesional(P), joven(P).
        puedeAndar(logistica, P):- profesional(P), trabajoEn(P,Omni).

    e. agregar postulantes tales que uno pueda andar para proyectos pero
    no para log�stica.

    ingeniero(pepe).
    trabajoEn(pepe, acme).

    otro pueda andar para ventas pero no para contadur�a.

    puedeAndar(ventas,lucia).



  Ejercicio 2 La siguiente es la n�mina de personal de una empresa:
    � Departamento de ventas: empleada Mar�a, cadetes Juan y Roque
    � Departamento de compras: empleada Nora, cadete Pedro
    � Departamento de administraci�n: empleados Felipe y Hugo, cadete
    Ana.
    Escribir un programa Prolog que modele a esta empresa, tal que
    puedan responderse las siguientes consultas :
    � �qui�nes trabajan en el departamento de compras? �y en el de
    ventas?
    � dadas dos personas, �trabajan en el mismo departamento?
    � dadas dos personas a y b, �puede a darle �rdenes a b? Decimos que a
    puede darle �rdenes a b si y s�lo si trabajan en el mismo
    departamento y a tiene un cargo superior a b. Se considera que
    �empleado� es un cargo superior a �cadete�.
*/

esEmpleado(maria).
esEmpleado(nora).
esEmpleado(felipe).
esEmpleado(hugo).

esCadete(juan).
esCadete(roque).
esCadete(pedro).
esCadete(ana).

trabajaEn(ventas, maria).
trabajaEn(ventas, juan).
trabajaEn(ventas, roque).

trabajaEn(compras, nora).
trabajaEn(compras, pedro).

trabajaEn(administracion, felipe).
trabajaEn(administracion, hugo).
trabajaEn(administracion, ana).

mismoDpto(X,Y):- trabajaEn(D, X), trabajaEn(D, Y), Y\=X.

esSuperior(A,B):- esEmpleado(A), esCadete(B).

daOrden(A,B):- mismoDpto(A,B), esSuperior(A,B).

/*
    Ejercicio 3 Escribir un programa Prolog que responda consultas
    acerca de cu�les son los rivales de una determinada selecci�n en un
    campeonato mundial. Una selecci�n tiene como rivales todos los otros
    equipos de su mismo grupo (�nunca contra s� misma!). Incluir en el
    programa la siguiente informaci�n:
    � El grupo A est� formado por Colombia, Camer�n, Jamaica e Italia.
    � El grupo B est� formado por Argentina, Nigeria, Jap�n y Escocia.
    El programa debe ser capaz de responder, p.ej., a la siguiente
    consulta: �cu�les son los rivales de Argentina? otorgando como
    respuestas "Nigeria", "Jap�n" y "Escocia". */

grupo(a, colombia).
grupo(a, camerun).
grupo(a, jamaica).
grupo(a, italia).
grupo(b, argentina).
grupo(b, nigeria).
grupo(b, japon).
grupo(b, escocia).

esRival(A, B):- grupo(E, A), grupo(E, B), A\=B.

