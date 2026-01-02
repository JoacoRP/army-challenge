# Flujo de Batalla

Proceso completo de resolución de una batalla entre dos ejércitos.

```mermaid
flowchart TD
    A["Iniciar Batalla<br/>(attacker, defender)"] --> B{"¿Ambos tienen<br/>unidades?"}
    B -->|No| C["Error: NoUnitsForBattleError"]
    B -->|Sí| D["Calcular fuerza total<br/>attacker_str = sum(units.strength)<br/>defender_str = sum(units.strength)"]
    D --> E{"Comparar<br/>fuerzas"}

    E -->|attacker > defender| F["Gana Atacante"]
    F --> F1["Defensor pierde 2 unidades<br/>más fuertes"]
    F1 --> F2["Atacante gana 100 oro<br/>gold_coins += 100"]
    F2 --> F3["winner = attacker"]

    E -->|defender > attacker| G["Gana Defensor"]
    G --> G1["Atacante pierde 2 unidades<br/>más fuertes"]
    G1 --> G2["Defensor gana 100 oro<br/>gold_coins += 100"]
    G2 --> G3["winner = defender"]

    E -->|attacker = defender| H["Empate"]
    H --> H1["Ambos pierden su unidad<br/>más débil"]
    H1 --> H2["winner = nil"]

    F3 --> I["Registrar batalla en historial<br/>de ambos ejércitos"]
    G3 --> I
    H2 --> I
    I --> J["Batalla completada"]
```

## Consecuencias

- **Victoria**: Ganador obtiene 100 oro, perdedor pierde 2 unidades más fuertes
- **Empate**: Ambos pierden 1 unidad más débil
