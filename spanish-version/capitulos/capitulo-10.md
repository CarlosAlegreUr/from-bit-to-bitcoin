# Capítulo 10: Proof-of-Work - Ganándote el Derecho a Escribir

*¿Y si tomáramos prestada la jerarquía temporalmente, pero ganáramos el liderazgo a través del esfuerzo?*

---

Hemos establecido el problema: distribuir una base de datos a través de miles de ordenadores crea caos de sincronización. Actualizaciones conflictivas, retrasos de latencia, y actores maliciosos pueden amenazar con romper el sistema.

Aquí hay un pensamiento natural: **¿Y si temporalmente le diéramos a alguien el poder de decidir?**

## Tomando Prestada la Jerarquía (Solo por un Momento)

Piénsalo: muchos de los problemas que identificamos en el Capítulo 9 se vuelven más fáciles si una persona tiene autoridad:

**Problema 1 (Actualizaciones conflictivas):** Si Alice envía 10 monedas a Bob Y a Carol al mismo tiempo, ¿quién decide qué transacción es válida? Fácil—la persona a cargo decide. Eligen una, rechazan la otra. Hecho.

**Problema 2 (Retrasos de latencia):** Si las bases de datos están temporalmente desincronizadas porque la información tarda tiempo en viajar, ¿quién decide cuál es el estado "correcto"? La persona a cargo espera un segundo o dos y declara: "Esta es la versión oficial." Todos actualizan para coincidir.

**Problema 3 (Seguridad):** Si Dave intenta inundar la red con transacciones falsas o enviar datos conflictivos a diferentes personas, ¿quién lo detiene? La persona a cargo valida transacciones y solo incluye las legítimas.

La centralización hace la coordinación mucho más simple—por eso los bancos funcionan tan eficientemente. Una autoridad, una base de datos, una fuente de verdad.

**Pero no queremos centralización permanente.** Eso nos lleva de vuelta al problema del banco—falta de propiedad, cuentas congeladas, control por una sola entidad.

**La idea:** ¿Y si le damos a alguien autoridad temporal para escribir en la base de datos, pero:
- Solo por un período corto (no para siempre como los bancos).
- Deben seguir reglas (como "no gastar doble").
- Rotamos quién obtiene este poder (no la misma persona cada vez).

**Este es el compromiso elegante:** Toma prestada la jerarquía temporalmente, pero distribúyela a lo largo del tiempo.

## ¿Quién Obtiene el Derecho a Escribir?

Vale, entonces le daremos a alguien poder temporal para añadir transacciones, para escribir nueva información a la base de datos. ¿Pero a quién?

**No podemos simplemente votar.** Los IDs aquí se crean desde casa—Dave podría ejecutar 500 identidades falsas y ganarle a todos en votación. Un ordenador, un voto no funciona cuando cualquiera puede pretender ser 500 ordenadores. Además, no nos conocemos entre nosotros, y no necesitamos hacerlo. ¿Cómo vas a votar por alguien digno de confianza si no lo conoces?

**No podemos simplemente elegir al azar.** Mismo problema—si Dave ejecuta 500 ordenadores en una red de 700 ordenadores, tiene una probabilidad de 500/700 de ser elegido comparado con 200 participantes honestos. Él gana la mayoría del tiempo. ¿Y si es malvado? ¿El mal gana la mayoría del tiempo? Eso, por definición, no es bueno.

**Necesitamos un mecanismo de selección diferente.**

## Cómo los Humanos Eligen Líderes

A lo largo de la historia, los humanos han elegido líderes basándose en **hazañas**:
- El héroe valiente que defendió la aldea (coraje demostrado a través de la acción).
- El doctor superinteligente que inventó una cura (experiencia demostrada a través del logro).
- El artesano habilidoso que construyó las mejores herramientas (competencia demostrada a través del trabajo).

**Las hazañas requieren:**
1. **Habilidad** - Necesitas saber cómo hacer algo.
2. **Esfuerzo** - Necesitas realmente hacer el trabajo.
3. **Prueba** - Otros pueden verificar que lo lograste.

No puedes falsificar una hazaña fácilmente. No puedes afirmar ser un héroe sin luchar. No puedes afirmar haber inventado una cura sin mostrar la medicina funcionando. La hazaña en sí es la prueba.

**¿Y si usáramos este mismo principio natural para elegir quién puede escribir en la base de datos?**

Requerir una hazaña—algo que requiere esfuerzo, puede verificarse, pero no puede falsificarse fácilmente.

## La Primera Hazaña Digital: Proof-of-Work

En el mundo físico, las hazañas involucran coraje, inteligencia, o artesanía. En el mundo digital, ¿cuál es el equivalente?

**Computación, ejecutada por electricidad, energía.**

Los ordenadores hacen trabajo computando—ejecutando cálculos, procesando datos, resolviendo problemas matemáticos. Algunos cálculos son fáciles (sumar 2+2), mientras otros son muy difíciles (encontrar un patrón específico en miles de millones de números aleatorios).

**Aquí está la idea:** Para ganarte el derecho de escribir el próximo lote de transacciones en la base de datos, debes resolver un rompecabezas computacional difícil.

No un rompecabezas que requiere inteligencia (eso favorecería injustamente a gente inteligente, y es muy difícil de diseñar). Un rompecabezas que requiere **fuerza bruta** funcionaría mejor—probar miles de millones de intentos hasta que encuentres la respuesta correcta. Esto consume electricidad real, electricidad que podrías haber usado para algo más, como calentar tu casa o ejecutar tu negocio. Así que, si realmente quieres usar esa electricidad para ganarte el derecho de escribir en la base de datos, tienes que hacer un sacrificio. ¿Estará la gente de acuerdo en que este sacrificio vale la pena? Resulta que sí lo estuvieron, y todavía lo están.

Pero si no lo estuvieran, incluso si estuvieras siguiendo las reglas y resolviendo el rompecabezas acordado, todo tu esfuerzo y electricidad habría sido desperdiciado. Tú, el trabajador y potencial futuro líder, y los demás tienen una dependencia mutua entre sí. Yo hago el trabajo, y confío en que ustedes lo valorarán. Y viceversa, has demostrado hacer el trabajo, y te recompenso dejándote escribir en la base de datos y yo usándola. Pero recuerda, mañana podría ser otra persona, incluso una malvada, así que mejor sigues las reglas y continúas trabajando.

No solo los usuarios de la base de datos dependen de los mineros, sino que los mineros dependen de que los usuarios encuentren útil la base de datos también. Brillantes dinámicas de teoría de juegos en juego aquí.

Los mineros son solo un nombre especial puesto a los ordenadores en la red que están intentando resolver estos rompecabezas para ganar el derecho de escribir las próximas transacciones en la base de datos.

**El algoritmo de Bitcoin que muestra su interpretación del esfuerzo se llama: Proof-of-Work.**

## El Rompecabezas

Déjame explicar el rompecabezas que Bitcoin usa (simplificado):

**El objetivo:** Encontrar un número que, cuando se combina con los datos de transacción y se pone a través de una función hash, produce una salida que comienza con un cierto número de ceros.

**¿Qué es una función hash?** ¿Recuerdas las funciones unidireccionales del Capítulo 7? Una función hash es similar—toma cualquier entrada y produce una salida de tamaño fijo que parece aleatoria. Cambia la entrada incluso ligeramente, y la salida cambia completamente.

**Ejemplo (simplificado):**
```
hash("Hola")  = d3a1f2
hash("Hola!") = 9f4e7b  (completamente diferente, y... ¡también único! si es suficientemente largo)
```

La función hash es una función unidireccional que también es determinista (la misma entrada siempre da la misma salida), pero impredecible (no puedes predecir la salida sin calcularla).

Porque las funciones hash son impredecibles y producen salidas de suficiente longitud, puedes usarlas para generar IDs—la probabilidad de que dos entradas diferentes produzcan la misma salida es astronómicamente baja. Diseñar una buena función hash no es trivial, pero para nuestros propósitos, asumiremos que la función hash de Bitcoin (SHA-256) es suficientemente buena.

**El rompecabezas:**
```
Entrada: [Transacciones + Bloque Anterior + Número Aleatorio Que Elegiste]
Salida: Hash que comienza con, digamos, 5 ceros (00000...)

Intenta:
hash([Transacciones + Bloque Anterior + 0]) = 3f2a8c... (no, no comienza con 00000)
hash([Transacciones + Bloque Anterior + 1]) = 7d1b5e... (no)
hash([Transacciones + Bloque Anterior + 2]) = 5c8f2a... (no)
...
hash([Transacciones + Bloque Anterior + 8,347,291]) = 00000f8a2c... (¡SÍ! ¡Lo encontré!)
```

El único algoritmo para resolver esto es... fuerza bruta. Tu única opción es intentar miles de millones o billones de números aleatorios hasta que encuentres uno que produzca un hash que comience con el número requerido de ceros.

**Esta es la hazaña.** Requiere:
- **Esfuerzo:** Intentar miles de millones de intentos requiere trabajo computacional masivo (electricidad, tiempo, hardware).
- **Prueba:** Una vez que encuentras la respuesta, cualquiera puede verificarla instantáneamente (solo ejecuta la función hash una vez con tu número).
- **No puede falsificarse:** No puedes pretender que hiciste el trabajo sin hacerlo realmente, porque la función hash es unidireccional. No puedes simplemente tener un valor con 5 ceros iniciales e intentar adivinar la entrada que lo creó.

## Por Qué Esto Funciona

Veamos cómo Proof-of-Work resuelve nuestros problemas:

**1. ¿Quién puede escribir?** Quien resuelva el rompecabezas primero. Se ganó el derecho a través del esfuerzo.

**2. ¿Puede Dave engañar con 500 identidades falsas?** No. Ejecutar 500 ordenadores no importa—lo que importa es el poder computacional. Si Dave tiene 30% del poder computacional total, gana aproximadamente 30% de los rompecabezas, mientras que los participantes honestos con 70% del poder computacional ganan aproximadamente 70% del tiempo. Es proporcional al esfuerzo, no al número de identidades.

**3. ¿Cómo sabemos que siguieron las reglas?** Cuando alguien publica su lote de transacciones (llamado un "bloque"), todos los demás verifican:
   - ¿Resolvieron el rompecabezas? (Verificar la validez del hash.)
   - ¿Son válidas todas las transacciones? (Verificar firmas, verificar saldos.)
   - ¿Sin gastar doble? (Verificar contra la base de datos.)

Si algo es inválido, todos rechazan el bloque, todas las nuevas transacciones, y no actualizan (sincronizan) su base de datos. El tramposo desperdició todo ese esfuerzo computacional para nada.

**4. ¿Con qué frecuencia sucede esto?** Bitcoin ajusta un **valor hash objetivo** para que se encuentre un nuevo bloque aproximadamente cada 10 minutos. En pantalla, esto a menudo se ve como requerir hashes con **más ceros iniciales**. Si más personas se unen y el poder computacional aumenta, el objetivo se vuelve más bajo (más difícil de cumplir). Si las personas se van y el poder computacional disminuye, el objetivo se vuelve más alto (más fácil de cumplir).

La razón por la que puedes "fijar" el tiempo que toma minar (crear) un bloque es porque puedes hacer algunas estadísticas para calcular el tiempo esperado para encontrar una solución basándote en el poder computacional total de la red. Al ajustar la dificultad del rompecabezas cada 2016 bloques (aproximadamente dos semanas), Bitcoin asegura que, en promedio, se encuentre un nuevo bloque cada 10 minutos. Si te interesa la matemática detrás de esto, te animo a investigar en línea y profundizar por tu cuenta.

Por ahora, desmitifiquemos algo de terminología:
- **Mining (Minería):** El proceso de intentar resolver el rompecabezas (ejecutar cálculos). Una prueba de esfuerzo para ganar el derecho de escribir el próximo lote de datos en la base de datos distribuida que todos comparten en la red.
- **Miner (Minero):** Un participante que ejecuta ordenadores para minar (resolver rompecabezas).
- **Block (Bloque):** Un lote de transacciones más la solución al rompecabezas. Que, hablando en general, son un conjunto de instrucciones sobre qué escribir a continuación en la base de datos.
- **Node (Nodo):** Un participante que mantiene una copia de la base de datos y verifica bloques (no necesariamente minando). Pueden aceptar o rechazar bloques basándose en las reglas que se han acordado. Si el minero comparte bloques inválidos, los nodos los rechazarán, y todos simplemente tendrán el mismo estado de base de datos. ¿Válido? Todos actualizan la base de datos añadiendo las transacciones en el orden establecido por el líder temporal y así todos terminan con el mismo estado en la base de datos.

## El Incentivo: Recompensas de Minería

Espera—¿por qué alguien gastaría electricidad y dinero en ordenadores caros para resolver estos rompecabezas "inútiles"?

**Porque hay una recompensa.**

Quien resuelva el rompecabezas puede:
1. **Crear nuevas monedas** - Actualmente 3.125 Bitcoin por bloque (esto se reduce a la mitad cada 4 años, eventualmente alcanzando cero alrededor del año 2140, si el consenso no cambia).
2. **Recolectar comisiones de transacción** - Los usuarios pueden adjuntar pequeñas comisiones a sus transacciones. El minero que las incluye en un bloque recolecta todas esas comisiones.

**Esto se llama mining (minería).** Como los mineros de oro gastando esfuerzo para extraer oro de la tierra, los mineros de Bitcoin gastan esfuerzo computacional para ganar Bitcoin. Y, como Bitcoin comparte un buen montón de propiedades que tiene el oro, supongo que por eso Satoshi Nakamoto lo llamó "mining" (minería). Pero esto es solo especulación del autor.

**El incentivo se alinea perfectamente:**
- Los mineros quieren recompensas, así que siguen las reglas (los bloques inválidos son rechazados, desperdiciando su esfuerzo).
- Los mineros compiten, así que invierten en más poder computacional (asegurando la red).
- A medida que el valor de Bitcoin aumenta, más mineros se unen, lo que significa más seguridad.

**Teoría de juegos en acción:** Es más rentable jugar honestamente y mantener la red funcionando que hacer trampa.

## El Milagro de Bitcoin, los Sueños Húmedos de los Frikis, Tal Vez

Pero espera... les pagan... ¿en qué? ¿En bits? En efecto. ¡En bitcoins! Pero a nadie le importaban estos bits inicialmente. En efecto, aquí es donde "el milagro" sucedió.

Un grupo de personas, probablemente "frikis" de ciencias de la computación y anarquistas (dicho con amor por el autor, que es un friki él mismo), decidieron simplemente gastar su electricidad y poder computacional en este "experimento loco" de una moneda digital descentralizada. Creían en la idea, o simplemente eran frikis divirtiéndose, y estaban dispuestos a invertir recursos en ello.

Algunas personas especulan que fue la CIA o cualquier otra agencia del gobierno de Estados Unidos intentando crear dinero programable para controlar a la población. Pero como se dijo, Satoshi Nakamoto desapareció de la vista pública—su **última publicación pública en un foro fue en diciembre de 2010**, y su **último correo privado conocido fue en abril de 2011**—y nunca se ha encontrado evidencia concreta para apoyar ninguna teoría sobre su identidad o afiliación.

El autor se inclina hacia los frikis jugando—¿tal vez frikis de la CIA en sus fines de semana? Quién sabe. La cosa es que la fiesta se salió de control, y lenta pero seguramente, más personas estuvieron de acuerdo con esta coordinación y consenso digital y comenzaron a intercambiar realmente estos bits con dinero fiat. Y... ¡boom! Nació una nueva clase de activo.

Es bastante poético que la cosa que es valiosa precisamente porque la gente puede usarla sin siquiera conocerse fue creada por alguien que nadie conoce—en la práctica entonces, por nadie. Por lo tanto, poéticamente, podemos atrevernos a decir que fue creado por nadie, y por todos nosotros, al mismo tiempo.

¡Pero espera! Según todo lo que hemos explicado, todavía podemos engañar a la red. Nota que no dijimos la palabra "blockchain" en absoluto...

## Liderazgo Temporal

Nota lo que hemos logrado:

- **Cada 10 minutos,** alguien gana el derecho de escribir el próximo lote de transacciones en la base de datos.
- **Tienen autoridad temporal** - Pero solo para ese bloque. Luego la carrera comienza de nuevo.
- **El liderazgo rota** - Quien resuelva el próximo rompecabezas se convierte en el próximo líder temporal.
- **Sin poder permanente** - Ninguna entidad individual controla la base de datos para siempre... ¿o sí? Si alguien tiene 51% de todo el poder computacional, simplemente será más probable que escriba más bloques, pero aún tiene que seguir las reglas o todos los demás rechazarán sus bloques.

Hemos tomado prestada la jerarquía temporalmente, la distribuimos a lo largo del tiempo, y usamos el esfuerzo como mecanismo de selección.

**Esto es radicalmente diferente de los bancos:**
- Bancos: Una entidad tiene control permanente.
- Bitcoin: Control temporal, ganado a través de trabajo computacional, rotando entre miles de participantes.

## Qué Hemos Resuelto (¿Lo Hemos Hecho?) y Qué No

**Lo que Proof-of-Work resuelve:**
- Quién puede escribir: Quien resuelva el rompecabezas primero.
- Ataques Sybil: Necesitas poder computacional, no identidades falsas.
- Ordenar transacciones: El ganador decide el orden en su bloque.
- Incentivos: Los mineros son recompensados por trabajo honesto. Los ataques Sybil ya no tienen sentido para agentes dentro de la red.

**Lo que todavía necesitamos abordar:**
- ¿Cómo estamos explicando blockchain sin la estructura blockchain misma? ¿Por qué la necesitamos? (Próximo capítulo.)
- ¿Qué pasa si dos mineros resuelven el rompecabezas al mismo tiempo? ¿Qué pasa si esto sucede a menudo?
- ¿Cómo hace esto que la historia sea evidente de manipular?
- ¿Qué pasa si un minero controla más del 50% del poder computacional? ¿Gana demasiadas oportunidades de tener el derecho de escribir en la base de datos?

## El Panorama General

Proof-of-Work es la forma de Bitcoin de seleccionar líderes temporales basándose en el esfuerzo. No es el único mecanismo de consenso, o algoritmo de consenso si prefieres. Ethereum, otra "cripto," ahora usa Proof-of-Stake, que exploraremos después. Pero Bitcoin fue el primero en resolver exitosamente el problema de la red de base de datos sincronizada distribuida sin intermediarios de confianza, usando consenso en su lugar.

**El avance:** Usar energía (trabajo computacional) como un recurso relacionable y escaso entre extraños para prevenir ataques Sybil y alinear incentivos.

**El compromiso:** Bitcoin usa mucha electricidad. Esto es controvertido. Pero es el costo de asegurar un sistema monetario sin depender de gobiernos o bancos. Si ese compromiso vale la pena es para que la sociedad lo decida.

Por ahora, entiende el mecanismo: Proof-of-Work convierte la computación en autoridad. Autoridad temporal, rotativa, ganada.

Y tal vez puedas empezar a ver el patrón general: necesitas algún "recurso" para probar esfuerzo y ganar el respeto de otros, luego necesitas algunas reglas para que no puedas realmente hacer lo que quieras con el poder temporal ganado, y finalmente necesitas incentivos para que la gente quiera jugar según estas reglas.

¿No suena esto familiar? ¿No suena esto similar a una democracia? ¿O al menos a un sistema de votación? ¿Cómo puede esto ser democrático si no todos tienen acceso a grandes recursos computacionales o electricidad barata? Profundizaremos en las implicaciones de todo esto más adelante en el libro.

## ¿Qué es una Blockchain, Realmente?

Ya puedes saber realmente qué son todos estos nombres elegantes: Bitcoin, Ethereum, Solana, Cardano, etc.

Por ahora quiero establecer que redes blockchain, criptomoneda, o cripto son todos nombres horribles. Ocultan la verdadera naturaleza de la tecnología.

Pero es el nombre que se ha quedado.

Estos son mejores nombres para hablar de esta tecnología:
- **Redes de base de datos basadas en consenso.**

Cuando alguien dice "blockchain," ahora puedes entender que están hablando de una "red de base de datos basada en consenso" donde los participantes acuerdan el estado de una base de datos compartida en una red.

En Bitcoin, el mecanismo de consenso es Proof-of-Work, pero en la práctica, puede ser CUALQUIER COSA—incluso un consenso centralizado. Un consenso autoritario, un consenso oligárquico basado en plutocracia donde solo los ricos pueden escribir los próximos bloques. Etc.

Los usuarios de Bitcoin valoran la capacidad de calcular cálculos hash realmente rápido como un recurso difícil de conseguir, lo que hace que sus reglas sean imposibles de romper.

Ethereum comenzó de esta manera también y luego cambió su consenso por razones que exploraremos después.

Finalmente, como humanos podemos simplemente acordar estados de base de datos distribuidos, y algunos de nosotros pensamos que es una buena forma de representar dinero.

¿Podemos incluso escribir las leyes en esta base de datos de tal manera que ningún gobierno corrupto pueda cambiarlas? ¿Podemos crear un mecanismo de votación perfecto que realmente represente a cada ciudadano sin elecciones manipuladas? ¿Cómo deberíamos definir el "esfuerzo" en el consenso para eso? ¿Deberíamos incluso dar tanto poder a la gente si esto es posible? ¿Estamos mejor en manos de tecnócratas?

Me gustaría que el lector se sintiera empoderado. Tener la capacidad de coordinarse con cualquiera sobre lo que constituye datos válidos, información válida, eventualmente si te gusta, verdad válida, es un progreso tecnológico increíblemente complejo y útil para que podamos coordinarnos mejor como especie.

Y como el tío Ben le dijo a Peter Parker: "Con un gran poder viene una gran responsabilidad." Debemos estudiar, debemos entender, debemos tener cuidado. Construir lenta pero seguramente cosas que importan y son útiles para todos nosotros.

Por ejemplo, puedes entender un casino como una coordinación y como un consenso. La gente juega juegos consensuados en un casino y apuesta dinero. Puedes hacer que tu base de datos represente un casino, establecer algunas reglas, y permitir que cualquiera en el mundo "apueste justamente" a través del internet.

Estas aplicaciones tipo casino están siendo lo principal que la gente normal encuentra atractivo y repugnante sobre "cripto".

Por favor, no te ciegues con los nombres elegantes, no te ciegues con la gente que usa estas hermosas estructuras de base de datos para estafar a otros o potenciar sus adicciones al juego.

Hay mucho potencial para el bien y el crecimiento de la especie aquí. Como el que Bitcoin tiene, que explicaré después.

Por ahora date cuenta de esto: las bases de datos guardan datos, tú interpretas los datos, tú y tus vecinos le dan significado. Adelante, coordínate con ellos, acuerden verdades sin dar a nadie acceso excesivo para definir las reglas.

Hablaremos más profundamente sobre las implicaciones de todo esto más adelante en el libro. Pero por ahora, es esencial entender realmente qué estás ganando y de qué trata realmente todo este progreso tecnológico.

## Una Nota sobre el Pensamiento de Satoshi

No sé si Satoshi Nakamoto (quienquiera que sea él o ella o ellos) pensó en ello de esta manera mientras diseñaba Bitcoin. Tal vez lo hizo, tal vez lo abordó de manera diferente.

Pero así es como el autor de este libro hace sentido intuitivo de la progresión natural: Necesitamos coordinación, así que tomemos prestada la centralización temporalmente. Necesitamos justicia, así que rotemos el liderazgo. Necesitamos resistencia Sybil, así que requiramos prueba de esfuerzo. Necesitamos incentivos, así que recompensemos a los trabajadores.

Las piezas encajan elegantemente.

---

**Idea Clave:** Para resolver el problema de la base de datos distribuida, Bitcoin toma prestada la centralización temporalmente—dando a una persona a la vez el derecho de escribir y ordenar las próximas transacciones de todos. Pero en lugar de elegir líderes a través de votación (vulnerable a ataques Sybil) o selección aleatoria (también vulnerable), Bitcoin requiere prueba de esfuerzo computacional. Quien resuelva un rompecabezas difícil primero gana el derecho de escribir el próximo bloque y recibe una recompensa. Esto crea un liderazgo rotativo, temporal donde la autoridad se gana a través del trabajo, no se otorga por confianza. Proof-of-Work alinea incentivos: es más rentable jugar honestamente que hacer trampa.

A continuación, exploraremos cómo estos bloques se encadenan juntos a lo largo del tiempo, creando la estructura blockchain que hace que la historia sea evidente de manipular, y seguiremos profundizando en detalles importantes e implicaciones de este diseño.
