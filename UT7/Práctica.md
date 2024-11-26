# Práctica: ![pokeball](https://emojis.slackmojis.com/emojis/images/1660307710/60591/pokeball.gif?1660307710) Pokemon II.

## Introducción
En esta práctica, trabajarás con el desarrollo de módulos en Odoo para gestionar Pokémon. Crearás modelos, relaciones, restricciones y vistas que permitan gestionar información sobre Pokémon, especies, entrenadores y equipos.

Para ello te proporciono un archivo llamado `Pokémon.zip`, que puedes descargar haciendo click [**aquí**](https://github.com/canarydev/SGE/raw/main/static/src/Pokemon.zip)


---

## Objetivos
1. **Crear los modelos**: `specie`, `pokemon`, `poketype`, `trainer` y `team`.
2. **Configurar vistas tree y form** para cada modelo.
3. **Establecer relaciones entre los modelos**.
4. **Establecer restricciones**, de ser posible, utilizando `@api.constraints` y `_sql_constraint`.
5. **Utilizar `@api.on_change`y `@api.depends`**.
6. **Diseñar vistas intuitivas y atractivas** para mostrar toda la información de forma clara.

---

## Objetivos detallados

### 1. Modelos a crear
- **Specie (Especie):** Representa una especie de Pokémon con sus estadísticas máximas.
  - Información básica: nombre, estadísticas máximas (HP, ataque, defensa), tipos, etc. Se utilizarán todos los campos existentes en el `csv` que se comparte dentro del fichero .zip.
- **PokeType (Tipos)**: Representa los distintos tipos que existen.
  - Nombre.
- **Pokemon:** Representa un pokémon individual basado en una especie.
  - Información básica: La misma que la de su especie, pero con características propias, `mote` y `entrenador`.
- **Trainer (Entrenador):** Representa un entrenador Pokémon.
  - Información básica: nombre. Puede tener varios equipos.
- **Team (Equipo):** Representa un equipo de Pokémon.
  - Información básica: nombre del equipo, integrantes del mismo y entrenador.

---

### 2. Relaciones entre modelos
- Cada **equipo** está vinculado a un **entrenador**.
- Cada **equipo** puede contener hasta 6 pokémon.
- Cada **pokémon** está basado en una **especie**.
- Cada **especie** y **Pokemon** tiene **tipos**.

---

### 3. Restricciones y validaciones
- Implementa restricciones para:
- Limitar el número de Pokémon por equipo a un máximo de 6 y un mínimo de 1.
- Validar que las estadísticas de un Pokémon no superen los valores máximos permitidos por su especie.

---

### 4. `@api.on_change` y `@api.depends` 
- Investiga y aprende a utilizarlos en el modelo `Pokemon`.

---

### 5. Vistas
- Diseña vistas **tree** y **form** para cada modelo.
- Asegúrate de que las vistas:
- Muestren toda la información relevante de manera clara.
- Sean intuitivas y atractivas.
- Permitan realizar las operaciones necesarias para gestionar los datos.

---
### 6. Libertad creativa
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
