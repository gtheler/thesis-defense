 
# 1. Introducción

Yo crecí en los noventa, donde todo daba vueltas alrededor de la televisión.
Un día estaba yo mirando "El contra".

## Calabró

El invitado era un director técnico de fútbol, no recuerdo quién.
En un momento, Calabró pregunta:

"Supongamos que van 45 minutos del segundo tiempo. ¿Qué preferiría? ¿Un córner o un lateral a favor?"

"¿Pero qué pregunta es esa?"---responde rápido Carrizo sin dejar hablar al DT.
"Con un córner uno tiene la posibilidad de llegar al área rival."

"Lo que pasa es que allá en Villa Dálmine"---explica Calabró---"durante la semana nosotros entrenamos laterales con sandías."

[pausa]

"Cuando el fin de semana agarramos una pelota, ¿sabés hasta dónde tiramos los laterales?"

[pausa]

Bueno, esa idea de entrenar laterales con sandías que escuché cuando tenía 10 años me empezó a perseguir.

## IB 2004

Diez años después estaba entrenando laterales con sandías en el IB.

## Electrón

Bueno.

## Lazo

Acá estoy entrenando laterales con mi tesis de grado sobre lazos de convección natural caóticos en una etapa académica.

## TECNA

Después de la maestría me dediqué a meter las narices en temas de licenciamimento de Atucha II en un etapa industrial de mi carrera profesional.

## Cites

Después de la criticidad, me pasé a temas de startups.
A veces yo le daba cheques gigantes a emprendedores desde CITES.

## BNA

Y a veces era yo el que pedía cheques. 

## Mafalda

Esta tesis es excepcional en el sentido de que fue atípica, una excepción a la receta tradicional.
En lo que voy a contar hay quince años de lecciones aprendidas provenientes de estos tres ámbitos: academia, industria y emprendedurismo.
Justamente este largo tiempo me permitió poder separar, como dice Mafalda, lo urgente de lo importante.

---
2 min
---

## TOC

Primero que nada, si hubiese podido escribir la tesis en inglés el título habría sido "a cloud-first approach for solving core-level neutron transport over unstructured grids."

Pero no encontré una buena traducción, así que elegí "transporte de neutrones en la nube" que indica explícitamente que el contenido de la tesis es una mezcla de 

 i. física de reactores a nivel de núcleo, y
 ii. programación tipo high-performance

La tesis está dividida en cinco capítulos más algunos apéndices (que sí están en inglés).
En en el primero explico el "why", en los dos siguientes el "how" y en los últimos dos el "what".
El "why" es un tanto subjetivo, si me permiten.
En el "how" no hay nada nuevo, es todo conocido.
La contribución original aparece recién en el "what".

---
3 min
---


## Why

Empecemos entonces con el "why".


### Diseño de software de cálculo

Consideremos esta tabla de un paper de 1965.
El título del paper es, justamente "Desarrollos recientes en computadoras y sus _consecuencias_ para el cálculo de reactores"

[pausa para que miren la tabla]

Tenemos que hacer el ejercicio mental de viajar 60 años al pasado y entender estos números.

Dejemos de lado consideraciones sobre arquitectura, lenguajes, compiladores, etc.
Pensemos en cómo había que diseñar el software de cálculo desde el punto de vista de ingeniería en aquella época.

Desde un punto de vista de costos, cada resultado calculado tiene que formar parte de la salida.
Porque si te gastás varios miles de dólares para hacer una corrida y después necesitás un número que no está en los papeles que imprimió el aparato, tenés que volver a pagar para calcularlo de nuevo.

Pero si viajamos de nuevo "back to the future", resulta que lo caro ahora es la hora de ingeniería y no la hora de CPU.
No tiene ningún sentido hacer que el calculista tenga que buscar la aguja que necesita en un pajar de números innecesarios.

[pausa]

Así y todo, la mayoría del software de cálculo en general y de reactores en particular, sigue sacando megas de salidas.
Aún cuando desde hace varios años tenemos libros como este, "The Art of Unix Programming" (que es un juego de palabras sobre este otro libro de Donald Knuth "The Art of Computer Programming") que sintetizan un montón de lecciones aprendidas en tema de diseño de software.

## 

Entre ellas, la "regla del silencio".

[silencio]

---
5 min
---

## Historia de dos reactores

Pasemos ahora a la otra mitad.

Supongamos que tenemos un reactor con un diseño medio único, ya licenciado y que está operando.
Después aparece otro reactor medio parecido, un poco más grande pero que hay que licenciar.
Bueno, las partes más sensibles hay que contratarlas afuera porque no tenemos ciertas capacidades de ingeniería.
Y aunque alguna vez las hayamos tenido, las perdimos por el camino.

Fair enough.

De todas maneras, metemos un poco las narices en el proceso de licenciamiento del reactor nuevo.

Fantástico.

Se licencia el reactor nuevo pero resulta que hay que re-licenciar el viejo.
Y ahora sí tenemos las capacidades.
De hecho, si me apurás, te digo que teníamos más capacidad que los "expertos internacionales".
Pero esa es discusión para otro momento.


## Esquema de dos paso

Long story short: tenemos que modelar la inyección de rápida de boro del segundo sistema de shutdown.

Primer esquema.

 1. calculamos la pluma de boro en el tanque del moderador con CFD, la metemos en un código de núcleo y tenemos una curva de reactividad vs. tiempo
 2. metemos esa curva en un código de planta acoplado con control y protección y vemos qué pasa.
 
## Esquema acoplado

Segundo esquema.

Calculamos la pluma de boro en el tanque del moderador con CFD, la metemos en un código de núcleo cinético-espacial acoplado con el código de planta y la lógica de control y protección.


## Elipse

En cualquiera de los dos casos, tenemos que hacer CFD primero y meter la pluma de boro en la neutrónica.
Así que prestemos atención a esa parte.

---
6 min 30 seg
---

## Canales

Sea Atucha o sea Embalse, en Argentina tenemos 

 1. canales cilíndricos
 2. moderador separado del refrigerante.

Así que la pluma va a rodear los canales.
El boro no se va a meter en el refrigerante, mucho menos en el combustible.

## Dominio

Cuando tenemos que discretizar una geometría curva como esta,
si queremos usar una malla estructurada como esta,
nos vamos a topar con un "stair-case effect" como este.

Por otro lado, si usamos mallas no estructuradas, bueno vamos a tener algún error pero para la misma cantidad de celdas, la discretización con mallas no estructuradas es muy superior.

## Celdas estructuradas...

Pero si uno mira los códigos de núcleo, ve cosas como estas.
Esto es Atucha I "vista" desde el código de cinética espacial que nombramos antes.

[pausa]

Modelar numéricamente barras inclinadas se parece bastante a jugar con "Legos" o, para los viejos como yo, "mis ladrillitos", ¿no?

---
7 min 30 seg
---

## Celdas

¿Cómo es el enfoque?
Bueno, agarramos un canal con un poco de moderador.
Con eso condensamos las secciones eficaces a nivel de celda y las usamos a nivel de núcleo.

## Gota

Desde el punto de vista del cálculo de celda, al menos hace diez años, si queríamos ver qué pasaba al meter una gota de boro lo único que podemos hacer es repartir estas dos mil ppm en el 5% del volumen como cien ppm en toda la celda.

---
8 min
---

## CFD

Dijimos que el primer paso era hacer un cálculo tipo CFD para ver cómo evoluciona la pluma de boro en el tanque del moderador.
Bueno, esto lo hacen los que saben de fluidos con mallas no estructuradas.
Está claro que el boro no se mete en los canales. 


## Mapeo

Desde el lado de la neutrónica de núcleo, ahora tenemos que mapear para cada instante la pluma del CFD en nuestra malla estructurada.

. . .

Terminamos con cosas como estas.

[pausa]

---
8 min 30 seg
---

## Refinado

Podemos refinar un poco la malla de cálculo, pero tampoco es que el panorama mejora mucho.

## Gota

Y además, si bien en el CFD el boro _no_ se mete en el refrigerante, con el esquema de celdas el boro termina metiéndose adentro de los canales.

Además de todas las preguntas sobre la validez del esquema, surge también esta pregunta:

. . .

¿Vale usar difusión?

---
9 min
---

## Limitaciones

Resumiendo.

Tenemos limitaciones de

 1. dilución de secciones eficaces
 2. efectos staircase muy marcados
 3. validez de la aproximación de difusión
 
. . .

Entonces, ¿qué proponemos? De atrás para adelante, usar SN en lugar de difusión.
El problema es que SN escala muy rápido, especialmente en memoria.
Así que necesitamos algo paralelizable, flexible y extensible.

. . .

Para que sea paralelizable, necesitamos mallas no estructuradas, que a su vez le pega al punto dos.

Con un poco de suerte, podemos re-pensar el esquema de condensación de secciones eficaces del punto uno.

Voy a dejar de hablar generalidades y voy a pasar a un ejemplo que ilustra lo que quiero decir.


## IAEA 3D Benchmark

Seguramente conocen ustedes este benchmark 3D de 1976.

## Simetrías

Como es para PWRs, te indican que la geometría tiene simetría un cuarto y se puede mallar perfectamente con cuadraditos.
Pero si uno mira con detenimimento, resulta que tiene geometría un octavo.

. . .

El chiste es que necesitamos mallas no estructuradas para aprovecharla.

Más aún, ese reflector no debería ser así.

. . .

Debería ser así.

Fíjense cómo sacándonos del modo de pensar en "cuadraditos" podemos "ver más allá de lo evidente" como Leon-O de los Thundercats.

## IAEA SN

Así que adelantándome al capítulo de resultados, les presento el benchmark 3D de IAEA resuelto con
 
 * simetría 1/8 en lugar de 1/4,
 * reflector circular en lugar de "recortado", y
 * S$_4$ en lugar de difusión.

---
10 min 30 seg
---

 
## How


Terminado el why, pasemos al cómo hacemos todo esto. 
 
 
---
11 min
---

## Séneca

Dice Séneca en una de las cartas a su discípulo Lucilio:

"No debemos tan sólo escribir ni tan sólo leer.
Hay que acudir a la vez a lo uno y a lo otro, y combinar ambos ejercicios a fin de que, cuantos pensamientos ha recogido la lectura, los reduzca a la unidad."

Sigue, Séneca:

"Lo que comprobamos que realiza en nuestro cuerpo la naturaleza sin ninguna colaboración nuestra, es eso lo que tenemos que hacer con la lectura. Los alimentos que tomamos, mientras mantienen su propia cualidad y compactos flotan en el estómago, son una carga.
Mas cuando se ha producido su trasformación, entonces y sólo entonces, se convierten en fuerza y sangre."

## Transporte y difusión de neutrones

Bueno, este capítulo no tiene nada nuevo.
Lo escribí para que la literatura de análisis de reactores no sea una carga para mí, sino que se convierta en fuerza y sangre.

. . .

Como ustedes sabrán, yo 

 * escribo en Markdown,
 * trackeo todo con Git y
 * ---cuando me dejan---publico en Github con licencia Creative Commons.
 
Entonces---como efecto colateral de lo que propone Séneca---si alguien necesita notas para dar clase puede acceder al markdown, modificarlo y compilarlo a PDF, HTML o el formato que guste.
Martín Silva ya me dijo que va a hacer eso en sus clases.
Fede Mezio, si te sirve... be my guest!

## Ecuación de transporte

Algunos detalles.

Empiezo con la derivación de la ecuación de transporte a partir de una "contabilidad" de neutrones.

## Armónicos
 
Expando la dependencia angular de la sección eficaz de scattering en polinomios de Legendre y la dependencia angular del flujo escalar en armónicos esféricos.
 
## Transporte linealmente anisótropo
 
Con eso llego a la ecuación de transporte linealmente anisotrópico (se dice así o anisótropo?) tratando de rellenar todos los pasos intermedios que no aparecen en la literatura.
 
## Difusión

Y también tratando de rellenar los pasos intermedios, especialmente los que en los libros dicen "esto se anula", bueno, mostrando cómo es que "esto se anula" y además llegando explícitamente a estas tres condiciones para obtener la celebrada aproximación de difusión.

---
13 min 30
---
 
## Paul Graham

El siguiente capítulo es cómo discretizamos estas ecuaciones.
Al igual que el anterior, este no tiene (casi) nada nuevo.

Pero hay un par de diferencias.
La primera la explica Paul Graham.

Esencialmente dice algo parecido a Séneca, seguramente ya conociendo la cita del capítulo anterior porque Graham suele citar a Séneca en sus ensayos.
Lo que me gustó de este párrafo es el pie de pagina, donde nos recuerda que "programar" es equivalente a "escribir".

La segunda es que el menú de este capítulo es mucho más amplio que el del anterior, así que hay que elegir.

## Esquemas

La discretización en energía es bastante straightforward.
Formulación multi-grupo, que es como si fuese volúmenes finitos sin operadores diferenciales.

. . .

Discretización en ángulo.
Para transporte, revisitamos las ordenadas discretas.

## Cuadraturas de nivel simétrico

De todo el menú, nos quedamos con las cuadraturas de nivel simétrico.

Este slide es un ejemplo de algo que _no_ hay que hacer.

Como me tomó un cierto tiempo llegar al algoritmo para fabricar los triangulitos estos para un $N$ arbitrario quería mostrárselos.
Pero la verdad es que esto no tiene por qué agregarle valor a ustedes.
Ni tienen por qué apreciar el hecho de que el software funcione para un $N$ arbitrario, porque después de todo es algo que se debería dar por sentado.
Es como publicitar un hotel diciendo "las habitaciones tienen baño privado".

Pero bueno, sepan que soy consciente de _algunos_ de mis sesgos mentales.

---
15 min 30
---

## Discretización en espacio

Discretización del espacio: elementos finitos.

Empecemos con la ecuación de Poisson, que es más sencilla.

. . .

Lo primero que hacemos es escribirla en una formulación débil.

Un operador bi-lineal coercivo $a$ aplicado a $u$ y $v$ es igual a un funcional $B$ larga de $v$ corta para toda $v$ corta viviendo en algún espacio funcional $V$ corta mayúscula. 
  
## Dominio

Todo esto sobre un dominio $U$ con una frontera con condición de Neumann sobre $\Gamma_N$ y condición de Dirichlet _homogénea_ sobre $\Gamma_D$.
Empezamos con Dirichlet homogénea y después les cuento cómo pasar a Dirichlet arbitraria.

## Nodos

Siguiente paso, ponemos nodos sobre el seno del dominio y sobre la frontera de Neumann, pero _no_ sobre la frontera de Dirichlet.

## Funciones

Después buscamos tantas funciones de forma como nodos pusimos de forma tal de que cada una valga uno en cada nodo y cero el en resto.
Esta va a ser la base del espacio vectorial aproximado donde vamos a encontrar la solución de la ecuación de Poisson que estamos resolviendo con elementos finitos.

## Elementos finitos

Para hacer esto "algorithm-friendly" ponemos puntos también sobre la frontera de Dirichlet e identificamos los triángulos (o cuadrángulos) que cubren el dominio U.
Llamamos a cada uno de estos triangulitos un "elemento", y escribimos las integrales de la formulación débil como sumas de contribuciones elementales.

---
17 min
---


## $K u = b$

Con un poco de álgebra lineal llegamos a que podemos obtener una solución de la ecuación de Poisson con elementos finitos resolviendo el sistema lineal $K$ por $u$ igual a $b$, donde $K$ es una matriz "rala" de tamaño igual al número de nodos y que tiene contribuciones de cada uno de los elementos.
Las contribuciones del elemento $i$-ésimo tienen esta pinta.

Una parte viene de la integración numérica y otra parte viene de la discretización del operador $a$ sobre la matriz de rigidez $K$ y del funcional $B$ larga grande sobre el vector del miembro derecho $b$ larga chica.

. . .

Favor de notar que

 1. Nunca tuvimos que pasar por la escalerita. Todo esto funciona con mallas no estructuradas.
 2. Ese vector $u$ no es "la" solución del problema. "La" solución de elementos finitos es una función continua en el espacio que podemos evaluar en cualquier punto arbitrario.

## Extras

Dos bonus tracks.
Primero, que podemos usar elementos segundo orden. Si quieren después profundizamos.

. . .

Segundo, nos quedaron pendientes las condiciones de Dirichlet no homogéneas.
Antes había dicho que en este capítulo no hay "casi" nada nuevo. Bueno, la justificación del truco usual de poner un uno en la diagonal de la matriz de rigidez y el valor no homogéneo en la fila del vector $b$ no la pude encontrar en la bibliografía.
De hecho consulté a colegas de la empresa de software de elementos finitos donde trabajo y nadie me supo dar la justificación. Todos usaban el truco sabiendo que funciona pero habiendo olvidado el "por qué", como en el cuento de los monos.

En las páginas 124 a 126 o, mejor aún, en stack exchange está mi justificación matemática.
De hecho mi respuesta es la segunda más votada (despúes de la primera que es de Jed Brown).

[pausa]

---
18 min 30 seg
---

## Difusión

Haciendo lo mismo que hicimos para Poisson pero para difusión multigrupo llegamos a unas expresiones para las contribuciones elementales.
Los detalles en el capítulo tres, pero dos cosas

 1. $L$ es leakage, $A$ es absorción y $F$ es fisión, abajo $s$ son las fuentes independientes
 2. Fíjense que la forma es parecida al caso de Poisson.

Medio que es esperable, ¿no? Porque el operador $a$ es elíptico en los dos casos.
De todas maneras en difusión, el operador no es simétrico y puede llegar a no ser coercivo.


## Transporte

Podemos hacer lo mismo con ordenadas discretas.

Otra vez, la forma es parecida pero

 1. El operador $a$ no es elíptico.
 2. La ecuación es hiperbólica de primer orden.

Así que es matriz $P$ que aparece en las matrices de pérdidas, absorciones y fisiones es una matriz estabilizada tipo Petrov-Galerkin.
Más detalles en el texto.

## Estado estacionario

¿Qué hacemos con todo esto?
Bueno, depende de qué tipo de problema estemos queriendo resolver.

 1. Si tenemos medio no multiplicativo con fuentes independientes, las pérdidas y las absorciones son proporcionales al flujo y las fuentes son, justamente, independientes. Esto da un problema lineal.

 2. Si tenemos medio multiplicativo con fuentes independientes, tenemos que agregar un término de fisiones proporcional al flujo. En lugar de ponerlo el el miembro derecho lo pasamos al izquierdo con signo negativo. Otra vez, problema lineal.
 
 3. Ahora, si no hay fuentes independientes entonces todo es proporcional al flujo. Volvemos a mandar las fisiones al miembro derecho y resolvemos un problema de autovalores para encontrar el $k_\text{eff}$ del reactor crítico asociado en $k$. El primer autovector nos da el flujo de estado estacionario.
 
. . .

Ya sé lo que están pensando. ¿Qué pasa en el caso no lineal?
Bueno, hay que hacer Newton Raphson y la cosa se complica un poco.
Pero por ahora no nos vamos a meter en eso y damos por terminado el how.

---
20 min
---


### Observación

Observación. Este trabajo sólo se enfoca en el desarrollo de la herramienta necesaria para realizar la
comparación. Un estudio cuantitativo de la eficiencia de diferentes esquemas numéricos para hacer
ingeniería neutrónica de núcleo implicaría un proyecto de ingeniería de varios hombre-años más
sus costos asociados. En la sección 7.1 listamos algunos de los trabajos futuros que podría derivar
de las bases sentadas en esta tesis.


## Neutrónica de núcleo de un PHWR

TECNA

matías rivero
chaboncito pellegrino
juan pablo gomez omil
ramiro vignolo
guido giuntoli
el enano tarazaga


# How

## Transporte y difusión de neutrones

Dice Séneca en una de sus cartas a Lucilio:

> No debemos tan sólo escribir ni tan sólo leer.
> Hay que acudir a la vez a lo uno y a lo otro, y combinar ambos ejercicios a fin de que, cuantos pensamientos ha recogido la lectura, los reduzca a la unidad.
> [...] Debemos actuar como las abejas. Las abejas revolotean de aquí para allá y van comiendo en las flores idóneas para elaborar la miel.
> El botín conseguido lo ordenan y distribuyen por los panales.
> Te recuerdo que también nosotros tenemos que imitar a las abejas y distinguir cuántas ideas acumulamos de diversas lecturas, pues se conservan mejor diferenciadas.
> Luego, aplicando la atención y los recursos de nuestro ingenio, debemos fundir en sabor único aquellos diversos jugos de suerte que aún cuando se muestre el modelo del que han sido tomados, no obstante, aparezca distinto de la fuente de inspiración.
> [...]
> Lo que comprobamos que realiza en nuestro cuerpo la naturaleza sin ninguna colaboración nuestra, es eso lo que tenemos que hacer con la lectura. Los alimentos que tomamos, mientras mantienen su propia cualidad y compactos flotan en el estómago, son una carga.
> Mas cuando se ha producido su trasformación, entonces y sólo entonces, se convierten en fuerza y sangre.
> Procuremos otro tanto con los alimentos que nutren nuestro espíritu.
> No permitamos que queden intactos cuántos hayamos ingerido para que no resulten ajenos a nosotros.
> Asimilémoslos. De otra suerte, irán al acervo de la memoria y no al de la inteligencia.
> [...]
> Prestémosle fiel asentimiento y apropiémonos de [lo que leemos] para que resulte una cierta unidad de muchos elementos.
> [...]
> Aunque se aprecie en tí la semejanza con algún maestro que ha calado profundamente en tu alma por la admiración, quiero que te asemejes a él como un hijo, no como un retrato.
> [...]
> ¿Cómo lograr esto te preguntas? Con una constante aplicación.
>
> _Lucio Séneca, Carta a Lucilio sobre la importancia de escribir, siglo I d.C._




en la parte de los maestros
beckurts
lewis
duderstadt
rudy stammler & maximo abbate

esto queda en markdown, latex, epub con licencia CC-BY


This license enables reusers to distribute, remix, adapt, and build upon the material in any medium or format, so long as attribution is given to the creator. The license allows for commercial use. CC BY includes the following elements:

BY: credit must be given to the creator.



## Esquemas de discretización numérica


Paul Graham: lo mismo que séneca pero con lenguajes de programación

Paul Graham puso YC con la plata que ganó de venderle a Yahoo el primer producto SaaS en 1998. No sólo lo hizo antes que nadie, sino que lo escribió en LISP. Según él nabía otros competidores pero en 1997 todos (incluso yo) usaban CGI-BINs escritos en C. Según él, LISP le permitió hacerlo más rápido y mejor que los demás.
Para que vayan tomándole el peso lo que no lo conocen, es un ñato que explica temas de filosofía con regular expressions.


Anyway, Paul Graham dice algo parecido a Seneca, de hecho cita sus cartas a Lucilio. Dice Graham escribir las ideas hace que uno se dé cuenta de que lo que le falta y de cómo rellenar esos gaps. Hablar ayuda pero el esfuerzo de escribir donde no hay tonos de voz y uno no puede extenderse en longitud es más estricto. Pero dice además, en una nota al pie "Machinery and circuits are formal languages."
Esto es, hasta que uno no programa la idea, no se da cuenta de la incompletitud de la idea.

NO: Para entender la recursividad primero hay que entender la recursividad

Este capítulo tiene los métodos numéricos particulares que elegí implementar en FeenoX:

 - multigrupo
 - SN
 - FEM
 
No es que un primero se sienta a escribir en markdown o en latex la derivación de las ecuaciones discretizdas y después escribe el código para implementarlarlas. Como dice Paul Graham, uno programa para encausar todos sus pensamientos y, una vez que el solver más o menos funciona, recién ahí uno escribe las ecuaciones que implementó y que sabe que más o menos funciona.
Este capítulo es exactamente eso: una combinación de desarollos y referencias que hace que el solver funcione más o menos bien arreglados en un hilo razonablemente encausador.

Podríamos decir que hay una sola contribución original: el manejo de condiciones de contorno de Dirichlet no homogéneas.


mostrar contribuciones elementales

¿Se entiende? Bueno, terminó el how, pasemos al what.


# What


## Implementación computacional

 - la bicicleta resuelve problemas que no existían cuando fue creada, pero no vamos a hablar de bicicleras aún cuando sus ecuaxiomes de movimwimto sean re interesantes,
pegunta qué otra cosa resuelve problemas

los que me conocen o leyeron la tesis, qué viene acá?, unix

Jon https://www.youtube.com/watch?v=QflVqavHHM0

stallman: the best way to solve a problem is to avoid it in the first place
libraries paths


C
shell scripts
eveything is a file
syscalls
I/O
sockets
telnet/ssh
nfs
dir structure
docker


Volviendo al ambiente de startups, finalmente me dieron el cheque gigante.
Era época de IB50k, de consultoría en temas de fatiga en piping de CNE, de vacaciones en Cancún, incluso Alejandro se acordará pero retomé el tema del doctorado y fui "re-inscripto" pero en 2018 mi nene se enfermó y tuve que cancelar todo.

A la vuelta estaba en Pampa y la vía, así que tuve que aprender cosas nuevas.
SRS/SDS





mientras tanto en ese año el licenciamiento de cna2 se hacía con fortran77 compilado con compaq visual fortran para windows porque eso era lo que la arn había validado (relap)
wims en f77 para windows

el codigo de nucleo estaba en un lenguaje buscar historia de pl-1 para windows

todo se corría en wine
buscar cita de knuth sobre too much effort on emulators
cita matt knepley get away from windows


how was life before git? hg bzr svn cvs
horrible!

how was life before markdown & git?
word

how was life before feenox?
relap, wims, etc.
(relap 5, cené al lado de derek gaston)





## Resultados

cap 6
lolich dijo en una reuniñon de consejo académico que este instituto tenía que formar los profesionales que escriben los manuales y los otros institutos tenían que formar los que los lean
leer y escribir manuales = entender la teoria de la relatividad y descubrirla

Yo siempre pienso que estoy pensado afuera de la caja. Y veo que hay otros adentro de la caja.
Pero a veces veo que yo estoy adentro de la caja, y hay otros que están afuera.
Y peor aún, a veces veo que el que yo pensaba que estaba adentro, está afuera.



Elegir algunos, preguntar cuáles
5 min por problema


## Conclusiones

 * como descartes, esto es lo que me sirve a mí, si a alguien más le sirve y quiere agregar cosas al manual, be my guest

## Tweets 

## Trabajos futuros


Dejo el sendero de jardines que se bifurcan de trabajos futuros, con el anhelo de que no queden simplemente en "nice to haves".
¿Cómo hacemos todo esto? Como le explica Séneca a Lucilio: "con una constante dedicación".
Porque si cuando estás haciendo consultoría y te está yendo relativamente bien, llegara a venir un cisne negro como dice Taleb y te cambia la número cinco por una bola de bowling, si le hiciste caso a Calabró y entrenaste laterales con sandías, tal vez te quede resto y puedas terminar una tesis de doctorado a los 41 años y volver a Cancún con tu familia. Muchas gracias.




# Apéndices

# JOSS

# Dirichlet BCs


# Inglés

Pensar en inglés te hace esforzarte más y se te activan áreas cognitivas del cerebro que no se activan si pensás y escribís en castellano.

# What does FeenoX mean



