---
title: Transporte de neutrones en la nube
numbersections: true
...
 
# Prolegómeno

Yo crecí en los noventa, donde todo daba vueltas alrededor de la televisión.

## Calabró

Estos dos monstruos tenían un programa llamado "El contra".
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

Diez años después estaba entrenando laterales con sandías en la clase de mecánica de Barrachina.

## Electrón

Bueno.

## Lazo

Acá estoy entrenando laterales en mi tesis de grado sobre lazos de convección natural caóticos en una etapa académica.

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


## Cien años de programación

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

## Unix rule of silence

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


## Esquema de dos pasos

Long story short: tenemos que modelar la inyección de rápida de boro del segundo sistema de shutdown.

Como la fluidodinámica está desacoplada del resto de la planta durante el par de segundos que dura la inyección, un primer esquema es...

 1. calculamos la pluma de boro en el tanque del moderador con CFD, la metemos en un código de núcleo y tenemos una curva de reactividad vs. tiempo
 2. metemos esa curva en un código de planta acoplado con control y protección y vemos qué pasa.
 
## Esquema acoplado

Segundo esquema.

Calculamos la pluma de boro en el tanque del moderador con CFD, la metemos en un código de núcleo cinético-espacial acoplado con el código de planta y la lógica de control y protección.


. . .

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
 
De hecho, si prestan atención abajo a la derecha a la izquierda de la fecha hay un hash que indica qué commit generó estos slides a partir de Markdwon. En la tesis lo mismo, así que si aparece un PDF, o un HTML "in the wild" o un ejemplar impreso en la biblitoeca, el footer indica el commit.
 
Entonces---como efecto colateral de lo que propone Séneca---si alguien necesita notas para dar clases tiene la libertad de acceder al markdown y modificarlo según necesite.
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


## Ordenadas discretas

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

## What

Veamos ahora el what.

[pausa]

## Bicicleta

[pausa]

Hace un tiempo escuché que la bicicleta es un dispositivo que tiene, entre otras, la siguiente particularidad:
resuelve problemas que no existían cuando se inventó.
El tema de movilidad en grandes ciudades y toda la sarasa de la new age.
Completen con media hora de mala literatura.

## Dennis & Ken

Resulta que Unix también es un diseño que resuelve problemas que no existían cuando fue inventado.

A medidados de los 60, estos muchachos trabajaban en los laboratorios Bell.
En esa época habían desarrollado un sistema operativo medio artesanal pero que andaba bastante bien.
Entonces se metieron los gerentes y organizaron un proyecto ambicioso para hacer una segunda versión "bien pulenta".
Pero el proyecto, llamado MULTICS (siglas _multiplexed_ information and computing service) fue tan ambicioso y complejo que se estancó.
Entonces a fines de los 60 estos dos muchachos empezaron desde cero y teniendo en cuenta las lecciones aprendidas sobre lo que NO hay que hacer y ahora sí, la tercera es la vencida, diseñaron e implementaron Unix---un juego de palabras sobre MULTICS.

Y como ustedes saben, este diseño casi sin modificaciones, es lo que hace que Internet y "la nube" funcionen como lo hace hoy.
Que no es ni remotamente parecido a cómo funcionaba hace 50 años, cuando Unix fue inventado.

. . .

Abro un concurso: una taza de Atlético de Rafaela para los dos primeros que digan cómo se llaman cada uno los dos de la foto.

---
21 min 30
---

## Jon

Pero esperen, porque no les voy a contar la historia de esos dos muchachos, sino de este otro muchacho.
Acá aparece en un documental de Discovery explicando cóm hacía para contar cartas en el Blackjack cuando era estudiante de ingeniería mecánica en el MIT.
Es uno de los personajes reales de la película de Kevin Spacey.


Cuestión que en las Vegas ganó un palo y con esa guita puso una startup de software para diseño mecánico 3D.
Hasta ese momento---principios de los 90---todos los programas de este tipo funcionaban en el Unix de los barbudos de la foto anterior.
Pero este Jon sin hache sabía que otro había otro nerd que se venía con todo: Bill Gates.


## Solidworks

Vio venir que en los 90 la moda iba a ser "X para Windows", así que su programa de diseño 3D corría en Windows.
Y Solidworks pasó de tener el 0 al 90% del mercado en un par de años.
En el 97 vendió su compañía por 300 millones de dólares y se quedó como CEO, consolidando el producto.

## Onshape

Pasa el tiempo. Año 2011. Jon se da cuenta de que la tecnología está cambiando nuevamente.
Renuncia y pone otra startup de software de diseño pero ahora, "en la nube".
Digamos un Google Docs para la ingeniería mecánica.
En 2019 vende Onshape por 480 millones y se queda como CEO, consolidando el producto.

Quien la compró era una de las empresas que tenían todo en los 80 y se quedaron sin nada en los 90.
Según me contaron off the record, la compraron porque: "no quisimos que nos vuelva a pasar lo mismo".



## Nerds

En resumen, este nerd ganó 1 millón gracias a otros nerds del MIT que estudiaron la matemática del Blackjack.
Los siguientes 300 gracias al nerd Bill Gates.
Y los últimos 480 gracias a los nerds de barba que en el 70 diseñaron un sistema que hoy resuelve problemas que no existían hace más 50 años.
Como la bicicleta.

---
23 min 30
---

Cierro concurso.
¿Nombre de los últimos dos?

Entre paréntesis, Dennis Ritchie (el que está parado) se murió en 2011 la misma semana que Steve Jobs.
Así que su muerte pasó casi desapercibida. El único que dijo algo fue Ariel Torres, el columnista de La Nación.

---
24 min
---

## Cheque

Por si se lo preguntaban, resulta que sí me dieron el cheque gigante.

## IB50k, CNE, cancún

Era mi época de emprendedor, IB50k...

. . .

Si bien nunca funcionó muy bien el emprendimiento, me permitió hacer consultoría en temas de mecánica de piping para la central de embalse.

. . .

Y poder ir a Cancún con mi familia.


## Do it for him

Pero bueno, a veces las cosas no salen como uno las planea.

## 

Y la enfermedad de un hijo te puede hacer apagar tu carrera profesional por un año.

[pausa]

---
24 min 30
---

## SRS & SDS

A la vuelta, tuve que empezar desde cero y, literalmente, agarrar lo que venía.
Esto implicó tener que aprender cosas nuevas.

Una de estas cosas fue un esquema de la industria del software muy interesante.
Consiste en un documento tipo "pliego" que lista los requerimientos que el comprador pide para un cierto desarrollo.
Y otro tipo "oferta" que indica cómo el software propuesto aborda e implementa cada requerimiento.

. . .

Para la herramienta desarrollada en esta tesis lo que hice fue jugar de los dos lados del mostrador.
Empecé escribiendo un SRS con estas secciones como si fuese un pliego de un llamado a licitación para una herramienta computacional.

Y después escribí el SDS explicando cómo es que mi propuesta de diseño e implementación satisface cada requisito.




## FeenoX @ JOSS

Les presento entonces a FeenoX, a cloud-first finite-element(ish) computational engineering tool, publicada en el Journal of Open Source Software.

Originalmente se llamaba "a cloud-first free no-fee no-X uniX-like finite-element(ish) computational engineering tool pero me hicieron achicarlo, como a Johan Sebastian Mastropiero.

---
25 min 30
---


## Unfair advantage: Markdown

Empecemos preguntándonos qué opciones tendríamos si necesitáramos escribir un documento técnico. Un informe o un paper.
En el lado más "fácil" del espectro tendríamos una monstruosidad como Word y ahí cerquita Google Docs.
Del otro lado algo como LaTeX o incluso TeX.
En el medio, Markdown.


## Unfair advantage: FeenoX

Bueno, piensen a FeenoX como si fuese el Markdown de las herramientas tipo elementos finitos.
FeenoX es a los solvers tradicionales y a las bibliotecas de elementos finitos lo que Markdown es a Word y a LaTeX, respectivamente.

## Licensing

Lo primero que pide el SRS es que la herramienta desarrollada sea "open source" en el sentido OSI.

El SDS dice que FeenoX no sólo es abierto sino que también es libre con licencia GPLv3+.
Y acá quiero hacer especial énfasis en que ninguno de los dos conceptos, código abierto o software libre, se refiere a la idea de _precio_.
"Free" no quiere decir "gratis". En inglés es "free as in freedom", no "free as in free beer".
Seguramente ya lo saben, pero nunca está de más repetirlo, especialmente en la industria nuclear.

De hecho, un gerente de sistemas en una reunión dijo "acá en esta empresa no usamos software libre por un tema de costos".
Cuando lo interrumpí para que elabore me explicó, palabras más palabras menos, "es más caro pagarle al que sabe dónde poner el punto y coma en el archivo de configuración del servidor de base de datos que pagar la licencia y configurarlo con el [mouse]{lang=en-US}".

. . .

Según Richard Stallman (no es Roqueta, es Stallman), lo importante es la _libertad_ de poder modificar el código para que el software se comporte como uno necesita.
Y si uno no sabe programar, poder tener la _libertad_ de contratar a alguien que lo haga.

. . .

Por otro lado, Eric Raymond (el del libro de Unix) hace énfasis en la superioridad técnica del software open source.
Y esto es especialmente importante en software científico y de ingeniería.

. . .

Esta discusión podría necesitar más de 45 minutos en sí misma, así que la termino acá con estos dos refranes populares.

[pausa]


---
27 min 30
---

## Scope

Resulta que FeenoX es un tercer intento, tal como Unix.

Todo empezó con el milonga, que algunos de ustedes conocerán e incluso habrán usado.

Como eso andaba más o menos bien, me pasó lo que a los gerentes de la Bell.

. . .

Empecé a agregar complejidad, features, etc. 

. . .

Hasta que decidí  empezar desde cero.

. . . 

El scope actual es que FeenoX puede resolver estos problemas.
Pero hay un mecanismo de extensión en src/pdes que voy a explicar en detalle en un momento.

## Unix

Una de las lecciones aprendidas en las dos primeras versiones fue que vale la pena apalancarse explícitamente en la filosofía Unix y hacerle caso al libro de Raymond.

Esencialmente, la filosofía Unix es "hacé un programa que haga solamente una cosa, pero que la haga bien".

Como usualmente hay que hacer varias cosas, la idea central es la de "composición" de forma tal de que la salida de un programa sea la entrada de otro.

. . . 

En términos de ingeniería "analógica" yo veo a FeenoX como una función de transferencia entre uno o más archivos de entrada y cero o más archivos de salida. Recuerden que en Unix, "todo es un archivo".

Y fijensé que dice "programa" y no "biblioteca".

## 17 rules

En su libro, Raymond explicita 17 reglas.
Todas tienen algún grado de impacto en el diseño y/o implementación de FeenoX.
Las marcadas en boldface son las más importantes.

. . .

Un par de comentarios.

FeenoX se enfoca en resolver ecuaciones en derivadas parciales.
Se tiene que llevar bien con otras herramientas, tales como malladores y post-procesadores.
Y se tiene que llevar bien con el concepto de "simulación programática", cuyo nombre no me gusta pero es como se lo llama en la industria.
En resumen, que sea script friendly.

También tiene que llevarse bien con interfaces gráficas. Siguiendo la regla de separación, FeenoX es un back end pero que tiene que hacer que el desarrollo de front ends sea relativamente fácil. ¿Qué implica esto? Que los inputs sean flexibles y fáciles de generar.
Y que no se enfoque en una sola forma de front end. Debería poder "hablar" con front ends desktop, web, no sé de los que ahora hay con esos visores de realidad virtual, en el futuro con un holograma láser o lo que sea.

Y tiene que ser ameno a corridas paramétricas.

Supongamos que tenemos este archivo de entrada: print hello pesos uno.
Bueno, si lo corremos desde bash do feenox hello punto fee pesos i nos dice hello 1, hello 2 y hello 3.

---
29 min 30
---

## Front-back

Por si no quedó claro, este es el concepto de separación entre front end y back end.

[pausa]

## La "nube"

Pasemos a "la nube".

¿Qué demonios es "la nube"? Básicamente es "somebody else's computers".
El plural es importante. Después me explayo.

Este concepto de cloud es importante porque permite bajar los costos de oportunidad.
Financieramente te dicen que alquiles en lugar de comprarte una casa.
Imagínense en términos de servidores de cálculo.

. . .

Ahora bien, que un solver sea "cloud first" o "cloud native" no es lo mismo que sea "cloud friendly".
Hay varios detalles que te pueden dejar fuera de juego.
Por ejemplo, si para hacer el deployment tenés que re-compilar el código antes de correrlo porque tu solver es un biblioteca entonces tenés un overhead que capaz que te mata el esquema de costos.
Por eso por diseño, FeenoX es un ejecutable que lee el problema a resolver en tiempo de ejecución.
Esto nunca se lo pude hacer entender a uno de los reviewers del JOSS. Espero poder explicarlo mejor acá.

. . .

Y ni que hablar de solvers tipo Desktop que quieren dockerizarlos para hacerlos "cloud friendly".
Esta es una cita de un gerente de una compañía de software de elementos finitos que factura más de 2 mil millones al año.

## CAEplex

Como prueba de concepto de una interfaz web pueden entrar a caeplex punto com.


## LE10

Déjenme ilustrar uno de los puntos de FeenoX, que es que debe haber una relación uno a uno entre la definición del problema de ingeniería y el archivo de entrada.
Fíjense que todo lo que aparece en la formulación "human friendly" aparece en el archivo de entrada.
¡Y nada más!

Este caso también ilustra otro punto importante. La salida es lo que uno le pide, ¡y nada más!
Dame la tensión normal en la dirección $y$ evaluada en el punto D. Nada más.


## Mazes

Una nota de color antes de meternos en el código.
Supongamos que somos Homero Simpson y que tenemos que resolver un laberinto donde sabemos cuál es la entrada y cuál es la salida.
Podemos explotar la elipticidad del operador de Laplace.

. . .

Este caso es uno de los tutoriales de FeenoX. Ahí en el link incluso se muestra como resolver el transitorio que ilustra cómo se prueban todos los caminos y los que no llevan a ningún lado van decayendo y sobrevive solamente la solución.

Bueno, basta de marketing.
Pasemos al código.

[pausa]

---
32 min 30
---

## Arquitectura

Preguntémonos, ¿qué es que lo que tenemos que hacer?

 1. construir los objetos globales $K$ y $b$
 2. resolver ${K} \cdot \vec{u} = \vec{b}$
 3. re-construir los flujos $\phi$ y $\psi$ a partir de $u$

El punto 2 es el foco de un solver, que por regla de Unix no vamos a escribir nosotros.
Nosotros nos tenemos que enfocar en 1 y en 3.

. . .
  
No voy a explicar las razones acá, pero el solver del punto 2 es PETSc (o SLEPc para criticidad).
Entonces FeenoX es esencialmente dos capas, "glue layers" en terminología Unix:
 
 1. que construye $K$ y $b$ a partir de la malla y del input 
 2. otra que convierte $u$ en flujos que puedan ser entendidos por un post-procesador como Paraview
 
. . .

Una decisión central es el lenguaje de programación.
Esencialmente tenemos que elegir entre Fortran, C y C++.
Tal vez Go y Rust también podrían ser alternativas, pero no los conozco lo suficiente como para decidir.

La filosofía Unix nos dice que debemos agregar complejidad solamente cuando la necesitemos
Por razones diferentes, Fortran y C++ agregan complejidad innecesaria, así que FeenoX está escrito en C que, entre paréntesis, es el lenguaje ideal para las glue layers según Eric Raymond.

---
33 min 30
---


## Algoritmos

Muy bien, veamos ahora cómo podemos hacer para construir la matriz global de rigidez y el vector de fuentes.
Barremos los elementos  acumulamos sobre los puntos de Gauss las contribuciones elementales.
En este caso para Poisson son las $B$ transpuesta $k$ $B$ para la matriz de rigidez y $H$ transpuesta por $f$ para las fuentes.

. . . 

¿Qué necesitamos?

 1. los pesos y coordenadas de Gauss
 2. las matrices de forma y de gradiente
 3. las coordenadas $C$ de los nodos
 4. una forma de evaluar la conductividad, la fuente y eventualmente las condiciones de contorno en un punto $x_q$

. . . 
 
Podemos notar

 1. que la ecuación a resolver está dada por lo que aparece entre llaves.
 2. los puntos 1 2 y 3 no dependen de la ecuación sino solamente de la malla
 3. la evaluación de las propiedades materiales y las condiciones de borde, bueno, un poco y un poco. Ahora explico mejor.

Entonces en prinpcio, podemos implementar a FeenoX como un framework general que es agnóstico de la ecuación a resolver y algún mecanismo que le provea lo que depende de la ecuación particular.
 
## Implementación

Supongamos entonces que quisiéramos elegir la ecuación a resolver en tiempo de ejecución.
Digamos que tenemos una variable $pde$ que indica qué ecuación queremos resolver.
Entonces podríamos implementar la evaluación de las llaves así.

. . . 

Bueno, esto es, primero que nada, feo.
Por favor, nunca hagan algo así.

Segundo, es tremendamente ineficiente. Hay que hacer todas estas comparaciones para cada punto de gauss de cada elemento.

Tercer, es difícil de mantener.


## Polimorfismo

Si hubiésemos elegido C++ podríamos haber implementado las llaves como métodos virtuales.
Como estamos en C, lo hacemos con apuntadores a funciones.

Entonces reemplazamos ese feo bloque de ifs por este otro bloque feo de ifs.
Pero,

 1. lo genera un script al que no le importa la belleza
 2. es uno sólo en toda la ejecución en tiempo de parseo.
 
Esencialmente en este único bloque if se hace apuntar un apuntador a función a una función que depende de cada ecuación a resolver, y a su vez en esa función se hacen apuntar los puntos de entrada que evalúan las contribuciones elementales, las condiciones de contorno y otras cosas más que dependen de la ecuación particular.

---
35 min 30
---

## Input

Pero antes de explicar en detalle esa implementación, déjenme hablar sobre el archivo de entrada.

Recuerden que FeenoX es un ejecutable, no una biblioteca.
El problema que tiene que resolver tiene que estar completamente definido por este archivo de entrada, es decir, definido en tiempo de ejecución.

Siguiendo la filosofía Unix, este input es un archivo de texto plano.
Tiene palabras claves en inglés, de forma tal de

 1. definir completamente el problema
 2. ser lo más auto-descriptivo y compacto posible, es decir están prohibidos los argumentos posicionales
 3. permitir expresiones algebraicas en cada lugar donde se espere un parámetro numérico
 4. tratar de mantener una correspondencia entre la formulación "humana" del problema y el input
 5. seguir la regla de que "problemas simples necesitan inputs simples"
 
y algunas más que discutimos en el SDS.

Estas palabras clave pueden ser definiciones o instrucciones.


## Ejemplos + IP

Por ejemplo. Efe de equis igual a equis cuadrado. Acá no hay sustantivo pero el igual funciona como una definición.
Acá definimos una función agebraica de un argumento.

. . .

Siguiente. Input file sorpresa con path una expresión tipo printf con un argumento random. Definición porque file es un sustantivo.
Read mesh es una instrucción que lee la malla en el archivo sorpresa.
Print cells es una instrucción. 

. . .


Acá tenemos un condicional. Si b es muy chiquito, instrucción print instrucción abort.
Terimina condicional, instrucción print.

. . .

De hecho FeenoX tiene un instruction pointer. 


## Conducción de calor 1D

Problema simple, input simple.

Línea 1, definimos que queremos condución 1D.
Línea 2, instrucción: leeme la malla.
Línea 3, definimos una variable k igual a 1. En problema thermal, si existe la variable k indica conductividad uniforme.
Líneas 4 y 5,  boundary condition (sustantivo) en left T igual a cero y en right T igual a 1.
Línea 6: instrucción, por favor resolvé el problema
Línea 7: instrucción imprimí la solución T evaluada en x=1/2

. . .

Si corremos esto con FeenoX, deberíamos obtener 0.5


## Conductividad no uniforme

¿Qué pasa si la conductividad no es uniforme?
Bueno, si tenemos una función de x lo que hacemos es definir una ka de equis y el resto todo igual.
Ahora el resultado ya no es 0.5 sino eso que está ahí.

. . .

¿Y si k depende de la temperatura?
Ningún problema, escribimos ka de equis en función de T de equis.
Ahora el problema es no lineal. FeenoX se da cuenta de que si en thermal la conductividad (o alguna condición de contorno) depende de T, que es la solución, tiene que resolver un problema no lineal.
Este caso tiene solución analítica, que es esa raíz cuadradada que está ahí.


## Reed

Pasemos a un problema neutrónico.
Caso 1D con diferentes materiales y secciones eficaces uniformes en cada trozo.

Problem ahora es neutron_sn con dim uno gropus 1 pero SN es pesos 1.
Recuerden que eso quiere decir que ese argumento viene de la línea de comandos.
Así que le tenemos que decir si queremos S2, S4, etc.

La salida de este input es la raíz cuadrada de la integral del cuadrado de la diferencia entre el flujo calculado por FeenoX y un perfil de referencia tomado de un blog académico.

---
38 min 30
---

## Bootstrap

Habiendo entendido tema input, volvamos al bloque de ifs feo.
Habíamos dicho que lo generaba un script al que no le importaba la belleza.
Bueno, ese script es parte del bootstrapping del repositorio, en este caso `autogen.sh`.
Ese script parsea los subdirectorios dentro de `src/pdes`. La idea es que cada ecuación tenga un subdirectorio con el nombre del PROBLEM a resolver.
Y además, cada subdirectorio tiene que tener ciertos archivos en C con ciertas funciones con un cierto nombre que este `autogen` pueda parsear. Es un script de Bash que genera un poco de código en C que finalmente se compila en FeenoX.

Después si tienen tiempo y ganas les muestro como funciona. En principio podríamos remover un directorio completamente, volver a hacer bootstrap y compilar. Ese ejecutable no va a poder resolver esa PDE que borramos, pero sí el resto.

Está claro que no ganamos mucho removiendo. Pero es mucho más interesante agregar, que remover.


## Entry points

Cada subdirectorio debería entonces proveer la implementación de cada una de estas funciones, que van a ser llamadas por el framework general a lo largo de la ejecución.

Alguna relacionada al parser, para leer opciones al keyowrod PROBLEM y para interpretar las condiciones de contorno.

Otras para inicializar.

Las centrales para evaluar las llaves en cada punto de Gauss.

Una que resuelve el problema usando PETSc. Este entry point define esencialmente si hay que resolver un problema lineal, uno no lineal, un problema de autovalores o uno transitorio. En el caso thermal, eso lo deciden las funciones de inicialización dependiendo de si la conductividad depende de la temperatura o no. En neutrónica, si es un problema con fuentes o de criticidad.

Y después otros entry points para implementar la segunda capa y construir los fujos o las tensiones y deformaciones a partir de lo que resolvió PETSc.

. . .

Ejemplo. El keyword PROBLEM lo lee el parser general. Mira si hay alguna pde llamada neutron SN.
El siguiente keyword DIM es genérico, lo parsea el framework. El siguiente keyword "groups" no lo entiende el general, entonces se lo pasa al particular que sí lo entiende. Lo mismo para "SN".

. . .

Siguiente. Ese snippet de un input muestra el $k$ effectivo y la reactividad. Esa variabe keff la define implícitamente el parser específico, y al hacer solve problem se rellena con el primer autovalor. Lo mismo los flujos psi y phi. Después ya están para ser usados como variables o como funciones del espacio, respectivamente. Las podemos evaluar, escribir en un archivo, integrar, derivar, etc.

. . .

Finalmente, esta es la pinta de la parte del framework que llama al entry point que evalúa las contribuciones elementales en los puntos de Gauss.
Un for sobre q, una llamada a un apuntador a función que apunta a un entry point que depende de la ecuación particular.


## Expressions

Otro principio fundamental de la base de diseño de FeenoX: "everything is an expression".
Incluso la dimensión o la cantidad de grupos.
Desde ya, las propiedades de los materiales y las condiciones de contorno.

. . .

Esto de poder evaluar expresiones algebraicas, inlcuyendo funcionales como integrales, derivadas y sumatorias nos permite por ejemplo comparar la solución numérica con la solución analítica en los casos que la tienen. Este es un ejemplo de condución de calor 1D transitoria. La solución, como ustedes saben, es una sumatoria de exponenciales que podemos evaluar perfectamente. Después restamos una de otra antes de imprimir y ya.

. . .

Este "feature" es especialmente importante para hacer verificación de código. En noviembre hice una presentación en la reunión Garcar del año pasado sobre verificación con MMS. De hecho es un de los resultados del capítulo 5, pero necesitaríamos 20 minutos. Dejo el link al video y al source de las slides.

---
41 min 30
---


## No print no shirt

Volvamos a una de las reglas centrales. La regla del silencio. ¿Recuerdan la tabla de 1965?
En FeenoX, sin PRINT no hay salida.
Le podemos pedir al software que haga un montón de cosas complicadas. 
Pero sin el bloque de abajo, no hay salida ni por terminal ni por archivo.
La salida es 100% user-defined usando las instrucciones PRINT, PRINTF, WRITE_RESULTS, etc.

Es más, algunas cosas ni las calcularía. Por ejemplo, si en un problema mecánico no hay ninguna expresión que involucre las tensiones, entonces FeenoX ni se molesta en calcularlas.




## Extras

Lista de temas que tienen una sección de la tesis donde las discutimos por escrito.

. . .

Lista de temas que no están explícitamente discutidos en el texto pero que podemos charlar durante el Q&A.

[pausa]

---
43 min
---

# Resultados

Capítulo de resultados.

## Tabla de problemas

Esta tabla muestra los problemas resueltos en la tesis.
Todos, excepto el último, requieren al menos una de las características distintivas de FeenoX.

## IAEA 3D PWR Onshape

El problema que ya mostramos del benchmark de IAEA.
En esta caso la geometría viene de un CAD modelado en Onshape 100% web y cloud.
El que contamos en la historia de Jon sin hache.

## Malla

A partir de ese CAD hacemos una malla 3D.

## Meld

Este es un dif de las salidas del caso original con simetría un cuarto y con simetría un octavo.
Tanto la memoria como el tiempo de ejecución bajan a la mitad.

## MPI

Y si corremos en paralelo, vemos que si bien el tiempo baja lo más importante es que baja la memoria por proceso.
Recuerden que ese era nuestro objetivo.

## Slab a dos zonas

Otro problema. Slab 1D con dos materiales, uno con k infinito menor que uno y el otro mayor que uno.
Ancho total b, ancho del absorbente a. Queremos estudiar el $k$ efectivo en función de $a$.
Si el solver soporta mallas no estructuradas y por ende no uniformes, podemos poner un nodo exactamente en $x=a$.
Si el solver solamente soporta espaciado uniforme (es decir, ladrillitos) entonces hay que detectar en qué celda cae la punta de la barra de control y asignarle a esa celda amarilla una sección eficaz ficticia que sea un promedio pesado de la de los dos materiales.
Esto da lugar el "efecto cúspide".

Como este problema tiene solución analítica (y FeenoX la puede evaluar) entonces podemos comparar el error cometido por los dos casos,

 1. poniendo un nodo exacamente en $x=a$
 2. simulando el comportamiento de la sección eficaz ficticida
 
Como dice Richard Stallman, la mejor manera de resolver un problema es evitándolo.

---
44 min 30 seg
---

## Cube-sphere

Todos sabemos que para un volumen fijo, una esfera tiene más reactividad que un cubo.

. . .

¿Y en el medio?
Bueno, podemos ir haciéndole fillets al cubo.

. . .

Buena suerte resolviendo esto con mallas estructuradas.

## Input + python

La filosofía Unix en acción.
El input de FeenoX es realmente sencillo.
La complejidad está puesta en un script de Python que usa el API de Gmsh para fabricar la malla y llamar paramétricamente a FeenoX.


## Tres pescaditos

Otro problema.
Supogamos que tenemos tres pescaditos absorbentes.
Dos están fijos. El problema es ubicar el tercero de forma tal que la reactividad total sea mínima.

## Input

Otra vez dividimos y conquistamos.
El driver es un Python que usa una biblioteca de optimización con el método de Nelder & Mead.
El Python llama a un Bash que ubica el pescadito y a su vez llama primero a Gmsh para mallar y después a FeenoX para resolver.
Algunas iteraciones y el $k$ efectivo es mínimo.


## PHWR

Último caso.
Un PHWR ficticio de siete canales y tres barras de control inclinadas.

[pausa]

## XS

Como el problema es inventado, también inventamos las secciones eficaces.
En particular, para el moderador ponemos un perfil de temperaturas en función de $z$.
Y hacemos que algunas secciones eficaces dependan algebraicamente y otras a través de puntos "experimentales" de esta temperatura.

## Flujos

Dibujitos tipo "CFD" (que quiere decir "colors for directors").


## Tabla y MPI

Y finalmente otra ilustración de que al correr esto en paralelo lo que logramos es bajar la memoria por proceso.

[pausa]

---
47 min
---

## Conclusiones

Antes que nada, todo esto que presenté va en el sentido del método de Descartes.
Como dice René, esto es lo que me sirvió a mí y lo comparto con ustedes.
Si a alguien más le sirve y quiere sumarse al barco, genial. Si no les sirve y quieren seguir otro método, en todo su derecho.


Seguimos el poco académico pero---a veces--útil orden why-how-what.
Y la metodología de diseño de software SRS/SDS.

## Unfair advantages

La herramienta que desarrollamos tiene, otra vez en el sentido de Descartes, algunas ventajas competitivas.

En particular, para neutrónica a nivel de núcleo soporta

 1. SN,
 2. mallas no estructuradas, y
 3. MPI.

## Tweets 

Si tuviesen que escribir un tweet o un mastodon contando que vienieron a esta charla, me gustaría que nombren alguno de estos cinco conceptos.

O esta idea de que FeenoX es a los solvers tradicionales y a las bibliotecas de elementos finitos lo que Markdown es a Word y a LaTeX, respectivamente.

## Trabajos futuros

La tesis y estas charla termina con un sendero de trabajos futuros que se bifrucan.
Cada unos de estos bullets implica varios años-persona y un presupuesto no despreciable.
En particular, el último es una meta-tarea que podría llegar a involucrar a una o más de las anteriores.

Seguramente ustedes se preguntan lo mismo que yo.
¿Cómo hacemos todo esto?

Bueno, como le explica Séneca a Lucilio: "con una constante dedicación".
Porque si llegara a venir un cisne negro que te cambia la número cinco por una bola de bowling, pero le habías hecho caso a Calabró y durante la semana te la pasaste entrenando laterales con sandías, tal vez te quede resto...

## PhD / Cancún

y puedas defender una tesis de doctorado a los 41...

y puedas volver a Cancún con tu familia.


## 

Muchas gracias.

---
49 min
---


# Apéndices

## JOSS


## Dirichlet BCs

<https://scicomp.stackexchange.com/questions/5072/how-to-properly-apply-non-homogeneous-dirichlet-boundary-conditions-with-fem>

## English vs. Castellano


Pensar en inglés te hace esforzarte más y se te activan áreas cognitivas del cerebro que no se activan si pensás y escribís en castellano.

## What does FeenoX mean


## How should FeenoX be pronounced.

## History

## GDB session


