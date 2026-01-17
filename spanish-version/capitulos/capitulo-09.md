# Capítulo 9: Dinero como Bits Sincronizados

*Si podemos asignar significado a los bits, ¿por qué no asignarles el significado de dinero?*

---

Ahora entiendes que la criptografía te permite crear IDs digitales desde tu casa y probar tu intención con firmas. Sabes que la información son solo bits, y los humanos asignamos significado a esos bits.

Aquí está la pregunta natural: **¿Podemos hacer que los bits signifiquen "dinero"?**

La respuesta es sí. Pero primero, entendamos qué necesita ser realmente el "dinero".

## ¿Qué Hace que Algo Sea Dinero?

A lo largo de la historia, los humanos han usado todo tipo de cosas como dinero: sal (tan valiosa que la palabra "salario" viene de ella), conchas (usadas a través de continentes durante milenios), oro y plata (pesados, pero universalmente valorados), billetes de papel (convenientes, pero solo valiosos porque estamos de acuerdo, y los impuestos), y números de cuentas bancarias digitales (solo entradas en una base de datos).

**¿Qué tienen todos estos en común?** Comparten ciertas propiedades que los hacen útiles como dinero.

### Propiedad 1: Escasez (No Puedes Crearlo Fácilmente)

Si tengo 10 unidades de dinero, no puedo tener repentinamente 11 sin ganarlo, encontrarlo con esfuerzo, o que alguien me lo dé.

**Ejemplos:**
- Oro: Difícil de minar, no puedes simplemente crear más.
- Billetes de dólar: El gobierno controla la impresión (no puedes fotocopiar y usarlo).
- Sal (históricamente): Requería esfuerzo extraerla del agua del mar.

**Contraejemplo:**
- Hojas: Demasiado abundantes, todos serían "ricos".
- Si alguien pudiera crear dinero libremente, no tendría valor.

Hay más razones filosóficas y sociológicas para justificar que para que algo sea valioso necesita ser escaso. Este libro no trata tanto sobre coordinación social sino más bien sobre la explicación de cómo se pueden usar nuevas tecnologías para ella. Por lo tanto, aquí dejo una intuición y argumento simple explicando por qué el valor debe tener algún grado de escasez:

Para que algo sea valioso necesita ser difícil de crear y escaso. El dinero es la abstracción del valor para que podamos coordinar el comercio. Si alguien pudiera simplemente recoger 100 hojas y decir "Ahora tengo poder sobre lo que tienes que hacer por mí," el sistema se desmorona. Simplemente recogeríamos hojas sin parar. Para recompensar el trabajo que realmente crea valor, no podemos simplemente dar valor a cualquier cosa que exista en abundancia accesible.

**Para que los bits sean dinero:** Necesitamos reglas que prevengan la creación descontrolada. El sistema debe hacer cumplir la escasez difícil de controlar.

### Propiedad 2: Verificabilidad (Puedes Probar Lo Que Tienes)

Si afirmo tener 10 unidades, necesito poder probártelo, y tú necesitas poder verificar que es real.

**Ejemplos:**
- Oro: Puedes pesarlo, probar su pureza.
- Billetes de dólar: Características de seguridad (marcas de agua, papel especial).
- Cuenta bancaria: Puedes comprobar tu saldo, mostrar un extracto.

**Contraejemplo:**
- Si simplemente digo "Tengo 10 unidades de valor," pero no puedo probarlo, no lo aceptarás.

**Para que los bits sean dinero:** Necesitamos una manera de comprobar los saldos. Algún registro compartido que todos puedan verificar, consultar, y preferiblemente, instantáneamente.

### Propiedad 3: Sin Doble Gasto (No Puedes Gastar el Mismo Dinero Dos Veces)

Si tengo 10 unidades y te las doy, ya no las tengo. No puedo dar también esas mismas 10 unidades a otra persona.

**Ejemplos:**
- Efectivo físico: Te doy un billete de 10€, y ya no lo tengo.
- Oro: Te doy la moneda de oro, y ahora está físicamente contigo.
- Transferencia bancaria: El banco deduce de mi cuenta, añade a la tuya.

**Contraejemplo:**
- Si pudiera gastar los mismos 10€ contigo Y con Bob, el dinero se rompe.
- Esta es la parte complicada con los archivos digitales (se pueden copiar infinitamente).

**Para que los bits sean dinero:** Cuando te los transfiero, esos bits específicos ya no deben ser "míos." El sistema debe rastrear la propiedad claramente.

### Propiedad 4: Transferibilidad (Puedes Enviarlo)

El dinero es inútil si no puedes darlo a otros a cambio de bienes, servicios, u otro dinero.

**Ejemplos:**
- Efectivo: Lo entregas, transferencia inmediata.
- Transferencia bancaria: Lo envías electrónicamente, a través del internet que ahora entendemos.
- Oro: Puedes transportarlo (aunque pesado).

**Para que los bits sean dinero:** Necesitamos un mecanismo para cambiar la propiedad. Una forma de decir "estos bits eran míos, ahora son tuyos."

### Propiedad 5: Propiedad (Realmente Lo Controlas)

Necesitas poseer verdaderamente tu dinero. No solo "tener permiso para usarlo" de otra persona.

**Ejemplos:**
- Efectivo en tu bolsillo: TÚ lo controlas físicamente.
- Oro que estás sosteniendo: TÚ lo posees.
- Cuenta bancaria: Bueno... el banco realmente lo controla (solo tienes permiso).

**El problema de la cuenta bancaria:** No posees el dinero; el banco sí. Confías en que te lo devuelvan cuando lo pidas. Pueden congelar tu cuenta, negar el acceso, o incluso quebrar. Tu "dinero" es solo su promesa hacia ti.

**Para que los bits sean dinero:** Idealmente, TÚ los controlas directamente. Como efectivo en tu bolsillo, pero digital.

### Propiedad 6: Fungibilidad (Cada Unidad es Equivalente)

Una unidad de dinero debería ser igual que cualquier otra unidad. Son intercambiables.

**Ejemplos:**
- Billetes de dólar: Cualquier billete de 10$ = cualquier otro billete de 10$.
- Oro: Una onza de oro puro = cualquier otra onza de oro puro (por peso y pureza).

**Contraejemplo:**
- Coleccionables únicos: Cada uno es diferente, no intercambiable.

**Para que los bits sean dinero:** 1 unidad de bit = 1 unidad de bit. No importa qué bits específicos tengas.

### Propiedad 7: Divisibilidad (Se Puede Dividir en Partes Más Pequeñas)

A veces necesitas pagar menos de 1 unidad completa. El dinero debería ser divisible.

**Ejemplos:**
- Dólar: Se puede dividir en centavos ($0.01).
- Oro: Se puede cortar o fundir en cantidades más pequeñas.
- Bitcoin: Divisible hasta 8 decimales (0.00000001 BTC, llamado un "satoshi").

**Para que los bits sean dinero:** Debería soportar fracciones. No solo números enteros.

### Propiedad 8: Durabilidad (No Desaparece ni se Descompone)

El dinero debería durar. Si se degrada rápidamente, no es útil para almacenar valor.

**Ejemplos:**
- Oro: No se oxida ni descompone (dura para siempre).
- Monedas: El metal perdura durante décadas.
- Billetes de papel: Se desgastan, pero duran unos años.

**Contraejemplo:**
- Comida: Se pudre, no puede usarse como dinero.

**Para que los bits sean dinero:** La información digital no se descompone (se puede copiar perfectamente), pero necesitas asegurarte de que no se pierda. Si pierdes el acceso (pierdes tu contraseña/claves), se ha ido.

## La Realización: Los Bits Pueden Tener Estas Propiedades

Mira lo que hemos aprendido hasta ahora:

**Del Capítulo 2 (Logos):** Los humanos asignamos significado a patrones de bits. Hemos asignado significado a bits como letras (ASCII), bits como imágenes (JPEG), y bits como música (MP3). ¿Por qué no bits como dinero?

**Del Capítulo 7 (Criptografía Asimétrica):** Podemos crear IDs digitales (claves públicas/privadas) y probar propiedad con firmas. Esto resuelve:
- **Propiedad:** Tu clave privada = tu control (como efectivo en tu bolsillo, digitalmente).
- **Transferibilidad:** Firma un mensaje diciendo "Envío X a Bob" y prueba la intención.

**¿Qué falta?** La parte de coordinación.

## El Problema de la Base de Datos

Piénsalo simplemente: si los bits representan dinero, ¿dónde los almacenas?

Los bits son información, y la información necesita almacenamiento. La información se almacena en bases de datos, que son en última instancia esos dispositivos físicos llamados transistores que tienen 2 estados posibles, cada uno representando un bit, como una puerta. Pero como dijimos, las puertas son transistores muy lentos y torpes. Es mejor simplemente usar ordenadores.

Así que necesitamos una base de datos—solo un ordenador almacenando información en bits—que rastree quién tiene cuánto dinero (saldos) y quién envió dinero a quién (transacciones).

**Ejemplo simple:**
```
Base de datos:
- Alice: 50 monedas
- Bob: 30 monedas
- Carol: 20 monedas

Transacción:
- Alice envía 10 monedas a Bob

Nuevo dato (estado) de la base de datos:
- Alice: 40 monedas
- Bob: 40 monedas
- Carol: 20 monedas
```

Fácil, ¿verdad?

## La Solución Tradicional: Una Base de Datos, Un Controlador

Así es como funcionan los bancos:

**La base de datos del banco:**
- Almacena el saldo de todos.
- El banco controla la base de datos.
- Cuando "envías dinero," le pides al banco que actualice la base de datos.
- El banco verifica: ¿Tiene Alice 10 monedas? ¿Sí? Vale, actualizar:
  - Restar 10 de Alice.
  - Añadir 10 a Bob.
  - ¡Hecho!

**Esto funciona.** Un punto central para mirar, para interactuar, centra-lizado. Pero nota el problema:

**Tú no controlas el dinero. El banco sí.**

El banco puede congelar tu cuenta, negar tu transacción, o quebrar (tu dinero desaparece). Debes confiar en el banco para mantener registros precisos y darte acceso cuando lo necesites.

¿Recuerdas la **Propiedad 5 (Propiedad)**? No posees verdaderamente tu dinero. Tienes un saldo en la base de datos de otra persona.

## La Idea: Distribuir la Base de Datos

Aquí está la idea: **¿Qué pasa si le damos a TODOS una copia de la base de datos?**

En lugar de un banco teniendo los registros, Alice tiene una copia de la base de datos, Bob tiene una copia, Carol tiene una copia, y miles de otras personas tienen copias también.

**Ahora:**
- Ninguna persona individual la controla (des-centralizado).
- Alice puede verificar el saldo de Bob ella misma (solo comprobar su copia).
- Nadie puede cambiar secretamente los registros (todos lo notarían).

**Esto resuelve algunos problemas:**
- **Verificabilidad:** Cualquiera puede comprobar el saldo de cualquiera.
- **Propiedad:** Ninguna entidad individual controla el acceso, solo tú y tus claves privadas.
- **Transparencia:** Todas las transacciones son visibles.

**Pero esto todavía tiene problemas...** Por ejemplo, no resuelve el problema del doble gasto por sí solo. Aún no tiene la propiedad 3.

## El Problema del Consenso

Aquí es donde se pone complicado.

Si todos tienen una copia de la base de datos, ¿cómo aseguramos que todas las copias permanezcan sincronizadas a medida que los datos cambian con el tiempo? Como los bits en nuestra base de datos están siendo interpretados como dinero, podemos reformular esto: ¿cómo aseguramos que todas las copias permanezcan sincronizadas a medida que el dinero se transfiere entre personas?

**Problema 1: Actualizaciones conflictivas**
```
Alice envía 10 monedas a Bob (transacción firmada)
Bob la recibe, actualiza su base de datos: Alice: 10, Bob: 40

Al mismo tiempo, Carol recibe una transacción diferente:
Alice envía 10 monedas a Carol (también firmada por Alice)

Base de datos de Bob: Alice: 0, Bob: 40, Carol: 20
Base de datos de Carol: Alice: 0, Bob: 30, Carol: 30

¿Cuál es correcta? Ambas tienen firmas válidas, y en ambas Alice tenía 10 monedas para gastar cuando se recibió la transacción.
```

¿Cómo prevenimos esto? ¿Quién decide qué transacción es válida? Ambas no pueden ser válidas, porque Alice estaría gastando doblemente sus 10 monedas.

Puedes decir, envíala primero a Bob y luego a Carol, pero ¿qué pasa si los mensajes llegan al mismo tiempo? Recuerda que estamos en internet—es como el salvaje oeste digital, sin autoridad central para decidir quién puede escribir primero o recibir el mensaje primero.

Bueno, entonces ¿creamos un consenso de siempre enviar los mensajes en ese orden y no tendremos problemas? Podría funcionar para 3 personas que confían entre sí, pero para miles de personas que no deberían necesitar confiar entre sí, ¿cómo aseguramos que todos estén de acuerdo en el mismo orden de transacciones?

```
1000 ordenadores todos tienen la base de datos
Alice firma: "Envío 10 a Bob"
¿Quién puede añadir esto a la base de datos?
¿Añaden los 1000 ordenadores al exactamente mismo tiempo?
¿Qué pasa si alguien añade transacciones falsas? ¿Qué pasa si Alice intenta confundir a la red que sostiene la base de datos para que algunos obtengan versiones conflictivas y ella consiga más dinero?
```

**Problema 2: Latencia (Retrasos por Distancia)**

Incluso si todos son honestos, la distancia física crea problemas de sincronización.

Imagina que Alice vive a 1km de Bob, y Carol vive a 10,000km de ambos. Carol le pagará a Alice 5 monedas, y Alice quiere comprar algo de Bob por 10 monedas. Alice solo tiene 8 monedas, así que no puede comprarlo todavía. Pero entonces Carol le envía 5 monedas, dando a Alice suficiente para comprarle a Bob.

```
                        Carol
                          *
                         /|
                        / |
                       /  |
                      /   |
                     /    |
                    /     |
                   /      |
                  /       |
                 /        |
                /         |
               /          |
              /           |
   ~10,000km /           /  ~10,000km
            /           /
           /           /
          /           /
         /           /
        /           /
       /           /
      /           /
     /           /
    /           /
   /  1km      /
  *-----------*
Alice      Bob
```

Alice intenta hacer transacción con Bob, pero la información—incluso si viaja a la velocidad de la electricidad—tarda tiempo en cruzar el mundo entero, y podría haber retrasos. Bob podría rechazar la transacción de Alice porque en su base de datos Alice solo tiene 8 monedas. Pero en la base de datos de Alice, porque ella tiene una mejor conexión de internet, la transacción de Carol ya llegó y ella cree que ya tiene 8+5=13 monedas.

¿Quién tiene razón? Ambos son honestos, ambos están siguiendo las reglas, pero sus bases de datos están temporalmente desincronizadas debido a la latencia.

Como puedes ver, ya sea por malicia e intentar gastar doble, o simplemente por la naturaleza de coordinar físicamente información a través de distancias, distribuir una base de datos compartida es un problema muy difícil.

Estas son las preguntas fundamentales:

## Las Preguntas Que Necesitamos Responder

1. **¿Cómo te aseguras de que TODOS los ordenadores guarden los mismos saldos?**
   - Si todos tienen una copia, todos necesitan estar de acuerdo.
   - ¿Cómo sincronizamos miles de bases de datos?

2. **¿Cómo te aseguras de que nadie transfiera o cree dinero sin permiso?**
   - Tenemos firmas (bien), pero ¿cómo haces cumplir que los participantes de la red las verifiquen?
   - ¿Qué pasa si alguien intenta gastar dinero que no tiene?
   - ¿Qué pasa si alguien intenta gastar el mismo dinero dos veces?

3. **¿Cómo alcanzas consenso sobre cómo y con qué límites escribir en esta base de datos compartida?**
   - ¿Quién puede añadir nuevas transacciones?
   - ¿Con qué frecuencia realizamos actualizaciones?
   - ¿Qué reglas deben seguir todos?
   - ¿Cómo hacemos cumplir esas reglas sin una autoridad central?

**Este es el problema del consenso.**

Y resolver este problema—permitir que miles de extraños mantengan una base de datos idéntica sin confiar en ninguna autoridad única—es lo que hace posible Bitcoin y otras criptomonedas. Es, como puedes ver, un problema muy difícil.

## Hablando Históricamente

Durante miles de años, los humanos usaron objetos físicos como dinero. La sal era valiosa porque preservaba la comida (esencial para la supervivencia). Las conchas eran raras, hermosas, y difíciles de falsificar. El oro era escaso, no se descomponía, tenía valor universalmente acordado, y era divisible. El papel era conveniente pero requería confiar en el emisor (gobierno y banco). Cada era encontró algo que funcionaba para la tecnología y los modelos de confianza de la época.

**El dinero físico** tenía escasez incorporada (difícil de crear) y propiedad (posesión = propiedad).

**El dinero digital** con bancos funcionó confiando en una autoridad central para mantener la contabilidad y mantener el valor del dinero estable.

**Pero bits sincronizados de forma consensuada**—distribuidos a través de miles de ordenadores, sin autoridad central, donde TÚ controlas tu dinero con claves criptográficas—esto es nuevo.

Solo es posible porque Satoshi (quienquiera que sea él, ella, o ellos) introdujo el primer **mecanismo de consenso descentralizado y práctico para dinero digital**—a menudo llamado *consenso Nakamoto*. Esto resolvió el problema del doble gasto en una red abierta combinando proof-of-work, selección de cadena más larga, e incentivos económicos. No es *la* solución final para toda la investigación de consenso (ese es un campo más amplio con muchas variantes), pero fue el avance que hizo funcionar Bitcoin.

---

**Idea Clave:** El dinero es solo información que acordamos que tiene valor. Los bits pueden representar dinero si tienen las propiedades correctas: escasez, verificabilidad, sin doble gasto, transferibilidad, propiedad, fungibilidad, divisibilidad, y durabilidad. Podemos almacenar esta información en una base de datos y distribuir copias a miles de ordenadores. Pero para que funcione, necesitamos resolver un problema difícil: ¿Cómo acuerdan miles de extraños el mismo estado de base de datos (datos) sin confiar en ninguna autoridad central? Ese es el problema del consenso—y eso es lo que exploraremos a continuación.

Por cierto, cuando digo estado significa lo mismo que los datos actuales en una base de datos, la información actual que la base de datos contiene.

A continuación, veremos cómo los **mecanismos de consenso** resuelven estos problemas. Entenderemos Proof-of-Work, mining (minería), y por qué la estructura blockchain hace que la historia sea evidente de manipular. Las piezas están uniéndose.
