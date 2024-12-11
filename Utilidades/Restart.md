Programar un módulo suele ser una tarea un tanto tediosa, ya que, en muchas ocasiones hay que salir de la pestaña actual para reiniciar Odoo, luego volver a Odoo para hacer click en varios sitios y actualizar... Vamos, un coñazo.

Aquí está la solución que estás buscando y que te hará todo mucho más sencillo.

En primer lugar, debes crear un nuevo modelo `restart.py` dentro del módulo que quieras crear:

```python
import sys
import os
from odoo import models, api, exceptions

class Restart(models.TransientModel):
    _name = 'my_module.restart'
    _description = 'Restart'

    @api.model
    def do_restart(self):
        if self.env.user.has_group('base.group_system'):
            try:
                self.env.cr.commit()  # Confirmar cualquier cambio pendiente en la base de datos
                self.env.cr.close()   # Cerrar la conexión a la base de datos actual
                os.execv(sys.executable, ['python3'] + sys.argv)
            except Exception as e:
                raise exceptions.UserError(f"Error al reiniciar Odoo: {e}")
        else:
            raise exceptions.AccessError("No tienes permiso para reiniciar Odoo")
```

Cambia `my_module` por el nombre de tu módulo.

Ahora crea `restart.xml`:

```xml
<odoo>
  <data>

    <!--Acción reset-->
    <record id="action_restart_odoo" model="ir.actions.server">
      <field name="name">Reiniciar Odoo</field>
      <field name="model_id" ref="my_module.model_my_module_restart"/>
      <field name="state">code</field>
      <field name="code">model.env['my_module.restart'].do_restart()</field>
    </record>

    <!--Acción actualización--> 
    <record id="action_update_my_module" model="ir.actions.server">
      <field name="name">Actualizar Módulos</field>
      <field name="model_id" ref="base.model_ir_module_module"/>
      <field name="binding_model_id" ref="base.model_ir_module_module"/>
      <field name="state">code</field>
      <field name="code">
          action = env['ir.module.module'].search([('name', '=', 'my_module')]).button_immediate_upgrade()
      </field>
    </record>


    <!--Elemento menú-->
    <menuitem id="menu_reset_odoo"
          name="Reiniciar Odoo "
          action="action_restart_odoo"
          sequence="8"/>

    <menuitem id="menu_update_my_module"
          name="Actualizar my_module"
          action="action_update_my_module"
          sequence="9"/>
  </data>
</odoo>
```

Vuelve a cambiar `my_module` por el nombre de tu módulo.

> **Nota**: Puedes cambiar el elemento de menú y ponerlo donde tú quieras.
