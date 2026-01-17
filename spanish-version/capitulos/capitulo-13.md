# Capítulo 13: Ethereum - La Máquina de Computación Consensuada

*¿Y si la base de datos pudiera ejecutar programas?*

---

Hemos pasado los últimos capítulos entendiendo Bitcoin: una base de datos distribuida que permite a extraños acordar quién posee cuánto sin confiar en ninguna autoridad central.

Pero las transacciones de Bitcoin son simples. Alice envía 10 BTC a Bob, Bob envía 5 BTC a Carol, y eso es todo—solo transferencia de valor. Restar un número aquí, sumarlo allá. Hay un poco más de complejidad bajo el capó, pero en su núcleo, Bitcoin solo está ejecutando sumas y restas.

Eso en sí es un programa, uno muy simple que suma y resta saldos. Simple y... aburrido.

¿Qué pasa si la base de datos pudiera hacer más que solo rastrear saldos? ¿Qué pasa si pudiera **ejecutar programas complejos**?

Esa es la idea que dio origen a **Ethereum**—una base de datos distribuida que no solo rastrea saldos sino que también almacena programas. Estos programas se llaman **smart contracts** (contratos inteligentes).

## Recapitulación de Bitcoin: Transacciones Simples

Las transacciones de Bitcoin son instrucciones sencillas:
```
Transacción:
- De: Dirección de Alice
- A: Dirección de Bob
- Cantidad: 10 BTC
- Firma: [Firma de Alice probando que autorizó esto]
```

La red verifica: ¿Tiene Alice 10 BTC? Sí. ¿Es válida la firma? Sí. Entonces actualizar la base de datos—restar 10 de Alice, sumar 10 a Bob.

**Simple. Limpio. Funciona perfectamente para dinero, o simplemente valor en el sentido del oro.** Algunas personas argumentan con muy buenas razones que Bitcoin no es dinero en el sentido de efectivo sino valor en el sentido de oro, pero ese es otro debate.

Por ahora solo nota lo que el scripting simple de Bitcoin no puede hacer fácilmente. No puede decir fácilmente "enviar dinero a Bob, pero solo si sucede alguna condición compleja X." No puede retener dinero hasta cierta fecha y luego liberarlo a múltiples partes si se cumplen ciertas condiciones complejas. No puede programar lógica compleja como préstamos o sistemas de votación.

Bitcoin mueve valor de A a B. Para eso fue diseñado.

**Ethereum preguntó: ¿Y si pudiéramos programar cualquier cosa?**

## La Idea: Transacciones Programables

Vitalik Buterin (el creador de Ethereum—este tipo, a diferencia de Satoshi, es conocido y está vivo) se dio cuenta: **¿Y si pudiéramos programar lógica compleja en la base de datos?**

¿Y si pudiéramos programar un préstamo? ¿O un testamento? ¿O incluso un sistema de votación?

No solo "enviar X a Y," sino:
- **SI** se entregan los bienes **ENTONCES** pagar al vendedor **SI NO** reembolsar al comprador.
- **SI** estoy inactivo durante 1 año **ENTONCES** enviar mis fondos a mis herederos.
- **SI** es el día 1 del mes **ENTONCES** deducir la cuota de suscripción.
- **SI** soy un votante válido **ENTONCES** permitirme almacenar mi voto para esta elección.
- **SI** el ciudadano se porta mal, **ENTONCES** congelar sus fondos.
- **SI** mi partido político está perdiendo, **ENTONCES** añadir votos falsos.

**Esto es un smart contract.** No es un contrato legal (no hay abogados involucrados), y tampoco tiene smartness (inteligencia), pero es un programa que se ejecuta en una RBDC y hace cumplir reglas automáticamente.

La parte smart depende de quién lo escriba. Y la palabra "contract" (contrato) podría venir del hecho de que necesitas firmas criptográficas para interactuar con él—en el "mundo real" firmas contratos y estos hacen cumplir cosas, y aquí firmas datos con criptografía lo cual permite que alguien ejecute código en una base de datos, así que es algo así como un contrato.

El nombre es un poco raro, pero la idea es poderosa. ¿Y si pudiéramos programar cualquier cosa en esta base de datos?

Déjame mostrarte lo que esto significa con ejemplos reales.

## Smart Contracts: Lógica Consensuada En Código

### Ejemplo 1: Préstamos con Garantía

Quieres pedir un préstamo. Con un smart contract, puedes programarlo: en la fecha X, si no se devuelve el dinero, la garantía va al prestamista. Eso es todo.

Sin bancos, sin papeleo, sin verificaciones de crédito. Solo código haciendo cumplir el acuerdo.

Pero espera, **el programa solo puede leer datos de la base de datos**, por lo tanto, ¿cómo sabe el programa cuáles son los datos del mundo real, como el precio de tu garantía que podría ser, digamos, una acción de Netflix?

Gran pregunta. Los programas en la base de datos necesitan información del mundo exterior (como precios, tiempo, confirmaciones de entrega). ¿Quién le da estos datos a la base de datos para que el programa pueda leerlos? ¿No es eso una parte centralizada de confianza?

Bueno, podría serlo, pero ese es un tema para otro momento. Por ahora, imagina que es posible poner datos reales en el programa de manera verificable y minimizando la confianza con incentivos económicos y teoría de juegos como hemos estado haciendo.

Si tienes curiosidad, investiga más profundamente lo que llamamos en la industria **oracles**—el más famoso es Chainlink. La idea principal de estos protocolos oracle es que ponen datos en la RBDC desde el mundo real, como feeds de precios, datos del clima, resultados deportivos, etc., de manera verificable y minimizando la confianza.

### Ejemplo 2: Testamento (Heredando Bits)

Quieres que tus activos de Ethereum vayan a tus hijos si algo te sucede.

**Solución tradicional:** Escribir un testamento legal, darle tus contraseñas a un abogado (arriesgado), esperar que todo salga bien.

**Solución con smart contract:**
```
Contrato: Testamento Digital
- SI no interactúo con este contrato durante 2 años
  ENTONCES enviar 50% de mi ETH a la dirección del Hijo A
  Y enviar 50% de mi ETH a la dirección del Hijo B.
- SI NO SI interactúo (pruebo que estoy vivo)
  ENTONCES reiniciar el temporizador de 2 años.
```

Esto es básicamente imparable. Incluso si pierdes tus claves privadas, incluso si mueres, el contrato se ejecuta automáticamente después del período de tiempo. Sin abogados, sin tribunal, nadie puede bloquearlo.

### Ejemplo 3: Suscripción (Pagos Recurrentes Automáticos)

Te suscribes a un servicio por 10$/mes.

**Solución tradicional:** Darles tu tarjeta de crédito. Confiar en que no cobrarán de más. Esperar acordarte de cancelar.

**Solución con smart contract:**
```
Contrato: Servicio de Suscripción
- El usuario deposita $120 (para 1 año).
- Cada 30 días, el contrato envía $10 al proveedor del servicio.
- El usuario puede cancelar en cualquier momento, el contrato reembolsa el saldo restante.
```

**Tú controlas cuándo cancelar. El proveedor del servicio no puede tomar más de lo acordado. Las reglas son transparentes y automáticas.**

Y no hay comisiones para todos estos intermediarios que hacen que las tarjetas de crédito funcionen en internet—solo las tarifas de ejecutar el programa en la RBDC (Red de Base de Datos Consensuada como Ethereum), que pueden ser menores. Las comisiones tradicionales de procesamiento de tarjetas de crédito oscilan entre **2–3% por transacción** para los comerciantes, mientras que las tarifas de transacción en tecnologías datasync descentralizadas dependen de la congestión de la red—oscilando desde fracciones de centavo hasta algunos dólares, a menudo significativamente más baratas que las tarifas de tarjetas de crédito para muchos casos de uso.

## La Máquina Virtual de Ethereum (EVM): Todos Ejecutan los Mismos Programas

Aquí está la magia: **Cada nodo en la red de Ethereum ejecuta estos smart contracts.** Mira, la frase anterior está llena de palabras raras que no habrías entendido antes de leer este libro. Espero que puedas ver el progreso que estás haciendo y la complejidad real en todas estas nuevas tecnologías datasync descentralizadas.

Recuerda de Bitcoin: Cada nodo tiene una copia de la base de datos, y cuando sucede una transacción, cada nodo la verifica y actualiza su copia.

**Ethereum añade:** Cada nodo también almacena programas en la base de datos. Cuando alguien interactúa con un programa, cada nodo **ejecuta el programa** y calcula el resultado.

**Esto es la Ethereum Virtual Machine (EVM):** Un ordenador virtual que existe a través de miles de ordenadores reales.

### Direcciones: Todavía Basadas en Claves Asimétricas

Una nota rápida antes de continuar: Las direcciones de Ethereum funcionan de la misma manera que las direcciones de Bitcoin. Todavía se basan en criptografía asimétrica (claves públicas/privadas) con las mismas propiedades que aprendimos en el Capítulo 7.

Se ven un poco diferentes debido a diferentes esquemas de hash y codificación, pero el mecanismo es el mismo:
- Tu clave privada → Tu clave pública → Tu dirección.

**Ejemplos:**
- Dirección de Bitcoin: `1A1zP1eP5QGefi2DMPTfTL5SLmv7DivfNa`
- Dirección de Ethereum: `0x742d35Cc6634C0532925a3b844Bc9e7595f0bEb`

Diferentes formatos, mismos principios criptográficos subyacentes.

Las direcciones mostradas fueron inventadas para ilustración.

### Cómo Funciona:

1. Escribes un smart contract (en un lenguaje de programación como Solidity).
2. Lo despliegas en Ethereum (se almacena en la base de datos).
3. Cualquiera puede interactuar con él (enviarle transacciones).
4. Cada nodo ejecuta el código del contrato con tu transacción como entrada.
5. Cada nodo calcula el mismo resultado (determinista).
6. La base de datos se actualiza basándose en el resultado.

**Propiedad clave: Computación determinista.**

La misma entrada lleva a la misma salida. Siempre. En cada ordenador.

Si Alice envía al contrato de préstamo una transacción de "devolver préstamo", cada nodo ejecuta el código del contrato, ve que se cumple la condición, y actualiza la base de datos para devolver su garantía.

**Todos están de acuerdo en la computación, igual que están de acuerdo en los saldos.**

No puedes simplemente no ejecutar un programa, porque está almacenado en la base de datos. Si intentas censurar un programa, o ejecutarlo de manera diferente, la próxima iteración de la base de datos que produces (el próximo bloque) será rechazada por todos los demás porque tus resultados (los datos en la base de datos) no coincidirán con los suyos.

Por lo tanto, alterar el código para censurar programas requeriría alterar el código que crea el consenso, así que si lo haces, básicamente estás creando una red completamente nueva—una donde estarás solo, e inútil.

## Por Qué Esto Es Innovación Revolucionaria: Programas Imparables

Piensa en los programas normales. Facebook puede eliminar tu cuenta. PayPal puede congelar tus fondos. Amazon puede cambiar sus términos de servicio.

**¿Por qué?** Porque controlan los servidores que ejecutan el código. Pueden modificarlo, apagarlo, o bloquearte en cualquier momento.

**Los smart contracts son diferentes, por defecto:**
- Ninguna empresa individual puede controlarlos.
- Una vez desplegados, se ejecutan para siempre.
- Nadie puede apagarlos, ni siquiera el creador.
- Nadie puede cambiar las reglas sin que todos lo vean.

**Esto es consenso en la computación, no solo en los saldos.**

Nota mi redacción, por defecto. Los programas son flexibles, así que puedes programar un smart contract que sea controlado por alguna empresa, o que pueda ser cambiado por alguna autoridad. Pero esa es una elección que haces cuando escribes el código y cuando interactúas con el código.

De la misma manera que alguien puede escribir código que es controlado por una empresa, alguien puede simplemente escribir ese mismo código pero controlado por nadie. El poder de decidir qué programa usar está en tus manos.

Ambos programas estarán ejecutándose para siempre en la RBDC, pero tú eliges con cuál interactuar.

**Así que aquí está la parte crucial:** Cualquiera puede desplegar su propio programa, y tú eliges qué programa ejecutar. No estás obligado a usar el programa X si crees que está abusando de tus datos, cobrándote demasiado, etc.

¿Un banco está prestando dinero con demasiada tasa de interés? Cualquiera puede crear un nuevo programa de banco con una tasa de interés más baja para que los clientes puedan prestar en términos más favorables.

Esto permite competencia a nivel de código. Transparente y auditable.

Esto permite tantas posibilidades...

## ¿Qué Podría Esto Permitir? Deja Que Tu Imaginación Vuele

Un hombre una vez dijo, si puedes soñarlo, puedes programarlo.

Piensa en las posibilidades:

**¿Y si tuvieras una red social descentralizada** donde la gente pudiera pagarte directamente para acceder a tu contenido en lugar de dar control total a una empresa de redes sociales y sus servidores y algoritmos opacos?

**¿Y si cualquiera pudiera ver el algoritmo** de esta red social? Sin manipulación oculta, sin sistemas de clasificación secretos. Código transparente que todos pueden verificar.

**¿Y si pudieras crear una organización descentralizada** donde cada decisión se vota por los miembros, y los votos automáticamente ejecutan cambios? Sin CEO que pueda anular la voluntad de la comunidad.

**¿Y si los artistas pudieran programar regalías** en su arte digital, para que cada vez que se revenda, automáticamente obtengan un porcentaje—para siempre?

**Las posibilidades son vastas.** Bancos, seguros, sistemas de votación, cadenas de suministro, gestión de identidad—cualquier cosa que involucre reglas, acuerdos y confianza puede potencialmente ser programada en una RBDC.

**Ethereum es una máquina de computación consensuada.** Miles de personas acordando qué programas ejecutar sobre su preciosa información, que puede representar y significar cualquier cosa, porque la interpretamos.

**Pero hay inconvenientes.**

## Los Lados Negativos:

### 1. Tienes Que Pagar Por Ello

El costo de ejecución del programa, al final del día, es electricidad, recuerda. Cada nodo ejecuta el programa, consumiendo poder computacional.

Algunas empresas podrían permitirte usar sus ordenadores centralizados gratis porque venden tus datos e información "privada"—pero en un ordenador descentralizado, todos tienen que pagar su parte justa del costo de electricidad para que el modelo sea sostenible.

Además, cuando despliegas un programa, eso literalmente ocupa algunos transistores y también funcionan con electricidad en todo el mundo, así que eso también tiene un costo. Si quieres poner tu código de banco en la base de datos para que cualquiera pueda ejecutarlo, tendrás que pagar por el espacio que usa.

¿Es esto caro? ¿Puede alguien permitírselo? Responderemos estas preguntas más tarde.

Por ahora, solo entiende: **la computación en RBDC cuesta dinero.** Esto es por diseño. Estos costos usualmente se llaman costos de **gas**. ¿Por qué gas? No lo sé. ¿Tal vez porque la gasolina alimenta coches y la computación alimenta ordenadores? No me importa, esta industria ya tiene tantos nombres raros, perdóname si no cuestiono este.

Por cierto, hay una razón extra para pagar cuanto más consumes. Imagina que le dices a la red que ejecute un programa que nunca termina—voilà, hackeaste la red, ahora nada más puede ejecutarse porque todos están ocupados ejecutando tu bucle infinito. Bueno, eso ahora se vuelve económicamente imposible. Cuanta más computación uses más pagas, así que para computar para siempre necesitarías pagar para siempre... ¿dinero infinito? Imposible.

### 2. ¡Puedes construir cualquier cosa! Espera... ¿cualquier cosa?

Con todas estas tecnologías datasync descentralizadas, puedes construir:
- **Intercambios descentralizados (DEXs):** Intercambia monedas con personas de todo el mundo sin un banco en el medio. Es como una bolsa de valores, pero dirigida por código en lugar de una corporación.
- **Banca descentralizada:** Pide y presta dinero sin un banco tradicional. Solo smart contracts haciendo cumplir los términos para todos, en todas partes.
- **DAOs (Organizaciones Autónomas Descentralizadas):** Organizaciones dirigidas por código y votos y que no siempre necesitan aprobación de una junta directiva. Piensa en ello como una empresa donde los accionistas automáticamente controlan cosas como el presupuesto a través de votación transparente.
- **Sistemas de identidad:** Posee tu identidad en línea a través de plataformas, no controlada por Google o Facebook.
- **Juego global:** Programa tu casino global imparable para promover el juego en todo el mundo sin que ningún gobierno pueda cerrarlo.

Y muchas más nuevas posibilidades, estos son solo algunos.

Algunos de estos son útiles. Algunos son hype. Algunos son experimentos. Algunos son de ética dudosa. Pero la **capacidad** ahora es real.

### 3. El Código Puede Tener Bugs (bugs significa errores en el código)

El código puede ser hackeado si no lo programas adecuadamente. ¿Dejas tu préstamo con un bug que puede multiplicar accidentalmente por 10 lo que debes? Estás en problemas.

Incluso si la RBDC funciona perfectamente, el código que escribes encima puede tener bugs. Así que ten cuidado con qué programas ejecutas.

Algunos errores en el código (bugs) podrían permanecer inactivos durante mucho tiempo, hasta que alguien los descubra y los explote. Esto ya ha sucedido múltiples veces, con millones de dólares perdidos—notablemente, el hack de The DAO en junio de 2016 resultó en la pérdida de aproximadamente 3.6 millones de ETH (aproximadamente $60M a precios de 2016). Los hacks cripto totales en años recientes han alcanzado miles de millones por año.

Afortunadamente, la seguridad de los códigos que se están usando está mejorando año tras año, pero este riesgo todavía está presente. Las probabilidades de que te afecte se reducen, pero nunca serán cero.

Personalmente, el autor trabaja precisamente en esta parte de la industria: ciberseguridad de RBDC y smart contracts. Así que puedo decirte: este es un riesgo real, pero está siendo tomado en serio por muchos profesionales.

Lenta pero seguramente, las probabilidades de que pierdas tu dinero por estas razones irán a 0 en la práctica, y si sucede, protocolos de seguro cubrirán tus pérdidas, que realmente no son tu culpa.

Se sentirá como contratar un seguro de vida siendo de 25 años solo por si acaso te cae un rayo. Es muy poco probable, pero si sucede quieres estar cubierto.

A día de hoy cuando estoy escribiendo esto, 16 de diciembre de 2024, es muy arriesgado, el autor no pondría todos sus ahorros/inversiones en ninguna criptomoneda individual debido a posibles problemas de seguridad.

### 4. El Diablo Está En Los Detalles Que Estoy Ocultando Por Simplicidad.

Algunos de los usos con los que he provocado tu mente son muy complicados de integrar técnicamente. No imposibles, pero de hecho mucho más complicados.

Al menos, con el conocimiento que obtendrás de este libro, estarás mejor equipado para seguir entendiéndolos por tu cuenta, haciendo tus propias preguntas críticas, lógicas e informadas sobre ellos mientras aprendes cómo funcionan.

## Bienvenido al Lado Oscuro

Como habrás notado, he descrito algunos casos de uso que son un poco... moralmente grises. Juego, préstamos no regulados, elecciones corruptas, etc.

Como con cualquier nueva tecnología, hay usos buenos y malos. Algunas personas usarán las RBDC para innovación y libertad. Otros podrían usarlas para estafas, fraude, evadir regulaciones legítimas o crear ilegítimas.

Por esto debes entender la tecnología. Para asegurarte de que la usas para "la mejora del mundo" y no dejar que alguien más la use para abusar de ti.

Esto es como las armas, los coches, o el internet mismo. Herramientas poderosas que pueden usarse para el bien o el mal. Tenemos el deber de preocuparnos, de entenderlas al menos a cierto nivel de detalle, para que podamos tomar decisiones informadas. Este libro es un esfuerzo claro en esa dirección.

## Resumen: Bitcoin Coordina Valor, Ethereum Coordina Valor Y Computación

Alejémonos y veamos lo que hemos desbloqueado:

**Bitcoin:**
- Base de datos distribuida.
- Rastrea saldos (quién tiene qué dinero).
- Consenso sobre reglas simples (todos están de acuerdo en la propiedad y transferencias simples).
- Transacciones simples: "Enviar X a Y."

**Ethereum:**
- Base de datos distribuida + ordenador distribuido.
- Rastrea saldos Y ejecuta programas.
- Consenso sobre computación compleja (todos están de acuerdo en las salidas de programas).
- Lógica compleja: "SI condición ENTONCES acción."

**Ambos son tecnologías de coordinación.** Permiten a extraños acordar algo sin confiar en una autoridad central.

Bitcoin: "Todos estamos de acuerdo en que Alice tiene 10 BTC."

Ethereum: "Todos estamos de acuerdo en que este programa debería enviar fondos a Bob porque se cumplió la condición."

# Hora de Contar Historias...

## Pero Ethereum Comenzó con Proof-of-Work. Luego Algo Cambió...

Cuando Ethereum se lanzó el **30 de julio de 2015**, usaba el mismo mecanismo de consenso que Bitcoin: **Proof-of-Work.** Los mineros resolvían rompecabezas computacionales, quemaban electricidad, ganaban recompensas.

Pero el **15 de septiembre de 2022**, Ethereum hizo algo sin precedentes: **Cambió de mecanismo de consenso.** Ese evento se llamó:

**The Merge (La Fusión):** Ethereum hizo la transición de Proof-of-Work a **Proof-of-Stake.**

No más minería. No más quemar electricidad. Una forma completamente diferente de lograr consenso.

**¿Por qué?** Una razón principal: Proof-of-Stake consume mucha menos electricidad (aproximadamente 99.95% menos).

**Aquí está la idea clave:** Esto es consenso. Si la gente (nodos) quiere un algoritmo diferente, simplemente pueden acordar y cambiarlo.

La comunidad acordó que este cambio valía la pena. Votaron con su participación. El cambio sucedió. La red siguió funcionando.

Simplemente dijeron en un foro de internet algo como: En el bloque número X, ejecutaremos un código completamente diferente, ¿vale?

Y cuando llegó ese bloque, todos lo hicieron. Nota un detalle muy importante: ejecutaron código diferente, pero el estado de la base de datos permaneció igual. Todos los saldos, todos los programas, todo permaneció intacto. Solo cambió la forma en que se logró el consenso.

**El consenso es social, ¿recuerdas?** La tecnología lo permite, pero los humanos deciden las reglas.

Si tienes curiosidad sobre los detalles técnicos de cómo funciona Proof-of-Stake, puedes investigarlo más profundamente. Pero para nuestros propósitos, solo entiende: es otro mecanismo de consenso, otra forma de coordinar, con otro conjunto único de compromisos.

Por ejemplo, si quieres censurar Bitcoin tienes que controlar el 51% del poder computacional de la red. En Ethereum, el poder computacional ahora no importa nada. Lo que importa es... su misma moneda nativa, Ether.

**¿La lección importante de todo esto?** Las redes pueden evolucionar. El consenso puede cambiar. Mientras todos los participantes estén de acuerdo.

Pero, gracias a esa hermosa estructura de datos, la blockchain, toda la historia se preserva. El pasado es inmutable, pero el futuro puede ser moldeado por consenso. Literalmente puedes ver todos los cambios que sucedieron con el tiempo, quién los propuso, cuándo, y cómo la comunidad acordó ejecutarlos. Nadie puede censurar cómo sucedió el pasado, nadie puede reescribir la historia, pero el futuro está abierto a la elección colectiva humana.

Ahora, ¿qué pasa si no todos están de acuerdo? ¿Qué pasa si la comunidad se divide? Esto ya ha sucedido múltiples veces en múltiples RBDC. Exploremos eso en el próximo capítulo.

---

**Idea Clave:** Bitcoin coordina valor, Ethereum coordina valor y computación. Los smart contracts son programas que cualquiera puede desplegar (desplegar en = guardar en) en la base de datos, ejecutados por cada nodo con lógica determinista. Tú eliges con qué programas interactuar—creando competencia transparente a nivel de código. Esto permite préstamos, testamentos, suscripciones, votación, e innumerables aplicaciones sin intermediarios. Pero hay compromisos: la computación cuesta dinero (gas), el código puede tener bugs, y las herramientas poderosas pueden servir tanto a propósitos buenos como malvados. Los programas son imparables por defecto, pero los desarrolladores pueden elegir hacerlos controlables. Cuando la comunidad de Ethereum decidió cambiar de Proof-of-Work a Proof-of-Stake, lo hizo—porque el consenso es en última instancia social. Las redes pueden evolucionar cuando los participantes están de acuerdo. Pero ¿qué pasa cuando no están de acuerdo?

A continuación, exploraremos qué sucede cuando el consenso se divide—cuando la comunidad está en desacuerdo tan fundamentalmente que la red se divide en dos realidades separadas. Esto profundizará nuestra comprensión de lo que realmente significa el consenso y por qué es en última instancia una elección humana, no solo un mecanismo técnico.
