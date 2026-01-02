# Diagrama de Clases - Jerarquía de Unidades

Representa la estructura de herencia de las clases de unidades en el sistema.

```mermaid
classDiagram
    class Unit {
        -training_bonus: int
        +initialize(training_bonus)
        +base_strength()* int
        +training_cost()* int
        +training_bonus_gain()* int
        +transformable()* bool
        +transform_target()* Class
        +transformation_cost()* int
        +strength() int
        +train() void
        +transform() Unit
        +unit_type() string
    }

    class Pikeman {
        +base_strength() 5
        +training_cost() 10
        +training_bonus_gain() 3
        +transformable() true
        +transform_target() Archer
        +transformation_cost() 30
    }

    class Archer {
        +base_strength() 10
        +training_cost() 20
        +training_bonus_gain() 7
        +transformable() true
        +transform_target() Knight
        +transformation_cost() 40
    }

    class Knight {
        +base_strength() 20
        +training_cost() 30
        +training_bonus_gain() 10
        +transformable() false
        +transform_target() nil
        +transformation_cost() nil
    }

    Unit <|-- Pikeman
    Unit <|-- Archer
    Unit <|-- Knight
```

## Características

- **Unit**: Clase base abstracta que define la interfaz común
- **Pikeman**: Primera forma, fuerza base 5
- **Archer**: Segunda forma, fuerza base 10
- **Knight**: Tercera forma (final), fuerza base 20
