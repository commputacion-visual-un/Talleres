# Taller de análisis de imágenes por software

## Propósito

Introducir el análisis de imágenes/video en el lenguaje de [Processing](https://processing.org/).

## Tareas

Implementar las siguientes operaciones de análisis para imágenes/video:

* Conversión a escala de grises: promedio _rgb_ y [luma](https://en.wikipedia.org/wiki/HSL_and_HSV#Disadvantages).
* Aplicación de algunas [máscaras de convolución](https://en.wikipedia.org/wiki/Kernel_(image_processing)).
* (solo para imágenes) Despliegue del histograma.
* (solo para imágenes) Segmentación de la imagen a partir del histograma.
* (solo para video) Medición de la [eficiencia computacional](https://processing.org/reference/frameRate.html) para las operaciones realizadas.

Emplear dos [canvas](https://processing.org/reference/PGraphics.html), uno para desplegar la imagen/video original y el otro para el resultado del análisis.

### Alternativas para video en Linux y `gstreamer >=1`

Distribuciones recientes de Linux que emplean `gstreamer >=1`, requieren alguna de las siguientes librerías de video:

1. [Beta oficial](https://github.com/processing/processing-video/releases).
2. [Gohai port](https://github.com/gohai/processing-video/releases/tag/v1.0.2).

Descompriman el archivo `*.zip` en la caperta de `libraries` de su sketchbook (e.g., `$HOME/sketchbook/libraries`) y probar cuál de las dos va mejor.

## Integrantes

Completar la tabla:

| Integrante | github nick |
|------------|-------------|
|  Joaquim Estopinan  | estopinj    |
|  Paula Caballero  | pycaballrom    |
|  Juan camilo Gallego  | jcgallegor    |


## Discusión

Evidenciamos que con el metodo luma para escalas de grises se aprecia mas el brillo de las imagenes y el contraste es mas suave, los detalles de la imagen se ven como en la imagen original.

Al implementar las mascaras se forma un borde al rededor de la imagen, como posibles soluciones para esto encontramos:
- Extender los pixeles del borde en cada direccion.
- Repetir la imagen en cada direccion.

*Estas posibles soluciones no fueron implementadas en esta entrega.

## Entrega

* Instrucciones:

En los archivos Taller_1 y rgb_luma para cambiar el metodo de escalas de grises entre RGB y HSB es necesario descomentarear el que desea usar y comentarear el otro.

En los archivos mascaras y videoMascaras para escoger la mascara o kernel debe cambiar el nombre del kernel en la linea donde se indica con el texto "CHANGE HERE WITH KERNEL TO APPLY"
