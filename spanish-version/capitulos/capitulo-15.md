# Capítulo 15: ¡Una Sociedad Para Ti! ¡Una Sociedad Para Mí! ¡Una Sociedad Para Todos!

*¿Podemos tener lo mejor de todos los mundos?*

---

En el Capítulo 14, aprendimos que cuando las comunidades no están de acuerdo, pueden hacer fork. Separación completa. Cadenas diferentes, comunidades diferentes, valores diferentes.

Pero, ¿y si no tuviéramos que elegir entre unidad e independencia?

¿Y si pudiéramos tener **muchas sociedades coordinándose** en lugar de una sociedad global o muchas completamente separadas?

Esta es la idea detrás de las Capa 2 (C2). Supongo que se llaman así porque usualmente se dibujan junto a la otra blockchain, pareciendo que están formando capas:

```
Cadena Capa 2: ->->->[]->->->[]->->->[]->->->[]->->->[]->->->[]->-> Bloque, Bloque

Cadena Capa 1: ->->->[]->->->[]->->->[]->->->[]->->->[]->->->[]->-> Bloque
```

Pero antes de entender mejor las Capa 2, ayudará entender un problema fundamental.

## El Trilema de Blockchain (como un dilema pero con tres opciones)

Hay un problema famoso en el diseño de RBDC llamado **el trilema de blockchain.**

Establece que solo puedes optimizar **2 de 3** propiedades:

1. **Descentralización:** Cualquiera puede participar (ejecutar un nodo, verificar transacciones...).
2. **Seguridad:** La red no puede ser fácilmente atacada o comprometida.
3. **Escalabilidad:** La red puede manejar muchas transacciones rápida y económicamente.

**Puedes elegir 2 cualesquiera y ser muy bueno en ellas, pero no las 3.**

Expliquemos intuitivamente por qué.

### Descentralización + Seguridad = Lento (Bitcoin, Ethereum)

Esto es lo que eligieron Bitcoin y Ethereum.

**Descentralización:**
- Cualquiera con un ordenador puede ejecutar un nodo.
- Los bloques son suficientemente pequeños (1-2 MB) para que muchas personas puedan almacenarlos y verificarlos.
- Miles de nodos independientes operan mundialmente.

**Seguridad:**
- Para atacar la red, necesitas una gran cantidad de un recurso difícil de obtener.
- Extremadamente caro y difícil.

**Sin embargo, esto viene con un costo de velocidad:**
- **Cada nodo procesa cada transacción.**
- Cada nodo almacena cada bloque.
- Cada nodo debe alcanzar consenso con cada otro nodo.

Hay un límite físico a qué tan rápido puede suceder esto. Si los bloques vienen demasiado rápido, algunos nodos no podrán mantener el ritmo con sus máquinas más pequeñas. Si los bloques son demasiado grandes, solo personas con hardware caro pueden participar, lo que lleva a la centralización y pierde las garantías de seguridad que proporciona la descentralización.

El tiempo de bloque (con qué frecuencia se crean nuevos bloques) se elige en las reglas de consenso. Bitcoin eligió 10 minutos, Ethereum eligió ~12 segundos. Pero no puedes hacerlo demasiado rápido sin arriesgarte a que solo ordenadores poderosos puedan mantener el ritmo.

Resultado: **~7 transacciones/segundo (Bitcoin), ~15 transacciones/segundo (Ethereum).**

Compara con otros sistemas de pago centralizados como Visa: **~24,000 transacciones/segundo.**

### Escalabilidad + Seguridad = Centralizado

¿Y si quisiéramos manejar 24,000 transacciones por segundo?

**Opción:** Hacer bloques enormes (como 1 GB en lugar de 1 MB).

**Resultado:**
- Pueden caber muchas más transacciones por bloque.
- Mucho más rápido, mucho más barato.

**Pero el problema:**
- Bloques de 1 GB cada 10 minutos = 144 GB por día = 52 TB por año.
- La mayoría de las personas no pueden almacenar tantos datos.
- La mayoría de las personas no pueden descargar bloques de 1 GB cada 10 minutos.
- **Solo grandes corporaciones y centros de datos pueden ejecutar nodos.**

Resultado: **Centralización.** Casi has recreado una base de datos tradicional con pasos extra.

Enhorabuena, en lugar de una dictadura de datos tradicional ahora tienes una pequeña oligarquía. Quiero decir, técnicamente en realidad es más descentralizado.

### Descentralización + Escalabilidad = Caos (Inseguro)

¿Y si quisiéramos que mucha gente participara (descentralización) Y procesar toneladas de transacciones rápidamente (escalabilidad)?

**Opción:** Mantener la red abierta para todos, pero hacer bloques enormes y que vengan muy rápido.

**Lo que sucede:**
- Muchas transacciones caben en cada bloque (check de escalabilidad).
- Cualquiera puede unirse (check de descentralización).
- Pero tienes que procesar cosas muy, muy rápidamente.

**El problema:**

No todos tienen el hardware para mantener el ritmo. Imagina que estás procesando el bloque 10 mientras alguien en Japón ya está en el bloque 12, otro nodo en Brasil todavía está en el bloque 11, y el tipo rico con el ordenador más rápido está en el bloque 20.

**La base de datos se desordena completamente y se desincroniza.**

Además, las distancias físicas importan. Incluso a la velocidad de la electricidad, si los bloques vienen demasiado rápido, un nodo en Islandia y un nodo en Senegal no pueden mantenerse coordinados. Para cuando el Bloque 100 llega a Senegal, Islandia ya está en el Bloque 105. La red se fragmenta geográficamente.

Es como la cocina de un restaurante con estrella Michelin donde todos literalmente corren intentando coordinarse a velocidades imposibles. Los chefs chocarían entre sí, empezarían a gritar, se confundirían. Caos.

Resultado: **Inseguridad.** La red no puede mantener el consenso. Los nodos no están de acuerdo sobre el estado actual. Todo el sistema se desmorona.

## Por Qué Las RBDC Descentralizadas Son Inherentemente Lentas

Al menos con algoritmos modernos, criptografía, y disponibilidad de hardware: **El consenso global toma tiempo.**

Recuerda cómo funcionan las RBDC:
1. Las personas envían transacciones.
2. **Cada nodo** las recibe y verifica.
3. Otro nodo (minero/validador) propone un bloque con esa transacción.
4. **Cada nodo** verifica el bloque completo.
5. **Cada nodo** actualiza su copia local de la base de datos.

**Esto es coordinación a escala global.**

Cuantos más nodos tienes (y por lo tanto más descentralización), más trabajo necesita suceder. Cada nodo debe calcular varias cosas por cada transacción.

Si lo quieres seguro—es decir, funcionando como se espera—no puedes apresurarlo. Si lo quieres descentralizado, no puedes limitar quién participa. Pero si también lo quieres rápido... tienes que sacrificar una de esas.

## ¿Pero Necesitamos Consenso Global Lento Para Todo?

**¿Y si no necesitamos consenso global para cada transacción individual?**

¿Y si podemos ejecutar RBDC que sacrifiquen cierto grado de descentralización a cambio de velocidad, pero solo para ciertos casos de uso?

Piensa en la vida real:

- No necesitas que el gobierno federal apruebe cada compra que haces en una tienda local.
- No necesitas que la ONU valide cada contrato entre dos personas en la misma ciudad.
- No necesitas que cada humano en la Tierra esté de acuerdo en lo que tú y tu amigo hacen juntos.

**La mayoría de la coordinación puede ser local.** Solo alguna coordinación realmente necesita ser global.

Así que, ¿y si aplicamos esto a las RBDC?

## Soluciones de Capa 2: Mini-Sociedades Dentro De Una Mega-Sociedad

**La idea:** Crear redes más pequeñas (Capa 2) que se sitúan "encima o junto a" una cadena principal (Capa 1).

**Capa 1 (La Capa Base):**
- El "gobierno federal" o "nivel de la UE."
- Lento, caro, máximamente seguro, consenso global.
- Árbitro final cuando surgen disputas.
- Todos confían en él, pero no lo usas para cada pequeña cosa.

**Capa 2 (Capas de Escalado):**
- Los "gobiernos estatales" o "naciones miembro."
- Rápido, barato, especializado, consenso local.
- Maneja transacciones del día a día.
- Periódicamente "liquida" con Capa 1 por seguridad.

**Ambos trabajando juntos.**

En lugar de procesar cada transacción en la cadena principal, procesamos la mayoría de las transacciones en Capa 2 y solo usamos Capa 1 cuando necesitamos crear un punto de control, liquidar, o resolver disputas.

Como llevar una cuenta en un bar. Normalmente no pagas después de cada bebida—liquidas al final de la noche.

### Ejemplos de Capa 2

**Bitcoin tiene Capa 2 como:**
- Lightning Network (para pagos rápidos y baratos)

**Ethereum tiene Capa 2 como:**
- Arbitrum
- Optimism
- Polygon
- Base
- Y muchas más...

Cada una es esencialmente su propia RBDC que periódicamente se sincroniza con la cadena principal por seguridad.

Esto es exactamente cómo las sociedades humanas ya funcionan.

### Estados Unidos

**Gobierno Federal (Capa 1):**
- Toma grandes decisiones (enmiendas constitucionales, guerra, acuerdos comerciales).
- Lento (el Congreso tarda una eternidad).
- Caro (enorme burocracia).
- Árbitro final (Tribunal Supremo).

**Gobiernos Estatales (Capa 2):**
- Toman decisiones locales (leyes de tráfico, impuestos locales, educación).
- Rápido (las legislaturas estatales se mueven más rápido).
- Barato (burocracia más pequeña).
- Se remiten a lo federal para disputas (la ley federal anula la ley estatal).

**Ambos trabajan juntos.** Los estados manejan la gobernanza del día a día. El gobierno federal maneja la coordinación importante.

No me repetiré con el ejemplo de la UE, es similar.

Pero las RBDC tienen nuevas características nunca vistas en la historia. Imagina que cada semana cada Estado actualiza sus datos a la RBDC federal, y así, como esa está descentralizada, permanece allí para siempre.

### Un Ejemplo de Corrupción

Imagina dentro de un Estado, porque es una RBDC más centralizada y más fácil de corromper, hay un caso de corrupción donde el dinero es robado o mal usado. Entonces podrías usar los datos de la semana pasada como un punto de partida fresco, un momento consensual donde todos están de acuerdo sobre el estado de las cosas, y desde allí puedes empezar a investigar hacia atrás para ver qué tan profunda y durante cuánto tiempo sucedió realmente la corrupción.

En casos tradicionales normales, los archivos que prueban movimientos sospechosos durante semanas y semanas podrían ser "perdidos" o destruidos por aquellos en el poder que se corrompieron. Pero con puntos de control blockchain, solo tienes una semana para cubrir tus huellas. Tienes que apresurarte, y en un sistema legal serio, si intentas grandes crímenes rápidamente, las probabilidades son que te atrapen.

### Otro Ejemplo

Le prestas dinero a Bob, pero Bob es amigo de Alice, una persona muy rica que también es política y está bien conectada con las personas que ejecutan esta RBDC rápida pero centralizada. Digamos que Bob no puede devolverte el dinero. Está en problemas, pero llama a Alice: "Oye, ¿podemos simplemente 'perder' los registros de este préstamo y pretender que nunca sucedió? ¿Podemos abusar del algoritmo de consenso para incluso reescribir un poco la historia?" Un poco, nota el juego de palabras.

Alice acepta y usa su influencia para conseguir que la RBDC centralizada "pierda" los registros de este préstamo. Estás sin suerte.

**Pero, en un sistema con actualizaciones periódicas a C1**, podemos ver que Bob realmente tomó un préstamo de ti hace 2 semanas y ahora ha desaparecido. Hora de investigación para las autoridades federales.

La Capa 1 descentralizada actúa como un punto de control inmutable. Incluso si la Capa 2 está comprometida, la Capa 1 preserva la verdad.

### Otro Otro Ejemplo

Imagina que pediste prestado a alguien, y ese prestamista sabía que no podrías devolver el préstamo pero aún así te dio el préstamo de todos modos—algo similar a la burbuja de 2008. Bueno, imagina que eso sucede a nivel estatal en EE.UU., y nuevamente, el sistema centralizado intenta excusarse con, "bueno... no lo sabíamos, ¿cómo lo habríamos sabido?" Bueno... los datos son públicos. Y mira la RBDC Federal: es claramente visible que estabas tomando decisiones muy arriesgadas, claramente irracionales que llevaron a muchos inversores y personas a la bancarrota.

Oh espera, todo es público... ¿Es eso bueno? Algunas personas se preocupan por la privacidad.

## Las Noticias Temporalmente Malas: Compromisos

Las Capa 2 no son perfectas. Introducen complejidad.

### La Complejidad Técnica Es Real

Técnicamente, las C2 pueden usar algoritmos muy diversos para ejecutarse, y todavía necesitamos encontrar una forma general de conectarlas fácilmente entre sí. La gente está trabajando en esto, pero por ahora, la complejidad técnica es algo real que hace desafiante ejecutar los escenarios descritos.

Estos sistemas existen, pero porque son complejos, es difícil para las personas normales entenderlos y por lo tanto usarlos para algo significativo.

Esto crea una barrera para la adopción. La tecnología funciona, pero la experiencia de usuario todavía se está descubriendo.

Imagina que para conectarte a internet tuvieras que hacerlo completamente diferente para cada marca de ordenador que uses. Eso ciertamente ralentizaría las cosas.

### Carga Cognitiva: Demasiadas Opciones

Más allá de la complejidad técnica, también está la carga cognitiva que crea.

Los usuarios tienen que elegir qué Capa 2 usar. ¿Uso Arbitrum? ¿Optimism? ¿Polygon? ¿Base? Es como elegir en qué estado vivir—no todos entienden las diferencias exactas y toma tiempo hacerlo.

Cada Capa 2 tiene diferentes supuestos de confianza (algunas son más centralizadas que otras), diferentes velocidades y costos, diferentes modelos de seguridad, y diferentes aplicaciones construidas sobre ellas. **¿Cómo se supone que una persona normal elija sabiamente?**

Ahora mismo, la mayoría de las personas no lo hacen. Se quedan con Capa 1 o usan lo que su aplicación favorita recomienda. Esto derrota algo del propósito.

Si quieres mover independientemente tu dinero alrededor de todas estas RBDC, realmente tienes que saber lo que estás haciendo. ¿Cuál es el chainID? ¿Es confiable este proveedor de nodos? ¿Necesito crear una nueva billetera para esta cadena? ¿Está disponible el token o moneda que quiero usar en esta cadena? ¿Es el código en esta cadena tan seguro y revisado por expertos de seguridad como en esta otra cadena? ¿Dónde puedo encontrar una interfaz de usuario simple para mover fondos entre las cadenas con uno o dos clics? ¿Es seguro este sitio web que encontré? ¿Quién lo gestiona? Genial, encontré otra cadena—recojamos toda esta información de nuevo...

Es como mudarse de residencia—posible, pero no instantáneo o gratis.

Nadie tiene tiempo para esto, solo frikis como el autor. Como se dijo, avances técnicos como crear nuevas reglas de consenso van a simplificar el proceso en el futuro, y los usuarios no tendrán que saber tanto sobre todos los detalles en absoluto. Pero eso está simplemente en construcción.

### Diferentes Supuestos de Confianza Y Accesibilidad de Software

Algunas Capa 2 son más centralizadas que Capa 1. Estás confiando en el operador de Capa 2 hasta cierto grado o completamente.

Es un compromiso: más velocidad y menor costo, pero un modelo de seguridad ligeramente o completamente diferente.

¿Qué pasa si el operador simplemente desaparece y no tuviste tiempo de mover tu dinero de vuelta a la RBDC segura? ¿Qué pasa si el desarrollador que hizo el sitio web desaparece y ahora, aunque es técnicamente posible, no sabes cómo mover tus fondos de vuelta?

No todos en este mundo son ingenieros de software, y aún menos personas entienden y pueden interactuar rápidamente con RBDC. Y no es realista esperar que todos se conviertan en uno por el bien de un sistema financiero más efectivo.

¿Cuál es la solución entonces? Como se dijo, los técnicos están trabajando en ello—en sitios web que cualquiera puede ejecutar en sus máquinas incluso sin internet, en aplicaciones que son de código abierto con código que es público y todos pueden verificar, que pueden descargar y usar para siempre en su teléfono para mover fondos de forma segura incluso si su sitio web favorito está caído.

Incluso se han inventado mecanismos criptográficos donde, incluso si la C2 se rompe, las personas pueden simplemente mover sus fondos a la RBDC principal sin tener que interactuar con la rota.

No es realista esperar que todos se conviertan en ingenieros de software, pero no es poco realista crear software de código abierto usable y accesible por cualquiera a escalas globales. Linux, un sistema operativo gratuito que funciona perfectamente, es gratis y para todos, en cualquier lugar. Y así sucesivamente—hay mucho software capaz de esto.

Es cierto que estos softwares requieren un pequeño esfuerzo; no están simplemente disponibles en la Play Store donde los instalas con un clic. Pero esta cosa o dos extra que tienes que aprender es mínima y cualquiera puede hacerlo en una o dos tardes, especialmente las nuevas generaciones que nacieron alrededor de herramientas digitales. Y es probable que alguien cree una forma de incluso eliminar esta pequeña barrera de entrada en el futuro.

Por lo tanto, danos tiempo y te daremos libertad colectiva. O pon un pequeño esfuerzo en entender cómo descargar código de lugares como GitHub. Las IAs modernas pueden explicar cómo hacer esto bastante bien.

Si eres un ingeniero de software leyendo esto, te animo a usar tu conocimiento y construir para el nicho de RBDC. Muchas gracias, eres muy bienvenido, nunca tendremos suficientes personas trabajando—solo crea más descentralización y mejores sistemas. Y por favor, no olvides el propósito, no olvides que la descentralización es lo que mantiene la fiesta en marcha.

### Contexto de Edad de la Industria

Esta industria tiene solo unos **16 años** a partir de **2025** si cuentas desde que se creó Bitcoin—muy joven—y todavía queda mucho código por escribir, y escribirlo de forma segura ralentiza el proceso. Arruina algo en esta industria y consigues algunos hackeos irrecuperables, como hemos explicado en capítulos anteriores.

### Fragmentación

Si todos usan diferentes Capa 2, el efecto de red se divide.

Es como cómo la UE se beneficia de que todas las naciones se coordinen, pero cada nación hablando un idioma diferente crea fricción.

Si tu dinero está en Arbitrum y el dinero de tu amigo está en Optimism, hacer transacciones entre ustedes dos es más difícil que si ambos estuvieran en la misma red.

Es como enviar un paquete a otro Estado en lugar de enviarlo a alguien en la ciudad más cercana.

## Resumiendo

**Coordinación Local -> Regional -> Nacional -> Global.**

- Te coordinas con tu familia (muy rápido, muy local).
- Tu ciudad se coordina internamente (rápido, local).
- Tu estado se coordina con otros estados (más lento, regional).
- Tu nación se coordina con otras naciones (lento, global).

**Las Capa 2 son el mismo patrón aplicado a RBDC.**

No estamos, a niveles de relaciones sociales, inventando algo nuevo—estamos reconociendo que la coordinación naturalmente sucede a múltiples escalas.

La mayor parte de tu vida diaria no necesita coordinación global. Solo algunas cosas lo hacen.

## La Seguridad Se Comparte Globalmente

Imagina que en sistemas tradicionales, cada vez que tenías una disputa, el mejor juez, abogados y detectives del mundo te ayudaban. Eso es imposible.

De cierta manera, ya no. Como vimos, podemos actualizar periódicamente los datos al sistema seguro, creando historia inborrable, evidencia—legible y analizable a la velocidad de la electricidad, en cualquier lugar del mundo.

**Sociedades dentro de sociedades, todas trabajando juntas y para cada una.**

Ethereum no necesita procesar cada transacción. Solo necesita ser el árbitro final cuando surgen disputas o cuando se necesitan puntos de control.

Bitcoin no necesita registrar cada compra de café. Solo necesita liquidar saldos finales cuando los canales de Capa 2 se cierran.

**Así es como escala la coordinación.**

No a través de forzar a todos a estar de acuerdo en todo, sino a través de permitir que grupos locales se coordinen rápidamente mientras mantienen una capa global para la verdad y seguridad.

Esto crea la idea de Ethereum como la máquina de confianza global. ¿Por qué vives relajado incluso si literalmente cualquiera puede herirte cuando sales? Porque hemos diseñado nuestro sistema para tener mecanismos "automatizados", como policía y jueces, para ayudarte cuando eso sucede. Estos sistemas tradicionales también son máquinas de confianza que construyen confianza. Y cuando confías puedes relajarte, y entonces mejor el sexo—lo mismo aplica en finanzas y coordinación de datos. Además, estos sistemas también pueden ser influenciados y mejorados por ti en caso de que se equivoquen, a través de votar por nuevas leyes, etc.

En una frase inversa, también generan la falta de necesidad de confiar, porque sabes que si alguien se porta mal, será castigado. Esto es lo que la industria llama "trustless" (sin necesidad de confianza).

Por cierto, el manifiesto trustless y la filosofía d/acc de Vitalik Buterin reflejan muy bien cómo las principales fuerzas que guían Ethereum tienen estas intenciones que he estado describiendo. Te animo a leerlos.

Como puedes ver, las RBDC son muy similares: acuerdos consensuales válidos sobre cuál es la información oficial, en la que todos pueden participar e incluso proponer cambios si las cosas parecen no funcionar. Y a diferencia de los sistemas tradicionales, estos sistemas pueden ser globales y realmente automatizados.

Este es el estado actual de pensamiento de la industria y un vistazo a las posibilidades que abre. Te animo a seguir aprendiendo sobre esto—como puedes ver, es avance tecnológico que nos otorga nuevas capacidades que simplemente no teníamos antes.

Pero ahora, espera, ¿te has dado cuenta? Todos estamos desnudos.

## El Último Inconveniente, Privacidad

Houston, todavía hay un problema: **Todas estas transacciones y datos siguen siendo públicos.**

Todos pueden ver tu saldo. Todos pueden ver con quién haces transacciones. Todos pueden rastrear tu historial financiero.

Los criminales pueden ver cuánto dinero tienes y decidir si atacarte.

Los gobiernos corruptos también. Quiero decir, son un subconjunto del ejemplo de criminales arriba.

Incluso tus vecinos pueden ver tus hábitos de gasto, pueden envidiarte, y crear presión social.

Las compañías de seguros pueden ver tus datos y decidir cobrarte más o menos sin razón real relacionada con la póliza de seguro actual.

Los empleadores pueden ver en qué gastas antes de contratarte, discriminando basándose en tu vida personal.

Regímenes autoritarios pueden rastrear donaciones de disidentes a grupos de oposición.

Acosadores y ex parejas abusivas pueden monitorear tus movimientos financieros y patrones de ubicación.

Las empresas pueden rastrear tus compras y construir perfiles publicitarios invasivos sin tu consentimiento.

Bueno para auditabilidad y generación de responsabilidad. Malo para privacidad y protección.

**¿Hay una forma de tener ambas, privacidad y verificación?**

¿Puedes probar que tienes suficiente dinero para hacer una compra sin revelar cuánto tienes?

¿Puedes probar que tienes suficiente edad para entrar a un bar sin mostrar tu fecha de nacimiento exacta?

¿Puedes probar que votaste sin revelar por quién votaste?

Esto parecía matemáticamente imposible durante mucho tiempo. Si quieres probar que algo es correcto, ¿no tienes que mostrarlo?

Resulta que no. Y ese es el tema de nuestro próximo capítulo.

---

**Idea Clave:** El trilema de blockchain: solo puedes tener 2 de 3 (descentralización, seguridad, escalabilidad). Bitcoin y Ethereum eligieron descentralización + seguridad, sacrificando velocidad (~7-15 tx/seg vs ~24,000 de Visa). Pero no necesitamos consenso global para todo—la mayoría de la coordinación puede ser local. Las Capa 2 son RBDC más pequeñas encima de Capa 1: Capa 1 es lenta, segura, global (gobierno federal), mientras que las Capa 2 son rápidas, baratas, locales (gobiernos estatales). Ejemplos: Lightning Network (Bitcoin), Arbitrum/Optimism/Polygon/Base (Ethereum). Periódicamente crean puntos de control en Capa 1, creando un registro inmutable que previene que la corrupción se oculte. Compromisos: complejidad técnica (difícil conectar C2), carga cognitiva (demasiadas opciones), diferentes supuestos de confianza, sobrecarga de coordinación, fragmentación. Esto refleja la sociedad humana: local -> regional -> nacional -> global. El consenso puede ser anidado—sociedades dentro de sociedades. La mayor parte de la vida diaria no necesita consenso global, solo puntos de control para verdad y seguridad. Pero todas las transacciones siguen siendo públicas—¿podemos tener privacidad Y verificación?

A continuación, exploraremos las pruebas de Conocimiento Cero—probar que sabes algo sin revelar qué sabes. Esto parecía imposible hasta los años 1980, e impráctico hasta los años 2010, pero ahora es la pieza faltante para coordinación privada y verificable.
