---
title: Transporte de neutrones en la nube
lang: es-AR
numbersections: true
fontsize: 12pt
mainfont: LinLibertineO
sansfont: Carlito
monofont: DejaVuSansMono
...
 
# Prolegómeno

Acá donde me ven, tengo 40 años.
Eso quiere decir dos cosas.
 
 * una, que estoy viejo para estar haciendo esto, y
 * otra que crecí en los noventa.
 
Y en los noventa, todo daba vueltas alrededor de la televisión.
Y yo me la pasaba desperdiciando mi tiempo mirando televisión.

## Calabró

[despacio]

Un día, estaba yo desperdiciando mi tiempo con el programa de estos dos monstruos.
El invitado era un director técnico de fútbol, no recuerdo quién.
En un momento, "El contra" le pregunta:

[un toque más rápido]

"Supongamos que van 45 minutos del segundo tiempo. ¿Qué preferiría? ¿Un córner a favor... o un lateral a favor?"

"¡¡Ehhh!! ¿Pero qué pregunta es esa?"---responde rápido Carrizo.
"Con un córner uno tiene la posibilidad de llegar al área rival. Con un lateral, no."

[despacio]

"Lo que pasa es que allá en Villa Dálmine"---explica tranquilo Calabró---"nosotros durante la semana...

## Sandías

entrenamos laterales con sandías."

[pausa]

"Cuando el fin de semana agarramos la pelota, ¿sabés hasta dónde tiramos los laterales?"

[pausa]

Bueno, esa idea de entrenar laterales con sandías me empezó a perseguir.

## IB 2004

Exactamente diez años después, estaba yo entrenando laterales con sandías en la clase de mecánica de Barrachina.

## Electrón

Bueno.

## Lazo

Acá estoy entrenando laterales en el laboratorio de Fabián con mi loop de convección natural caótico en una etapa académica.

## TECNA

Terminada mi maestría en el IB, me dediqué a meter las narices en temas de licenciamiento de Atucha II en un etapa industrial de mi carrera profesional.

## Cites

Después de la criticidad, me pasé a temas de startups.
A veces yo le daba cheques gigantes a emprendedores desde CITES...

## BNA

Y a veces era yo el que pedía cheques...

## Mafalda

Esta tesis es excepcional en el sentido de que fue atípica, una excepción a la receta tradicional.
En lo que voy a contar hay quince años de lecciones aprendidas provenientes, justamente, de estos tres ámbitos: 

 * academia,
 * industria y
 * emprendedurismo.

De hecho, este largo tiempo me permitió poder separar---como dice Mafalda---lo urgente de lo importante.

## TOC

Primero que nada, si hubiese podido escribir la tesis en inglés el título habría sido ese: "a cloud-first etcétera".

Pero no encontré una buena traducción, así que elegí...

---

"transporte de neutrones en la nube" con el que intenté indicar---sin mucho éxito ahora con el diario del lunes---que el contenido de la tesis es una mezcla de 

 * física de reactores a nivel de núcleo, y
 * programación tipo high-performance.
 
---

La tesis está dividida en cinco capítulos más algunos apéndices---que sí están en inglés.
En en el primero explico la motivación, que sería el "por qué".
Los siguientes dos tienen el "cómo" y los últimos dos el "qué".


## Why

Empecemos entonces---como sugiere Simon Sinek---con el "why".


## Cien años de programación

Veamos juntos esta tabla de un paper de 1965.
El título del paper es "Desarrollos _recientes_ en computadoras y sus _consecuencias_ para el cálculo de reactores"

[pausa para que miren la tabla]

Tenemos que hacer el ejercicio mental de viajar 60 años al pasado para entender estos números.

Dejemos de lado consideraciones sobre arquitecturas, lenguajes, compiladores, etc.
Pensemos en cómo había que diseñar software de ingeniería en esa época.

Desde un punto de vista de costos, cada resultado calculado tenía que formar parte de la salida.
Porque si te llegabas a gastar varios miles de dólares para hacer una corrida y resulta que después necesitabas un número que no estaba en los papeles que el aparato había impreso, tenías que volver a pagar.

Viajemos "back to the future". Resulta que hoy, la hora de ingeniería es mucho más cara que la hora de CPU.
No tiene ningún sentido hacer que el ingeniero tenga que buscar la aguja que necesita en un pajar de números innecesarios.

[decir el siguiente párrafo mientras busco los libros]

Así y todo, hoy en día hay software de cálculo sigue sacando 669 de líneas de salida sin que se las pidas, incluyendo el nombre del programa como ASCII art.

Aún cuando desde hace varios años que tenemos libros como este, "The Art of Unix Programming" (que es un juego de palabras sobre este otro libro de Donald Knuth "The Art of Computer Programming"), que están llenos de lecciones aprendidas sobre programación a lo largo de todos este tiempo---del 65 a hoy.


## Historia de dos reactores

Pasemos ahora a la otra mitad.
Supongamos que hay un país que tiene no una, sino

---

dos centrales nucleares con un diseño único en el mundo.
Y los ingenieros nucleares de ese país tienen que modelar la inyección rápida de boro del segundo sistema de shutdown.

## Esquema de dos pasos

Sea con cinética puntual...
 
---

o con cinética espacial, como la fluidodinámica está desacoplada del resto de la planta durante el par de segundos que dura la inyección...

---

podemos calcular la pluma de boro en el tanque del moderador con CFD y meterla en un código de núcleo.
Así que prestemos atención a esa parte.


## Canales

En Argentina tenemos 

 1. moderador separado del refrigerante, y
 2. canales cilíndricos, que son una geometría "curva", ¿no?
 

## Dominio

Y cuando queremos discretizar una geometría curva como esta...

---

con una malla estructurada como esta...

---

nos vamos a topar con un "stair-case effect" como este.

---

Por otro lado, si usamos mallas no estructuradas, bueno vamos a tener algún error pero para la misma cantidad de celdas la discretización va a ser muy superior.

## Celdas estructuradas...

En los códigos neutrónicos de núcleo, aparecen cosas como estas.
Esto es Atucha I "vista" desde el código de cinética espacial que nombramos antes.

[pausa]

Es como "jugar a los Rastis", ¿no?
O a los Legos para los millenials.

## Celdas

[rápido]

¿Cómo es el esquema de cálculo multi-escala?
Bueno, agarramos un canal con un cacho de moderador alrededor y con eso condensamos secciones eficaces de celda a núcleo.
Fantástico.

## Gota

[un poco menos rápido]

Pero supongamos que queremos meter una gota de ácido deuterobórico en la celda.
Como hay solamente un único parámetro de concentración de boro, tenemos que mantener la masa y no nos queda otra más que distribuir _uniformemente_ el boro en toda la celda.
Y una gotita de 2.000 ppm no es lo mismo que 100 ppm en toda la celda.


## CFD

Por otro lado, dijimos que el primer paso era hacer un cálculo tipo CFD para ver cómo evoluciona la pluma de boro en el tanque del moderador.
Esto lo hacen los que saben de fluidos.
El boro no se mete en los canales porque el moderador está separado del refrigerante. 
Muy bien.


## Mapeo

[lento]

Para la neutrónica de núcleo tenemos que mapear---para cada instante---la pluma del CFD en nuestra malla estructurada.

---

Terminamos con Legos como estos.

[pausa]


## Gota

Entre los legos y el esquema de celdas, el boro termina metiéndose finalmente adentro de los canales.

Además de todas las preguntas sobre la validez de este esquema, surge también esta pregunta:

---

¿Qué tan buena es la aproximación de difusión en estas condiciones?


## Limitaciones

Resumiendo.

Tenemos limitaciones por

 1. dilución de la sección eficaz del boro 10 en toda la celda,
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

Para el punto uno, tenemos que re-pensar el esquema de condensación de secciones eficaces.
Para eso necesitamos flexibilidad en la entrada y extensibilidad en los modelos.

[pausa]

Pasemos a un ejemplo que ilustra estos puntos que quiero transmitir.


## IAEA 3D Benchmark

Seguramente conocen ustedes este benchmark 3D.

## Simetrías

El enunciado indica correctamente que la geometría tiene simetría un cuarto.
Como es para PWRs, con esta simétria se puede mallar perfectamente con cuadraditos.
Pero si miramos detenidamente, resulta que tiene simetría un _octavo_, y no solamente un cuarto.

---

El chiste es que necesitamos mallas _no estructuradas_ para aprovecharla.

Más aún, ese reflector no debería ser así.

---

Debería ser así.


## IAEA SN

Así que adelantándome al capítulo de resultados, les presento el benchmark 3D de IAEA resuelto con
 
 * simetría $1/8$ en lugar de $1/4$,
 * reflector circular en lugar de "recortado", y
 * S$_4$ en lugar de difusión.

 
 
## How

Aca termina mi explicación del "why."
Pasemos ahora al "how." 
 
[pausa para tomar agua y buscar carta]

## Séneca

Tengo acá una de las cartas de Séneca a su discípulo Lucilio.
Escribe Séneca:

[mostrar el papel como Dolina]

"No debemos tan sólo escribir ni tan sólo leer.
Hay que acudir a la vez a lo uno y a lo otro, y combinar ambos ejercicios a fin de que, cuantos pensamientos ha recogido la lectura, los reduzca a la unidad."

Sigue, Séneca:

"Lo que comprobamos que realiza en nuestro cuerpo la naturaleza sin ninguna colaboración nuestra, es eso lo que tenemos que hacer con la lectura. Los alimentos que tomamos, mientras mantienen su propia cualidad y compactos flotan en el estómago, son una carga.
Mas cuando se ha producido su trasformación, entonces y sólo entonces, se convierten en fuerza y sangre."

## Transporte y difusión de neutrones

Capítulo 2. Este capítulo no tiene _nada_ nuevo.
Lo escribí para que las ecuaciones que estudié hace casi veinte años en las clases de Ghó no sean una carga para mí, sino que se conviertan en fuerza y sangre.

---

Como ustedes sabrán, yo 

 * escribo en Markdown,
 * trackeo todo con Git y
 * ---cuando me dejan---publico en Github con licencia Creative Commons.

--- 

[rápido]

Acá abajo medio chiquito hay un hash que indica qué commit generó estos slides a partir del Markdown.
En la tesis lo mismo, así que si aparece un PDF, o un HTML online o se ponen a hojear un ejemplar impreso en la biblioteca, el footer indica el commit.
 
Si alguien necesita notas para dar clases---Chaco, Fede, [mirando a la cámara] Martín---tiene la libertad de clonar el repositorio y modificarlo según considere, [con voz de profesor y señalando] respetando la licencia.

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

El siguiente capítulo es cómo discretizamos estas ecuaciones diferenciales.
Este tampoco tiene (casi) nada nuevo.

Pero hay un par de diferencias.
La primera la explica Paul Graham.

[no sé si decir esto]
Entre paréntesis, si no conocen a Paul Graham googléenlo ahora mismo.
Es un ñato que llega a explicar conceptos de filosofía con regular expressions. Cierro paréntesis.


En uno de sus ensayos dice básicamente lo mismo que Séneca. No sorprende porque Graham suele citar a Séneca.
Pero agrega un pie de página genial, donde nos recuerda que "programar" es equivalente a "escribir".
Es decir, este capítulo está apuntador a programar las ecuaciones, no solamente a mirarlas.

La segunda diferencia, es que el menú de este capítulo es mucho más amplio que el del anterior, así que hay que elegir.

## Esquemas

La discretización en energía es bastante straightforward: formulación multi-grupo, que es como si tuviésemos volúmenes finitos con acople algebraico en lugar de diferencial.

---

Discretización en ángulo: revisitamos las ordenadas discretas, que podemos ver también como unos volúmenes finitos particulares.


## Discretización en espacio

Discretización del espacio: del menú, elegimos _elementos_ finitos.

Hagamos un breve repaso usando la ecuación de Poisson.

---

Primero la escribimos como una formulación débil.

Un operador bi-lineal coercitivo $a$ aplicado a $u$ y $v$ tiene que ser igual a un funcional $B$ larga de $v$ corta para toda $v$ corta viviendo en algún espacio funcional $V$ corta mayúscula. 
  
## Dominio

Todo esto sobre un dominio $U$ maýuscula con condición de Neumann sobre $\Gamma_N$ y condición de Dirichlet _homogénea_ sobre $\Gamma_D$.
Empecemos con Dirichlet homogénea y después les cuento cómo pasar a Dirichlet arbitraria.

## Nodos

Siguiente paso, ponemos nodos sobre el seno del dominio y sobre la frontera de Neumann, pero _no_ sobre la frontera de Dirichlet.

## Funciones

Después buscamos tantas funciones de forma como nodos pusimos de manera tal de que cada una valga uno en un nodo particular y cero el en resto. Y además tienen que satisfacer las condiciones de Dirichlet---o sea se tienen que anular en $\Gamma_D$.

## Elementos finitos

Para facilitar la programación, ponemos nodos también sobre la frontera de Dirichlet e identificamos los triángulos  que cubren el dominio $U$.
Llamamos a cada uno de éstos un "elemento", y escribimos las integrales de la formulación débil como sumas de contribuciones elementales.



## $K \cdot u = b$

Con un poco de álgebra lineal llegamos a que tenemos que resolver el sistema $K$ por $u$ igual a $b$, donde $K$ es una matriz "sparse" o "rala" de tamaño igual al número de nodos y que tiene contribuciones de cada uno de los elementos.
Las contribuciones del elemento $i$-ésimo tienen esta pinta.

Una parte viene de la integración numérica y otra parte viene de la discretización del operador $a$ que va a parar a la matriz de rigidez $K$ y del funcional $B$ larga grande que va al vector $b$ larga chica del miembro derecho.

---

Favor de notar que

 1. Nunca tuvimos que pasar por la escalerita. Todo esto funciona con mallas no estructuradas.

---
 
 2. Ese vector $u$ no es "la" solución del problema. "La" solución de elementos finitos es una función continua del espacio que podemos evaluar en cualquier punto arbitrario y que tenemos que fabricar a partir del vector $u$.

## Extras

Dos bonus tracks.
Primero, que podemos usar elementos segundo orden. Si quieren después profundizamos.

---

[rápido]

Segundo, nos quedaron pendientes las condiciones de Dirichlet no homogéneas.
Este es el "casi" nada nuevo.
Nunca pude encontrar una buena justificación del truco usual de poner un uno en la diagonal de la matriz de rigidez y el valor no homogéneo en la fila correspondiente del vector $b$.
De hecho consulté a colegas del palo de los elementos finitos y nadie me pudo cantar la posta.
Todos usaban el truco sabiendo que funciona pero habiendo olvidado el "por qué"...

[chiste]

como en el experimento de los monos.

En stack exchange está mi justificación matemática, que es la parte "nueva".
De hecho mi respuesta es la segunda más votada (después de la primera que es de Jed Brown).

[pausa]


## Difusión

Haciendo lo mismo que hicimos para Poisson pero para difusión multigrupo, llegamos a estas expresiones para las contribuciones elementales.
Los detalles en el capítulo tres.

$L$ es leakage, $A$ es absorción y $F$ es fisión. Abajo, $s$ son las fuentes.

Fíjense que la forma es parecida al caso de Poisson.
Medio que es esperable, ¿no? Porque el operador $a$ es elíptico en los dos casos aunque en difusión multi-grupo, el operador no es simétrico y puede llegar a no ser coercitivo.


## Ordenadas discretas

Podemos hacer lo mismo con ordenadas discretas.

Otra vez, la forma es parecida pero hay un diferencia: la ecuación es hiperbólica de primer orden y el operador $a$ no es elíptico.
Así que esa matriz $P$ que aparece en las contribuciones elementales es una matriz estabilizada tipo Petrov-Galerkin.
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
Pero hoy no nos vamos a meter en eso, y damos por terminado el "how."

## What

Veamos ahora el "what," que tiene las contribuciones originales de la tesis.

[pausa, tomar agua]

## Bicicleta

Con esto de la new age y la movilidad en grandes ciudades, le escuché a alguien decir que la bicicleta es un dispositivo que resuelve problemas que no existían cuando se inventó. Ajá.

## Dennis & Ken

Bueno, resulta que estos dos muchachos también inventaron algo que resuelve problemas que no existían en ese momento.

Veamos.

A mediados de los 60 (la época del paper de la tablita), los Bell Labs tenían un sistema operativo medio artesanal pero que andaba bastante bien.
Entonces, ¿qué pasó? Se metieron los gerentes y organizaron un proyecto para hacer una nueva versión "mejorada". En lunfa, un sistema operativo "bien pulenta".
Pero el proyecto, llamado MULTICS (siglas de _multiplexed_ information and computing service) fue tan ambicioso y complejo que se estancó.
No iba ni pa’delante ni pa’trás.
Entonces en el 70 estos dos muchachos empezaron desde cero.
Dejaron lo que servía, tiraron a la basura el resto y diseñaron e implementaron Unix---un juego de palabras sobre MULTICS.

---

Abro un concurso: una taza con el escudo de Atlético de Rafaela para cada una de las dos primeras personas que digan cómo se llaman cada uno los dos de la foto.

¿Alguien?

Bueno, cuando quieran, levanten la mano y arriesguen una respuesta.

## Jon

Pero esperen, porque no les voy a contar la historia de esos dos muchachos, sino de este otro.
Acá aparece en un documental de Discovery explicando cómo hacía para contar cartas en el Blackjack cuando era estudiante de ingeniería mecánica en el MIT.

Cuestión que en Las Vegas ganó un palo y con esa guita puso una startup de software de CAD 3D: Solidworks.
Hasta ese momento---principios de los 90---todos los programas CAD funcionaban en el Unix de los muchachos.

## Solidworks

Pero este Jon (sin hache) se dió cuenta de que en los 90 la moda iba a ser "X para Windows", así que Solidworks se enfocó en Windows.
Y pasó a tener el 90% del mercado en un par de años.
En el 97, Dassault la compró por 300 millones de dólares y Jon se quedó como CEO.

## Onshape

Pasa el tiempo. Año 2011. Jon se da cuenta de que la tecnología está cambiando de nuevo.
Renuncia a Solidworks y pone otra startup de CAD pero ahora, "en la nube y directamente desde el browser".
Bueno, en 2019 vendió Onshape por 480 millones.

## Nerds

En resumen, 

 * Este nerd del MIT ganó su primer millón gracias a otros nerds del MIT.

--- 
 
 * Los siguientes 300 gracias al nerd Bill Gates.
 
---

 * Y los últimos 480 gracias a los nerds de barba que en el 70 diseñaron un sistema operativo que hoy resuelve todos desafíos que presenta "la nube" y que definitivamente no existían hace más 50 años. Como la bicicleta.


Cierro concurso con ayudita.
¿Nombre de los últimos dos?

[ver si hace falta]

Primer paréntesis, Dennis Ritchie (el de la derecha) se murió en 2011 la misma semana que Steve Jobs.
Así que su muerte pasó casi desapercibida. El único que dijo algo fue Ariel Torres en su columna de La  Nación.

[chiste]

Segundo paréntesis.
Hubo nerds que hicieron mucha plata. Hay una luz de esperanza para la audiencia.


## Cheque

Ah! Por si se lo preguntaban, resulta que sí me dieron el cheque gigante.

## IB50k, CNE, cancún

[tranquilo]

Era mi época de emprendedor, de IB50k...

---

Si bien mi emprendimiento nunca funcionó muy bien comercialmente, me permitió hacer consultoría en temas de mecánica de piping para Embalse con mi propio solver.

---

Incluso poder manejar mis tiempos para ir a la playa con mi familia.


## Do it for him

Pero bueno, a veces las cosas no salen como uno las planea.

## 

Y si tu hijo se enferma, tal vez tengas que apagar tu carrera profesional por un año.

[pausa, tomar agua]


## SRS & SDS

A la vuelta, tuve que empezar desde cero y---literalmente---agarrar lo que venía.
Esto implicó tener que aprender cosas nuevas.

Una de estas cosas fue un esquema muy interesante de la industria del software que me hizo usar un cliente de Europa.
Consiste en un documento tipo "pliego" que lista los requerimientos que el comprador pide para un cierto desarrollo.
Y otro tipo "oferta" que indica cómo el vendedor aborda e implementa cada requerimiento.

---

Para la herramienta desarrollada en esta tesis lo que hice fue jugar de los dos lados del mostrador.
Empecé escribiendo un SRS con estas secciones como si fuese un pliego de un llamado a licitación para una herramienta computacional.

Y después escribí el SDS explicando cómo es que mi propuesta de diseño e implementación satisface cada una estas las secciones que yo mismo escribí.




## FeenoX @ JOSS

Les presento entonces a FeenoX, un software publicado este año en Journal of Open Source Software.

Déjenme ver si me sale ilustrar un punto sobre su diseño.


## Unfair advantage: Markdown


¿Qué opciones tendríamos si necesitáramos escribir un documento técnico? Un informe o un paper.
En el lado más "fácil" (y "horrendo") del espectro tendríamos una monstruosidad como Word y ahí cerquita Google Docs.
Del otro lado, algo como LaTeX o incluso TeX (lo que inventó Donald Knuth, el del libro beige).
En el medio, Markdown.


## Unfair advantage: FeenoX

Bueno, piensen a FeenoX como si fuese el Markdown de las herramientas tipo elementos finitos.
FeenoX es a los solvers tradicionales y a las bibliotecas de elementos finitos lo que Markdown es a Word y a LaTeX, respectivamente.

[chiste]

Nota al pie: por favor, traten de _no_ usar Word para escribir matemática.
Me hace doler los ojos... como cuando voy a la cancha.


## Licensing

Lo primero que pide el SRS es que la herramienta desarrollada sea "open source" en el sentido OSI.

Esto es como predicar para el coro así que resumo la discusión sobre licenciamiento de software:

 1. Free no quiere decir gratis
 
--- 
 
 2. Según Stallman lo importante es la libertad

---
 
 3. Según Raymond (el del libro amarillo) lo importante es que se vea el código
 
Esta discusión necesitaría más de 45 minutos en sí misma, así que la termino acá con estos dos refranes populares, que se pueden aplicar al software abierto.

[pausa]



## Scope

Resulta que FeenoX, tal como Unix, es un tercer intento. Un third-system effect.

Todo empezó con el milonga, que algunos de ustedes conocerán e incluso tal vez habrán usado.

Como eso andaba más o menos bien, me pasó lo que a los gerentes de la Bell.

---

Empecé a agregar complejidad, features innecesarias, etc. 

---

Hasta que decidí empezar de cero, como Ken.

---

El scope actual es que FeenoX puede resolver estos problemas.
Pero hay un mecanismo de extensión con el que se pueden agregar otras ecuaciones, que voy a explicar en detalle en un momento, y que es una de las contribuciones originales.

## Unix

Una de las lecciones aprendidas en las dos primeras versiones fue que vale la pena hacerle caso al libro amarillo y apalancarse explícitamente en la filosofía Unix.

Too long; didn't read it: la filosofía Unix es "hacé un programa que haga solamente una cosa, pero que la haga bien".

---

Como usualmente hay que hacer varias cosas, están presentes los conceptos de "separación" y "composición" de forma tal de que la salida de un programa sea la entrada de otro.

---

De hecho FeenoX se puede usar como un filtro pasando el input o incluso datos a través de un pipe.



## 17 rules

En su libro, Raymond explicita 17 reglas.
Todas tienen algún grado de impacto en el diseño o en la implementación de FeenoX.

---

Un par de comentarios.

FeenoX se enfoca solamente en resolver "bien" ecuaciones en derivadas parciales.
Tiene que poder "charlar" con otras herramientas del palo, en particular malladores y post-procesadores.
Y se tiene que llevar bien con el concepto de "simulación programática", cuyo nombre no me gusta pero es como se lo llama en la industria.
A mí me gusta más decir las cosas con el sufijo "friendly", así que para mí sería "script friendly."

---

En particular, tiene que permitir corridas paramétricas de forma más o menos sencilla.
FeenoX lo hace expandiendo argumentos de la línea de comandos en el input.

Supongamos que tenemos este archivo de entrada: `PRINT` hello pesos uno.
Bueno, si lo corremos desde Bash como `do` `feenox` `hello` punto `fee` pesos $i$ dentro de un `seq` uno tres, nos dice "Hello 1", "Hello 2" y "Hello 3."

---

Otra regla importantísima: la regla de separación.
Política de mecanismo. Front de back.

## Front-back

Excelentemente ilustrada en esta figura conceptual.

[pausa]

## La "nube"

Pasemos ahora a "la nube".

¿Qué demonios es "la nube"? Básicamente quiere decir "computadoras de otra gente corriendo Linux."
El plural es importante, porque queremos resolver problemas grandes y vamos a necesitar varias computadoras.

Y que sean de otra gente y no nuestras, nos permite bajar los costos de oportunidad.
Si los que saben de finanzas te dicen que alquiles en lugar que te compres una casa, imagínense computadoras para hacer cálculos.

Pregunta para que vayan pensando (sin premio): ¿Por qué Amazon pasó de vender libros a vender horas de CPU?

---

Ahora bien, que un solver sea "cloud first" o "cloud native" no es lo mismo que sea "cloud friendly" o "cloud enhanced".
No es solamente SSH o docker.
Y ni que hablar de solvers point-and-click para Windows a los que les hacen un remote desktop y dicen que son "cloud".

--- 


Para que tengan una idea, esta es una cita de un gerente de una compañía de software de elementos finitos que factura más de 2 mil millones de dólares al año durante una presentación interna.

## Cloud first $\neq$ cloud friendly

¿Y por qué no es lo mismo?

Primero hay un tema de entrada y salida.
Central para separar front de back. El objetivo es que FeenoX pueda funcionar con diferentes front ends: desktop, web, realidad virtual, un holograma láser en 3D, no sé.

Después hay temas de deployment y escalabilidad.

Si el software no tiene todos estos ítems en cuenta en su base de diseño, después---como en cualqueir proyecto de ingeniería---es muy complicado cambiarlo para acomodar lo que falta.

## CAEplex

Como prueba de concepto de una interfaz web pueden entrar a CAEplex punto com, que es el emprendimiento que nunca funcionó comercialmente.
Es mobile-friendly así que pueden entrar ahora.

## LE10

Déjenme ilustrar uno de los puntos más importantes de la base de diseño FeenoX, que es que debe haber una relación uno a uno entre la definición del problema de ingeniería y el archivo de entrada, que aprovecho para presentar: tienen esta pinta.

Fíjense que todo lo que aparece en la formulación "humana" aparece en el archivo de entrada.
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
  
La biblioteca del punto 2 es PETSc.
Entonces FeenoX juega el papel dos capas---o "glue layers" en terminología Unix:
 
 * una que construye $K$ y $b$ a partir de la malla y del input, y 
 * otra que convierte el vector $u$ en la solución real, distribuciones espaciales que puedan ser evaluadas en cualquier punto del espacio y entendidas por un post-procesador como Paraview.
 
---

[despacio porque es importante]

Breve mención a la elección del lenguaje de programación.
Esencialmente tenemos que elegir entre Fortran, C y C++.

La filosofía Unix nos dice que debemos agregar complejidad solamente cuando la necesitemos.
Por razones diferentes---e incluso opuestas---Fortran y C++ agregan complejidad innecesaria.
Así que FeenoX está escrito en C que, entre paréntesis y sesgo de confirmación mediante, es el lenguaje ideal para las glue layers según Eric Raymond.


## Algoritmo para construir

Muy bien, veamos ahora cómo podemos hacer para construir la matriz global de rigidez y el vector de fuentes.
Barremos los elementos y acumulamos las contribuciones elementales sobre los puntos de Gauss.
En este caso para Poisson son las $B$ transpuesta $k$ $B$ para la matriz de rigidez y $H$ transpuesta por $f$ para las fuentes.

---

Fíjense que la ecuación diferencial esencialmente está dada por las expresiones entre llaves.

Entonces, en principio, podríamos implementar a FeenoX como un framework general que sea agnóstico de la ecuación a resolver más algún mecanismo que le provea lo que depende de la ecuación particular.
 
## Implementación

¿Cómo podríamos hacer esto?
Supongamos que tenemos una variable `pde` que indica qué ecuación queremos resolver.
Entonces podríamos implementar la evaluación de las llaves así.

If `pde` es Poisson then return $B$ transpuesta $k$ $B$, else if etc.

---

Bueno, esto es, primero que nada, feo.
Por favor, nunca hagan algo así.

Segundo, es tremendamente ineficiente. Hay que hacer todas estas comparaciones para cada punto de Gauss de cada elemento.

Tercero, es difícil de mantener.


## Polimorfismo


Si hubiésemos elegido C++ podríamos haber implementado las llaves como métodos virtuales.
Como estamos en C, lo hacemos con apuntadores a función.


---

Entonces reemplazamos ese bloque feo de ifs por este otro bloque feo de ifs.
Pero con dos diferencias:

 1. lo genera un script al que no le importa la belleza, y
 2. es uno sólo en toda la ejecución en tiempo de parseo.
 
Esencialmente en este único bloque if se resuelve un apuntador a una función en tiempo de parseo que depende de cada ecuación a resolver.
Y a su vez en esa función se resuelven puntos de entrada que evalúan las contribuciones elementales, las condiciones de contorno y otras cosas más que dependen de la ecuación diferencial particular.


## Input

Pero antes de explicar en detalle esa implementación, déjenme hablar sobre el archivo de entrada.

Siguiendo la filosofía Unix, este input es un archivo de texto plano.
Tiene palabras clave en inglés, de forma tal de

 1. definir completamente el problema: de forma tal de que no sea necesaria ninguna intervención humana una vez lanzado el programa
 2. ser lo más auto-descriptivo y compacto posible: es decir están prohibidos los argumentos posicionales
 3. permitir expresiones algebraicas en cada lugar donde se espere un parámetro numérico: ahora ilustramos este punto
 4. tratar de mantener una correspondencia entre la formulación "humana" del problema y el input (como lo que hablamos hace un rato del "nada más")
 5. seguir la regla de que "problemas simples necesitan inputs simples": ya lo ilustramos también en un segundo
 
y algunas más que discutimos en el SDS.

Estas palabras clave pueden ser definiciones o instrucciones.



## Conducción de calor 1D

Problema simple, input simple.

 * Línea 1, definición (`PROBLEM` es sustantivo): queremos conducción 1D.
 * Línea 2, instrucción: leeme la malla. ¿Qué malla? Bueno, esta, que tiene dos puntos físicos llamados "left" y "right".
 
--- 
 
 * Línea 3, definimos una variable `k` y le asignamos el valor uno. En problema `thermal`, si existe la variable `k` indica conductividad uniforme.
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

La salida de este caso es un error cuadrático con respecto a una solución de referencia que encontré en un blog, así que desconozco la exactitud.

## Bootstrap

Habiendo entendido tema input, volvamos ahora al bloque de ifs feo.
Habíamos dicho que lo generaba un script al que no le importaba la belleza.
Bueno, ese script es parte del bootstrapping del repositorio, en este caso `autogen`.
Ese script parsea los subdirectorios dentro de `src/pdes`. 
La idea es que cada ecuación tenga un subdirectorio con el nombre del `PROBLEM` a resolver.

Cada subdirectorio tiene que tener ciertos archivos en C con ciertas funciones con un cierto nombre que este `autogen` pueda parsear. Este es el script de Bash que genera el bloque feo de ifs.

Después si tienen tiempo y ganas les muestro cómo funciona.
Podemos remover un directorio completamente, volver a hacer bootstrap y compilar. Ese ejecutable no va a poder resolver esa PDE que borramos, pero sí el resto.

Está claro que no ganamos mucho removiendo. Es mucho más interesante agregar, que remover.
Este es el mecanismo de extensibilidad que mencioné antes.
En los trabajos futuros hay un bullet que es agregar nuevas ecuaciones: electromagnetismo, acústica, fluidos... se aceptan sugerencias.

[mostrar perfil alar?]

## Entry points

Cada subdirectorio debería entonces proveer la implementación de cada una de estas funciones, que van a ser llamadas por el framework general a lo largo de la ejecución.

Alguna relacionada al parser, para leer opciones al keyword `PROBLEM` y para interpretar las condiciones de contorno.

Otras para inicializar.

Las centrales para evaluar las llaves en cada punto de Gauss.

Una que resuelve el problema usando PETSc. Este entry point define esencialmente si hay que resolver

 * un problema lineal,
 * uno no lineal,
 * un problema de autovalores o
 * uno transitorio.

En el caso `thermal`, eso lo deciden las funciones de inicialización dependiendo de si la conductividad depende de la temperatura o no. En neutrónica, si es un problema con fuentes o de criticidad.

Y después otros entry points para implementar la segunda capa y construir los flujos y las corrientes a partir de lo que resolvió PETSc.


## Expressions

Otro principio fundamental de la base de diseño de FeenoX relacionado a la flexibilidad, que ya nombramos antes: "todo es una expresión".
Incluso la dimensión o la cantidad de grupos.
Desde ya, las propiedades de los materiales y las condiciones de contorno.

---

Esto de poder evaluar expresiones algebraicas, incluyendo funcionales como integrales, derivadas y sumatorias nos permite por ejemplo comparar la solución numérica con la solución analítica en los casos que la tienen. Este es un ejemplo de conducción de calor 1D transitoria. La solución, como ustedes saben, es una sumatoria de exponenciales que podemos evaluar perfectamente. Después restamos una de otra antes de imprimir y ya.

---

Este "feature" es especialmente importante para hacer verificación de código. En la reunión Garcar del año pasado hice una presentación sobre verificación con MMS. De hecho es uno de los resultados del capítulo 5, pero necesitaríamos 20 minutos para discutirla, que es lo que dura esa charla. Dejo el link al video.


## No print no shirt

Volvamos a otra de las reglas centrales. La regla del silencio. ¿Recuerdan la tablita del 65, no?
En FeenoX, sin `PRINT` no hay salida.
Le podemos pedir al software que haga un montón de cosas complicadas. 
Pero sin el bloque de abajo, no hay salida ni por terminal ni por archivo.
La salida es 100% definida por el usuario usando las instrucciones `PRINT`, `PRINTF`, `WRITE_RESULTS`, etc.

Es más, algunas cosas ni las calcularía. Por ejemplo, si no hay ninguna expresión que involucre las corrientes $J$, entonces FeenoX ni se molesta en calcularlas porque sabe que no son necesarias.




## Extras

Lista de temas que tienen una sección de la tesis donde las discutimos por escrito.

---

Lista de temas que no están explícitamente discutidos en el texto pero que podemos charlar durante el Q&A.

Anoten para después levantar la mano y preguntar.

[pausa]


# Resultados

Capítulo de resultados.

## Tabla de problemas

Esta tabla muestra los problemas resueltos en la tesis.
Todos, excepto el último, requieren al menos una de las características distintivas de FeenoX

 * simulación programática
 * mallas no estructuradas
 * ordenadas discretas
 * paralelización con MPI
 

## IAEA 3D PWR Onshape

Este es el problema que ya mostramos del benchmark de IAEA.
En este caso la geometría viene de un CAD modelado en Onshape, 100% web y cloud. El de los 480 millones de Jon sin hache.

## Malla

A partir de ese CAD hacemos una malla 3D y corremos FeenoX.

## Meld

Este es un dif de las salidas del caso original con simetría un cuarto y con simetría un octavo.
Tanto la memoria como el tiempo de ejecución bajan a la mitad.

## MPI

Y si corremos en paralelo, vemos que si bien el tiempo baja lo más importante es que también baja la memoria por proceso.
Recuerden que ese era nuestro objetivo: resolver problemas grandes partiéndolos en pedazos chicos de forma tal de que cada uno consuma una cantidad razonable de memoria.

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

Curva omposible de obtener con Legos.

## Input + python

Este caso ilustra la filosofía Unix en acción.
El input de FeenoX es realmente sencillo.
La complejidad está puesta en un script de Python que usa el API de Gmsh para hacer los fillets, fabricar la malla y llamar paramétricamente a FeenoX.


## Tres pescaditos

Otro problema.
Supogamos que tenemos tres pescaditos absorbentes.
Dos están fijos. El problema consiste ubicar el tercero de forma tal que la reactividad total sea mínima.

## Input

Otra vez dividimos y conquistamos.
El driver es un Python que usa el paquete de optimización de SciPy con el método de Nelder & Mead.
Este Python llama a un Bash que ubica el pescadito y a su vez llama primero a Gmsh para crear la malla y después a FeenoX para calcular el $k$ efecitvo. Algunas iteraciones encontramos el mínimo.


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

Conclusiones.
Antes que nada, todo esto que presenté va en el sentido del método de Descartes.
Como dice René, esto es lo que me sirvió a mí y lo comparto con ustedes.
Si a alguien más le sirve y quiere sumarse al barco, genial. Si no les sirve y quieren seguir otro método, adelante.

---

Seguimos el poco académico pero---a veces---útil orden why-how-what de Simon Sinek.

---

Y la metodología de diseño de software SRS/SDS.

## Unfair advantages

La herramienta que desarrollamos tiene, otra vez en el sentido de Descartes, algunas ventajas competitivas.

---

En particular, para neutrónica a nivel de núcleo soporta

 * simulación programática (siguiendo la filosofía Unix)
 * mallas no estructuradas
 * ordenadas discretas (además de difusión)
 * paralelización con MPI

---

Como dijo una vez un director del IB en una reunión de consejo académico cuando yo era representante de los estudiantes: no es lo mismo leer manuales que escribir manuales.
 
 
## Tweets 

Si tuviesen hacer un tweet o un mastodon contando que vinieron a escuchar esta charla, me gustaría que escriban alguno de estos siete conceptos en 140 caracteres.

En particular, la idea de que FeenoX es a los solvers tradicionales y a las bibliotecas de elementos finitos lo que Markdown es a Word y a LaTeX, respectivamente.

## Trabajos futuros

La tesis y esta presentación terminan con un jardín de trabajos futuros que se bifurcan.
Cada unos de estos bullets implica varios años-persona y un presupuesto importante.
En particular, el último es una meta-tarea que podría llegar a involucrar a una o más de las anteriores.

Seguramente ustedes se preguntan lo mismo que yo.
¿Cómo hacemos todo esto?

Bueno, como le explica Séneca a Lucilio: "con una constante dedicación".
Porque si llegara a venir un cisne negro y te cambiara la número cinco a la que estás acostumbrado por una bola de bowling, pero vos le estuviste haciendo caso al contra y durante la semana te la pasaste entrenando laterales con sandías, tal vez te quede resto...

## PhD / Cancún

y puedas terminar una tesis de doctorado a los 40...

y puedas volver a la playa con tu familia.

Muchas gracias.

[esperar y pasar de slide]

## 




----------------


# Apéndices

## Índice

 * Video CAEplex
 * Elementos de segundo orden
 * Mostrar bootstrap
 * Garcar 2023
 * Lista de temas que tienen una sección de la tesis donde las discutimos por escrito.
 * Lista de temas que no están explícitamente discutidos en el texto pero que podemos charlar durante el Q&A.
 * SNES y TS
 * Amazon de libros a CPU
 * ...


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



## El experimento de los monos

## PETSc

## Unix y los desafíos de la nube

## Markdown

## Amazon

## CAEplex & Onshape

## Presentación Garcar 2023

## Mazes

Una nota de color antes de meternos en el código.
Supongamos que somos Homero Simpson y que tenemos que resolver un laberinto donde sabemos cuál es la entrada y cuál es la salida, pero no el camino que las une.
Podemos explotar la elipticidad del operador de Laplace con FeenoX.

. . .

Este es un post de LinkedIn y uno de los tutoriales.
Bueno, pasemos al código.

[pausa]

## Mostrar autogen, borrar thermal


## Licensing



El [remarcar] SDS dice que FeenoX no sólo es abierto sino que también es libre con licencia GPL3+.
Seguramente estoy predicando para el coro y ya lo saben, pero nunca está de más repetirlo---especialmente en la industria nuclear.
Quiero hacer especial énfasis en que ninguno de los dos conceptos, ni código abierto ni software libre, se refiere a la idea de _precio_.

---

Según Richard Stallman (no es Roqueta, es Stallman), lo importante es tener la _libertad_ para poder modificar el código para que el software se comporte como uno necesita.
Y si uno no sabe programar, tener la _libertad_ de poder contratar a alguien que lo haga. Esto es re profundo.

---


Por otro lado, Eric Raymond (el del libro amarillo) hace énfasis en la superioridad _técnica_ del software open source.
Y tiene un punto. Y esto es importante en software científico y de ingeniería. Especialmente, de nuevo, en la industria nuclear.

## Ejemplos + IP

Por ejemplo. `INPUT_FILE` sorpresa `PATH` una expresión tipo `PRINTF` con un argumento random. Definición porque `FILE` es un sustantivo.
`READ_MESH` es una instrucción que lee la malla en el archivo sorpresa.
`PRINT` cells es una instrucción. 

---


Acá tenemos un condicional. Si $b$ es muy chiquito: instrucción `PRINT`, instrucción `ABORT`.
Termina condicional, instrucción `PRINT`.

---

Este es uno más difícil.
Acá no hay ni verbos ni sustantivos.
$a$ igual a 1 es una instrucción, pero $f$ de $x$ igual a $a$ $x$ cuadrado es una definición.
Los `PRINT`s, aunque sean iguales, van a imprimir cosas diferentes.


---

De hecho FeenoX tiene un instruction pointer que ejecuta todas las instrucciones siguiendo una linked list respetando los loops y los condicionales.

## Ejemplos

---

Ejemplo. El keyword `PROBLEM` lo lee el parser general. Mira si hay alguna PDE llamada `neutron_sn`. Perfecto, entonces resuelve todos los apuntadores que expliqué antes.

El siguiente keyword `DIM` es genérico, lo parsea el framework.
El siguiente keyword `GROUPS` no lo entiende el general, entonces se lo pasa al particular que sí lo entiende.
Lo mismo para `SN`.

---

Siguiente. Ese snippet de un input muestra el $k$ efectivo y la reactividad.
Esa variable `keff` la define implícitamente el parser específico, y al hacer `SOLVE_PROBLEM` se rellena con el primer autovalor. Lo mismo los flujos $\psi$ y $\phi$ y las corrientes $J$.
Por ejemplo, en elasticidad sería calcular tensiones a partir de desplazamientos. En conducción de calor, flujos de calor a partir de temperaturas.

Después ya están para ser usados como variables o como funciones del espacio. Las podemos evaluar, escribir en un archivo, integrar, derivar, etc.

---

Finalmente, esta es la pinta de la parte del framework que llama al entry point que evalúa las contribuciones elementales en los puntos de Gauss.
Un for sobre $q$, una llamada a un apuntador a función que apunta a un entry point que depende de la ecuación particular.



## Unix

portability
multi-task
multi-user
plain text for storing data
hierarchical filesystem
devices as files
ipc
small programs that commumicate through pipes
client-server program model
kernel space/user space (memory)
regexp
C
tcp/ip
documentation manpages



the idea that the power of a system comes more from the relationships among programs than from the programs themselves


git vs. github

