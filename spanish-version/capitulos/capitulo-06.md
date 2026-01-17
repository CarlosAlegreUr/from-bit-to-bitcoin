# Capítulo 6: Cifrado Simétrico - Secretos Compartidos

*Como una cerradura y una llave—pero ambas partes necesitan la misma llave.*

---

Hemos establecido el problema: Alice quiere enviar a Bob un mensaje secreto, pero Carol está escuchando en la red. ¿Cómo pueden comunicarse en privado?

La respuesta empieza simple: **revuelve el mensaje para que solo Bob pueda descifrarlo.**

Esto se llama **cifrado**, y la forma más simple se llama **cifrado simétrico**—donde ambas partes comparten el mismo secreto.

## El Cifrado César

Empecemos con uno de los métodos de cifrado más antiguos: el cifrado César, nombrado así por Julio César quien lo usó para enviar mensajes militares hace más de **2,000 años** (Julio César vivió del 100 a.C. al 44 a.C., haciéndolo aproximadamente hace 2,050 años).

La idea es hermosamente simple: **desplaza cada letra por un número fijo.**

**Ejemplo: Desplazar por 3**

```
Alfabeto original:    A B C D E F G H I J K L M N Ñ O P Q R S T U V W X Y Z
Desplazado izq. por 1: B C D E F G H I J K L M N Ñ O P Q R S T U V W X Y Z A
Desplazado izq. por 2: C D E F G H I J K L M N Ñ O P Q R S T U V W X Y Z A B
Desplazado izq. por 3: D E F G H I J K L M N Ñ O P Q R S T U V W X Y Z A B C
```

Ahora codifica un mensaje:

```
Alfabeto original:    A B C D E F G H I J K L M N Ñ O P Q R S T U V W X Y Z
                              ↓     ↓       ↓     ↓
Desplazado por 3:     D E F G H I J K L M N Ñ O P Q R S T U V W X Y Z A B C

Mensaje original:  HELLO
H → K
E → H
L → O
L → O
O → R

Mensaje cifrado: KHOOR
```

Alice envía "KHOOR" a través de la red. Carol lo intercepta pero solo ve "KHOOR"—no tiene idea de lo que significa.

Bob recibe "KHOOR" y desplaza en la dirección opuesta, de vuelta por 3:

```
Alfabeto desplazado:  D E F G H I J K L M N Ñ O P Q R S T U V W X Y Z A B C
                              ↓     ↓       ↓     ↓
Alfabeto original:    A B C D E F G H I J K L M N Ñ O P Q R S T U V W X Y Z

Mensaje cifrado: KHOOR
K → H
H → E
O → L
O → L
R → O

Mensaje descifrado: HELLO
```

**Esto es cifrado.** El mensaje se revuelve usando una regla (en este caso, desplazar 3 posiciones a la derecha en la posición de la letra en el alfabeto), y solo alguien que conoce la regla puede descifrarlo.

La "regla" se llama la **clave**. En este caso, la clave es "3" (la cantidad de desplazamiento). También puedes pensar en la clave como una contraseña que tanto Alice como Bob conocen.

## El Principio de la Contraseña

El cifrado moderno funciona con el mismo principio, solo que con matemáticas mucho más complejas. En lugar de desplazar letras, los ordenadores usan funciones matemáticas que revuelven bits de formas que son extremadamente difíciles de revertir sin la clave.

Piénsalo así:

```
f(x) → significa una función matemática

Como, por ejemplo: f(x) = x + 2
Probablemente has visto esto en el instituto.

x puede ser cualquier número. Algunas funciones incluso tienen 2 entradas:
f(x, y) = x + y + 2

Eliges los valores de x e y (entrada, información inicial),
los introduces en la función, y obtienes una salida (información final).

Si elegiste x = 3 e y = 5:
f(3, 5) = 3 + 5 + 2 = 10

Bueno, también puedes pensar en el cifrado así:
f(mensaje, contraseña) = mensaje_revuelto
```

**Cifrado:** Alice toma su mensaje y una contraseña, los ejecuta a través de una función, y obtiene galimatías revuelto.

**Descifrado:** Bob toma el mensaje revuelto y la misma contraseña, los ejecuta a través de la función inversa, y recupera el mensaje original.

La función inversa es la función que hace lo "opuesto." Si sumas uno, el inverso es restar uno. Multiplicar por 3, entonces el inverso es dividir por 3.

**Ejemplo:**

```
Mensaje: "La contraseña es banana123"
Contraseña: "secret42"

Función de cifrado compleja:
f("La contraseña es banana123", "secret42") = "8x!mQ2$pL9@vN..."

Función de descifrado compleja:
f_inversa("8x!mQ2$pL9@vN...", "secret42") = "La contraseña es banana123"
```

Carol intercepta "8x!mQ2$pL9@vN..." pero sin conocer la contraseña ("secret42"), no puede descifrarlo. Es solo ruido de aspecto aleatorio para ella.

**Esto es cifrado simétrico:** Tanto Alice como Bob usan la misma clave secreta (contraseña) para cifrar y descifrar.

Pero aquí está el problema: si Carol conociera la función que usas—las operaciones matemáticas involucradas—podría potencialmente romper el cifrado simplemente adivinando contraseñas. Es fácil ver por qué con el cifrado César, porque solo hay 25 desplazamientos posibles. Así que si Carol sabe que estás usando un cifrado César, puede simplemente intentar desplazar por 1. ¿Todavía no tiene sentido? Vale, desplazar por 2. ¿Aún nada? Intenta desplazar por 3... ¡BINGO! Tiene sentido. Con solo 25 posibilidades, un ordenador puede probar todas ellas muy, muy rápidamente.

## Por Qué se Llama "Simétrico"

El nombre viene del hecho de que la misma clave funciona en ambas direcciones:

```
Lenguaje estándar       Lenguaje cifrado
  |                           |
  | --- Cifrar mensaje --->   |
  |     (usando clave X)      |
  |                           |
  | <--- Descifrar mensaje -- |
  |     (usando clave X)      |
  |                           |
```

Como una cerradura física y una llave:
- Alice cierra la caja con la clave X
- Bob abre la caja con la misma clave X
- Ambas partes necesitan exactamente la misma clave

Esto es diferente del **cifrado asimétrico** (que cubriremos a continuación), donde Alice y Bob usan claves diferentes:

```
Lenguaje estándar       Lenguaje cifrado
  |                           |
  | --- Cifrar mensaje --->   |
  |     (usando clave X)      |
  |                           |
  | <--- Descifrar mensaje -- |
  |     (usando clave Y)      |
  |                           |
```

Pero eso es para después.

## Cifrado Simétrico Moderno

El cifrado César es fácil de romper—solo hay 25 desplazamientos posibles, así que Carol podría probarlos todos en segundos.

El cifrado simétrico moderno usa algoritmos mucho más sofisticados que hacen mucho más que simplemente desplazar caracteres. Un algoritmo famoso y ampliamente usado es:

**AES (Advanced Encryption Standard - Estándar de Cifrado Avanzado):**
- Usado en todas partes: aplicaciones bancarias, sitios web HTTPS, archivos cifrados
- En lugar de desplazar letras, revuelve bits usando operaciones matemáticas complejas

**El punto:** Con una contraseña fuerte, el cifrado simétrico es virtualmente imposible de romper por fuerza bruta. El cifrado César necesita solo 25 cálculos para descifrar, pero con contraseñas suficientemente largas y una secuencia de operaciones suficientemente complejas, tomaría miles de millones de años para que incluso los ordenadores más rápidos prueben todas las contraseñas posibles (claves).

Así que el cifrado simétrico realmente se usa en redes, pero de formas complejas y técnicas diferentes que realmente no necesitas entender aquí. Para los frikis o curiosos, investiguen TLS (Transport Layer Security - Seguridad de Capa de Transporte) y cómo usa cifrado simétrico para transferencia rápida de datos después de establecer una conexión segura. Para la gente normal leyendo esto, simplemente continúen leyendo.

## La Falla Fatal

Entonces hemos resuelto el problema, ¿verdad? ¡Alice y Bob ahora pueden comunicarse de forma segura!

No del todo. Hay un problema masivo: **¿Cómo acuerdan Alice y Bob la contraseña en primer lugar?**

Piénsalo:

```
Alice quiere enviar a Bob un mensaje cifrado.

Pero primero, necesitan acordar una contraseña.

¿Cómo le dice Alice a Bob la contraseña?

Si la envía por Internet... ¡Carol la intercepta!

Ahora Carol conoce la contraseña y puede descifrar todo.
```

**Este es el problema del huevo y la gallina del cifrado simétrico:**

- Tienes matemáticas muy bonitas que permiten enviar mensajes cifrados, pero necesitas una contraseña compartida
- Para compartir la contraseña a largas distancias, necesitas... un canal cifrado
- Pero para tener un canal cifrado, necesitas una contraseña compartida
- Pero para compartir la contraseña... (bucle infinito)

Nota que a cortas distancias Alice puede simplemente encontrarse con Bob en persona y darle la contraseña, pero esto no es práctico en el Internet donde las distancias podrían abarcar continentes.

## Las Relaciones a Larga Distancia No Funcionaban

A lo largo de la historia, la gente resolvió esto encontrándose en persona:

**Espías:** Dos agentes se encuentran en un callejón oscuro, intercambian libros de códigos cara a cara, luego se comunican de forma segura vía radio.

**Militar:** Los soldados reciben libros de códigos antes del despliegue. Si el enemigo captura un libro de códigos, todas las comunicaciones están comprometidas.

**Banca:** Vas al banco en persona, te dan un PIN, luego puedes usar cajeros automáticos y banca en línea.

El patrón: **Secretos pre-compartidos.** Alice y Bob se encuentran en un lugar seguro de antemano y acuerdan una contraseña. Luego pueden comunicarse remotamente usando esa contraseña.

**Pero esto no escala al Internet.**

No puedes volar a las oficinas centrales de Amazon para intercambiar una contraseña antes de comprar en línea. No puedes encontrarte cara a cara con tu banco antes de usar su sitio web. No puedes visitar físicamente los servidores de Instagram para configurar el cifrado.

El Internet conecta extraños que nunca se han conocido y nunca se conocerán. ¿Cómo pueden establecer un secreto compartido sobre un canal público donde los atacantes están escuchando?

**Durante siglos, esto parecía imposible.**

Cada método de cifrado requería secretos pre-compartidos, y pre-compartir secretos requiere un canal seguro. Pero, ¿cómo creas un canal seguro sin tener ya un secreto compartido?

Parecía una imposibilidad lógica—como pedirle a alguien que abra una puerta cuando la llave está dentro de la habitación cerrada.

**Este fue el problema sin resolver de la criptografía hasta los años 1970.**

## Por Qué Esto Importa para Bitcoin

Podrías estar preguntándote: ¿por qué estamos hablando de cifrados César en un libro sobre Bitcoin?

Porque la seguridad de Bitcoin depende enteramente de la criptografía. Específicamente:

**Las direcciones de Bitcoin—tu monedero—funcionan con claves criptográficas asimétricas.**

Cuando "posees" Bitcoin, no posees realmente nada físico. Posees conocimiento de un número secreto (una clave privada, una contraseña que solo tú deberías conocer) que prueba matemáticamente la propiedad. Sin esa clave, el Bitcoin es matemáticamente inaccesible para ti—y para todos los demás. Allá vas: ahora tienes una mejor comprensión de lo que es realmente un monedero de Bitcoin.

Y porque es solo información—un número muy grande usado como entrada en una función matemática—puede almacenarse en cualquier lugar: papel, hardware, titanio, tu cerebro, etc. Tú eliges el medio. ¿Uno portátil? ¿Uno duradero? Depende de ti y tus necesidades. Hablaremos más sobre esto después.

**Las transacciones de Bitcoin se firman con claves privadas.**

Cuando envías Bitcoin, estás creando una transacción y firmándola con tu clave privada. Esta firma prueba:
1. Posees el Bitcoin que estás gastando. (Bueno, posees el secreto matemático que otorga acceso a ellos.)
2. Autorizaste la transacción. (Porque, supuestamente, no compartiste ese número con nadie, así que debes ser tú quien los está enviando.)
3. La transacción no ha sido manipulada. (Deduciremos lógicamente esta propiedad después.)

Pero, ¿qué significa "firmar"? En la práctica, es calcular la función matemática que vimos antes:

`f(mensaje, clave_privada) = mensaje_cifrado`.

Porque esto te identifica como el propietario del Bitcoin, lo llamamos una firma—como las firmas en los cheques bancarios clásicos en papel o contratos. Realmente puedes pensar en las firmas de criptomonedas como cheques bancarios clásicos. Profundizaremos después.

Pero, ¿cómo funciona esto sobre una red pública donde cualquiera puede mirar? ¿Cómo pruebas que posees acceso a Bitcoin sin revelar tu clave privada? ¿Cómo verifican miles de extraños tu firma (hacen el cálculo matemático) sin conocer su entrada (tu contraseña)?

**La respuesta reside en propiedades muy especiales y nuevas que puedes lograr si diseñas la función matemática de forma suficientemente inteligente—y eso es lo que llamamos criptografía asimétrica**—el avance matemático que hace posible Bitcoin (y la seguridad moderna de Internet).

Pero tuvimos que entender primero el cifrado simétrico, porque nos muestra el problema que resuelve el cifrado asimétrico. Y porque es relativamente fácil de explicar con modelos mentales simples—como las funciones matemáticas que vimos y el cifrado César.

Así que, resumiendo: ahora sabes cómo pensar apropiadamente sobre el cifrado—funciones matemáticas muy complejas que procesan información, mapeando entradas a salidas. Ayudando a los ordenadores a "inventar" instantáneamente un nuevo lenguaje estándar que solo ellos saben hablar.

Dependiendo de sus propiedades, las clasificamos en cifrado simétrico o asimétrico.

Como hemos visto, las propiedades del cifrado simétrico son:
- Ambas partes comparten la misma clave secreta (contraseña)
- La misma clave se usa para cifrar y descifrar mensajes

Pero esto tiene una complicación central: ¿cómo compartes la clave secreta en primer lugar a largas distancias sin que alguien la intercepte?

---

**Idea Clave:** El cifrado simétrico revuelve mensajes usando una contraseña secreta compartida. Es imposible de romper con algoritmos modernos como AES. Pero tiene una falla fatal: ¿cómo compartes la contraseña rápidamente y a largas distancias sin que alguien la intercepte? Encontrarse en persona funciona, pero no escala al Internet donde miles de millones de extraños necesitan comunicarse de forma segura sin conocerse nunca, y rápidamente.

A continuación, exploraremos el avance que resolvió esto: **cifrado asimétrico**—un truco mágico matemático que te permite enviar secretos sin compartir contraseñas, y probar identidad sin revelar secretos. Este es uno de los bloques fundamentales de Bitcoin y toda la seguridad digital moderna.

Por ahora, estamos empezando a entender verdaderamente qué es realmente un monedero cripto. Es solo una contraseña, un montón de información—una elegida muy inteligentemente.
