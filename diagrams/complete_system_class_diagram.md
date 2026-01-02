# Diagrama de Clases - Sistema Completo

Visión general del sistema completo incluyendo todas las entidades principales y sus relaciones.

```mermaid
classDiagram
    class Army {
        -civilization: Civilization
        -units: Unit[]
        -gold_coins: int
        -battle_history: Battle[]
        +initialize(civilization_name)
        +total_strength() int
        +train_unit(unit) void
        +transform_unit(unit) Unit
        +strongest_unit() Unit
        +weakest_unit() Unit
        +lose_two_strongest_units() void
        +lose_weakest_unit() void
        +add_gold(amount) void
        +attack(defender) Battle
        +record_battle(battle) void
    }

    class Civilization {
        -name: symbol
        +CIVILIZATIONS: Hash
        +initialize(name)
        +initial_units() Unit[]
        +valid_civilizations() symbol[]
    }

    class Battle {
        -attacker: Army
        -defender: Army
        -winner: Army
        -timestamp: Time
        +initialize(attacker, defender)
        +resolve() Battle
        +winner_name() string
    }

    class Unit {
        <<abstract>>
        -training_bonus: int
        +strength() int
        +train() void
        +transform() Unit
        +unit_type() string
    }

    class Pikeman {
    }

    class Archer {
    }

    class Knight {
    }

    Army --> Civilization: "has a"
    Army --> Unit: "has many"
    Army --> Battle: "has many"
    Battle --> Army: "involves (2x)"
    Unit <|-- Pikeman
    Unit <|-- Archer
    Unit <|-- Knight
```

## Estructura

- **Army**: Entidad principal que gestiona ejércitos
- **Civilization**: Configuración de civilizaciones
- **Battle**: Resolución de batallas
- **Unit** (con subclases): Modelo de unidades militares
