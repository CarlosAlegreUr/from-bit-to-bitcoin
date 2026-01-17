# Capítulo 11: La Blockchain - Encadenando la Historia

*¿Qué pasa cuando dos mineros resuelven el rompecabezas al mismo tiempo?*

---

Al final del Capítulo 10, dejamos una pregunta crítica sin responder.

Hemos establecido quién puede escribir en la base de datos (mineros que resuelven rompecabezas), cuándo escriben (cada 10 minutos), y por qué siguen las reglas (los incentivos se alinean). Pero no hemos abordado un caso límite fundamental: **¿qué pasa cuando dos mineros resuelven el rompecabezas exactamente al mismo tiempo?**

## El Problema de la Solución Simultánea

Imagina que todos tenemos bases de datos sincronizadas mostrando los mismos saldos en el Bloque 100. (Recuerda, Bloque 100 simplemente significa que hemos acordado 100 veces el próximo estado de la base de datos—en el caso de Bitcoin, cada transición de estado involucra restar algunos saldos y añadir otros basados en transacciones.)

```
Estado actual (Bloque 100):
- Alice: 50 monedas
- Bob: 30 monedas
- Carol: 20 monedas
```

Ahora imagina dos mineros, Minero A y Minero B, ambos resolviendo el rompecabezas de Proof-of-Work casi al mismo tiempo. Ambos encontraron soluciones válidas, ambos hicieron el trabajo, y ambos merecen la recompensa.

**Minero A comparte con la red Bloque 101a:**
```
Bloque 101a:
- Transacción: Minero A recibe una recompensa según las reglas de incentivo, digamos 10 monedas
- Nuevos saldos: Alice: 50, Bob: 30, Carol: 20, Minero A: 10
```

**Minero B comparte con la red Bloque 101b:**
```
Bloque 101b:
- Transacción: Minero B recibe una recompensa según las reglas de incentivo, digamos 10 monedas
- Nuevos saldos: Alice: 50, Bob: 30, Carol: 20, Minero B: 10
```

Ambos bloques son válidos—ambos mineros siguieron las reglas, y ambos completaron el Proof-of-Work.

**Ahora los nodos tienen que decidir: ¿qué bloque deberían aceptar?**

Algunos nodos reciben el Bloque `101a` primero y actualizan sus bases de datos en consecuencia, mientras que otros nodos reciben el Bloque `101b` primero y actualizan a esa versión en su lugar. **Las bases de datos ahora están desincronizadas.** La mitad de la red piensa que un minero recibió la recompensa, y la otra mitad piensa que un minero diferente lo hizo.

## La Elección Imposible

Aquí está el dilema que enfrentamos:

**Si elegimos el Bloque 101a:**
- Rechazamos el trabajo del Minero B, aunque fue honesto e hizo el trabajo.
- Rompemos la regla de consenso que dice "quien resuelve el rompecabezas puede escribir."
- ¿Por qué participaría alguien si su trabajo honesto puede ser rechazado arbitrariamente?

**Si elegimos el Bloque 101b:**
- Rechazamos el trabajo del Minero A, aunque también fue honesto.
- Mismo problema—estamos rompiendo las reglas.

**Si aceptamos ambos:**
- El estado de la base de datos se vuelve inconsistente.
- La mitad de la red tiene saldos diferentes que la otra mitad.
- El punto entero del consenso—todos acordando el mismo estado—se pierde.

**Si dejamos que la base de datos se desincronice:**
- El sistema se vuelve inútil porque diferentes personas ven diferentes verdades, diferentes datos. Nunca olvides: todo son solo datos, y lo que importa es cómo los interpretamos.
- Si estamos interpretando esos datos como dinero, se vuelve sin valor si no podemos acordar quién tiene qué.

**Si rompemos las reglas:**
- El consenso se rompe.
- Las mismas reglas que hacen que la gente elija el sistema y lo encuentre valioso son violadas.
- El sistema se vuelve sin valor.

**Este es un problema real**—no solo por el potencial de un actor malicioso para reescribir la historia (llegaremos a eso), sino también porque participantes honestos creando bloques válidos simultáneamente pueden causar que la red diverja y pierda sincronización.

## La Solución Elegante: Déjalos Competir

Ambos mineros demostraron que hicieron el trabajo, y no podemos elegir uno sin ser injustos.

Así que aquí está la respuesta de Bitcoin: **No elijas todavía. Déjalos competir por una ronda más. Veamos quién puede sostener su esfuerzo.**

**La regla:** Cuando dos bloques válidos aparecen al mismo tiempo, no rechaces ninguno inmediatamente. En su lugar, ve cuál se extiende primero.

**Cómo funciona:**

1. Algunos nodos aceptan el Bloque 101a, otros aceptan el Bloque 101b.
2. Los mineros empiezan a trabajar en el próximo rompecabezas (Bloque 102).
3. Algunos mineros construyen encima del Bloque 101a, otros construyen encima del Bloque 101b. Recuerda que el rompecabezas depende de los datos del bloque anterior, así que deben elegir uno sobre el cual construir.
4. Cualquier bloque que se extienda primero (tenga otro bloque construido encima) gana.

**Ejemplo:**
```
           +- Bloque 101a (Minero A) <- Minero C empieza a construir aquí
Bloque 100 -+
           +- Bloque 101b (Minero B) <- Minero D empieza a construir aquí
```

Unos minutos después, el Minero C resuelve el Bloque 102a (construyendo sobre el Bloque 101a):

```
           +- Bloque 101a -> Bloque 102a  (esta "cadena" es ahora más larga)
Bloque 100 -+
           +- Bloque 101b  (esta cadena es más corta)
```

**Ahora la decisión es clara:** la cadena con el Bloque 101a es más larga, lo cual simplemente significa que se ha puesto más esfuerzo en resolver rompecabezas para crearla. Siguiendo nuestro consenso de esfuerzo, deberíamos elegir esa.

Todos los nodos cambian a la cadena más larga, y el Bloque 101b es abandonado. El trabajo del Minero B es descartado, pero eso está bien—la decisión fue tomada jugando según el mismo consenso de esfuerzo. En el caso de Bitcoin, ese es el consenso de que cálculos hash rápidos representan una hazaña válida de esfuerzo.

Las transacciones del Bloque 101b que no fueron incluidas en el Bloque 101a vuelven al "mempool" (como una sala de espera para transacciones) y serán incluidas en bloques futuros si todavía son válidas.

Vale genial, ¡lo resolvimos! Ahora podemos seguir adelante y mantener sincronizada la base de datos incluso cuando hay empates.

¿Pero qué pasa si empatan de nuevo, y de nuevo, y de nuevo? En términos generales, ¿qué pasa si el consenso consistentemente nos da dos ganadores válidos dignos del derecho de escribir en la base de datos? ¿Qué pasa si alguien intenta engañarnos enviando bloques falsos en el futuro que parecen tener más trabajo en ellos?

Si queremos crear un sistema robusto, no podemos simplemente esperar lo mejor y asumir que esto nunca sucederá.

## ¿Por Cuánto Tiempo Seguimos Haciendo Esto?

La respuesta no es general—es específica al mecanismo de consenso que uses en tu red de base de datos basada en consenso.

Recuerda, creo que "redes blockchain" es un nombre realmente malo, así que de ahora en adelante en este libro, las llamaré redes de base de datos basadas en consenso, o simplemente redes de base de datos de consenso, o incluso solo RBDC (Red de Base de Datos Consensuada) [en inglés CDN - Consensus Database Network].

**La respuesta para el consenso de Bitcoin:**

La cadena que acumula más Proof-of-Work gana. Como el rompecabezas que los mineros están resolviendo es verdaderamente aleatorio, eventualmente una cadena se adelantará—y eso solo puede ser causado por el hecho de que esos mineros han puesto mayores cantidades de esfuerzo en ella. La cadena más larga representa el mayor esfuerzo computacional, y esa es la que todos aceptan.

**Esto se llama la "regla de la cadena más larga."**

La explicación de por qué una cadena eventualmente se adelanta ha sido simplificada aquí. Si tienes curiosidad, el whitepaper original de Satoshi Nakamoto tiene una explicación más formal de por qué esto funciona.

Cuando hay múltiples versiones competidoras de la base de datos, los nodos siguen esta regla simple: **Acepta la cadena válida más larga (iteración de consenso).**

Como ahora tenemos una nueva regla que tener en cuenta, tenemos que describirla con nuevos datos. Ahora necesitamos almacenar en nuestra base de datos no solo los saldos de las personas sino también cuántos pasos de esfuerzo se han puesto en la base de datos.

Un enfoque ingenuo sería simplemente almacenar un contador—un pequeño número de bits que cuenta cuántas iteraciones de esfuerzo (bloques) se han añadido. Pero esto es fácilmente hackeado.

¿Cómo rastreas iteraciones de una manera que nunca pueda ser falsificada? No puedes simplemente asumir que el próximo bloque válido será el Bloque 101, porque ¿qué pasa si alguien viene y dice, "Oye, encontré una base de datos válida donde nadie ha gastado doble, todas las transacciones son válidas, y dice Bloque 102"? Podría ser que alguien realmente puso más esfuerzo en la base de datos y encontró 2 bloques más mientras no estabas prestando atención.

Pero también podría ser que 2 mineros encontraron una solución válida al mismo tiempo, y uno fue honesto diciendo "el próximo bloque es 101," mientras que el otro estaba haciendo trampa diciendo "el próximo bloque es 102." Si la gente ve 102, pensarán que se puso más esfuerzo allí, y todos lo aceptarán.

El segundo minero acaba de burlar el sistema y engañó a todos haciéndoles pensar que se invirtió más esfuerzo cuando realmente no fue así.

¿Por qué pudo lograr esto? Porque no hay vínculo entre cada paso que tomamos en la base de datos—cualquiera puede simplemente afirmar lo que quiera sobre el próximo número.

Necesitamos una forma más inteligente de representar en qué iteración estamos, una forma que no pueda ser engañada. Una forma en la que nadie pueda reinventar ni el futuro ni los datos pasados de nuestra base de datos. Una forma en la que nadie pueda decir, "Estamos repentinamente en el futuro, chicos" (iteraciones más altas).

Y aquí es donde finalmente introducimos la estructura de datos blockchain—una estructura de datos que hace imposible falsificar el tiempo.

Pero antes de darte esta última pieza central del rompecabezas, déjame aclarar algo importante: Finalidad.

## Entendiendo la Finalidad

Finalidad es un término técnico que usamos para definir cuánto tiempo tiene que pasar antes de que una iteración de nuestra base de datos se considere final—significando que nunca puede ser cambiada de nuevo por nadie, nunca.

El tiempo hasta la finalidad depende del consenso que estés usando en tu red de base de datos basada en consenso. En Bitcoin, la finalidad es probabilística: cuantos más bloques se construyan encima de un bloque dado, más seguro se vuelve ese bloque.

Después de 6 bloques (aproximadamente 1 hora), la probabilidad de reescribir ese bloque se vuelve astronómicamente baja, así que para propósitos prácticos, lo consideramos final.

En otras RBDC, como Ethereum, la finalidad se logra a través de mecanismos diferentes. En el caso de Ethereum, toma aproximadamente 12-15 minutos considerar un bloque final.

Esto significa que en una RBDC, una vez que se alcanza la finalidad, nadie nunca podrá cambiar esos datos—incluso si tienen 51% del poder computacional en el caso de Bitcoin.

La propiedad de finalidad también es habilitada por la estructura de datos blockchain, y diferentes RBDC tienen diferentes tiempos de finalidad.

## Ahora, ¿Qué es una Blockchain, Realmente?

Es simplemente una forma muy inteligente de almacenar en qué iteración de este cuento interminable de escribir en nuestra base de datos común estamos—de una manera que garantiza que nadie pueda hacer trampa al respecto.

Como puedes ver, la blockchain es en realidad solo otra pieza del sistema entero que estamos construyendo. Es una pieza de ingeniería que encaja en nuestra máquina.

Imagina llamar a los automóviles "máquinas de transporte de motor de combustión." El motor es solo una pieza del sistema de transporte entero. Lo que importa es su uso, por lo que usamos la palabra "automóvil" (auto: por sí mismo, móvil: en movimiento) en lugar de "máquina de transporte de motor de combustión"—eso sería demasiado técnico y no muy útil.

El término "red blockchain" tiene un problema similar: es demasiado técnico y no muy descriptivo. La industria ha estado usando "red blockchain" durante demasiado tiempo. Como mínimo, prefiero decir: Una red blockchain es una red de base de datos basada en consenso que usa la estructura de datos blockchain para probar su historia.

Siendo honesto conmigo mismo, "red de base de datos basada en consenso" también es demasiado técnico para la mayoría de las personas. Pero al menos describe lo que estos sistemas realmente hacen, lo cual es más importante.

La gente normal entiende la palabra "datos" bastante bien—después de leer este libro, lo entiendes aún mejor. La gente también entiende "sincronización" y "descentralización". Así que aquí propongo llamar a toda esta clase de tecnología **Tecnología Datasync Descentralizada** [Decentralized Datasync Technology] en lugar de Tecnología Blockchain.

Para ser honesto, no aprenderás ninguna funcionalidad nueva de aquí en adelante en este capítulo.

La estructura de datos blockchain es solo una forma segura de almacenar el contador—y también las transiciones de datos en la historia de nuestra base de datos—de una manera evidente de manipular. Esto asegura que todos sepan en qué iteración estamos, cuál viene después, cuál vino antes, y que nadie puede hacer trampa sobre nada de eso.

Durante el resto del capítulo explicaré intuitivamente cómo funciona esto, pero este es más un tema de ciencias de la computación que uno de "entender el uso de nuevas tecnologías"—que es en lo que este libro intenta enfocarse principalmente.

Estoy intentando explicar tan pocos detalles técnicos como sea posible mientras aún te doy una verdadera comprensión de cómo funcionan estos sistemas.

---

## Opcional: Para los Curiosos (Puedes Saltarte Esto)

**Si estás más interesado en las implicaciones societarias y prácticas de las redes de base de datos basadas en consenso que en las ciencias de la computación detrás de ellas, siéntete libre de saltarte el próximo capítulo y continuar en el capítulo 13.**

El siguiente capítulo profundiza en los detalles técnicos de cómo funciona la estructura de datos blockchain—es fascinante, pero no esencial para entender el panorama general de lo que estos sistemas permiten.

Si te quedas, exploraremos estructuras de datos, memoria, punteros, listas enlazadas, y finalmente juntaremos todo para ver exactamente cómo una blockchain previene las trampas.

**-> Continúa leyendo si tienes curiosidad sobre los detalles técnicos, o salta al Capítulo 13 para el próximo gran tema.**

---

**Idea Clave:** Cuando dos mineros resuelven rompecabezas simultáneamente, no podemos elegir uno sin romper las reglas de consenso. La solución: deja que ambas cadenas compitan, y acepta la que se extienda primero (la regla de la cadena más larga). Para prevenir trampas sobre en qué iteración estamos, usamos la estructura de datos blockchain—una forma evidente de manipular de almacenar la historia. Esto permite un sistema donde el pasado no puede ser silenciosamente reescrito, y todos pueden verificar que están en la misma iteración de base de datos. Llamamos a toda esta clase de tecnología **Tecnología Datasync Descentralizada**—sistemas que sincronizan datos a través de miles de ordenadores sin control central.

A continuación, exploraremos qué permiten estos sistemas a nivel societario—cómo cambian las dinámicas de poder, permiten nuevas formas de coordinación, y por qué esto importa para el futuro. La base está completa. Ahora entendamos las implicaciones.
