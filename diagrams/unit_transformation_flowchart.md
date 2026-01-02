# Flujo de Transformación de Unidad

Proceso de transformación de una unidad a un tipo más fuerte, preservando el bonus de entrenamiento.

```mermaid
flowchart TD
    A["Iniciar Transformación<br/>(unit, army)"] --> B{"¿Unidad pertenece<br/>al ejército?"}
    B -->|No| C["Error: NoUnitsAvailableError"]
    B -->|Sí| D{"¿Unidad puede<br/>transformarse?"}
    D -->|No| E["Error: TransformationNotAllowedError"]
    D -->|Sí| F{"¿Oro suficiente?<br/>(costo: transformation_cost)"}
    F -->|No| G["Error: InsufficientGoldError"]
    F -->|Sí| H["Restar oro del ejército<br/>gold_coins -= transformation_cost"]
    H --> I["Guardar training_bonus<br/>bonus = unit.training_bonus"]
    I --> J["Crear nueva unidad del tipo target<br/>new_unit = TransformTarget.new(bonus)"]
    J --> K["Reemplazar unidad<br/>units.delete(old_unit)<br/>units.push(new_unit)"]
    K --> L["Transformación completada<br/>(bonus preservado)"]
```

## Características Clave

- **Preservación de Bonus**: El bonus de entrenamiento se transfiere a la nueva unidad
- **Validación**: Solo ciertas unidades pueden transformarse
- **Costo**: Cada transformación tiene un costo en oro
