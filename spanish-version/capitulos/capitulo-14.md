# Capítulo 14: Cuando el Consenso se Divide - La Naturaleza del Acuerdo

*¿Qué pasa cuando no todos están de acuerdo?*

---

Hemos aprendido que el consenso es social. Ethereum cambió de Proof-of-Work a Proof-of-Stake porque la comunidad estuvo de acuerdo, y la red evolucionó en consecuencia.

Pero aquí está la pregunta: **¿Qué pasa cuando la comunidad no está de acuerdo?**

¿Qué pasa si la mitad de los participantes quiere ir en una dirección, y la otra mitad quiere ir en otra?

**Esto ha sucedido. Múltiples veces.**

## La Pregunta Fundamental

Recuerda lo que aprendimos: Las RBDC funcionan porque todos ejecutan el mismo código y están de acuerdo en las mismas reglas.

Pero el código es solo software. Cualquiera puede copiarlo. Cualquiera puede modificarlo. Cualquiera puede ejecutar su propia versión.

Cuando una porción significativa de una comunidad no está de acuerdo en qué código ejecutar, obtenemos lo que llamamos un **fork** (bifurcación). Piensa en ello como una bifurcación en el camino—dos coches conduciendo hacia esa división pueden elegir caminos diferentes, y desde ese punto en adelante, están viajando por carreteras diferentes, dirigiéndose en direcciones diferentes hacia mundos diferentes, poéticamente hablando.

A nivel técnico, los nodos simplemente empiezan a rechazar bloques que no siguen su versión de las reglas. Los mineros empiezan a minar en la versión que prefieren. Los usuarios empiezan a hacer transacciones en la versión en la que confían. ¿El resultado? Bases de datos diferentes con datos diferentes para cada grupo ejecutando software diferente.

Una blockchain, como sabes del capítulo 12, puede visualizarse como una cadena de bloques:

```
Bloque 1 -> Bloque 2 -> Bloque 3 -> Bloque 4 -> Bloque 5...
```

¿Qué pasa cuando el próximo estado de la base de datos difiere entre grupos? Bueno, nuestro lindo dibujo de la blockchain tiene que dibujarse con una división en dos—se bifurca, se divide:

```
                                     -> Bloque 6a -> Bloque 7a (cadena ETH)
                                   /
Bloque 1 -> Bloque 2 -> ... -> Bloque 5
                                   \
                                     -> Bloque 6b -> Bloque 7b (cadena ETC)
```

Esto es lo que sucede ahora:

**Entonces, ¿qué impide que la red se divida en múltiples versiones incompatibles?**

La respuesta corta: Nada.

La respuesta larga: Déjame contarte dos historias.

## Historia 1: El Fork de Ethereum - El Código Es Ley vs. Proteger El Ecosistema

En 2016, algo sin precedentes sucedió en Ethereum.

### The DAO: Un Experimento de $150 Millones

Alguien creó un smart contract (programa) llamado "The DAO" (Organización Autónoma Descentralizada). Era esencialmente un fondo de capital de riesgo diseñado para reunir dinero de inversores, pero dirigido completamente por código.

La gente enviaba dinero (ETH) a este contrato, y los poseedores de tokens votaban sobre qué proyectos financiar. Sin CEO, sin junta directiva—solo código haciendo cumplir las reglas.

**Recaudó $150 millones en ETH.** En ese momento, eso era aproximadamente el 14% de todo el Ethereum en existencia.

Todos estaban emocionados. ¡Este era el futuro! ¡Organizaciones descentralizadas!

Entonces, alguien encontró un error en el código—un bug.

### El Hackeo: $50 Millones Robados

El 17 de junio de 2016, un atacante explotó una vulnerabilidad en el código de The DAO.

El bug les permitía retirar fondos repetidamente sin que el contrato actualizara adecuadamente el saldo—como un cajero automático que te da dinero pero olvida restarlo de tu cuenta.

**Se drenaron $50 millones en ETH.**

El atacante no "hackeó" Ethereum. No cambiaron ninguna regla de consenso. Solo encontraron un fallo en el código del smart contract y lo explotaron—perfectamente legal según el código mismo.

Si escribes código que me envía dinero pero olvidas poner un límite en cuánto puede gastar, bueno, eso técnicamente no es mi culpa. El hackeo real era más complejo que esto, pero captas la idea de un error de código:

```solidity
code SoyAliceYElNoEstaPagando() {
    enviarDineroDeVueltaAAlice(100$);
    dineroQueDebeAlice = -0$;
}
// Este pseudocódigo no resta nada de la deuda, permitiendo retiros infinitos a Alice. ¡Oh no!
```

**En el hack de The DAO, el código hizo exactamente lo que estaba programado para hacer.** El atacante simplemente entendió el código mejor que sus creadores y reconoció un error en su programación.

Recuerda del capítulo anterior: los programas en la cadena tienen sus propias reglas, y si quieres anularlas, no puedes hacerlo sin cambiar completamente el estado de la base de datos—lo que lleva a que las personas tengan estados diferentes y rechacen los bloques de los demás.

### El Dilema: Dos Filosofías Incompatibles

La comunidad de Ethereum enfrentó una elección, y ambas opciones tenían argumentos fuertes e internamente consistentes:

**Opción 1: El código es ley. Déjalo estar.**
- El atacante siguió las reglas del código (incluso si no fueron intencionadas).
- Revertir esto establece un precedente peligroso: señala que romper el consenso base está bien si alguien se equivocó programando encima de él.
- ¿Quién decide qué es una transacción "legítima" vs. un "hackeo"? En este caso claramente fue un hackeo, pero ¿qué pasa con casos futuros? Estas distinciones pueden volverse muy complicadas.
- Si podemos revertir esto, podemos revertir cualquier cosa.

**La inmutabilidad importa más que el dinero porque señala que somos honestos con nuestro consenso y por lo tanto confiables.**

Imagina un país con un sistema legal muy inestable donde las leyes pueden cambiarse retroactivamente y rápidamente. Nadie querría hacer negocios allí. ¿Qué pasaría si una tarde, de la nada, tu cuenta bancaria se vacía debido a una nueva ley que dice "todo el dinero en bancos de empresas tipo X ahora pertenece al estado"?

**Opción 2: Esto daña el ecosistema. Arréglalo.**
- $50M representan el dinero de gente real.
- El atacante explotó un error claro en el código, no comportamiento legítimo.
- Si no arreglamos esto, la confianza en Ethereum colapsa. ¿Qué pensará la gente? ¿Entenderán los matices entre bugs de smart contracts y acuerdos a nivel de red? Ethereum tenía solo un año en ese momento, y la gente todavía estaba aprendiendo qué era.
- Podemos hacer un fork—reescribir la historia para deshacer el hackeo.
- **El pragmatismo importa más que la ideología.**

Ambos lados tenían puntos válidos. Ambos eran internamente consistentes. Ambos reflejaban valores reales.

**Este no era un problema técnico. Era un desacuerdo filosófico sobre qué debería ser Ethereum.**

¿Debería Ethereum ser una plataforma donde **el código es absolutamente ley**, incluso cuando eso lleva al robo? ¿O debería ser una plataforma que **protege a sus usuarios**, incluso si eso significa romper la inmutabilidad?

### La Votación: 85% vs. 15%

La comunidad realizó una votación (a través de un mecanismo de señalización—no vinculante, pero indicativa).

**85% votó por hacer fork** — revertir el hackeo, devolver el dinero a la gente.

**15% votó en contra** — mantener la cadena como está, honrar "el código es ley."

La tensión era palpable. Ambos lados sentían que estaban luchando por el alma de Ethereum. Ambos lados creían que tenían razón.

Así que Ethereum se bifurcó.

### La División: Dos Ethereums

En el bloque `1,920,000`, la red se dividió en dos cadenas separadas:

**Ethereum (ETH):** La cadena mayoritaria, la que todavía funciona como "la principal" hoy. Revirtió el hackeo y devolvió los fondos robados. La comunidad eligió el pragmatismo bajo la promesa de nunca hacerlo de nuevo—y hasta ahora han mantenido esa promesa, incluso con hackeos importantes de exchanges como el **hackeo de Bybit de febrero de 2025** donde aproximadamente 401,000 ETH (~$1.5B) fueron robados del exchange centralizado (no todo estaba dentro de Ethereum pero captas la idea).

**Ethereum Classic (ETC):** La cadena minoritaria. Mantuvo la historia original, honró la inmutabilidad, y eligió la ideología.

**Ambas son RBDC válidas.** Ambas todavía están funcionando. Ambas tienen valor. Ambas tienen comunidades.

**Valores de mercado** (que fluctúan constantemente):
- Al momento de escribir esto (principios de 2026), la capitalización de mercado de Ethereum está en los **cientos de miles de millones de dólares**, mientras que la de Ethereum Classic está en los **pocos miles de millones**.

El mercado votó con su dinero. La mayoría ganó económicamente. Pero la minoría todavía existe.

Ahora que sabes un poco de los procesos técnicos detrás de los forks, déjame explicar qué pasó en la práctica:

En el bloque `1,920,000`, algunos nodos eligieron seguir la cadena ETH, aceptando un nuevo bloque con una transacción especial devolviendo los fondos hackeados. Otros eligieron seguir la cadena ETC, rechazando ese bloque y continuando con las reglas originales.

Los mineros se dividieron. Los desarrolladores se dividieron. Los usuarios se dividieron. Los exchanges tuvieron que decidir qué cadena llamar "Ethereum" y cuál llamar "Ethereum Classic."

La comunidad estaba dividida, pero ambas podían coexistir.

### Ten Cuidado, El Pasado Puede Perseguirte

¿Recuerdas la estructura de datos blockchain? Su poder puede verse claramente aquí. Esto no es solo una historia—**es historia registrada.**

Ve a mirar el bloque `1,920,000` en ambas cadenas. Verás el fork. Puedes rastrear el ETH robado. Puedes ver a dónde fue en cada cadena.

**En Ethereum (ETH):** Los fondos fueron devueltos.

**En Ethereum Classic (ETC):** El atacante se los quedó.

Nadie puede ocultar esto. Nadie puede reescribirlo. La blockchain actual de ETH preserva el desacuerdo para siempre. Siempre mostrará cómo la comunidad rompió el consenso por una iteración, incluso si después retomaron usando las mismas reglas de consenso.

Como dirían las generaciones más nuevas:
**Esta es la máquina anti-manipulación psicológica en acción.**

Para cualquiera que lea esto y no sepa qué es la manipulación psicológica (gaslighting): La manipulación psicológica es una forma de manipulación en la que una persona o grupo hace que alguien cuestione su propia memoria, percepción o cordura. Por ejemplo, en una relación tóxica, una pareja podría negar repetidamente eventos que la otra claramente recuerda, haciéndola dudar de su propio recuerdo y sentirse confundida o loca.

En este caso, la blockchain previene la manipulación psicológica al hacer pública y verificable la historia de desacuerdos. Nadie puede decir "eso nunca pasó." Los datos están allí, para siempre—hasta que el último nodo se apague, de todos modos. Hay algunos matices en eso, pero captas la idea. Te animo de nuevo a investigar si tienes curiosidad.

## Historia 2: Bitcoin vs. Bitcoin Cash - La Guerra del Tamaño de Bloque

En 2017, Bitcoin enfrentó su propia división.

### El Problema: Bitcoin Es Lento

Bitcoin procesa aproximadamente 7 transacciones por segundo. Visa procesa alrededor de 24,000.

A medida que Bitcoin ganó popularidad, las tarifas de transacción se dispararon y los tiempos de espera aumentaron. Se estaba volviendo caro y lento.

**¿Por qué tan lento?** Porque cada nodo procesa cada transacción, y el protocolo de Bitcoin limita el tamaño de bloque a 1 MB (megabyte).

Un megabyte (MB) es 1 millón de bytes. Un byte es 8 bits. Así que 1 MB = 8 millones de bits.

El tamaño de bloque es como la cantidad máxima de datos que puedes cambiar en la base de datos en cada iteración. Cada cambio de saldos (una transacción) escribe y borra algunos datos, así que hay un límite en cuántas transacciones pueden procesarse a la vez.

Si solo puedes escribir 8 millones de bits por iteración, y cada iteración toma 10 minutos (el objetivo de Bitcoin), estás limitado en cuántas transacciones puedes incluir.

### El Debate: Bloques Más Grandes vs. Mantenerlos Pequeños (el tamaño importa)

Una vez más, la comunidad se dividió en dos bandos con visiones válidas pero incompatibles:

**Equipo Bloques Grandes:**
- Simplemente aumentar el tamaño de bloque.
- Permitir bloques de 8 MB en lugar de 1 MB.
- Más transacciones por bloque = más rápido, más barato.
- Necesitamos escalar ahora para competir con Visa.
- Bitcoin debería ser usable para pagos cotidianos.

**Equipo Bloques Pequeños:**
- Bloques más grandes = menos personas pueden ejecutar nodos (porque necesitarían más almacenamiento y ancho de banda para manejar el aumento de datos).
- Menos personas ejecutando nodos = más centralización.
- La centralización derrota el propósito de Bitcoin.
- Aumentar la capacidad de transacciones con soluciones de Capa 2 en su lugar (como Lightning Network). No te preocupes, tocaremos qué es una solución de Capa 2 más adelante en este libro.
- Bitcoin debería ser una capa de liquidación, no una red de pagos.

Nuevamente, ambos lados tenían puntos válidos. Ambos reflejaban valores diferentes sobre qué debería ser Bitcoin.

Un lado priorizó **accesibilidad y tarifas bajas**. El otro priorizó **descentralización y seguridad**.

### El Fork: Bitcoin vs. Bitcoin Cash

La comunidad no pudo ponerse de acuerdo.

Así que el 1 de agosto de 2017, Bitcoin se bifurcó:

**Bitcoin (BTC):** Mantuvo bloques de 1 MB. Se enfocó en la descentralización. Desarrolló soluciones de Capa 2.

**Bitcoin Cash (BCH):** Aumentó a bloques de 8 MB (más tarde 32 MB). Se enfocó en el rendimiento de transacciones.

Ambos todavía existen. Ambos tienen comunidades. Ambos tienen visiones diferentes de lo que significa "Bitcoin".

**Valores de mercado** (que fluctúan constantemente):
- Al momento de escribir esto (principios de 2026), la capitalización de mercado de Bitcoin está en los **cientos de miles de millones de dólares** (acercándose o superando un billón en ocasiones), mientras que la de Bitcoin Cash está en los **pocos miles de millones**.

Nuevamente, una mayoría claramente ganó económicamente. Pero la cadena minoritaria sobrevive.

## El Patrón: La Tecnología Permite, Los Humanos Deciden

Nota lo que está sucediendo en ambas historias:

### 1. La Tecnología Permite El Fork

El código es de código abierto. Cualquiera puede copiarlo. Cualquiera puede modificarlo. Cualquiera puede ejecutar su propia versión.

**Hacer fork es trivialmente fácil desde un punto de vista técnico.** Solo cambia unas pocas líneas de código, anúncialo, y ve quién te sigue.

La estructura de datos blockchain hace fácil probar dónde sucedió la división. La naturaleza de código abierto hace fácil copiar y modificar.

### 2. Los Humanos Deciden El Resultado

Pero, ¿qué fork tiene valor? Esa no es una pregunta técnica—es una pregunta social.

**La gente vota con su participación en la red y con su dinero:**
- ¿A qué nodos apuntan su hardware los mineros?
- ¿En qué cadena construyen los desarrolladores?
- ¿Qué moneda listan los exchanges?
- ¿Qué moneda compran y mantienen los usuarios?
- ¿Qué fork valora la gente?

La respuesta determina qué fork "gana" económicamente (aunque ambos pueden sobrevivir).

En el caso tanto de Ethereum como de Bitcoin, la cadena mayoritaria ganó la batalla económica decisivamente. Pero las cadenas minoritarias no desaparecieron—encontraron sus propias comunidades que valoraron sus principios.

### 3. Blockchain Hace El Desacuerdo Auditable

En sistemas tradicionales, los desacuerdos pueden ocultarse, censurarse o reescribirse.

**En RBDC, el desacuerdo es permanente.**

Gracias a la propiedad de inmutabilidad de la estructura de datos blockchain, puedes ver exactamente cuándo sucedió el fork. Puedes rastrear qué usuarios fueron en qué dirección. Puedes verificar la historia tú mismo.

Nadie puede decir "eso nunca pasó." Los datos son públicos.

Esto crea un registro permanente y auditable de cada desacuerdo importante en la historia de la red.

## Los Forks Son Guerras Civiles, Más o Menos

Cuando las comunidades están en desacuerdo fundamentalmente, pueden dividirse.

Al principio, los forks suenan mal. "¡La red se dividió! ¿No es eso un fracaso?"

No realmente. **Los forks son prueba de que la coordinación es voluntaria.**

Podrías pensar: "¿No sería mejor si todos simplemente estuvieran de acuerdo? ¿No nos haría eso más fuertes? Somos más débiles divididos—eso parece malo."

Ese es un punto de vista totalmente válido. Aquí es donde entra en juego la ética, y nos damos cuenta de que la ética no es objetiva.

**¿Son los forks malos o buenos? Depende de tus valores y el contexto en que sucedieron.**

Si valoras la unidad y la fuerza a través de la escala, los forks parecen fracasos. La comunidad es más débil dividida.

Si valoras la libertad y la capacidad de salir, los forks parecen éxitos. La minoría tiene poder.

Si valoras la inmutabilidad por encima de todo, el fork de ETH fue una traición. Si valoras el pragmatismo y proteger a los usuarios, fue una intervención necesaria.

Si valoras la accesibilidad, los bloques más grandes de Bitcoin Cash tienen sentido. Si valoras la descentralización, los bloques pequeños de Bitcoin tienen sentido.

**No hay una respuesta objetivamente correcta.** Esto es filosofía, incluso política si quieres—no matemáticas.

### No Puedes Forzar Consenso Global

Nadie puede hacerte ejecutar código específico. Nadie puede forzarte a estar de acuerdo.

Bueno, si todos los nodos están en un país, el ejército de ese país podría ser capaz de... pero la mayoría de las RBDC son globales y distribuidas a través de países que no necesariamente se gustan entre sí.

Si el 85% quiere revertir un hackeo, el 15% puede decir "no" y mantener viva la cadena original.

Si no estás de acuerdo lo suficientemente fuerte, puedes hacer fork. Y si suficientes otros están de acuerdo contigo, tu fork sobrevive.

**Esta es una tecnología de libertad colectiva.** La libertad para que cualquier comunidad use la tecnología que mejor se adapte a sus intereses.

#### ¿Cuántas Personas Necesitas Para Hacer Fork?

Solo nosotros 2.

Mientras tengas un grupo—es decir, al menos 2 personas—ambos pueden ejecutar su propia versión del código en la base de datos y convencer a otros de usarla. Mientras tengas al menos 2 personas, tienes consenso entre ustedes y pueden ejecutar su propia versión del código.

¿Es eso económicamente sostenible? ¿Tienen ustedes dos suficiente dinero para ejecutar los ordenadores incluso si nadie está dispuesto a pagar para escribir datos en su base de datos? Si sí, pueden ejecutar su propia versión del código y crear su propia "sociedad digital," su propia RBDC. Si no, bueno, será mejor que encuentren usuarios dispuestos a pagar por sus servicios.

O amenazarlos, quién sabe. Nunca olvides los lados oscuros de la naturaleza humana. Pero tampoco seas demasiado paranoico. En el equilibrio encontramos la virtud, diría Aristóteles.

Pero, ¿quién soy yo para decirte qué hacer? Nadie—de la misma manera que no soy nadie para decirte qué consenso ejecutar en tu ordenador.

### La Historia Del Desacuerdo Se Preserva

Los gobiernos reescriben libros de texto de historia. Las corporaciones borran registros embarazosos. Las plataformas centralizadas banean voces disidentes.

**Las RBDC, porque usan blockchains, no pueden hacer esto.**

La división Ethereum/Ethereum Classic es visible para siempre. Cualquiera puede estudiarla. Cualquiera puede aprender de ella.

Las generaciones futuras verán:
- ¿De qué trataba el desacuerdo?
- ¿Quién votó de qué manera?
- ¿Cuáles fueron los argumentos?
- ¿Cómo reaccionó el mercado?

**Nadie puede censurar esto.** La blockchain hace el desacuerdo permanente y auditable.

## La Realización Más Profunda: De Dos Sociedades A Muchas

Si el consenso puede dividirse en dos sociedades (ETH/ETC, BTC/BCH), ¿puede dividirse en muchas?

**Sí.**

Podrías tener:
- Ethereum (pragmático, cadena mayoritaria).
- Ethereum Classic (ideológico, enfocado en la inmutabilidad).
- Ethereum [Nuevo Fork] (experimentando con características diferentes).
- Y más...

Cada fork es una mini-sociedad con sus propias reglas, su propia comunidad, sus propios valores.

## Suficiente División—¿Por Qué No Unirse?

**Aquí hay un pensamiento provocador:** ¿Y si en lugar de dividirnos completamente, creáramos mini-sociedades que se coordinen con una mega-sociedad más grande?

¿Y si tuviéramos:
- Una cadena principal (lenta, segura, cara, consenso global).
- Muchas cadenas laterales (rápidas, baratas, especializadas, consenso local).
- Todas coordinándose juntas cuando sea necesario.

Como Estados Unidos:
- Gobierno federal (lento, seguro, árbitro final).
- 50 gobiernos estatales (rápidos, locales, especializados).
- Ambos trabajando juntos.

O algo "ligeramente" diferente, como la Unión Europea:
- UE (capa de coordinación, reglas compartidas).
- 27 naciones (soberanas, independientes, especializadas).
- Ambas respetándose mutuamente.

**Esto es escalado de Capa 2.** Y es el tema de nuestro próximo capítulo.

Muy resumido y dejando detalles atrás, por ahora:

Las Capa 2 son simplemente RBDC que se comunican con otra RBDC, compartiendo datos cuando es necesario pero teniendo sus propias reglas y código para ejecutar por su cuenta.

En lugar de separación completa (como los forks), las Capa 2 mantienen conexión mientras permiten independencia. Lo mejor de ambos mundos.

## Lo Que Esto Significa Para Cualquiera

Los forks nos enseñan algo profundo:

**El consenso de software no es algo que impongas. Es algo que eliges.**

No puedes forzar a la gente a estar de acuerdo. Solo puedes:
- Presentar tu caso.
- Escribir tu código.
- Ver quién te sigue.

**La red es, en última instancia, la gente que la eligió.** El código es solo una herramienta. La gente decide qué herramienta usar. Si suficientes personas no están de acuerdo, la red se divide. Y eso no es necesariamente el fin del mundo, ya que ambas versiones pueden coexistir.

**Esto es lo que realmente significa la descentralización:** Ninguna entidad individual decide por todos. Los grupos lo hacen, empezando por el más pequeño—2 personas.

Esto no es libertad individual, sino libertad colectiva. Una tecnología que permite a cualquier colectivo coordinar su información de la manera que les plazca.

## La Máquina Anti-Manipulación Psicológica, Mejorada

Hemos estado llamando a la blockchain "la máquina anti-manipulación psicológica" porque previene reescribir la historia.

Pero ahora vemos algo más profundo:

**No puedes prevenir que el consenso cambie.** La gente siempre estará en desacuerdo. Los forks sucederán.

**Pero puedes probar cuándo y cómo cambió.**

Si una mayoría intenta reescribir la historia, la minoría puede hacer fork y preservar el original.

Si un gobierno intenta censurar una transacción, los usuarios pueden hacer fork y mantenerla visible.

Si los desarrolladores intentan imponer nuevas reglas, los usuarios pueden rechazarlas y quedarse con el código antiguo.

**Nadie tiene poder absoluto. Todos tienen el poder de salir.**

Esta es una estructura social fundamentalmente nueva que permite coordinación instantánea voluntaria de datos con registros permanentes de desacuerdo.

La blockchain no previene el conflicto—hace el conflicto visible, auditable, y sobrevivible.

---

**Idea Clave:** Los forks suceden cuando las comunidades están en desacuerdo fundamentalmente sobre valores y dirección. ¿Son buenos o malos? Depende de tus valores y contexto. El fork de Ethereum (hackeo de The DAO) se dividió sobre pragmatismo vs. inmutabilidad. El fork de Bitcoin (tamaño de bloque) se dividió sobre accesibilidad vs. descentralización. Ambos lados tenían argumentos válidos—esto es filosofía, no matemáticas. La tecnología hace que hacer fork sea fácil (copiar código, ejecutar tu versión), pero los humanos deciden el resultado (qué cadena tiene valor). La blockchain hace el desacuerdo permanente y auditable—puedes verificar exactamente cuándo/cómo sucedió. Los forks prueban que la coordinación es voluntaria: no puedes forzar el consenso, solo elegirlo. Con tan pocas como 2 personas, puedes hacer fork. La máquina anti-manipulación psicológica mejorada: no puedes prevenir el cambio, pero puedes probar cuándo cambió y preservar alternativas. Nadie tiene poder absoluto—todos tienen el poder de salir. Pero, ¿y si en lugar de separación completa, nos coordináramos en múltiples niveles?

A continuación, exploraremos soluciones de escalado de Capa 2—mini-sociedades que se coordinan con mega-sociedades más grandes. Como los estados de EE.UU. y el gobierno federal, o las naciones de la UE y la UE. Consenso anidado, sociedades dentro de sociedades, todas trabajando juntas. Así es como las RBDC escalan sin forzar a todos a dividirse completamente.
