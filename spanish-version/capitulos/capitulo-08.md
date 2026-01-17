# Capítulo 8: Computación Cuántica - ¿La Amenaza del Futuro?

*¿Romperán los ordenadores cuánticos todo lo que acabamos de aprender?*

---

Ahora que entiendes la criptografía asimétrica—la base matemática de los monederos de criptomonedas y la comunicación segura por internet—hay una pregunta importante que necesitamos abordar:

**"¿No romperán los ordenadores cuánticos todo esto?"**

Esta es una de las preocupaciones más comunes sobre las criptomonedas. Afrontémosla directamente.

## La Preocupación

La criptografía asimétrica se basa en funciones unidireccionales—operaciones matemáticas que son fáciles de calcular hacia adelante pero extremadamente difíciles de revertir. Por ejemplo, multiplicar dos grandes números primos es fácil, pero descifrar qué dos primos se multiplicaron es extremadamente difícil (tomaría a los ordenadores clásicos miles de millones de años). Aquí está la preocupación: **los ordenadores cuánticos podrían ser capaces de revertir estas funciones "unidireccionales" mucho más rápido.**

## ¿Qué es la Computación Cuántica?

Recuerda del Capítulo 1: un bit clásico es 0 o 1—un interruptor que está apagado o encendido.

Un **bit cuántico** (o **qubit**) es diferente. Debido a fenómenos físicos extraños a nivel atómico y temperaturas extremadamente bajas, un qubit puede existir como **0 y 1 al mismo tiempo**. Esto se llama **superposición**.

```
Bit clásico:
[0]  o  [1]  (un estado a la vez)

Bit cuántico (qubit):
[0 Y 1 simultáneamente]  (superposición de estados)
```

Cuando tienes múltiples qubits en superposición, pueden representar muchas combinaciones posibles a la vez, permitiendo a los ordenadores cuánticos explorar muchas soluciones simultáneamente y haciendo ciertos tipos de cálculos exponencialmente más rápidos.

**Importante:** La computación cuántica no es magia. No hace todo más rápido—es muy buena para tipos específicos de problemas (como factorizar números grandes) pero no universalmente mejor en todas las tareas de computación.

## Qué se Rompe y Qué No

**Lo que los ordenadores cuánticos podrían romper:**
- RSA (se basa en factorizar números grandes)
- Criptografía de Curva Elíptica / ECDSA (usado por Bitcoin y Ethereum)
- Cronograma: Los expertos típicamente estiman que los ordenadores cuánticos capaces de romper la criptografía de clave pública de hoy están **a 10–20 años de distancia**, con algunos situando el riesgo alrededor de los **años 2030**, aunque la incertidumbre y el desacuerdo permanecen sobre los cronogramas exactos.

**Lo que permanece seguro:**
- Cifrado simétrico como AES (solo usa claves más grandes)
- Funciones hash (relativamente resistentes)
- Algoritmos de criptografía post-cuántica (ya existen y fueron estandarizados por NIST en **agosto de 2024** con el lanzamiento de FIPS 203, 204, y 205, cubriendo algoritmos como Kyber, Dilithium, y SPHINCS+)

## Por Qué las Criptomonedas Pueden Adaptarse

**Las criptomonedas son software. El software puede actualizarse.**

Bitcoin usa ECDSA para firmas, pero no hay nada que impida un cambio a algoritmos resistentes a la cuántica. El protocolo central—bloques, transacciones, consenso—permanece igual; solo cambia el algoritmo de firma.

**Ejemplo de migración:**
```
Actual: Clave Privada → (ECDSA) → Clave Pública → Dirección de Bitcoin

Futuro: Clave Privada → (Algoritmo post-cuántico) → Clave Pública → Nueva Dirección de Bitcoin
```

Los usuarios generarían nuevos monederos resistentes a la cuántica y transferirían sus fondos. La blockchain continúa, solo que con nuevos algoritmos de firma.

## Todos Tienen Este Problema

**Si los ordenadores cuánticos rompen el cifrado de criptomonedas, rompen TODO:**
- Banca en línea → rota
- Comunicaciones militares → rotas
- Secretos gubernamentales → rotos
- Cada sitio web HTTPS → roto

**Las criptomonedas no son únicamente vulnerables.** Enfrentan la misma amenaza cuántica que todos los demás—y en realidad son MÁS adaptables porque los protocolos cripto pueden actualizarse vía consenso, mientras que los sistemas tradicionales son notoriamente lentos para cambiar.

El mundo entero tiene incentivo para desarrollar criptografía resistente a la cuántica ANTES de que existan ordenadores cuánticos poderosos. Y ese trabajo ya está bien en marcha.

## La Búsqueda del Tesoro: El Bitcoin de Satoshi

Aquí hay una consecuencia fascinante:

**Satoshi Nakamoto**, el creador seudónimo de Bitcoin, minó entre **750,000 y 1.1 millones de Bitcoin** en los primeros días (la mayoría de los análisis estiman alrededor de **1 millón de BTC**)—hoy vale decenas de miles de millones de dólares.

**Cuando gastas Bitcoin, revelas tu clave pública en la blockchain.** Satoshi hizo algunas transacciones, revelando algunas claves públicas.

Si alguien construye un ordenador cuántico lo suficientemente poderoso para romper ECDSA, podría derivar claves privadas desde esas claves públicas reveladas y robar el Bitcoin. Esto crea dos resultados posibles:

1. Quien rompa ECDSA primero encuentra el "tesoro" (miles de millones de dólares en Bitcoin temprano)
2. La red acuerda mover todos esos fondos a una nueva dirección resistente a la cuántica controlada por nadie

Esto no es solo teórico—crea un incentivo real para resolver las amenazas cuánticas antes de que lleguen. Con miles de millones de dólares en juego, la gente toma la amenaza en serio y migrará a tiempo.

---

**Idea Clave:** Los ordenadores cuánticos representan una amenaza futura para algunos algoritmos criptográficos, incluyendo aquellos usados por las criptomonedas. Sin embargo, los algoritmos resistentes a la cuántica ya existen, y la migración es posible. Todo el internet enfrenta este mismo desafío, creando fuertes incentivos para soluciones oportunas. Esta es una transición manejable, no una catástrofe.

Ahora que entiendes las herramientas criptográficas—cómo crear IDs digitales, probar propiedad, y firmar transacciones—exploremos qué viene después: **¿Podemos hacer que los bits signifiquen "dinero"?** En el próximo capítulo, veremos cómo los bits pueden tener las propiedades del dinero, por qué necesitamos una base de datos distribuida para almacenarlos, y el desafío fundamental que hace posibles las criptomonedas: el problema del consenso.
