# Capítulos

 1. piñón + motivación
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

 
# Ideas
 
 * usar objetos! el libro de raymond?
 * props
   a. objetivo: hace mejor la charla
   b. subjetivo: te hace tener más confianza a vos
   
   
   
# Tiempos
 
 1. (5 min) laterales con sandías, 3 ámbitos, TOC, mafalda
    1. (2 min) 100 años de programación
    2. (5 min) historia de dos reactores
    3. (3 min) propuesta: IAEA 3D PWR
    
 2. (3 min) Séneca, markdown, CC-BY, ecuaciones de transporte y difusión
 
 3. (5 min) Paul Graham
    1. energía multigrupo
    2. ángulo SN
    3. espacio FEM: mostrar contribuciones elementales, dirichlet BCs como appendix
    
 4. (10 min) Historia de Unix
    
    Acá debe venir el momento 1/phi
    Después de Unix, contar que yo estaba pum para arriba y pasa lo de max
    Foto do it for him?
    Aprender cosas nuevas: SRS/SDS
    
    Arquitectura - bien técnico y aburrido, terciopelo negro
    
    Mostrar compilación?
    Make check?
    cambiar 1 sign - recompilar - make check
    
 5. (10 min) Dr. Pepe Lolich, manuales
 
    Tabla de casos, accediendo a gentiles pedidos
    
    gdb session?
    IAEA 3D?
    PHWR?
    
 6. (2 min) conclusiones y trabajos futuros
 
    contribución siguiendo SRS/SDS
    
    word cloud: FOSS cloud-first untructured-grids programatic parallel Unix
    
    Trabajos futuros: que no queden en TO-DOs o nice-to-haves
    
    [...] CITES.
    
    
    
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
