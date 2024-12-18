# Práctica: ![pokeball](https://emojis.slackmojis.com/emojis/images/1660307710/60591/pokeball.gif?1660307710) Pokemon III.

## Introducción
En esta práctica, trabajarás con el desarrollo de módulos en Odoo para gestionar Pokémon. Crearás modelos, relaciones, restricciones y vistas que permitan gestionar información sobre pokémon, especies, tipos, entrenadores y equipos.

Para ello te proporciono un archivo llamado `Pokémon.zip`, que puedes descargar haciendo click [**aquí**](https://github.com/canarydev/SGE/raw/main/static/csv/Pokemon.zip)

Se trata de la continuación de lo ya realizado en la práctica anterior, por lo que puedes continuarla.

---

## Objetivos
1. **Añadir un campo Image** en `specie` y `pokemon`. Debe cargarse como una `image_url` utilizando las imágenes falcilitadas en `Pokemon.zip`.
2. **Configurar vistas kanban** para `pokemon`y el `team` dentro de la vista formulario del `trainer`.
3. **Añadir un nuevo campo** `lvl` que indique el nivel del Pokemon. Estará dentro del modelo `pokemon.pokemon` y debe ser introducido mediante [**XPath**](https://github.com/canarydev/SGE/blob/main/UT8/7.%20XPath.md). Un pokemon no puede nunca sobrepasar el nivel 100.
4. **Añadir widgets** que puedan añadir algún tipo de funcionalidad. Por ejemplo, `badge` dentro de pokemon para mostrar el tipo como una píldora, algún widget que me permita ver la vida como una barra de vida.
5. **Añadir clases _oe** que mejoren la vista.
6. **Añadir estilos CSS**, por ejemplo, la línea separadora que aparece como ejemplo o algún otro.

---

## Objetivos detallados

### 1. Añadir un campo Image

Debe añadirse en `specie` y `pokemon` y debe cargarse como una `image_url` utilizando las imágenes falcilitadas en `Pokemon.zip`.

---

### 2. Configurar vistas Kanban

Los Pokemon deben presentarse como una vista Kanban que condense la información de una forma clara y sencilla. Además, cuando un entrenador vea su equipo, debe poder verlo en una vista Kanban, en lugar de como una lista.

---

### 3. Añadir un nuevo campo mediante XPath

El campo `lvl` que indicará el nivel del Pokemon. Estará dentro del modelo `pokemon.pokemon` y debe ser introducido mediante [**XPath**](https://github.com/canarydev/SGE/blob/main/UT8/7.%20XPath.md).

Debes añadir la restriccuón de que el nivel debe estar entre 1 y 100.

---

### 4. Añadir widgets 

Añade al menos 2 widgets.

---

### 5. Clases _oe

Añade al menos 1 clase _oe, preferiblemente 2.

---
### 6. Añadir estilos CSS

Añade una hoja de estilos CSS y utilízala.


### 7. Libertad creativa

Se permite libertad para:
- Diseñar los formularios y listas con la estructura y estilo que consideres más adecuados.
- Añadir campos adicionales si crees que enriquecen el modelo.

---

## Entregables

1. **Código del módulo Odoo**:
   - Comprimir el módulo y entregarlo como .zip
     
2. **PDF que muestre el cumplimiento de cada uno de los puntos**:
   - Explica el funcionamiento del módulo y muetre cada una de los objetivos cumplidos.

---

## Criterios de evaluación

1. **Correcta implementación de los modelos**:
   - Estructura lógica y relaciones entre ellos.
2. **Cumplimiento de las restricciones**:
   - Número máximo y mínimo de Pokémon por equipo.
   - Estadísticas limitadas por especie.
3. **Calidad de las vistas**:
   - Claridad, intuición y diseño.
4. **Funcionalidad del módulo**:
   - Que sea instalable y operativo en una instancia de Odoo.
5. **Entrega**:
   - Que se entregue en tiempo y forma a través de la plataforma Moodle, entregando los archivos necesarios para demostrar que se ha realizado correctamente.

---

## Entrega
Entrega a través del aula virtual.
