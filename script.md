---
title: Transporte de neutrones en la nube
numbersections: true
fontsize: 12pt
...
 
# Prolegómeno

Yo crecí en los noventa, cuando todo daba vueltas alrededor de la televisión.

## Calabró

Ustedes recordarán que estos dos monstruos tenían un programa llamado "El contra".
Un día, el invitado era un director técnico de fútbol, no recuerdo quién.
En un momento, Calabró le pregunta:

"Supongamos que van 45 minutos del segundo tiempo. ¿Qué preferiría? ¿Un córner o un lateral a favor?"

"¿Pero qué pregunta es esa?"---responde rápido Carrizo sin dejar hablar al técnico.
"Con un córner uno tiene la posibilidad de llegar al área rival."

"Lo que pasa es que allá en Villa Dálmine"---explica Calabró---"durante la semana nosotros entrenamos laterales con sandías."

[pausa]

"Cuando el fin de semana agarramos la pelota, ¿sabés hasta dónde tiramos los laterales?"

[pausa]

Bueno, esa idea de entrenar laterales con sandías me empezó a perseguir.

## IB 2004

Exactamente diez años después, estaba entrenando laterales con sandías en la clase de mecánica de Barrachina.

## Electrón

Bueno.

## Lazo

Acá estoy entrenando laterales en el laboratorio de Fabián con mi loop de convección natural caótico en una etapa académica.

## TECNA

Terminada mi maestría en el IB, me dediqué a meter las narices en temas de licenciamiento de Atucha II en un etapa industrial de mi carrera profesional.

## Cites

Después de la criticidad, me pasé a temas de startups.
A veces yo le daba cheques gigantes a emprendedores desde CITES.

## BNA

Y a veces era yo el que pedía cheques. 

## Mafalda

Esta tesis es excepcional en el sentido de que fue atípica, una excepción a la receta tradicional.
En lo que voy a contar hay quince años de lecciones aprendidas provenientes de estos tres ámbitos: academia, industria y emprendedurismo.
Justamente este largo tiempo me permitió poder separar, como dice Mafalda, lo urgente de lo importante.

## TOC

Primero que nada, si hubiese podido escribir la tesis en inglés el título habría sido ese: "a cloud-first etcétera".

Pero no encontré una buena traducción, así que elegí...

---

"transporte de neutrones en la nube" que intenta explicar (sin mucho éxito) que el contenido de la tesis es una mezcla de 

 * física de reactores a nivel de núcleo, y
 * programación tipo high-performance.
 
---

La tesis está dividida en cinco capítulos más algunos apéndices (que sí están en inglés).
En en el primero explico el "why", en los dos siguientes el "how" y en los últimos dos el "what".


## Why

Empecemos entonces con el "why".


## Cien años de programación

Veamos juntos esta tabla de un paper de 1965.
El título del paper es, justamente "Desarrollos _recientes_ en computadoras y sus _consecuencias_ para el cálculo de reactores"

[pausa para que miren la tabla]

Tenemos que hacer el ejercicio mental de viajar 60 años al pasado para entender estos números.

Dejemos de lado consideraciones sobre arquitecturas, lenguajes, compiladores, etc.
Pensemos en cómo había que diseñar software de ingeniería nuclear.

Desde un punto de vista de costos, cada resultado calculado tiene que formar parte de la salida.
Porque si te gastás varios miles de dólares para hacer una corrida y después necesitás un número que no está en los papeles que imprimió el aparato, tenés que volver a pagar.

Viajemos "back to the future". Resulta que hoy, lo caro es la hora de ingeniería y no la hora de CPU.
No tiene ningún sentido hacer que el ingeniero tenga que buscar la aguja que necesita en un pajar de números innecesarios.

[pausa para buscar libros]

Así y todo, la mayoría del software de cálculo sigue sacando megas de salidas, incluyendo el nombre del programa como ASCII art.

Aún cuando desde hace varios años que tenemos libros como este, "The Art of Unix Programming" (que es un juego de palabras sobre este otro libro de Donald Knuth "The Art of Computer Programming"), que sintetizan un montón de lecciones aprendidas sobre programación.

## Unix rule of silence

Entre ellas, la "regla del silencio".

[silencio, tomar agua]


## Historia de dos reactores

Pasemos ahora a la otra mitad.
Supongamos que tenemos una central nuclear con un diseño medio único, ya licenciada y que está operando.

---

Después aparece otro reactor medio parecido, un poco más grande pero que hay que licenciar.
Y una vez licenciado el nuevo, hay que re-licenciar el primero.

## Esquema de dos pasos

Long story short: tenemos que modelar la inyección rápida de boro del segundo sistema de shutdown.
Como la fluidodinámica está desacoplada del resto de la planta durante el par de segundos que dura la inyección, un primer esquema es primero calcular la pluma de boro en el tanque del moderador con CFD, meterla en un código de núcleo y obtener una curva de reactividad vs. tiempo para usarla en un código de planta con cinética puntual acoplado con control y protección y resolver el transitorio.
 
## Esquema acoplado

Segundo esquema.

Calcular la pluma de boro en el tanque del moderador con CFD y meterla directamente en un código de núcleo cinético-espacial acoplado con el código de planta y la lógica de control y protección.

---

En cualquiera de los dos casos, tenemos que hacer CFD primero y meter la pluma de boro en la neutrónica.
Así que prestemos atención a esa parte.


## Canales

Sea Atucha o sea Embalse, en Argentina tenemos 

 1. canales cilíndricos, y
 2. moderador separado del refrigerante.

El boro se inyecta en el tanque del moderador.
Así que la pluma va a rodear los canales.
El boro no se va a meter en el refrigerante, mucho menos en el combustible.

## Dominio

Cuando tenemos que discretizar una geometría curva como esta...

---

si queremos usar una malla estructurada como esta...

---

nos vamos a topar con un "stair-case effect" como este.

---

Por otro lado, si usamos mallas no estructuradas, bueno vamos a tener algún error pero para la misma cantidad de celdas la discretización va a ser muy superior.

## Celdas estructuradas...

Ahora, en los códigos de núcleo, aparecen cosas como estas.
Esto es Atucha I "vista" desde el código de cinética espacial que nombramos antes.

[pausa]

Esto es "jugar a los Rastis", ¿no?


## Celdas

¿Cómo es el esquema de cálculo?
Bueno, agarramos un canal con un poco de moderador.
Con eso condensamos las secciones eficaces a nivel de celda y las usamos a nivel de núcleo.

## Gota

En la celda, si queremos ver qué pasa al meter una gota de boro lo único que podemos hacer es repartir estas dos mil ppm en, digamos un 5% del volumen, como cien ppm distribuidas uniformemente en toda la celda.


## CFD

Dijimos que el primer paso era hacer un cálculo tipo CFD para ver cómo evoluciona la pluma de boro en el tanque del moderador.
Este cálculo lo hacen los que saben de fluidos con mallas no estructuradas.
Está claro que el boro no se mete en los canales. 


## Mapeo

Desde el lado de la neutrónica de núcleo, ahora tenemos que mapear para cada instante la pluma del CFD en nuestra malla estructurada.

---

Terminamos con Legos como estos.

[pausa]


## Gota

Y además, si bien en el CFD el boro _no_ se mete en el refrigerante, con el esquema de celdas el boro termina metiéndose "numéricamente" adentro de los canales.

Además de todas las preguntas sobre la validez del esquema, surge también esta pregunta:

---

¿Vale usar difusión en estas condiciones?


## Limitaciones

Resumiendo.

Tenemos limitaciones de

 1. dilución de secciones eficaces,
 2. efectos staircase muy marcados, y
 3. cuestionable validez de la aproximación de difusión.
 
---

Entonces, ¿qué proponemos? De atrás para adelante: primero usar S$_N$ en lugar de difusión.
El problema es que S$_N$ escala muy rápido, especialmente en memoria. Así que necesitamos algo

 * paralelizable,
 * flexible y
 * extensible.

---

Para que sea paralelizable, necesitamos mallas no estructuradas, que a su vez le pega al punto dos.

Con un poco de suerte, podemos re-pensar el esquema de condensación de secciones eficaces del punto uno.
Para eso necesitamos flexibilidad, que ilustramos en el capítulo de resultados.
La extensiblidad la explico en la implementación.

Pasemos a un ejemplo que ilustra lo que quiero decir.


## IAEA 3D Benchmark

Seguramente conocen ustedes este benchmark 3D.

## Simetrías

Como es para PWRs, te indican que la geometría tiene simetría un cuarto.
Se puede mallar perfectamente con cuadraditos.
Pero si uno mira con detenimimento, resulta que tiene geometría un octavo.

---

El chiste es que necesitamos mallas no estructuradas para aprovecharla.

Más aún, ese reflector no debería ser así.

---

Debería ser así.


## IAEA SN

Así que adelantándome al capítulo de resultados, les presento el benchmark 3D de IAEA resuelto con
 
 * simetría $1/8$ en lugar de $1/4$,
 * reflector circular en lugar de "recortado", y
 * S$_4$ en lugar de difusión.

 
 
## How


Terminado el why, pasemos al "how". 
 

## Séneca

Dice Séneca en una de las cartas a su discípulo Lucilio.
Acá la tengo.

[mostrar el papel como Dolina]

"No debemos tan sólo escribir ni tan sólo leer.
Hay que acudir a la vez a lo uno y a lo otro, y combinar ambos ejercicios a fin de que, cuantos pensamientos ha recogido la lectura, los reduzca a la unidad."

Sigue, Séneca:

"Lo que comprobamos que realiza en nuestro cuerpo la naturaleza sin ninguna colaboración nuestra, es eso lo que tenemos que hacer con la lectura. Los alimentos que tomamos, mientras mantienen su propia cualidad y compactos flotan en el estómago, son una carga.
Mas cuando se ha producido su trasformación, entonces y sólo entonces, se convierten en fuerza y sangre."

## Transporte y difusión de neutrones

Este capítulo no tiene _nada_ nuevo.
Lo escribí para que la literatura de análisis de reactores no sea una carga para mí, sino que se convierta en fuerza y sangre.

---

Como ustedes sabrán, yo 

 * escribo en Markdown,
 * trackeo todo con Git y
 * ---cuando me dejan---publico en Github con licencia Creative Commons.
 
De hecho, si prestan atención abajo a la derecha a la izquierda de la fecha hay un hash que indica qué commit generó estos slides a partir de Markdown. En la tesis lo mismo, así que si aparece un PDF, o un HTML online o se ponen a hojear un ejemplar impreso en la biblioteca, el footer indica el commit.
 
Si alguien necesita notas para dar clases tiene la libertad de acceder al Markdown y modificarlo según necesite, respetando la licencia.

## Ecuación de transporte

Resumen del capítulo: derivación de la ecuación de transporte a partir de una "contabilidad" de neutrones.

## Armónicos
 
Expansión de la dependencia angular de la sección eficaz de scattering en polinomios de Legendre y de la dependencia angular del flujo escalar en armónicos esféricos.
 
## Transporte linealmente anisótropo
 
Ecuación de transporte linealmente anisotrópico.
 
## Difusión

Aproximación de difusión.
Fin del capítulo.

 
## Paul Graham

El siguiente capítulo es cómo discretizamos estas ecuaciones.
Este tampoco tiene (casi) nada nuevo.

Pero hay un par de diferencias.
La primera la explica Paul Graham.

En uno de sus ensayos dice básicamente lo mismo que Séneca. No sorprende porque Graham suele citar a Séneca (cuando no usa regular expressions para explicar conceptos de filosofía).
Pero agrega un pie de página donde nos recuerda que "programar" es equivalente a "escribir".

La segunda es que el menú de este capítulo es mucho más amplio que el del anterior, así que hay que elegir.

## Esquemas

La discretización en energía es bastante straightforward: formulación multi-grupo, que es como si tuviésemos volúmenes finitos con acople algebraico en lugar de diferencial.

---

Discretización en ángulo para transporte. Revisitamos las ordenadas discretas, que podemos ver también como unos volúmenes finitos particulares.


## Discretización en espacio

Discretización del espacio: del menú, elegimos _elementos_ finitos.

Hagamos un breve repaso usando la ecuación de Poisson.

---

Lo primero que hacemos es escribirla en una formulación débil.

Un operador bi-lineal coercivo $a$ aplicado a $u$ y $v$ tiene que ser igual a un funcional $B$ larga de $v$ corta para toda $v$ corta viviendo en algún espacio funcional $V$ corta mayúscula. 
  
## Dominio

Todo esto sobre un dominio $U$ con una frontera con condición de Neumann sobre $\Gamma_N$ y condición de Dirichlet _homogénea_ sobre $\Gamma_D$.
Empecemos con Dirichlet homogénea y después les cuento cómo pasar a Dirichlet arbitraria.

## Nodos

Siguiente paso, ponemos nodos sobre el seno del dominio y sobre la frontera de Neumann, pero _no_ sobre la frontera de Dirichlet.

## Funciones

Después buscamos tantas funciones de forma como nodos pusimos de manera tal de que cada una valga uno en un nodo particular y cero el en resto.

## Elementos finitos

Para facilitar la programación, ponemos puntos también sobre la frontera de Dirichlet e identificamos los triángulos (o cuadrángulos) que cubren el dominio $U$.
Llamamos a cada uno de éstos un "elemento", y escribimos las integrales de la formulación débil como sumas de contribuciones elementales.



## $K \cdot u = b$

Con un poco de álgebra lineal llegamos a que tenemos que resolver el sistema $K$ por $u$ igual a $b$, donde $K$ es una matriz "rala" de tamaño igual al número de nodos y que tiene contribuciones de cada uno de los elementos.
Las contribuciones del elemento $i$-ésimo tienen esta pinta.

Una parte viene de la integración numérica y otra parte viene de la discretización del operador $a$ que va a parar a la matriz de rigidez $K$ y del funcional $B$ larga grande que va al vector $b$ larga chica del miembro derecho.

---

Favor de notar que

 1. Nunca tuvimos que pasar por la escalerita. Todo esto funciona con mallas no estructuradas.
 2. Ese vector $u$ no es "la" solución del problema. "La" solución de elementos finitos es una función continua en el espacio que podemos evaluar en cualquier punto arbitrario.

## Extras

Dos bonus tracks.
Primero, que podemos usar elementos segundo orden. Si quieren después profundizamos.

---

Segundo, nos quedaron pendientes las condiciones de Dirichlet no homogéneas.
Este es el "casi" nada nuevo.
Nunca pude encontrar una buena justificación del truco usual de poner un uno en la diagonal de la matriz de rigidez y el valor no homogéneo en la fila del vector $b$.
De hecho consulté a colegas del palo de los elementos finitos y nadie me pudo cantar la posta.
Todos usaban el truco sabiendo que funciona pero habiendo olvidado el "por qué", como en el experimento de los monos.

En stack exchange está mi justificación matemática, que es la parte "nueva".
De hecho mi respuesta es la segunda más votada (después de la primera que es de Jed Brown).

[pausa]


## Difusión

Haciendo lo mismo que hicimos para Poisson pero para difusión multigrupo, llegamos a estas expresiones para las contribuciones elementales.
Los detalles en el capítulo tres.

$L$ es leakage, $A$ es absorción y $F$ es fisión, abajo $s$ son las fuentes independientes

Fíjense que la forma es parecida al caso de Poisson.
Medio que es esperable, ¿no? Porque el operador $a$ es elíptico en los dos casos.
De todas maneras en difusión multi-grupo, el operador no es simétrico y puede llegar a no ser coercivo.


## Ordenadas discretas

Podemos hacer lo mismo con ordenadas discretas.

Otra vez, la forma es parecida pero hay un diferencia: la ecuación es hiperbólica de primer orden y el operador $a$ no es elíptico.
Así que esa matriz $P$ que aparece en los términos de pérdidas, absorciones y fisiones es una matriz estabilizada tipo Petrov-Galerkin.
Una vez más, los detalles en el texto.


## Estado estacionario

¿Qué hacemos con todo esto?
Bueno, depende de qué tipo de problema estemos queriendo resolver.

 * Si tenemos un medio no multiplicativo con fuentes independientes, las pérdidas y las absorciones son proporcionales al flujo pero las fuentes son, justamente, independientes. Esto da un problema lineal.

 * Si tenemos fuentes independientes y de fisión, tenemos que agregar un término de fisiones proporcional al flujo. En lugar de ponerlo en el miembro derecho lo pasamos al izquierdo con signo negativo. Otra vez, problema lineal.
 
 * Ahora, si no hay fuentes independientes entonces todo es proporcional al flujo. Volvemos a mandar las fisiones al miembro derecho y resolvemos un problema de autovalores para encontrar el $k_\text{eff}$ del reactor crítico asociado en $k$. El primer autovector nos da el flujo de estado estacionario.
 
---

Ya sé lo que están pensando. ¿Qué pasa en el caso no lineal?
Bueno, hay que hacer Newton-Raphson y la cosa se complica un poco.
Pero por ahora no nos vamos a meter en eso y damos por terminado el how.

## What

Veamos ahora el what.

[pausa]

## Bicicleta

[pausa]

Con esto de la new age y la movilidad, escuché que alguien decía que la bicicleta es un dispositivo que resuelve problemas que no existían cuando se inventó.

## Dennis & Ken

Resulta que estos muchachos también inventaron algo que resuelve problemas que no existían en ese momento.

Veamos.

A mediados de los 60 (la época del paper de la tablita), los Bell Labs tenían un sistema operativo medio artesanal pero que andaba bastante bien.
Entonces se metieron los gerentes y organizaron un proyecto para hacer una nueva versión "mejorada". En lunfa, "bien pulenta".
Pero el proyecto, llamado MULTICS (siglas de _multiplexed_ information and computing service) fue tan ambicioso y complejo que se estancó.
No iba ni para adelante ni para atrás.
Entonces en el 70 estos dos muchachos empezaron desde cero.
Dejaron lo que servía, tiraron a la basura el resto y diseñaron e implementaron Unix---un juego de palabras sobre MULTICS.

---

Abro un concurso: una taza de Atlético de Rafaela para cada una de las dos primeras personas que digan cómo se llaman cada uno los dos de la foto.

## Jon

Pero esperen, porque no les voy a contar la historia de esos dos muchachos, sino de este otro.
Acá aparece en un documental de Discovery explicando cómo hacía para contar cartas en el Blackjack cuando era estudiante de ingeniería mecánica en el MIT.
Es uno de los personajes reales de la película de Kevin Spacey.


Cuestión que en Las Vegas ganó un palo y con esa guita puso una startup de software de CAD 3D: Solidworks.
Hasta ese momento---principios de los 90---todos los programas CAD funcionaban en el Unix de los muchachos.
Pero este Jon (sin hache) sabía que otro había otro nerd que se venía con todo: Bill Gates.


## Solidworks

Vio venir que en los 90 la moda iba a ser "X para Windows", así que Solidworks se enfocó en Windows.
Y pasó a tener el 90% del mercado en un par de años.
En el 97, Jon vendió su compañía por 300 millones de dólares y se quedó como CEO.

## Onshape

Pasa el tiempo. Año 2011. Jon se da cuenta de que la tecnología está cambiando nuevamente.
Renuncia a Solidworks y pone otra startup de CAD pero ahora, "en la nube y directamente desde el browser".
Bueno, en 2019 vendió Onshape por 480 millones.

## Nerds

En resumen, 

 * Este nerd del MIT ganó 1 millón gracias a otros nerds del MIT

--- 
 
 * Los siguientes 300 gracias al nerd Bill Gates.
 
---

 * Y los últimos 480 gracias a los nerds de barba que en el 70 diseñaron un sistema operativo que hoy resuelve todos problemas que presenta "la nube" que definitivamente no existían hace más 50 años. Como la bicicleta.


Cierro concurso.
¿Nombre de los últimos dos?

Entre paréntesis, Dennis Ritchie (el de la derecha) se murió en 2011 la misma semana que Steve Jobs.
Así que su muerte pasó casi desapercibida. El único que dijo algo fue Ariel Torres, el columnista de La Nación.

## Cheque

Por si se lo preguntaban, resulta que sí me dieron el cheque gigante.

## IB50k, CNE, cancún

Era mi época de emprendedor, IB50k...

---

Si bien nunca funcionó muy bien el emprendimiento, me permitió hacer consultoría en temas de mecánica de piping para la central de embalse con mi propio solver.

---

Incluso poder ir a Cancún con mi familia.


## Do it for him

Pero bueno, a veces las cosas no salen como uno las planea.

## 

Y si tu hijo se enferma, tal vez tengas que apagar tu carrera profesional por un año.

[pausa]


## SRS & SDS

A la vuelta, tuve que empezar desde cero y, literalmente, agarrar lo que venía.
Esto implicó tener que aprender cosas nuevas.

Una de estas cosas fue un esquema de la industria del software muy interesante.
Consiste en un documento tipo "pliego" que lista los requerimientos que el comprador pide para un cierto desarrollo.
Y otro tipo "oferta" que indica cómo el software propuesto aborda e implementa cada requerimiento.

---

Para la herramienta desarrollada en esta tesis lo que hice fue jugar de los dos lados del mostrador.
Empecé escribiendo un SRS con estas secciones como si fuese un pliego de un llamado a licitación para una herramienta computacional.

Y después escribí el SDS explicando cómo es que mi propuesta de diseño e implementación satisface cada un de los requisitos que yo mismo me puse.




## FeenoX @ JOSS

Les presento entonces a FeenoX, un software publicado este año en Journal of Open Source Software.



## Unfair advantage: Markdown

Déjenme ver si puedo ilustrar este punto.

¿Qué opciones tendríamos si necesitáramos escribir un documento técnico. Un informe o un paper.
En el lado más "fácil" del espectro tendríamos una monstruosidad como Word y ahí cerquita Google Docs.
Del otro lado, algo como LaTeX o incluso TeX (lo que inventó Donald Knuth, el del libro gris).
En el medio, Markdown.


## Unfair advantage: FeenoX

Bueno, piensen a FeenoX como si fuese el Markdown de las herramientas tipo elementos finitos.
FeenoX es a los solvers tradicionales y a las bibliotecas de elementos finitos lo que Markdown es a Word y a LaTeX, respectivamente.

## Licensing

Lo primero que pide el SRS es que la herramienta desarrollada sea "open source" en el sentido OSI.

El SDS dice que FeenoX no sólo es abierto sino que también es libre con licencia GPLv3+.
Seguramente ya lo saben, pero nunca está de más repetirlo, especialmente en la industria nuclear.
Quiero hacer especial énfasis en que ninguno de los dos conceptos, ni código abierto ni software libre, se refiere a la idea de _precio_.

---

Según Richard Stallman (no es Roqueta, es Stallman), lo importante es la _libertad_ de poder modificar el código para que el software se comporte como uno necesita.
Y si uno no sabe programar, tiene la _libertad_ de contratar a alguien que lo haga. Esto es re profundo.

---


Por otro lado, Eric Raymond (el del libro de Unix) hace énfasis en la superioridad técnica del software open source. Y tiene un punto.
Y esto es importante en software científico y de ingeniería. Especialmente, de nuevo, en la industria nuclear.

---

Esta discusión podría necesitar más de 45 minutos en sí misma, así que la termino acá con estos dos refranes populares, que se pueden aplicar al software abierto.

[pausa]



## Scope

Resulta que FeenoX es, tal como Unix, un tercer intento. Third-system effect.

Todo empezó con el milonga, que algunos de ustedes conocerán e incluso tal vez habrán usado.

Como eso andaba más o menos bien, me pasó lo que a los gerentes de la Bell.

---

Empecé a agregar complejidad, features, etc. 

---

Hasta que decidí empezar de cero.

---

El scope actual es que FeenoX puede resolver estos problemas.
Pero hay un mecanismo de extensión que voy a explicar en detalle en un momento.

## Unix

Una de las lecciones aprendidas en las dos primeras versiones fue que vale la pena apalancarse explícitamente en la filosofía Unix y hacerle caso al libro de Raymond.

Too long; didn't read it: la filosofía Unix es "hacé un programa que haga solamente una cosa, pero que la haga bien".

Fijensé que dice "programa" y no "biblioteca".

---

Como usualmente hay que hacer varias cosas, están presentes los conceptos de "separación" y "composición" de forma tal de que la salida de un programa sea la entrada de otro.

---

De hecho podemos usar a FeenoX como un filtro de Unix pasando el input por la entrada estándar.



## 17 rules

En su libro, Raymond explicita 17 reglas.
Todas tienen algún grado de impacto en el diseño o en la implementación de FeenoX.

---

Un par de comentarios.

FeenoX se enfoca solamente en resolver "bien" ecuaciones en derivadas parciales.
Tiene que poder "charlar" con otras herramientas del palo, en particular malladores y post-procesadores.
Y se tiene que llevar bien con el concepto de "simulación programática", cuyo nombre no me gusta pero es como se lo llama en la industria.
A mí me gusta más decir las cosas con el sufijo "friendly", así que sería "script friendly".

---

En particular, tiene que permitir corridas paramétricas de forma más o menos sencilla.
FeenoX lo hace expandiendo argumentos en la línea de comandos en el input.

Supongamos que tenemos este archivo de entrada: `PRINT` hello pesos uno.
Bueno, si lo corremos desde Bash como `do` FeenoX `hello.fee` pesos $i$ dentro de un seq uno tres, nos dice "Hello 1", "Hello 2" y "Hello 3."

---

Otra regla importantísima, la regla de separación.

## Front-back

Excelentemente ilustrada en esta figura conceptual.

[pausa]

## La "nube"

Pasemos a "la nube".

¿Qué demonios es "la nube"? Básicamente quiere decir "computadoras de otra gente corriendo Linux."
El plural es importante, porque queremos resolver problemas grandes y vamos a necesitar varias computadoras.

Y que sea de otra gente y no nuestro, nos permite bajar los costos de oportunidad.
Los que saben de finanzas dicen que alquiles en lugar de comprarte una casa.
Pregunta para que vayan pensando: ¿Por qué Amazon pasó de vender libros a horas de CPU?

---

Ahora bien, que un solver sea "cloud first" o "cloud native" no es lo mismo que sea "cloud friendly".
No es solamente SSH o docker.

--- 

Y ni que hablar de solvers tipo desktop que quieren dockerizarlos para hacerlos "cloud enhanced".
Esta es una cita de un gerente de una compañía de software de elementos finitos que factura más de 2 mil millones de dólares al año.

## Cloud first $\neq$ cloud friendly

¿Por qué no es lo mismo?

Primero hay un tema de entrada y salida.
Central para separar front de back. El objetivo es que FeenoX pueda funcionar con diferentes front ends: desktop, web, realidad virtual, un holograma láser en 3D, no sé.

Después hay temas de deployment y escalabilidad.

Si el software no tiene todos estos ítems en cuenta en su base de diseño, después es muy complicado cambiar para acomodar lo que falta.

## CAEplex

Como prueba de concepto de una interfaz web pueden entrar a CAEplex punto com.


## LE10

Déjenme ilustrar uno de los puntos de la base de diseño FeenoX, que es que debe haber una relación uno a uno entre la definición del problema de ingeniería y el archivo de entrada.
Fíjense que todo lo que aparece en la formulación "human friendly" aparece en el archivo de entrada.
¡Y nada más!

Este caso también ilustra otro punto importante. La salida es lo que uno le pide, ¡y nada más!
Dame la tensión normal en la dirección $y$ evaluada en el punto D. Nada más.



## Arquitectura

Para decidir cómo implementamos todo esto, preguntémonos... ¿qué es que lo que tenemos que hacer?

 1. construir los objetos globales $K$ y $b$
 2. resolver $K \cdot u = b$
 3. re-construir los flujos $\phi$ y $\psi$ (y tal vez las corrientes $J$) a partir de $u$

El punto 2 es el foco de una biblioteca numérica.
Por regla de Unix no la vamos a escribir nosotros.
Nosotros nos tenemos que enfocar en 1 y en 3.

---
  
La biblioteca del punto 2 es PETSc (o SLEPc para criticidad).
Entonces FeenoX juega el papel dos "glue layers" en terminología Unix:
 
 * una que construye $K$ y $b$ a partir de la malla y del input, y 
 * otra que convierte la solución $u$ en flujos que puedan ser entendidos por un post-procesador como Paraview.
 
---

Breve mención a la elección del lenguaje de programación.
Esencialmente tenemos que elegir entre Fortran, C y C++.

La filosofía Unix nos dice que debemos agregar complejidad solamente cuando la necesitemos
Por razones diferentes, Fortran y C++ agregan complejidad innecesaria.
Así que FeenoX está escrito en C que, entre paréntesis y sesgo de confirmación de por medio, es el lenguaje ideal para las glue layers según Eric Raymond.


## Algoritmo para construir

Muy bien, veamos ahora cómo podemos hacer para construir la matriz global de rigidez y el vector de fuentes.
Barremos los elementos y acumulamos las contribuciones elementales sobre los puntos de Gauss.
En este caso para Poisson son las $B$ transpuesta $k$ $B$ para la matriz de rigidez y $H$ transpuesta por $f$ para las fuentes.

Fíjense que la ecuación diferencial esencialmente está dada por las llaves.

Entonces, en principio, podríamos implementar a FeenoX como un framework general que es agnóstico de la ecuación a resolver más algún mecanismo que le provea lo que depende de la ecuación particular.
 
## Implementación

¿Cómo podríamos hacer esto?
Supongamos que tenemos una variable `pde` que indica qué ecuación queremos resolver.
Entonces podríamos implementar la evaluación de las llaves así.

---

Bueno, esto es, primero que nada, feo.
Por favor, nunca hagan algo así.

Segundo, es tremendamente ineficiente. Hay que hacer todas estas comparaciones para cada punto de Gauss de cada elemento.

Tercero, es difícil de mantener.


## Polimorfismo

Si hubiésemos elegido C++ podríamos haber implementado las llaves como métodos virtuales.
Como estamos en C, lo hacemos con apuntadores a funciones.

Entonces reemplazamos ese feo bloque de ifs por este otro bloque feo de ifs.
Pero con dos diferencias:

 1. lo genera un script al que no le importa la belleza, y
 2. es uno sólo en toda la ejecución en tiempo de parseo.
 
Esencialmente en este único bloque if se hace apuntar un apuntador a función a una función que depende de cada ecuación a resolver, y a su vez en esa función se hacen apuntar los puntos de entrada que evalúan las contribuciones elementales, las condiciones de contorno y otras cosas más que dependen de la ecuación particular.


## Input

Pero antes de explicar en detalle esa implementación, déjenme hablar sobre el archivo de entrada.

Siguiendo la filosofía Unix, este input es un archivo de texto plano.
Tiene palabras clave en inglés, de forma tal de

 1. definir completamente el problema
 2. ser lo más auto-descriptivo y compacto posible, es decir están prohibidos los argumentos posicionales
 3. permitir expresiones algebraicas en cada lugar donde se espere un parámetro numérico
 4. tratar de mantener una correspondencia entre la formulación "humana" del problema y el input
 5. seguir la regla de que "problemas simples necesitan inputs simples"
 
y algunas más que discutimos en el SDS.

Estas palabras clave pueden ser definiciones o instrucciones.


## Ejemplos + IP

Por ejemplo. Efe de equis igual a equis cuadrado. Acá no hay sustantivo pero el igual funciona como una definición.

---

Siguiente. `INPUT_FILE` sorpresa `PATH` una expresión tipo `PRINTF` con un argumento random. Definición porque `FILE` es un sustantivo.
Read mesh es una instrucción que lee la malla en el archivo sorpresa.
`PRINT` cells es una instrucción. 

---


Acá tenemos un condicional. Si $b$ es muy chiquito: instrucción `PRINT`, instrucción `ABORT`.
Terimina condicional, instrucción `PRINT`.

---

De hecho FeenoX tiene un instruction pointer que ejecuta todas las instrucciones siguiendo una linked list. 


## Conducción de calor 1D

Problema simple, input simple.

 * Línea 1, definimos que queremos conducción 1D.
 * Línea 2, instrucción: leeme la malla.
 * Línea 3, definimos una variable `k` igual a 1. En problema thermal, si existe la variable `k` indica conductividad uniforme.
 * Líneas 4 y 5,  boundary condition (sustantivo) en left $T$ igual a cero y en right $T$ igual a 1.
 * Línea 6: instrucción, por favor resolvé el problema
 * Línea 7: instrucción imprimí la solución $T$ evaluada en $x=1/2$

---

Si corremos esto con FeenoX, deberíamos obtener 0.5


## Conductividad no uniforme

¿Qué pasa si la conductividad no es uniforme?
Bueno, si tenemos una función de $x$ lo que hacemos es definir una $k$ de $x$ y el resto todo igual.
Ahora el resultado ya no es 0.5 sino eso que está ahí.

---

¿Y si $k$ depende de la temperatura?
Ningún problema, escribimos $k$ de $x$ en función de $T$ de $x$.
Ahora el problema es no lineal. FeenoX se da cuenta de que si en `thermal` la conductividad (o alguna condición de contorno) depende de $T$, que es la solución, tiene que resolver un problema no lineal.
Este caso tiene solución analítica, que es esa raíz cuadrada que está ahí.


## Reed

Pasemos a un problema neutrónico.
Caso 1D con diferentes materiales y secciones eficaces uniformes en cada trozo.

Problem ahora es `neutron_sn` con `DIM` uno, `GROUPS` uno pero `SN` es pesos uno.
Recuerden que eso quiere decir que ese argumento viene de la línea de comandos.
Así que le tenemos que decir si queremos S$_2$, S$_4$, S$_6$, etc.

La salida de este input es la raíz cuadrada de la integral del cuadrado de la diferencia entre el flujo calculado por FeenoX y un perfil de referencia tomado de un blog académico.


## Bootstrap

Habiendo entendido tema input, volvamos ahora al bloque de ifs feo.
Habíamos dicho que lo generaba un script al que no le importaba la belleza.
Bueno, ese script es parte del bootstrapping del repositorio, en este caso `autogen`.
Ese script parsea los subdirectorios dentro de `src/pdes`. 
La idea es que cada ecuación tenga un subdirectorio con el nombre del `PROBLEM` a resolver.

Cada subdirectorio tiene que tener ciertos archivos en C con ciertas funciones con un cierto nombre que este `autogen` pueda parsear. Es un script de Bash que genera un poco de código en C que finalmente se compila en FeenoX.

Después si tienen tiempo y ganas les muestro cómo funciona. En principio podríamos remover un directorio completamente, volver a hacer bootstrap y compilar. Ese ejecutable no va a poder resolver esa PDE que borramos, pero sí el resto.

Está claro que no ganamos mucho removiendo. Es mucho más interesante agregar, que remover.
Es éste el mecanismo de extensibilidad que mencioné antes.


## Entry points

Cada subdirectorio debería entonces proveer la implementación de cada una de estas funciones, que van a ser llamadas por el framework general a lo largo de la ejecución.

Alguna relacionada al parser, para leer opciones al keyword `PROBLEM` y para interpretar las condiciones de contorno.

Otras para inicializar.

Las centrales para evaluar las llaves en cada punto de Gauss.

Una que resuelve el problema usando PETSc. Este entry point define esencialmente si hay que resolver un problema lineal, uno no lineal, un problema de autovalores o uno transitorio. En el caso thermal, eso lo deciden las funciones de inicialización dependiendo de si la conductividad depende de la temperatura o no. En neutrónica, si es un problema con fuentes o de criticidad.

Y después otros entry points para implementar la segunda capa y construir los flujos o las tensiones y deformaciones a partir de lo que resolvió PETSc.

---

Ejemplo. El keyword `PROBLEM` lo lee el parser general. Mira si hay alguna PDE llamada `neutron_sn`. Perfecto, entonces resuelve todos los apuntadores.

El siguiente keyword `DIM` es genérico, lo parsea el framework.
El siguiente keyword `GROUPS` no lo entiende el general, entonces se lo pasa al particular que sí lo entiende.
Lo mismo para `SN`.

---

Siguiente. Ese snippet de un input muestra el $k$ efectivo y la reactividad.
Esa variable `keff` la define implícitamente el parser específico, y al hacer `SOLVE_PROBLEM` se rellena con el primer autovalor. Lo mismo los flujos $\psi$ y $\phi$.
Después ya están para ser usados como variables o como funciones del espacio. Las podemos evaluar, escribir en un archivo, integrar, derivar, etc.

---

Finalmente, esta es la pinta de la parte del framework que llama al entry point que evalúa las contribuciones elementales en los puntos de Gauss.
Un for sobre $q$, una llamada a un apuntador a función que apunta a un entry point que depende de la ecuación particular.


## Expressions

Otro principio fundamental de la base de diseño de FeenoX: "everything is an expression".
Incluso la dimensión o la cantidad de grupos.
Desde ya, las propiedades de los materiales y las condiciones de contorno.

---

Esto de poder evaluar expresiones algebraicas, incluyendo funcionales como integrales, derivadas y sumatorias nos permite por ejemplo comparar la solución numérica con la solución analítica en los casos que la tienen. Este es un ejemplo de conducción de calor 1D transitoria. La solución, como ustedes saben, es una sumatoria de exponenciales que podemos evaluar perfectamente. Después restamos una de otra antes de imprimir y ya.

---

Este "feature" es especialmente importante para hacer verificación de código. En la reunión Garcar del año pasado hice una presentación sobre verificación con MMS. De hecho es uno de los resultados del capítulo 5, pero necesitaríamos 20 minutos, que es lo que dura esa charla. Dejo el link al video.


## No print no shirt

Volvamos a otra de las reglas centrales. La regla del silencio. ¿Recuerdan la tablita de 1965?
En FeenoX, sin `PRINT` no hay salida.
Le podemos pedir al software que haga un montón de cosas complicadas. 
Pero sin el bloque de abajo, no hay salida ni por terminal ni por archivo.
La salida es 100% definida por el usuario usando las instrucciones `PRINT`, `PRINTF`, `WRITE_RESULTS`, etc.

Es más, algunas cosas ni las calcularía. Por ejemplo, si no hay ninguna expresión que involucre las corrientes $J$, entonces FeenoX ni se molesta en calcularlas porque sabe que no son necesarias.




## Extras

Lista de temas que tienen una sección de la tesis donde las discutimos por escrito.

---

Lista de temas que no están explícitamente discutidos en el texto pero que podemos charlar durante el Q&A.

[pausa]


# Resultados

Capítulo de resultados.

## Tabla de problemas

Esta tabla muestra los problemas resueltos en la tesis.
Todos, excepto el último, requieren al menos una de las características distintivas de FeenoX.

## IAEA 3D PWR Onshape

Este es el problema que ya mostramos del benchmark de IAEA.
En este caso la geometría viene de un CAD modelado en Onshape, que es 100% web y cloud.
El que contamos en la historia de Jon sin hache.

## Malla

A partir de ese CAD hacemos una malla 3D.

## Meld

Este es un dif de las salidas del caso original con simetría un cuarto y con simetría un octavo.
Tanto la memoria como el tiempo de ejecución bajan a la mitad.

## MPI

Y si corremos en paralelo, vemos que si bien el tiempo baja lo más importante es que también baja la memoria por proceso.
Recuerden que ese era nuestro objetivo.

## Slab a dos zonas

Otro problema. Slab 1D con dos materiales, uno con $k$ infinito menor que uno y el otro mayor que uno.
Ancho total $b$, ancho del absorbente $a$. Queremos estudiar el $k$ efectivo en función de $a$.
Si el solver soporta mallas no estructuradas y por ende no uniformes, podemos poner un nodo exactamente en $x=a$.
Si el solver solamente soporta espaciado uniforme (es decir, ladrillitos) entonces hay que detectar en qué celda cae la punta de la barra de control y asignarle a esa celda amarilla una sección eficaz ficticia que sea un promedio pesado de la de los dos materiales.
Esto da lugar el "efecto cúspide".

Como este problema tiene solución analítica (y FeenoX la puede evaluar) entonces podemos comparar el error cometido por los dos casos,

 1. poniendo un nodo exactamente en $x=a$
 2. simulando el comportamiento de la sección eficaz ficticia
 
Como dice Richard Stallman, la mejor manera de resolver un problema es evitándolo.


## Cube-sphere

El problema del cubo-esfera.
Todos sabemos que para un volumen fijo, una esfera tiene más reactividad que un cubo.

---

¿Y en el medio?
Bueno, podemos ir haciéndole fillets al cubo.

---

Imposible de resolver con Legos.

## Input + python

Este caso ilustra la filosofía Unix en acción.
El input de FeenoX es realmente sencillo.
La complejidad está puesta en un script de Python que usa el API de Gmsh para fabricar la malla y llamar paramétricamente a FeenoX.


## Tres pescaditos

Otro problema.
Supogamos que tenemos tres pescaditos absorbentes.
Dos están fijos. El problema es ubicar el tercero de forma tal que la reactividad total sea mínima.

## Input

Otra vez dividimos y conquistamos.
El driver es un Python que usa una biblioteca de optimización con el método de Nelder & Mead.
Este Python llama a un Bash que ubica el pescadito y a su vez llama primero a Gmsh para mallar y después a FeenoX para resolver.
Algunas iteraciones y el $k$ efectivo es mínimo.


## PHWR

Último caso.
Un PHWR ficticio de siete canales y tres barras de control inclinadas.

[pausa]

## XS

Como el problema es inventado, también inventamos las secciones eficaces.
En particular, para el moderador ponemos un perfil de temperaturas en función de $z$.
Y hacemos que algunas secciones eficaces dependan algebráicamente y otras a través de puntos "experimentales" de esta temperatura.

## Flujos

Dibujitos tipo "CFD" (que como ustedes saben, quiere decir "colors for directors").


## Tabla y MPI

Y finalmente otra ilustración de que al correr esto en paralelo lo que logramos es bajar la memoria por proceso.

[pausa]

## Conclusiones

Antes que nada, todo esto que presenté va en el sentido del método de Descartes.
Como dice René, esto es lo que me sirvió a mí y lo comparto con ustedes.
Si a alguien más le sirve y quiere sumarse al barco, genial. Si no les sirve y quieren seguir otro método, en todo su derecho.

---

Seguimos el poco académico pero---a veces---útil orden why-how-what.

---

Y la metodología de diseño de software SRS/SDS.

## Unfair advantages

La herramienta que desarrollamos tiene, otra vez en el sentido de Descartes, algunas ventajas competitivas.

---

En particular, para neutrónica a nivel de núcleo soporta

 a. simulación programática (siguiendo la filosofía Unix)
 b. mallas no estructuradas
 c. ordenadas discertas (además de difusión)
 d. paralelización con MPI

---

Como dijo una vez un director del IB en una reunión de consejo académico: no es lo mismo leer manuales que escribir manuales.
 
 
## Tweets 

Si tuviesen que escribir un tweet o un mastodon contando que vinieron a escuchar esta charla, me gustaría que nombren alguno de estos siete conceptos.

En particular, la idea de que FeenoX es a los solvers tradicionales y a las bibliotecas de elementos finitos lo que Markdown es a Word y a LaTeX, respectivamente.

## Trabajos futuros

La tesis y esta presentación terminan con un jardín de trabajos futuros que se bifurcan.
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



----------------


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





## Cuadraturas de nivel simétrico

De todo el menú, nos quedamos con las cuadraturas de nivel simétrico.

Este slide es un ejemplo de algo que _no_ hay que hacer.

Como me tomó un cierto tiempo llegar al algoritmo para fabricar los triangulitos estos para un $N$ arbitrario quería mostrárselos.
Pero la verdad es que esto no tiene por qué agregarle valor a ustedes.
Ni tienen por qué apreciar el hecho de que el software funcione para un $N$ arbitrario, porque después de todo es algo que se debería dar por sentado.
Es como publicitar un hotel diciendo "las habitaciones tienen baño privado".

Pero bueno, sepan que soy consciente de _algunos_ de mis sesgos mentales.


## Mazes

Una nota de color antes de meternos en el código.
Supongamos que somos Homero Simpson y que tenemos que resolver un laberinto donde sabemos cuál es la entrada y cuál es la salida, pero no el camino que las une.
Podemos explotar la elipticidad del operador de Laplace con FeenoX.

. . .

Este es un post de LinkedIn y uno de los tutoriales.
Ahí en el link se muestran los detalles de cómo hacer el dibujito ese para un laberitno arbitrario.
Incluso cómo resolver el transitorio que ilustra cómo se prueban todos los caminos y los que no llevan a ningún lado van decayendo y sobrevive solamente la solución.

Bueno, basta de marketing.
Pasemos al código.

[pausa]

## Cosas que quedaron

 * Video CAEplex
 * Elementos de segundo orden
 * Mostrar bootstrap
 * Garcar 2023
 * Lista de temas que tienen una sección de la tesis donde las discutimos por escrito.
 * Lista de temas que no están explícitamente discutidos en el texto pero que podemos charlar durante el Q&A.
 * SNES y TS
 * Amazon de libros a CPU
 * ...

 
## El experimento de los monos

