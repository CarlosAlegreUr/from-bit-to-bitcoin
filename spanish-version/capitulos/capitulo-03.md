# Capítulo 3: Algoritmos - Siguiendo Reglas

*Los ordenadores no piensan. Siguen recetas, muy rápido, muy precisamente.*

---

Hemos establecido que los bits son solo patrones, y asignamos significado a esos patrones a través de mapeos acordados como ASCII. Pero, ¿cómo hacen realmente *algo* los ordenadores con esta información?

La respuesta: **algoritmos**. Palabra elegante, concepto simple. Un algoritmo es solo un conjunto de instrucciones—una receta para resolver un problema o completar una tarea.

## La Analogía de la Receta

Piensa en hacer un bocadillo de jamón y queso. Aquí está el algoritmo:

```
1. Consigue dos rebanadas de pan
2. Consigue el jamón
3. Consigue el queso
4. Consigue un cuchillo
5. Pon una rebanada de jamón en una rebanada de pan
6. Pon una rebanada de queso encima del jamón
7. Pon la segunda rebanada de pan encima
8. ¡Listo!
```

Eso es un algoritmo—una secuencia de pasos que, si se siguen exactamente, produce el resultado deseado.

**La propiedad clave:** Si sigues los mismos pasos con los mismos ingredientes, obtienes el mismo bocadillo cada vez. Esto se llama ser **determinista**: la misma entrada lleva a la misma salida, siempre. Piensa en entrada como "información inicial" o "símbolos iniciales", y piensa en salida como "información final" o "símbolos finales".

Los ordenadores funcionan de la misma manera. Dale a un ordenador un algoritmo y algunos datos de entrada (de ahora en adelante, si lees la palabra "datos" también puedes pensarlo como "información"), y ejecutará los pasos exactamente como están escritos, produciendo la misma salida cada vez. ¿Y si no? Bueno, has sido hackeado, o deberías contactar al fabricante de tu ordenador—estropearon algún transistor, cable u otro componente físico.

## Un Algoritmo Simple: Binario a Letras

Escribamos un algoritmo que tome datos binarios y los convierta en texto usando la tabla ASCII que aprendimos en el Capítulo 2.

**Entrada:** Una cadena de bits (por ejemplo, `01001000 01001001`)

**Salida:** Texto legible por humanos (por ejemplo, "HI")

**Algoritmo:**

```
Paso 1: Dividir la entrada en grupos de 8 bits
        01001000 | 01001001

Paso 2: Convertir cada grupo de binario a decimal
        01001000 = 72
        01001001 = 73

Paso 3: Buscar cada número decimal en la tabla ASCII
        72 = H
        73 = I

Paso 4: Juntar las letras
        Salida: "HI"
```

Eso es todo. Cuatro pasos. Síguelos con precisión, y `01001000 01001001` se convierte en "HI" cada vez.

**Tu ordenador hace esto miles de millones de veces por segundo.** Cuando abres un archivo de texto, cargas una página web, o lees esta frase, tu ordenador está ejecutando algoritmos que convierten bits en píxeles, sonidos, letras e imágenes.

## Los Ordenadores No "Piensan"

Aquí hay algo crucial que entender: **Los ordenadores no piensan. No entienden. Solo siguen instrucciones.**

Cuando tu ordenador muestra la letra 'H', no "sabe" qué significa 'H'. No entiende el concepto de letras o lenguaje. Simplemente siguió este algoritmo:

```
SI bits = 01001000
ENTONCES mostrar patrón de píxeles #72 del archivo de fuente
```

Eso es todo. Sin comprensión, sin inteligencia, sin consciencia. Solo: ve este patrón, haz esta acción.

Esto podría parecer decepcionante, pero en realidad es profundo. Al seguir reglas simples muy rápido, los ordenadores pueden hacer cosas que *parecen* inteligentes:

- Traducir idiomas (siguiendo reglas gramaticales + búsquedas en diccionario)
- Jugar al ajedrez (siguiendo reglas de evaluación de movimientos)
- Reconocer caras (siguiendo reglas de coincidencia de patrones)
- Enrutar tus correos (siguiendo reglas de protocolo de red)
- **Procesar transacciones de dinero digital (siguiendo reglas de validación)**

Todo son algoritmos. Todas instrucciones. Todo determinista.

## El Poder del Determinismo

**Determinista** significa: dada la misma entrada, siempre obtienes la misma salida.

Esta propiedad es crítica para que los ordenadores trabajen juntos. Imagina si tu ordenador y mi ordenador pudieran mirar los mismos bits y obtener resultados *diferentes*—la comunicación sería imposible, y la coordinación se desmoronaría completamente.

Bitcoin confía completamente en esta propiedad. Miles de ordenadores alrededor del mundo ejecutan los mismos algoritmos sobre los mismos datos, y todos llegan a las mismas conclusiones sobre qué es válido y qué no.

**Por esto funciona Bitcoin.** No por magia, sino porque los algoritmos deterministas garantizan que todos siguiendo las mismas reglas terminan con la misma "verdad"—información predecible, verificable.

¿Qué es un minero? ¿Un bloque? ¿Una transacción? Llegaremos allí, no te preocupes. Por ahora, solo entiende que todos estos conceptos están construidos sobre algoritmos que los ordenadores siguen con precisión.

## Los Algoritmos Pueden Ser Simples o Complejos

Algunos algoritmos son triviales:

```
Algoritmo: Sumar dos números
Entrada: 5, 3
Paso 1: Sumar los números juntos
Salida: 8
```

Otros son increíblemente complejos:

```
Algoritmo: Renderizar un fotograma de videojuego 3D
Entrada: Posición del jugador, datos del mundo, reglas de iluminación, física...
Paso 1: Calcular qué objetos son visibles
Paso 2: Aplicar iluminación y sombras
Paso 3: Aplicar texturas a las superficies
Paso 4: Calcular reflejos
Paso 5: Aplicar desenfoque de movimiento
Paso 6: Convertir coordenadas 3D a píxeles 2D
... (cientos de pasos más)
Salida: Un fotograma del juego (1/60 de segundo)
```

Pero ambos son la misma idea fundamental: una secuencia de instrucciones que transforma entrada en salida.

Bitcoin usa ambos tipos—algoritmos simples y complejos. Pero todo es determinista. Todo es solo seguir reglas.

## Los Ordenadores Siguen Recetas Perfectamente (y Estúpidamente)

Aquí hay un ejemplo clásico que muestra tanto el poder como la limitación de los algoritmos.

Imagina que le das a un ordenador este algoritmo:

```
Algoritmo: Hacer un bocadillo
Paso 1: Poner jamón en el pan
```

Un humano entendería: conseguir pan, abrir el paquete de jamón, extenderlo, etc.

Pero un ordenador fallaría inmediatamente. **"¿Poner"? ¿Qué significa eso? "¿Jamón"? ¿Dónde está? "¿En"? ¿Cuál es la posición?**

Los ordenadores necesitan *cada paso* deletreado explícitamente:

```
Paso 1: Localizar objeto etiquetado "pan" en sistema de coordenadas
Paso 2: Localizar objeto etiquetado "jamón"
Paso 3: Mover jamón a coordenada X, Y, Z sobre el pan
... (cientos de micro-pasos)
```

Por esto programar es difícil—debes pensar como un ordenador: descomponer todo en los pasos más pequeños posibles, no asumir nada, definir todo.

**Pero una vez que lo haces:** el ordenador ejecuta esos pasos impecablemente, miles de millones de veces, sin cansarse nunca o cometer un error.

## Por Qué Esto Importa para Bitcoin

Bitcoin es una colección de algoritmos.

Estos algoritmos definen cosas como:
- Cómo verificar que alguien realmente posee el dinero que está intentando gastar
- Cómo asegurarse de que el mismo dinero no se gasta dos veces
- Cómo acordar el orden de las transacciones
- Cómo recompensar a las personas que ayudan a asegurar la red

Ordenadores por todo el mundo ejecutan estos mismos algoritmos. Todos siguen las mismas reglas. Dada la misma información, todos llegan a la misma conclusión sobre qué es válido.

No se necesita confianza. Solo matemáticas.

Bueno, no exactamente "sin confianza". Todavía confías en:
- Los algoritmos están correctamente implementados
- La mayoría de los participantes están siguiendo las reglas
- Tu hardware de ordenador no te está mintiendo

Pero no necesitas confiar en ninguna persona o institución única. Puedes verificar todo tú mismo ejecutando los algoritmos.

Esto es lo que la gente quiere decir con "trustless" (sin confianza) (aunque "trust-minimized" (confianza minimizada) es más preciso). Eventualmente confías en matemáticas y código ejecutando un consenso acordado, no en banqueros y gobiernos, que podrían poner el dinero donde les dijiste... o no.

## La Transición a Protocolos

Los algoritmos dicen a los ordenadores individuales qué hacer. Pero, ¿qué pasa con los ordenadores hablando entre *sí*?

Eso requiere **protocolos**—reglas acordadas para la comunicación. Y eso es exactamente lo que exploraremos en el próximo capítulo.

Protocolos, como... ¡El Protocolo de Internet! Voilà, esa palabra que todos usamos pero poco entendemos: Internet.

Porque Bitcoin no es solo un ordenador ejecutando algoritmos. Son miles de ordenadores coordinándose a través de internet, todos ejecutando los mismos algoritmos, todos hablando el mismo protocolo o estándar, todos convergiendo en la misma "verdad" (información ordenada interpretada con el mismo significado).

Y *ahí* es cuando se pone realmente interesante.

---

**Idea Clave:** Los algoritmos son conjuntos de instrucciones que los ordenadores siguen determinísticamente. La misma entrada lleva a la misma salida, siempre. Este determinismo es lo que permite a miles de ordenadores verificar independientemente la misma información y llegar a las mismas conclusiones sin confiar entre sí. Los ordenadores no "entienden" nada—solo siguen reglas perfectamente, miles de millones de veces por segundo.

A continuación, veremos cómo los ordenadores se coordinan a través de redes. ¿Cómo habla tu ordenador con un servidor en otro país? ¿Cómo se mantienen sincronizados miles de nodos de Bitcoin? Ese es el poder de los **protocolos**—y son más simples de lo que parece la palabra.

Tal vez no esperabas salir de este libro con una comprensión intuitiva del famoso Internet. Espero que sea tan fascinante para ti como lo fue para mí cuando lo aprendí por primera vez hace años.
