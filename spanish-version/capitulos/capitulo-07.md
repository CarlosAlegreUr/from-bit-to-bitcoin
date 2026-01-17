# Capítulo 7: Cifrado Asimétrico - El Truco Mágico y Cómo Crean Monederos Cripto

*Dos claves en lugar de una: una clave pública que todos pueden ver y una clave privada que solo tú conoces.*

---

Hemos establecido el problema con el cifrado simétrico: Alice y Bob necesitan compartir una contraseña antes de poder comunicarse de forma segura, pero compartir esa contraseña requiere... un canal seguro. Lo cual requiere una contraseña. Bucle infinito.

**Durante siglos, esto parecía imposible de resolver.**

Entonces, en los años 1970, los matemáticos descubrieron algo notable—un tipo de función matemática con propiedades muy especiales que parecía casi mágica: **fácil de calcular en una dirección, pero extremadamente difícil de revertir.**

Este avance se llama **cifrado asimétrico**, y lo cambió todo.

## La Función Unidireccional

Empecemos con el concepto central: una **función unidireccional**.

Recuerda del Capítulo 6, hablamos sobre funciones:

```
f(x) = x + 2

Si x = 3, entonces f(3) = 3 + 2 = 5
```

Esta es una función fácil. Si conoces la salida (5) y la función usada para calcularla, puedes fácilmente descifrar la entrada (3). Simplemente resta 2, una sola operación, sumar 2, que tiene una operación inversa simple, restar 2.

```
Desafío:

Bob usó f(x) = x + 2 para cifrar un mensaje.
El resultado de cifrar el mensaje fue 5.
¿Cuál era el mensaje original?

Sabemos entonces que:
x + 2 = 5

Lo cual con matemáticas simples podemos resolver:
x = 5 - 2
x = 3

Respuesta:
Salida = 5
Entrada/Mensaje enviado = 3
```

**Revertir esta función es muy fácil. Para humanos y para ordenadores.**

¿Pero qué pasa si tuviéramos una función que fuera fácil de calcular hacia adelante (entrada a salida) pero extremadamente difícil de revertir (salida a entrada)? Y no solo queremos decir "difícil" como "toma unos segundos"—queremos decir "difícil" como **"tomaría a todos los ordenadores en la Tierra miles de millones de años revertirla."**

¿Existe tal función?

**Sí**. Muchas de ellas, en realidad. Son la base de la criptografía moderna.

## Un Ejemplo Para los Curiosos: Multiplicación de Números Primos

Aquí hay un ejemplo intuitivo. Si te sientes confundido, no te preocupes demasiado:

**Dirección fácil: Multiplicar dos números primos**

```
Toma dos números primos: 89 y 97
Multiplícalos: 89 × 97 = 8,633

Esto es fácil. Un ordenador hace esto instantáneamente.
```

**Dirección difícil: Descifrar los números primos originales**

```
Dado: 8,633
Pregunta: ¿Qué dos números primos se multiplican para dar 8,633?

Esto es mucho más difícil. Tendrías que probar dividir por cada número primo
hasta que encuentres los números originales.
```

Ahora imagina usar **números primos realmente, realmente grandes**:

```
p = 32,416,190,071 (primo de 11 dígitos)
q = 32,416,187,567 (primo de 11 dígitos)

p × q = 1,050,807,929,418,200,854,057

¡Buena suerte revirtiendo eso sin conocer p y q!
Incluso los ordenadores tardan mucho en adivinar y comprobar todas las combinaciones posibles.
```

**Con primos muy grandes** (por ejemplo, primos de 617 dígitos usados en claves RSA de 2048 bits comúnmente usadas en muchos sistemas tradicionales), **descifrar los números originales se vuelve esencialmente imposible con la tecnología actual.** Incluso los superordenadores más rápidos tardarían más que la edad del universo en encontrar tales números.

**Nota importante:** Bitcoin no usa realmente RSA o factorización de grandes primos. Bitcoin usa **criptografía de curva elíptica (específicamente secp256k1)**, que se basa en números de 256 bits (aproximadamente 77 dígitos decimales)—un tipo diferente de función unidireccional basada en matemáticas de curva elíptica en lugar de factorización de primos. Tanto RSA como la criptografía de curva elíptica proporcionan seguridad fuerte a través de diferentes problemas matemáticos que son fáciles en una dirección pero difíciles de revertir.

Esta asimetría—fácil de calcular, difícil de revertir—es la base de todo cifrado asimétrico, ya sea basado en factorización de primos (RSA) o curvas elípticas (Bitcoin).

**¿Por qué números primos?** Porque estos números solo pueden dividirse por sí mismos y 1, dejando 0 como resto. Esta propiedad es lo que hace que la multiplicación sea fácil pero la operación inversa difícil. No te preocupes demasiado por los detalles matemáticos—si te sientes confundido sobre lo de los números primos, tómate tu tiempo si quieres, pero esto no es esencial. Simplemente puedes aceptar que hay algunas funciones matemáticas que son fáciles de calcular en una dirección pero difíciles de revertir.

## Las Dos Claves: Pública y Privada

Aquí es donde se pone brillante.

**Paso 1: Crear las claves (hecho localmente en tu ordenador)**

Cualquiera puede generar un par de claves pública/privada usando algoritmos ampliamente disponibles (como RSA, ECC, etc). Los algoritmos son conocimiento público de la misma manera que cualquiera puede describir y calcular la función `f(x) = x + 2`—solo necesitas un ordenador para calcularlos rápidamente.

Ejecutas el cálculo en tu ordenador:
```
cálculo_generar_claves() => (clave_privada, clave_pública)
```

El cálculo tiene esa propiedad fácil-solo-una-dirección que discutimos: calcular una clave pública desde una clave privada (`f(Clave privada) -> Clave pública`) es la dirección fácil que cualquiera puede calcular, mientras que el reverso (`f(Clave pública) -> Clave privada`) es la dirección difícil—matemáticamente incalculable con la tecnología actual.

Así que, puedes calcular una clave pública que está matemáticamente y únicamente asociada con tu clave privada, pero nadie puede descifrar tu clave privada desde tu clave pública incluso si conocen el algoritmo (función matemática) que usaste para calcularla/computarla.

**Paso 2: Compartir la clave pública**

Ahora compartes tu clave pública con todos. Publícala en línea, envíala en correos, publícala en una base de datos. No importa quién la vea.

**La configuración:**

En lugar de una clave compartida (como el cifrado simétrico), el cifrado asimétrico usa **dos claves diferentes**:

1. **Clave pública** - Compartes esta con todos. Publícala en internet. Grítala desde los tejados. No importa quién la vea. (Lo mismo que haces con una dirección cripto)

2. **Clave privada** - Mantienes esta en secreto. Nunca la compartas con nadie. Nunca. (Lo mismo que haces con la clave privada del monedero cripto, esa secuencia de 12 o 24 palabras de la que habrás oído hablar)

**La magia:** Estas dos claves están matemáticamente relacionadas a través de una función unidireccional.

- Puedes **derivar** la clave pública desde la clave privada (dirección fácil)
- **No puedes** derivar la clave privada desde la clave pública (dirección difícil, que puede crear propiedades de anonimato, seguridad, e incluso identificación si se diseña para esos propósitos)

## Cómo Funciona

Así es como funciona la comunicación en el reino digital:

```
Lenguaje estándar         Lenguaje personal cifrado
  |                           |
  | --- Cifrar mensaje ----> |
  |     (usando clave pública)|
  |                           |
  | <--- Descifrar mensaje -- |
  |     (usando clave privada)|
  |                           |
```

Si alguien quiere hablar con Bob y solo con Bob, cifran su mensaje con la clave pública de Bob. Una vez cifrado, solo Bob puede descifrarlo con su clave privada. Incluso si alguien intercepta el mensaje, no pueden leerlo sin la clave privada de Bob.

Y si Bob quiere comunicarse con cualquier otra persona, puede buscar la clave pública de esa persona y usarla para cifrar su mensaje. Solo esa persona puede descifrarlo con su clave privada.

Solo como un pequeño recordatorio, puedes pensar en el cifrado como traducir de un idioma a otro, como del español a un idioma secreto inventado pero consistente.

Imagina que hay una base de datos pública con las claves públicas de todos. En la práctica no es exactamente así, pero imagínalo—puedes simplemente buscarla y enviar un mensaje privado a cualquiera sin tener que conocerlos o compartir un secreto de antemano.

**Ejemplo: Alice y Bob enamorándose**

Alice quiere decir "TE AMO, ALICE" a Bob, así que busca la clave pública de Bob y calcula:

```
f("TE AMO, ALICE", clave pública de Bob) = Mensaje cifrado
```

Bob recibe el mensaje cifrado:

```
f_inversa(Mensaje cifrado, clave privada de Bob) = "TE AMO, ALICE"
```

Ahora Bob quiere decir "YO TAMBIÉN TE AMO, BOB". Busca la clave pública de Alice y calcula:

```
f("YO TAMBIÉN TE AMO, BOB", clave pública de Alice) = Mensaje cifrado
```

Alice recibe el mensaje cifrado:

```
f_inversa(Mensaje cifrado, clave privada de Alice) = "YO TAMBIÉN TE AMO, BOB"
```

**Si Carol intercepta los mensajes cifrados:**
- Ve el galimatías cifrado
- Podría incluso conocer la clave pública de Bob
- Pero **no puede** descifrar el mensaje sin la clave privada de Bob
- Y la clave privada de Bob es matemáticamente imposible de derivar desde su clave pública

**Esto resuelve el problema de compartir contraseñas.**

Alice y Bob nunca tuvieron que conocerse. Nunca tuvieron que compartir un secreto. Bob simplemente publicó su clave pública, y Alice la usó para enviarle un mensaje seguro—todo a través de una red pública donde Carol está mirando todo.

## La Magia Real: Cifrado RSA

El algoritmo de cifrado asimétrico más famoso es **RSA** (nombrado por sus inventores: Rivest, Shamir, y Adleman), que fue inventado en **1977** y publicado en **1978**.

Para los curiosos que quieran profundizar en cómo funciona RSA matemáticamente, hay muchos recursos en línea. Pero para nuestros propósitos, solo debes saber que es un algoritmo ampliamente usado que implementa la propiedad de función unidireccional de la que hemos estado hablando.

Y para los curiosos que quieran saber cómo exactamente publicas tu clave pública en la práctica, usualmente se hace a través de **Infraestructura de Clave Pública (PKI)** o **certificados digitales** (como los certificados SSL/TLS para sitios web). Para Bitcoin específicamente, tu clave pública está relacionada inequívocamente con tu dirección de Bitcoin y se revela a toda la red cuando haces tu primera transacción.

## Por Qué Esto Importa para Bitcoin

Bitcoin no cifra transacciones (son públicas en la blockchain). Lo que esto significa es que todos pueden ver que Bob quiere enviar X bitcoin a Alice, por ejemplo.

Pero Bitcoin usa criptografía asimétrica para algo incluso más importante—probar que Bob es quien quiere enviar la transacción y probar que solo Alice las recibirá: **Probar propiedad sin revelar secretos.**

Recuerda del Capítulo 6, tu monedero de Bitcoin es esencialmente una clave privada. Pero ahora entendamos el panorama completo:

**La jerarquía:**

```
Clave Privada (número secreto que generas)
    | (función unidireccional)
    v
Clave Pública (derivada de la clave privada, puede compartirse)
    | (otra función unidireccional)
    v
Dirección de Bitcoin (donde la gente te envía Bitcoin)
```

Desglosemos esto:

- Tu **monedero de Bitcoin** es una **clave privada** (un número secreto muy grande)

- Tu **clave pública** se deriva de tu clave privada usando una función unidireccional específica, como RSA.

- Tu **dirección de Bitcoin** (esa larga cadena de letras y números que representa tu monedero y a la cual la gente envía dinero) se calcula desde tu **clave pública** usando otra función unidireccional. Esta usualmente es una función llamada función hash.

**¿Por qué este enfoque por capas?**

La dirección del monedero no es la clave pública en sí, sino que se deriva de ella. Esto crea propiedades interesantes como:

- Revela menos información sobre tu clave pública, lo cual, aunque nada malo puede pasar si alguien la descifra, es una mejor práctica de ciberseguridad simplemente revelar tan poca información como sea necesario. Los detalles sobre esto son innecesariamente técnicos y más allá del alcance de este libro. Como siempre, si tienes curiosidad, investiga.

- La dirección resultante es más corta y más fácil de compartir que toda la clave pública.

Ejemplo:

```
Clave pública: 04b0bd634234abdc04b0bd634234abdc04b0bd634234abdc... y más
Dirección de Bitcoin: 1A1zP1eP5QGefi2DMPT (más pequeña y también única)

[estos números fueron inventados, es solo una representación visual]
```

Si esto representa un número, ¿por qué veo letras? Porque esto está escrito en formato hexadecimal.

Los humanos usamos el formato decimal, basado en 10 dígitos (0-9). Los ordenadores a menudo usan formato binario (basado en 2 dígitos: 0 y 1). El formato hexadecimal está basado en 16 dígitos. Pero solo tenemos 10 símbolos de dígitos (0-9), así que empezamos a usar letras cuando se nos acaban:

```
SÍMBOLOS ÚNICOS
Decimal:      0 1 2 3 4 5 6 7 8 9
Binario:      0 1
Hexadecimal:  0 1 2 3 4 5 6 7 8 9 A B C D E F
```

Si realmente no entiendes esto, no te preocupes. Solo piensa que esas letras, de alguna manera, también representan números.

Cuando gastas Bitcoin, creas una **firma digital** usando tu clave privada para señalar que autorizas la transacción. La única parte "digital" de ello es que se hace en un ordenador, pero un término más preciso sería "firma matemática."

**La firma prueba:**
1. Posees el Bitcoin (posees la clave privada)
2. Autorizaste la transacción, solo si el punto número 1 es verdadero y eres el único que tiene la clave privada, aquí es donde entra la responsabilidad personal.
3. La transacción no ha sido manipulada. Esto no depende de ti, esta es una propiedad matemática.

**La magia:**
- Cualquiera puede verificar tu firma usando tu clave pública
- Pero solo tú puedes crear la firma (requiere tu clave privada)
- Y nadie puede descifrar tu clave privada desde tu clave pública

```
El Mundo                         Ordenador de Bob
  |                                     |
  |                                     | firmar("Envío 5 BTC a Alice")
  |                                     | [usando clave privada]
  |                                     |
  |     (      Mensaje enviado     )    |
  | <---( "Envío 5 BTC a Alice",   )--- |
  |     (    salida de firmar      )    |
  |                                     |
  |                                     |
```

Según la imagen anterior, ahora El Mundo tiene 2 cosas:
1. El mensaje: "Envío 5 BTC a Alice"
2. La salida de firmar (la firma) ese mensaje con la clave privada de Bob

Si quieren asegurarse de que solo Bob pudo haber creado ese mensaje, pueden usar la clave pública de Bob para verificar la firma.

Si Bob creó el mensaje, entonces usar las "matemáticas inversas" para firmar debería dar el mensaje. Esto significa:

```
f_inversa(salida de firmar, clave pública de Bob) = "Envío 5 BTC a Alice"
```

Así que el mundo puede simplemente hacer las matemáticas inversas, y si el mensaje coincide, solo puede significar una cosa: este mensaje fue producido por alguien que tiene la clave privada de Bob, que es solo Bob.

El proceso ha sido ligeramente simplificado, el proceso de verificación de la firma es un poco más complejo pero este modelo mental funciona para los intentos y propósitos de este libro. En realidad la función se ve más así:

```
f_verificar(firma, clave pública, mensaje original) = Verdadero/Falso
```

Esto es **criptografía asimétrica al revés**: en lugar de cifrar mensajes, estás firmando mensajes y enviando la firma con ellos. En lugar de "solo Bob puede descifrar," es "solo Alice pudo haber firmado esto, y todos pueden verificarlo, porque las matemáticas son públicas—todos conocen RSA por ejemplo."

Exploraremos las firmas digitales en profundidad en el próximo capítulo. Entender la diferencia entre cripto-firmas y cripto-transacciones es crucial para operar con criptomonedas de forma segura.

## Propiedades Interesantes

Resumamos lo que hemos aprendido:

- Cualquiera puede generar un par de claves pública/privada usando algoritmos ampliamente disponibles (como RSA, ECC, etc)
- Los algoritmos son conocimiento público; solo necesitas un ordenador/móvil para calcularlos
- Puedes compartir tu clave pública con cualquiera, y tu dirección de monedero cripto también. Es mejor si solo compartes la dirección del monedero, pero compartir la clave pública también es seguro—nadie te robará dinero solo con eso
- El mundo puede usar tu clave pública para enviarte mensajes cifrados o verificar tus firmas digitales
- Pero solo tú puedes descifrar esos mensajes o crear firmas, porque solo tú tienes la clave privada

## Lo Que Hemos Resuelto

Revisemos lo que nos permite el cifrado asimétrico: la generación de contraseñas únicas y globalmente válidas, comunicación segura sobre canales públicos, y probar identidad sin revelar secretos.

Estas propiedades permitieron cosas como:
- Banca en línea segura
- Comercio electrónico
- Mensajería cifrada agnóstica a la distancia
- **Y monederos de criptomonedas**

Todo porque hemos descubierto una manera de crear IDs caseros. Un gran número único imposible de adivinar asociado con otro que puedes compartir, y que cualquiera puede verificar que solo tú creaste ese número compartido, asociando a su creador con él. O en otras palabras, identificando a su creador anónimo con él. Todo asegurado gracias a matemáticas que usan la propiedad fácil-de-calcular-solo-una-dirección.

## Resumen

Si incluso con este nivel de simplificación esto todavía es difícil de captar, no te preocupes, es normal. Estoy intentando explicar cosas para que te sientas más seguro porque entiendes las dinámicas hasta cierto punto. Si esto todavía se siente demasiado complejo, simplemente recuerda una cosa simple:

- EN GENERAL, NUNCA COMPARTAS TU CLAVE PRIVADA CON NADIE.
- NO TU CLAVE PRIVADA, NO TUS MONEDAS.
- SI COMPARTES, ESTÁS CONCEDIENDO ACCESO A ELLAS. ASEGÚRATE DE QUE SEA SOLO CON PERSONAS EN QUIENES CONFÍAS 101%.

---

**Idea Clave:** El cifrado asimétrico usa dos claves en lugar de una. Una clave pública (compartida con todos) y una clave privada (mantenida en secreto). Los mensajes cifrados con la clave pública solo pueden descifrarse con la clave privada. Las claves están matemáticamente relacionadas a través de funciones unidireccionales—fáciles de calcular hacia adelante, esencialmente imposibles de revertir. Esto resuelve el problema de compartir claves: extraños pueden comunicarse de forma segura sin conocerse nunca o pre-compartir secretos.

Ahora que entiendes la criptografía asimétrica—la base matemática de los monederos de criptomonedas y la comunicación segura por internet—hay una pregunta importante que necesitamos abordar: **"¿No romperán los ordenadores cuánticos todo esto?"** Esta es una de las preocupaciones más comunes sobre las criptomonedas. En el próximo capítulo, exploraremos brevemente qué es realmente la computación cuántica, qué puede y no puede romper, y por qué esto no es un escenario apocalíptico para las cripto como algunos imaginan.
