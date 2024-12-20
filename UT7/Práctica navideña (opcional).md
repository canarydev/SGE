# Práctica: 🏛️ Bufete de Abogados

---

## Introducción  
En esta práctica, trabajarás con el desarrollo de módulos en Odoo para gestionar la operativa de un bufete de abogados. Crearás modelos, relaciones, restricciones y vistas que permitan gestionar información sobre abogados, especialidades, clientes y consultas realizadas. Además, implementarás funcionalidades específicas como un widget de firma y flujos basados en estados para las consultas.

Para ayudarte a empezar, puedes utilizar los conceptos y herramientas aprendidos en prácticas anteriores.

---

## Objetivos  
1. **Crear los modelos**: `especializacion`, `abogado`, `cliente`, `consulta` y otros relacionados.  
2. **Configurar vistas tree, form y kanban** para cada modelo.  
3. **Establecer relaciones entre los modelos.**  
4. **Establecer restricciones**, de ser posible, utilizando `@api.constraints` y `_sql_constraint`.  
5. **Utilizar `@api.on_change` y `@api.depends`**.  
6. **Diseñar un flujo de trabajo visual para las consultas** basado en estados.  
7. **Implementar el widget de firma digital** en las respuestas de los abogados.  

---

## Objetivos detallados  

### 1. Modelos a crear  

#### **Especialización:**  
- Representa las áreas de especialización que pueden tener los abogados.  
- **Campos sugeridos:**  
  - Nombre (Char, obligatorio).  
  - Descripción (Text, opcional).  

#### **Abogado:**  
- Representa a cada abogado registrado en el sistema.  
- **Campos sugeridos:**  
  - Nombre completo (Char, obligatorio).  
  - Número de identificación profesional (Char, único y obligatorio).  
  - Especializaciones (Many2many hacia `especializacion`).  
  - Activo (Boolean, por defecto True).  

#### **Cliente:**  
- Representa a los clientes del bufete.  
- **Campos sugeridos:**  
  - Nombre completo (Char, obligatorio).  
  - Documento de identificación (Char, único y obligatorio).  
  - Dirección (Char, opcional).  
  - Teléfono y correo electrónico (Char, opcionales).  

#### **Consulta:**  
- Representa una consulta realizada por un cliente.  
- **Campos sugeridos:**  
  - Cliente (Many2one hacia `cliente`).  
  - Especialización requerida (Many2one hacia `especializacion`, opcional si no se selecciona abogado).  
  - Abogado asignado (Many2one hacia `abogado`, filtrado por la especialización requerida).  
  - Estado (Selection: `recibido`, `presupuestado`, `pagado`, `terminado y firmado`).  
  - Precio inicial (Float).  
  - Respuesta del abogado (Text).  
  - Firma (Widget de firma).  

---

### 2. Relaciones entre modelos  
- Cada **abogado** puede tener varias **especializaciones**.  
- Cada **consulta** está asociada a un **cliente**.  
- Cada **consulta** puede estar asociada a una **especialización** y un **abogado**.  

---

### 3. Restricciones y validaciones  
- Validar que:  
  - El precio inicial sea mayor a cero.  
  - No se pueda asignar un abogado que no tenga la especialización requerida.  
  - No se pueda registrar dos clientes con el mismo documento de identificación.  

---

### 4. `@api.on_change` y `@api.depends`  
- **`on_change`** en el campo de especialización de la consulta para filtrar automáticamente los abogados disponibles.  
- **`depends`** para actualizar automáticamente el estado o precio inicial según las acciones realizadas.  

---

### 5. Flujo de trabajo de las consultas  
- Diseñar un flujo de estados en formato kanban para las consultas:  
  - **Recibido:** Consulta recibida, pendiente de presupuestar.  
  - **Presupuestado:** Se ha indicado un precio inicial.  
  - **Pagado:** El cliente ha realizado el pago.  
  - **Terminado y firmado:** El abogado ha respondido y firmado.  

---

### 6. Vistas  
- Diseñar vistas **tree** y **form** para los modelos:  
  - **Abogados:** Mostrar especializaciones y estado activo.  
  - **Clientes:** Mostrar consultas asociadas.  
  - **Consultas:** Incluir vistas kanban y formularios intuitivos.  

---

### 7. Libertad creativa  
Se permite libertad para:  
- Diseñar los formularios y listas con la estructura y estilo que consideres más adecuados.  
- Añadir campos adicionales si enriquecen el modelo.  

---

## Posibles modelos adicionales  
- **Pago:** Para gestionar los pagos de las consultas (puede vincularse a módulos existentes en Odoo).  
- **Caso:** Si decides ampliar el flujo para incluir la gestión de casos derivados de consultas.  

---

## Entregables  
1. **Código del módulo Odoo**:  
   - Comprimir el módulo y entregarlo como `.zip`.  
2. **PDF explicativo**:  
   - Mostrar el cumplimiento de cada punto del objetivo, con capturas de pantalla del módulo funcionando.  

---

## Criterios de evaluación  
1. **Correcta implementación de los modelos y relaciones.**  
2. **Cumplimiento de las restricciones y validaciones.**  
3. **Diseño y funcionalidad de las vistas.**  
4. **Operatividad del flujo de estados.**  
5. **Uso del widget de firma digital.**  
6. **Entrega en tiempo y forma.**  

---

## Entrega  
Subir el módulo y PDF explicativo a la plataforma Moodle.
