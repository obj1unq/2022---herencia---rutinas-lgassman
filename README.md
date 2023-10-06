# Rutinas deportivas

Este es un sistema que busca calcular como las rutinas de ejercicios
impactan en el peso de las personas.


## 1. Rutinas


**Requerimiento** De una rutina se espera poder calcular cuantas calorías quema durante el 
tiempo que se practique.


En este sistema se contemplan 4 tipos de rutina: Running, Maratón, Remo y Remo
de competición.

Independiente de cual es la rutina, siempre la fórmula para saber cuántas
calorías baja una rutina depende del tiempo que se practique  y una intensidad
con la siguiente fórmula:

- `100 * (tiempo - descanso) * intensidad`

- El tiempo es algo que siempre se le dice a la rutina al momento de consultar cuantas calorías quema

- El descanso y la intensidad dependerá del caso según se detalla:


### Running

- La intensidad se establece para cada rutina en especial
- El descanso es de 5 minutos si el tiempo es mayor a 20, si no 2.

**Ejemplo:** **correr en la playa** es una actividad de running de intensidad 1.2
- Al practicarse por 5 minutos quemará `100 * (5 -2) * 1.2 = 360`
- Al practicarse por 90 minutos quemará `100 * (90-5) * 1.2 = 10200`

## Maratón
Es un tipo especial de Running con la siguiente diferencia:

- Las calorías que gasta siempre es el doble de una rutina de running común

**Ejemplo:** *la maraton de ba** es una maraton de intensidad 1.2
- Al practicarse por 5 minutos quemará `(100 * (5 -2) * 1.5) * 2 = 900`
- Al practicarse por 90 minutos quemará `(100 * (90-5) * 1.5) * 2 = 25500`
 
### Remo

- La intensidad es siempre 1.3
- El descanso es tiempo / 5

**Ejemplo:** **remar en el delta** es una actividad de remo 
- Al practicarse por 5 minutos quemará `100 * (5 - (5 /5)) * 1.3 = 520`
- Al practicarse por 90 minutos quemará `100 * (90 - (90/5)) * 1.3 = 9360`

## Remo de competición

Es un tipo especial de Remo con las siguientes diferencias:

- La intensidad es siempre 1.7
- El descanso son 3 minutos menos de lo que se descansa en una rutina de remo normal. Pero
ojo, si ese valor es menor a 2, entonces es 2 (Tip: usar el método max de los números)

**Ejemplo:** **remar en el camino de los remeroes** es una actividad de remo de competición 
- Al practicarse por 5 minutos quemará `100 * (5 - 2) * 1.7 = 510`
- Al practicarse por 90 minutos quemará `100 * (90 - ((90/5) - 3) ) * 1.7 = 12750`


## 2. Personas

Las personas hacen distintas rutinas de ejercicios. 

El tiempo que ejercitan una rutina depende del tipo de persona en cuestión

Cuidado, no siempre pueden hacer una rutina, cada tipo de persona tiene su regla 

Cuando realizan una rutina su peso baja una cantidad de kilos 
que dependerá de la cantidad de calorías que quema la rutina durante el tiempo 
en que la persona la practica, y de la cantidad de kilos por caloría que 
que depende tipo de persona:

Peso que pierde al hacer una rutina: `calorias que baja la rutina en el tiempo que la practica / kilosPorCaloríaQuePierde `

Mientras que la primera parte de la fórmula se resolvió en el punto anterior, la segunda se detalla
para cada tipo de persona:

**Requerimientos**:
- Saber cuanto peso perdería una persona al aplicar una rutina
- Que una persona aplique una rutina alterando su peso
 
### Personas sedentarias:

- La cantidad de kilosPorCaloría de las personas sedentarias es 7000

- El tiempo que ejercita una rutina se establece para cada persona sedentaria

- solo aplican una rutina si su peso es mayor a 50

**Ejemplos**
 
 Calamardo es una persona sedentaria de peso 60 y usa 5 minutos por rutina
 
 
 Al practicar las rutinas del punto anterior peso final es:

  - Correr en la playa: `60 - (360/7000) = 59.948 ` 
  - Correr la Maraton de BA: `60 - (900/7000) = 59.871` 
  - Remar en el delta: `60 - (520/7000) = 59.925`
  - Remar en el camino de los remeros: `60 - (510/7000) = 59.927`
  
  Pero si le cambiamos el peso a calamardo para que sea 40, entonces
  no podría practicar ninguna de esas rutinas, por ejemplo correr en la playa
  y el peso se mantendría en 40.
  
 *Nota:* Todos los resultados estan truncados a 3 decimales. usar `miNumero.truncate(3)` en los tests 

### Personas atletas

Las personas atletas tienen una variación en su fórmula para
calcular el peso al practicar una rutina, porque siempre pierden
un kilo menos que el resto de las personas 

- Formula de peso que se pierde al hacer una rutina: ` (calorias que baja la rutina / kilosPorCaloría) - 1 ` 
*Nota:* La primera parte es igual que la fórmula para todas las personas

- La cantidad de kilosPorCaloría de las personas atletas es 8000

- El tiempo que ejercita una rutina es siempre 90.

- Solo realizan una rutina si las calorías que consumiría al realizarla es mayor a 10000

**Ejemplos**:

Bob es una persona atleta de peso 40 

Al practicar las rutinas del punto anterior peso final es:

  - Correr en la playa: `40 - ((10200/8000) - 1)  = 39.725` 
  - Correr la Maraton de BA: `40 - ((25500/8000) - 1) = 37.812` 
  - Remar en el delta: No se puede porque las calorías de esta rutina es menor a 10000, el peso se mantiene en 40
  - Remar en el camino de los remeros: `40 - ((12750/8000) - 1) = 39.406`
*Nota:* Todos los resultados estan truncados a 3 decimales. usar `miNumero.truncate(3)` en los tests 

## Clubes

Un **club** tiene varios predios
De un **predio** se conoce las rutinas que se pueden practicar
Se pide:

- El mejor predio de un club para una persona: Es la sucursal que más calorías le 
haría quemar a esa persona si ésta practicara todas las rutinas una vez

- Los predios tranquis de un club  para una persona: Es el conjunto de predios que tienen al menos
una rutina que le hace perder menos de 500 calorias a la persona

- Las rutinas más exigentes del club para una persona: Es el conjunto
formado por la rutina más exigente de cada predio para esa persona. La rutina más 
exigente es la que más calorías le hace quemar a esa persona

** Ejemplos ** 
 
El **club barrial** tiene dos predios. El **náutico**, desde dónde
se puede remar en el delta y en el camino de los remeros, y 
el **recreo**, dónde se puede correr por la playa y correr la maratón
de buenos aires.


- El mejor predio del club barrial para bob es el **recreo**. Ya que le
hace gastar 35700 mientras que náutico le hace gastar 22110

- El mejor predio del club barrial para calamardo es el **recreo**. Ya que le
hace gastar 1260 mientras que náutico le hace gastar 1030

- Para bob no hay predios tranquis en el club barrial, 

- Para calamardo, el conjunto de predios tranquis solo tiene a el recreo, ya que ahí puede correr por 
la playa gastando solo 360 calorías 

-para bob las rutinas más exigentes del club barrial
son la maratón de buenos aires y remar en el camino de los remeros.

-para calamardo  las rutinas más exigentes del club barrial
son la maratón de buenos aires y remar en el delta.


