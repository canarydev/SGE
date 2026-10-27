En esta actividad vamos a trabajar con los datos reales de las ventas registradas en el módulo Punto de Venta (POS) de Odoo.

La tienda dispone de un gran volumen de ventas y necesita analizar la información para conocer mejor a sus clientes, identificar los productos más vendidos y descubrir hábitos de compra.

Para ello, deberás realizar **4 consultas SQL de dificultad progresiva**, utilizando las tablas de PostgreSQL correspondientes.

## 2. Consultas que debes realizar

### Consulta 1. Los 10 productos más vendidos (1,5 puntos)

Obtén un **ranking de los 10 productos más vendidos** de la tienda, ordenados por el número total de unidades vendidas, **de mayor a menor**.

La consulta debe mostrar:

- Nombre del producto.
- Número total de unidades vendidas.

**Ejemplo de resultado:**

| Producto | Unidades vendidas |
|---|---:|
| Café con leche | 348 |
| Bocadillo | 287 |
| Refresco | 251 |

### Consulta 2. El cliente que más dinero ha gastado (2 puntos)

La dirección de la tienda quiere saber **qué cliente ha gastado más dinero** teniendo en cuenta todas las compras que ha realizado.

Deberás obtener el cliente que más dinero ha gastado, sumando el importe de todos sus pedidos.

La consulta debe mostrar:

- Nombre del cliente.
- Cantidad total gastada en euros.

**Importante:** No deben tenerse en cuenta las ventas que no tengan un cliente identificado.

**Ejemplo de resultado:**

| Cliente | Total gastado (€) |
|---|---:|
| Ana García | 1.248,50 |

### Consulta 3. El producto favorito de cada cliente (3 puntos)

Queremos conocer los gustos de nuestros clientes.

Para ello, deberás averiguar **cuál es el producto que más unidades ha comprado cada cliente**, teniendo en cuenta todas las compras que ha realizado.

La consulta debe mostrar:

- Nombre del cliente.
- Nombre del producto más comprado.
- Número total de unidades compradas de ese producto.

**Importante:**

- Cada cliente debe aparecer una sola vez.
- Se deben sumar las unidades adquiridas en diferentes pedidos.
- Si un cliente tiene varios productos empatados en el primer puesto, puedes mostrar cualquiera de ellos.

**Ejemplo de resultado:**

| Cliente | Producto favorito | Unidades compradas |
|---|---|---:|
| Ana García | Café con leche | 28 |
| Luis Pérez | Bocadillo | 19 |
| Marta López | Refresco | 34 |

### Consulta 4. ¿Qué productos se compran juntos? (3,5 puntos)

La dirección quiere descubrir **qué combinaciones de productos compran habitualmente los clientes** para diseñar ofertas y promociones.

Deberás obtener un ranking de las **10 parejas de productos que aparecen juntos en un mayor número de pedidos**.

La consulta debe mostrar:

- Nombre del primer producto.
- Nombre del segundo producto.
- Número de pedidos en los que se han comprado juntos.

**Importante:**

- Los dos productos deben pertenecer al mismo pedido.
- No se debe relacionar un producto consigo mismo.
- Una pareja no puede aparecer duplicada por el orden de los productos. Por ejemplo, «Café + Bocadillo» y «Bocadillo + Café» son la misma combinación.
- Si un producto aparece varias veces dentro del mismo pedido, deberá contarse una sola vez.

**Ejemplo de resultado:**

| Producto 1 | Producto 2 | Compras conjuntas |
|---|---|---:|
| Café | Bocadillo | 148 |
| Refresco | Patatas | 97 |
| Café | Croissant | 81 |

## 3. Información técnica

Para realizar las consultas, puedes utilizar las siguientes tablas de Odoo:

| Tabla | Descripción |
|---|---|
| `pos_order` | Información de los pedidos realizados en el TPV. |
| `pos_order_line` | Líneas de pedido, productos vendidos y cantidades. |
| `res_partner` | Información de los clientes. |
| `product_product` | Variantes de los productos. |
| `product_template` | Información general y nombre de los productos. |

**Nota:** En Odoo 16, el campo `name` de `product_template` puede estar almacenado en formato JSONB debido al sistema de traducciones.

## 4. Condiciones de realización

1. Todas las consultas deberán realizarse utilizando SQL compatible con PostgreSQL.
2. No se permite utilizar el ORM de Odoo.
3. Deberás utilizar las relaciones entre tablas que sean necesarias.
4. Los resultados deberán estar ordenados según se indique en cada ejercicio.
5. Deberán excluirse los pedidos cancelados y tenerse en cuenta las devoluciones para no contabilizarlas como ventas positivas.
6. Las consultas deberán funcionar independientemente del número de registros existentes en la base de datos.

## 5. Entrega de la actividad

Deberás entregar un documento que contenga, para cada ejercicio:

- **Número y título de la consulta.**
- **Código SQL completo.**
- **Captura de pantalla del resultado obtenido** al ejecutar la consulta sobre PostgreSQL.

## 6. Criterios de evaluación

| Ejercicio | Puntuación máxima |
|---|---:|
| Consulta 1. Los 10 productos más vendidos | 1,5 puntos |
| Consulta 2. El cliente que más dinero ha gastado | 2 puntos |
| Consulta 3. El producto favorito de cada cliente | 3 puntos |
| Consulta 4. Productos que se compran juntos | 3,5 puntos |
| **TOTAL** | **10 puntos** |

Se valorará que las consultas devuelvan la información solicitada, utilicen correctamente las relaciones entre tablas, agrupen los datos cuando sea necesario y eviten resultados duplicados o incorrectos.
