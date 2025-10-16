# 🍷 Ejercicio: Creación y Gestión de Base de Datos en Odoo para una Vinoteca

## 🎯 Objetivo
Se debe diseñar y gestionar una base de datos en **Odoo**, simulando la gestión de una **vinoteca**.  
Esto incluye la creación de productos (vinos, quesos, ibéricos), gestión de proveedores, clientes, presupuestos, ventas online y configuración avanzada del TPV con maridajes y códigos QR.

---

## 🧾 Instrucciones generales

Al crear la base de datos:

- **Usuario:** `alumno`  
- **Contraseña:** `alumno`  
- **Master Password:** `juandecolonia`

---

## 1️⃣ Configuración previa del entorno

### 🏢 Almacenes
Se deben crear tres almacenes para gestionar el inventario:

1. 🏠 **Almacén Principal (WH)**  
2. 🍇 **Rioja (RJ)**  
3. 🍷 **Ribera del Duero (RD)**  

Estos almacenes se usarán para almacenar vinos según su denominación de origen.

---

### 💰 Impuestos especiales
Se debe crear un **impuesto especial para bebidas alcohólicas (IEV)** con las siguientes características:

- **Nombre:** Impuesto Especial del Vino (IEV)  
- **Tipo:** Porcentaje sobre el precio del producto  
- **Porcentaje:** 5%  
- **Incluido en el precio:** ✅ Sí (el precio final debe incluir el impuesto)

Este impuesto se debe **aplicar junto al IVA (21%)**.  
Por tanto, los vinos tributarán con **IVA (21%) + IEV (5%)**, resultando en una carga total del **26%** sobre el precio antes de impuestos.

> 💡 En Odoo, esto se puede configurar de tres formas posibles:
> 1. Crear un impuesto **IEV (5%)** y añadirlo **además del IVA (21%)** a los productos. ✅ *(Recomendado para este ejercicio)*  
> 2. Crear un único impuesto del **26%** que englobe ambos.  (NO)
> 3. Crear un impuesto del **5%** que se aplique automáticamente cuando se use el IVA (requiere secuencia de impuestos o impuestos hijos). (NO)

---

## 2️⃣ Productos, proveedores y clientes

### 🍇 Productos

Se deben crear los siguientes productos dentro del módulo de **Ventas** o **Inventario**.

#### 🧴 Vinos
- **Vinos tintos:** 3 modelos diferentes (por ejemplo: La Felisa, Protos Roble...)  
  - Cada uno con **dos variantes**: “Crianza” y “Reserva”.
- **Vinos blancos:** 2 modelos diferentes (por ejemplo: El marido de mi amiga...)  
  - Cada uno con **dos variantes**: “Joven” y “Reserva”.
- **Vino rosado:** 1 modelo  
  - **Sin variantes.**
Investiga algunos nombres de vinos reales.

> 🔹 Las variantes deben crearse mediante **atributos de producto** (por ejemplo, “Tipo de vino” o “Categoría”) de forma que Odoo gestione las diferentes versiones del mismo vino.

#### 🧀 Maridajes
Se deben crear además los siguientes productos complementarios:
- **Quesos:** 3 tipos (curado, semicurado, duro)
- **Ibéricos:** 3 tipos (jamón y chorizo ibérico...)
- **Complemento gourmet:** 3 productos (por ejemplo, aceite de oliva o pan de cristal)

Los maridajes no tienen variantes.

Cada vino debe incluir en su ficha una **sugerencia de maridaje**.  
Por ejemplo:
- “Marida con queso semicurado”  
- “Marida con jamón ibérico”

Todos los productos deben tener:
- Nombre  
- Descripción  
- Foto  
- Precio con impuestos incluidos  
- Categoría de producto  
- Proveedor asignado  

---

### 🤝 Proveedor

Se debe crear un proveedor llamado **Distribuciones Vinícolas del Norte**.

Realizar un **pedido de compra** de **6 unidades de cada producto** a este proveedor.

---

### 👥 Clientes

Se deben crear **tres clientes**:

1. **Cliente individual:** un compañero/a de clase.  
2. **Cliente empresa:** un restaurante local.  
3. **Cliente tienda:** una tienda gourmet.

A continuación, se deben crear **dos presupuestos** para cada cliente:

- 💎 **Presupuesto 1:** Lote premium (vinos más caros y maridajes gourmet).  
- 🍷 **Presupuesto 2:** Lote económico (productos más asequibles).

Debes confirmar al menos 2 presupuestos y registrarlos como ventas.

---

### 🚚 Movimientos entre almacenes

Se deben realizar traslados de stock:

- Desde **Almacén Principal (WH) → Rioja (RJ)** (para los vinos de esa denominación).  
- Desde **Almacén Principal (WH) → Ribera del Duero (RD)** (para los vinos de esa denominación).

Es decir, debes trasladar todo el stock que hayas comprado desde el Almacén Principal (WH) a los otros dos almacenes, según la denominación a la que pertenezca cada vino.

Al menos un traslado debe de ser parcial, es decir, que no se entregan todos los productos en la misma entrega, sino que se debe generar otra entrega.

Después, se deben realizar ventas desde cada uno de estos almacenes.

---

## 3️⃣ TPV (Terminal Punto de Venta)

El **TPV** de la vinoteca debe configurarse con las siguientes características:

### 🛒 Ventas cruzadas (maridajes)
Configurar productos sugeridos en el TPV:
- Si se selecciona un **vino tinto**, sugerir **jamón ibérico**.  
- Si se selecciona un **vino blanco**, sugerir **queso semicurado**.  
- Si se selecciona un **vino rosado**, sugerir **aceite gourmet**.

### 📱 Códigos QR
Se deben generar **códigos QR** o **códigos de barras** para los productos principales (especialmente vinos y maridajes).  
El objetivo es que puedan ser escaneados en el TPV para añadir rápidamente el producto a la venta.

> 💡 Se puede usar el campo “Código de barras / Código interno” del producto para asignar un código QR o EAN simulado.

### 💳 Ventas en el TPV
Se deben realizar **dos ventas** distintas:
1. Una venta de un **vino blanco + queso maridaje**.  
2. Una venta de un **vino tinto + ibérico maridaje**.

---

## 4️⃣ Venta en la tienda online (módulo eCommerce)

Se debe activar el **módulo de ventas online (Sitio Web)**.

- Publicar al menos **5 productos** (3 vinos + 2 quesos + 2 ibéricos). Es recomendable publicarlos todos.  
- Realizar una **venta desde la web** como si se fuera un cliente externo.  
- Confirmar y facturar la venta.

---

## 5️⃣ Entrega final

🔐 Se debe entregar:

1. **Backup de la base de datos** (`.zip` o `.dump`).  
2. **Documento PDF (memoria)** con capturas de pantalla que muestren:
   - Configuración de almacenes (WH, RJ, RD).  
   - Impuesto especial creado y aplicado.  
   - Productos (con variantes y fotos).  
   - Pedido de compra al proveedor.  
   - Clientes y presupuestos.  
   - Ventas realizadas (TPV y web).  
   - Ejemplo de códigos QR en el TPV.  
   - Configuración de ventas cruzadas.

---

## 6️⃣ Evaluación

| Criterio | Puntuación |
|-----------|-------------|
| Configuración inicial (almacenes e impuestos) | 1 pts |
| Creación de productos (con variantes, maridajes y fotos) | 2 pts |
| Gestión de proveedores, clientes y pedidos de compra | 2 pts |
| Presupuestos y ventas correctamente gestionadas | 2 pts |
| Configuración y uso del TPV (QR y ventas cruzadas) | 1 pt |
| Venta online funcional y registrada | 1 pt |
| **Memoria (documentación y claridad de evidencias)** | **1 pt** |

**Total: 10 puntos**
