# Flujo de Entrenamiento de Unidad

Proceso completo de entrenamiento de una unidad militar.

```mermaid
flowchart TD
    A["Iniciar Entrenamiento<br/>(unit, army)"] --> B{"¿Unidad pertenece<br/>al ejército?"}
    B -->|No| C["Error: NoUnitsAvailableError"]
    B -->|Sí| D{"¿Oro suficiente?<br/>(costo: training_cost)"}
    D -->|No| E["Error: InsufficientGoldError"]
    D -->|Sí| F["Restar oro del ejército<br/>gold_coins -= training_cost"]
    F --> G["Incrementar bonus de entrenamiento<br/>training_bonus += training_bonus_gain"]
    G --> H["Calcular nueva fuerza<br/>strength = base + training_bonus"]
    H --> I["Entrenamiento completado<br/>(fuerza nunca disminuye)"]
```

## Pasos

1. Verificar que la unidad pertenece al ejército
2. Verificar que hay suficiente oro
3. Deducir el costo del entrenamiento
4. Incrementar el bonus de entrenamiento
5. Recalcular la fuerza total de la unidad
