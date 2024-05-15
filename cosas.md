# Capítulos

 1. piñón + motivación
     - inicio
     - link
     - desarrollo
     - final
     - tweet
    
 2. séneca + markdown para dar clases
 3. paul graham: lo mismo que séneca pero con "machinery"
    - SRS/SDS
    - meter foto cancún 2018
 4. historia de unix y jon hirstick
    - bien técnico y aburrido, terciopelo negro
 5. escribir manuales != leer manuales
    - accediendo a gentiles pedidos mostrar algún caso
    - o hacer un gdb?
 6. lo que sea pero terminar up in the sky con la foto en cancun 2024

# Llevar

 * Libro Unix
 * Libro TAOCP
 * botella de auga
 * pasador de slides
 * kde connect pasador y apuntador
 * cronómetro
 * agrandar terminal
 * ir al baño antes
 * apagar whatsapp
 * configurar okular, no progress
 * premio para el que sepa los nombres de ken & ritchie

 
# Averiguar

 * micrófano
 * proyector
 * red, internet
 * HDMI
 * a qué hora ir
 * zoom, cámara
 * biblioteca, impresión de las tesis
 
 
 
# Ideas
 
 * usar objetos! el libro de raymond y el de knuth
 * props
   a. objetivo: hace mejor la charla
   b. subjetivo: te hace tener más confianza a vos
 * regalar dos tazas
 * en front cover poner mazes y domain staircase
   
   
    
    
    
    
# Cosas 1


 * practicar con Ezequiel
 * en CITES?
 * lo más divertido tiene que estar en el min 27-28 ($1/\phi \cdot 45$)
 * entrar con un piñón pero dejar respirar
 * contar una historia para presentarse uno
 * hacer un relieve: _hablar rápido para pasar de largo lo que no es importante_ y **despacio para lo importante**
 * el aplauso es al final, no a la charla: eso es lo que recuerdan
 * el reloj de la oratoria, cuál es el tweet que uno quisiera que algún asistente escriba?
   - comienzo
   - link
   - desarrollo
   - final
 * el arte de la oratoria consiste en que no se note el arte
 * enmarcar en una historia
 * contar pequeñas historias, dar recreos de lo pesado
 * conectar el contenido conmigo para después conectarlo con la audiencia
 * hablar antes y preguntar qué casos quieren ver
 * llevar tiempo con watch o con algo que no vean que voy mirando?

 
## Hábitos

 1. tener un anecdotario
 2. usar los recursos que queremos incorporar en las charlas en las conversaciones cotidianas, por ejemplo practicar contar historias o hacer pausas de suspenso
 3. incorporar recursos de otros
 4. introspección como audiencia
 5. elegir un objetivo puntual por año
 6. tener un sparring
 7. tomarlo de manera lúdica


## Cosas 2



The cloud: somebody else's computer(s).



Hacer lo que hizo el que contaba lo de xuxa con esto:
 
En estos tiempos, lo mejor que les puede traer para Papá Noel a los chicos son celulares, tablets y sets de realidad virtual.
Cuando _yo_ era chico, allá en los 90, todo pasaba alrededor de la televisión.
Así que lo mejor que te podía traer Papá Noel era un televisor para tu pieza. Y eso me pasó a mi.

Carrizo y Calabró tenían un programa que ahora de grande y con el diario del lunes, juzgo excepcional:
"El Contra", en el que Carrizo entrevistaba a un invitado y Calabró se metía y llevaba la contra.
No era de mis preferidos a mis 10 años, pero cada tanto lo veía.

Un día el invitado era un director técnico de fútbol---no recuerdo quién---y Calabró pregunta: "Suponga que van 45 del segundo tiempo. ¿Usted prefiere tener a favor un córner o un lateral?"
"¡¿Pero qué pregunta es esa?!" se indiga Carrizo. "Con un córner puede llegar al área, con un lateral no".
"Lo que pasa es que allá en Villa Dálmine, nosotros entrenamos laterales con sandías. Cuando llega el fin de semana, ¿sabés hasta dónde tiramos la pelota?"

Bueno, la plantas entrenan laterales con sandías.
Aunque Christián le haya dejado de prestar atención, la capacidad extra que esa plantita desarrolló practicando "un poco más" de lo necesario fue lo que le permitió volver a florecer.



Desde ese momento a mis 10 u 11 años, me propuse entrenar laterales con sandías.

Nunca pude encontrar la escena en Youtube.

 
 
### SRS/SDS


¿contar historia de max para llegar al SRS/SDS?
NO! más tarde

Dentro de mi experiencia profesional, en algún momento tuve que hacer un desarollo para una empresa de Suiza muy interesante.
Era sobre temas de cálculo mecánico por elementos finitos, pero el requerimiento vino por el departamento de IT y no por el departamento de ingeniería mecánica.

Nosotros tenemos el sesgo de disponibilidad donde acá en el IB la gente sabe tanto de mecánica como de programación, en particular _buenas prácticas_ de programación. Pero si uno sale a la naturaleza, en general, los que saben de mecánica no saben qué es Git y los que saben de IT no saben qué es una tensión principal. Incluso hasta parece que hablaran idiomas diferentes.
En particular estos dos departamentos se llevaban mal entre sí así que terminé siendo yo el que traducía lo que querían decirse a un idioma común que entendiéramos todos.
Lo importante es que como la negociación del alcance técnico del proyecto fue con el departamento de IT y no del de mecánica, ellos estaban acostumbrados a usar un esquema muy útil pero que para mí era nuevo: el del Software Design Requirements y Software Design Specifications.
Son dos documentos, con algunas secciones más o menos estándar.
El primero lo escribe el cliente, con los _requerimientos_ que tiene que tener el software a desarrollar.
El segundo lo escribe el proveedor, explicando explícitamente cómo piensa cumplir con los requerimientos del cliente.
Una vez que se ponen de acuerdo, comienza el proyecto.


Entonces me propuse escribir un SRS tal que, tomando las lecciones aprendidas en los tres ámbitos por los que pasé, defina qué requerimientos debería satisfacer una herramienta de mecánica computacional para resolver problemas de ingeniería.
E inmediatamente después me crucé del otro lado del mostrador y empecé a escribir no sólo la implementación de esa herramienta computacional sino---al mismo tiempo---el SDS explicando por qué la diseñé e implementé como les voy a contar suscintamente.
Es decir, escribí tanto el pliego como la oferta. No debería ser así, pero bueno, estuve en varias licitaciones...

En el apéndice A está el SRS y en el B el SDS con todos los detalles.







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
