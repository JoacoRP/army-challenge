# Diagrama de Excepción - Validaciones

Sistema completo de validaciones y excepciones del sistema.

```mermaid
graph TD
    A["Operación Solicitada"] --> B{Validación}

    B --> B1["train_unit()"]
    B1 --> B1V{Validar}
    B1V -->|Unidad no en ejército| B1E["NoUnitsAvailableError"]
    B1V -->|Oro insuficiente| B1E
    B1V -->|✓ Válido| B1S["Entrenar"]

    B --> B2["transform_unit()"]
    B2 --> B2V{Validar}
    B2V -->|Unidad no en ejército| B2E["NoUnitsAvailableError"]
    B2V -->|No transformable| B2E
    B2V -->|Oro insuficiente| B2E
    B2V -->|✓ Válido| B2S["Transformar"]

    B --> B3["attack()"]
    B3 --> B3V{Validar}
    B3V -->|Atacante sin unidades| B3E["NoUnitsForBattleError"]
    B3V -->|Defensor sin unidades| B3E
    B3V -->|✓ Válido| B3S["Batalla"]

    B --> B4["new(civilization)"]
    B4 --> B4V{Validar}
    B4V -->|Civilización inválida| B4E["InvalidCivilizationError"]
    B4V -->|✓ Válido| B4S["Crear Ejército"]

    B1S --> OK["Operación Completada"]
    B2S --> OK
    B3S --> OK
    B4S --> OK

    B1E --> FAIL["Operación Rechazada"]
    B2E --> FAIL
    B3E --> FAIL
    B4E --> FAIL

    style B1E fill:#ffcdd2
    style B2E fill:#ffcdd2
    style B3E fill:#ffcdd2
    style B4E fill:#ffcdd2
    style B1S fill:#c8e6c9
    style B2S fill:#c8e6c9
    style B3S fill:#c8e6c9
    style B4S fill:#c8e6c9
    style OK fill:#c8e6c9
    style FAIL fill:#ffcdd2
```

## Excepciones Personalizadas

- `NoUnitsAvailableError`: Unidad no pertenece al ejército
- `NoUnitsForBattleError`: Ejército sin unidades
- `TransformationNotAllowedError`: Unidad no transformable
- `InsufficientGoldError`: Oro insuficiente
- `InvalidCivilizationError`: Civilización no válida
