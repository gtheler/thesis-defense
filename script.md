



 
## Intro

Calabró.
Mecánica & electrón.
Loop.
Tecna.
Cites.
Seamplex.



## Mafalda

El desarrollo que voy a contar tiene más de una decena de años de lecciones aprendidas.
Esta tesis excepcional (en el sentido de que fue atípica en palabras de Christian) no aparece ligada a ninguno de estos tres ámbitos.
Pero sí haber trabajado profesionalmente en temas académdicos, industriales y de emprendedurismo me permitió tomarme el tiempo para poder separar, como dice Mafalda, lo urgente de lo importante.

Mi anhelo es que todo este trabajo que voy a contar no quede en otra lista de TO-DOs y que los trabajos futuros que lo voy a contar a continuación desencadene no queden en "nice to have"s.

---


Esta es una tesis

 * excepcional en el sentido de que es la excepción, de que es atípica
 * escrita durante los fines de semana (e incluso me tomé unos días de vacaciones en Las Vegas)
 * por un profesional (en el sentido de que me pagan para programar software de elementos finitos) de la industria del software de cálculo que pasó también profesionalmente por estos tres entornos.
 
Esto me permite tomarme el tiempo para, como dice Mafalda, poder separar "lo urgente" de "lo importante".


## TOC

El contenido de la tesis es una mezcla de 

 i. física de reactores a nivel de núcleo
 ii. programación en HPC


que justamente son las dos mitades del título.
Está dividida en cinco capítulos donde en el primero explico el "why", en los dos siguientes el "how" y en los últimos dos el "what".
El why es un tanto subjetivo.
El how es ya conocido.
La contribución original aparece recién en el what.


## Why


### Diseño de software de cálculo

Consideremos esta tabla de un paper de 1965 sobre computadoras para cálculo de reactores.



En CNA2 se usaba software diseñado con este paradigma.
Pero era una base de diseño implícita. O al menos yo nunca vi ninguna documentación que explique el rationale de ciertas decisiones de diseño.
Hay que adivinarlas y, pero aún, aceptarlas.


### IAEA 3D Benchmark

Voy a dejar de hablar generalidades y voy a pasar a un ejemplo que ilustra lo que quiero decir.





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


## Conclusiones y trabajos futuros

 * como descartes, esto es lo que me sirve a mí, si a alguien más le sirve y quiere agregar cosas al manual, be my guest

Dejo el sendero de jardines que se bifurcan de trabajos futuros, con el anhelo de que no queden simplemente en "nice to haves".
¿Cómo hacemos todo esto? Como le explica Séneca a Lucilio: "con dedicación y esfuerzo".
Porque si cuando estás haciendo consultoría y te está yendo relativamente bien, llegara a venir un cisne negro como dice Taleb y te cambia la número cinco por una bola de bowling, si le hiciste caso a Calabró y entrenaste laterales con sandías, tal vez te quede resto y puedas terminar una tesis de doctorado a los 41 años y volver a Cancún con tu familia. Muchas gracias.




# Apéndices

# JOSS

# Dirichlet BCs


# Inglés

Pensar en inglés te hace esforzarte más y se te activan áreas cognitivas del cerebro que no se activan si pensás y escribís en castellano.



