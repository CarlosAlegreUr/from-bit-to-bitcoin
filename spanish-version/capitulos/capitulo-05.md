# Capítulo 5: El Problema de la Confianza

*El internet es público por defecto. Más abierto que las piernas de tu ex.*

---

Hemos establecido que los ordenadores se comunican usando protocolos—reglas acordadas que permiten la coordinación a través del globo. El Internet funciona porque miles de millones de dispositivos siguen las mismas reglas para enviarse paquetes de datos entre sí.

Pero aquí está el problema: **El Internet es una red pública.**

Si visualizas los ordenadores conectados entre sí con líneas, parece una red:

![internet](../../images/image.png)

Cuando envías datos a través del Internet, no viajan directamente de tu ordenador al destino. En su lugar, saltan a través de docenas de ordenadores intermedios—enrutadores, conmutadores, servidores—cada uno reenviando tu paquete más cerca de su destino.

**Cualquiera a lo largo de ese camino puede leer tus datos.**

## Alice, Bob, y Carol

Usemos un escenario clásico de la criptografía.

Alice quiere enviar a Bob un mensaje secreto: "La contraseña es: banana123"

Ella lo envía a través del Internet, y el mensaje viaja a través de:
- Su enrutador local
- Su proveedor de servicios de internet (ISP)
- Múltiples enrutadores troncales
- El ISP de Bob
- El enrutador local de Bob
- Finalmente, el ordenador de Bob

En cada una de estas paradas, alguien podría estar mirando.

Entra Carol. Ella es una fisgona—tal vez trabaja en el ISP, tal vez está ejecutando un enrutador, o tal vez es simplemente alguien que descubrió cómo interceptar tráfico de red (esto se llama **rastreo de paquetes**).

```
Alice envía: "La contraseña es: banana123"
    |
[Enrutador 1] <- ¡Carol está escuchando aquí!
    |
[Enrutador 2]
    |
[Enrutador 3] <- ¡Carol podría estar escuchando aquí también!
    |
Bob recibe: "La contraseña es: banana123"
```

Carol lo ve todo. La contraseña, el mensaje, todo. Alice y Bob no tienen privacidad.

**Este es el problema de la confianza:** ¿Cómo envías secretos por un canal público cuando cualquiera podría estar escuchando?

## Soluciones Históricas

Este no es un problema nuevo—los humanos han estado intentando enviar mensajes secretos durante miles de años.

**Los métodos antiguos** incluían mensajeros de confianza (que podían ser capturados o sobornados), cartas selladas (que podían ser abiertas y reselladas), y códigos secretos escritos en papel (que requerían que ambas partes tuvieran el libro de códigos).

**La Segunda Guerra Mundial** vio la famosa máquina Enigma, el dispositivo de cifrado de Alemania. Los descifradores de códigos aliados pasaron años trabajando para descifrarla, y una vez que lo hicieron, pudieron leer todas las comunicaciones militares alemanas. Guerras se ganaron y perdieron basándose en quién podía mantener sus mensajes secretos.

**El patrón:** A lo largo de la historia, enviar secretos ha requerido confiar en alguien o algo para que no los intercepte.

## La Pregunta Fundamental

Aquí está lo que hace que el Internet sea diferente de todos los métodos de comunicación anteriores:

**El Internet está diseñado para ser abierto.** Las bases del Internet se establecieron con **ARPANET en 1969**, que conectaba instituciones de confianza—universidades, laboratorios de investigación, instalaciones gubernamentales. Compartían artículos académicos y datos de investigación, y la privacidad no era la prioridad; la comunicación abierta lo era. El "Internet" moderno como lo conocemos emergió a través de los años 1980 y 1990 con la adopción de los protocolos TCP/IP.

Pero a medida que el Internet creció y conectó al mundo entero, surgió un problema: ¿cómo envías datos privados a través de una red pública? Dentro de un edificio, los cables dedicados funcionan bien. ¿Pero entre ciudades, países, continentes? Necesitas infraestructura—enrutadores, cables, satélites—propiedad y operados por extraños.

No es como una línea telefónica privada entre dos personas. Es una red pública global donde los datos rebotan a través de docenas de ordenadores de extraños antes de llegar a su destino.

Esto crea una paradoja:
- Necesitamos que el Internet sea abierto (para que tengamos voz, por lo tanto influencia, en todas partes)
- Pero necesitamos que nuestros mensajes sean privados (para que solo las personas que queremos puedan leerlos)

**¿Podemos tener privacidad en público?**

Durante la mayor parte de la historia humana, la respuesta era: No. No puedes enviar un secreto en público sin que alguien potencialmente lo lea. Necesitas canales privados, mensajeros de confianza, salas seguras.

Pero entonces los matemáticos descubrieron algo notable.

## Por Qué Esto Importa Hoy

Piensa en lo que haces en línea:

- **Banca:** Envías contraseñas y detalles de cuenta. Si Carol intercepta esto, te roba el dinero.
- **Compras:** Ingresas números de tarjetas de crédito que viajan a través de redes públicas.
- **Mensajes:** Registros médicos, documentos legales, fotos personales—todos rebotando a través de ordenadores de extraños.

**La pregunta que necesitamos responder:** ¿Cómo envían Alice y Bob secretos entre sí cuando Carol está escuchando en la red?

La solución ingenua: "¡Simplemente no dejes que Carol escuche!"

Pero eso es imposible. Carol podría ser:
- Una empleada de tu ISP
- Una agencia gubernamental con acceso a enrutadores
- Una hacker que comprometió una red
- La dueña de una red WiFi pública que estás usando
- Cualquiera entre tú y tu destino

**No puedes controlar quién está mirando. Solo puedes controlar lo que ven.**

## La Solución: Cifrado

Probablemente has visto esto en tu navegador web: un pequeño icono de candado junto al nombre del sitio web. Suele ser verde, y al lado de "https://", en lugar de "http://".

```
http://ejemplo.com   <- No seguro (Carol puede leer todo)
https://ejemplo.com  <- Seguro (Carol ve galimatías)
```

Esa pequeña "s" al final de "https" significa "secure" (seguro). Significa que tu conexión está **cifrada**.

Cuando visitas un sitio web HTTPS:
- Tu navegador y el sitio web establecen una conexión cifrada
- Todo lo que envías parece ruido aleatorio para cualquiera que esté mirando
- Carol puede ver que estás comunicándote, pero no lo que estás diciendo
- Es como susurrar en un idioma que solo tú y el sitio web entienden

**Por esto funciona la banca en línea.** No porque el Protocolo de Internet sea seguro por defecto (no lo es), sino porque ciframos los mensajes que enviamos a través de él.

Puedes imaginarlo como dos personas hablando en un idioma que no conoces, justo frente a ti. Para ti, esa comunicación está cifrada. Como una forma inicial de entenderlo, los ordenadores hacen algo similar pero sobre el internet.

¿Recuerdas ASCII, el estándar que todos entienden? Bueno, imagina que tu ordenador—porque puede computar y asignar significados muy, muy rápido—crea un nuevo mapeo tipo ASCII con el ordenador de destino, y entonces solo ellos saben lo que está pasando. Algo como: "Oye, todas las Bs serán As, todas las As serán Bs y todas las Ys serán Zs". Entonces la palabra BABY se convierte en ABAZ, y solo ellos lo saben. Más tarde veremos cómo funciona realmente, pero este primer modelo mental te será útil.

Entonces, ¿cómo funciona este cifrado realmente?

## La Configuración para lo que Viene

Necesitamos resolver dos problemas relacionados pero diferentes:

**Problema 1: Cómo enviar secretos cuando todos están mirando**
- Alice quiere enviar a Bob un mensaje privado
- Carol está escuchando
- El mensaje debe llegar intacto y sin leer

**Problema 2: Cómo probar la identidad**
- Alice recibe un mensaje cifrado
- ¿Pero cómo sabe que es realmente de Bob?
- ¿Qué pasa si Carol descifró el "idioma" y se está haciendo pasar por Bob?
- ¿Cómo pruebas la identidad a largas distancias cuando no pueden verse entre sí?

Aquí están las buenas noticias: **el cifrado resuelve ambos problemas.** Entenderemos intuitivamente cómo más tarde.

Por cierto, lectores, el cifrado usa **matemáticas**. Ambos problemas se basan en el mismo avance fundamental: **criptografía asimétrica**—uno de los descubrimientos matemáticos más importantes del siglo XX.

Pero antes de llegar a esa magia, necesitamos entender primero la versión más simple: **cifrado simétrico**.

Porque el cifrado simétrico plantea el problema que el cifrado asimétrico resuelve. Y entender el problema es la mitad de la batalla.

---

**Idea Clave:** El Internet es público por defecto. Cualquiera entre tú y tu destino puede potencialmente leer tus datos. A lo largo de la historia, enviar secretos requería canales privados o mensajeros de confianza. Pero la criptografía moderna permite algo que parece imposible: enviar secretos en público, donde todos pueden ver el mensaje pero nadie puede leerlo. Esta es la base de la privacidad digital—y es esencial para Bitcoin.

Profundicemos en los conceptos muy básicos de cifrado que necesitas para sentirte más seguro y entender cómo funciona Bitcoin.
