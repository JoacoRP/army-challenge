# Army Challenge - Domain Model Implementation

A comprehensive domain-driven design implementation of the **Amalgama Army Challenge**, featuring armies, units, training, transformations, and battle mechanics.

## The Challenge

This project solves the Army Challenge from Amalgama, which requires modeling a system of:
- **Three civilizations** (Chinese, English, Byzantine) with different initial unit compositions
- **Three unit types** (Pikeman, Archer, Knight) with varying strength and capabilities
- **Training mechanics** where units gain strength by spending gold
- **Transformation mechanics** where units evolve into stronger forms while preserving training bonuses
- **Battle resolution** where armies clash and the stronger one wins, with specific consequences

For the complete challenge specification, see [amalgama_challenge.md](./amalgama_challenge.md).

## Solution Overview

This implementation provides:

✅ **Object-Oriented Domain Model**
- Pure Ruby classes representing the domain (no unnecessary persistence)
- Polymorphic unit types with encapsulated rules
- Clean separation of concerns between Army, Unit, Battle, and Civilization classes

✅ **Key Features**
- Army creation with civilization-specific initial units
- Unit training with gold management
- Unit transformation with training bonus preservation
- Battle mechanics with winner determination and consequences
- Complete error handling with custom exceptions

✅ **Design Patterns**
- **Inheritance**: Unit base class with Pikeman, Archer, Knight subclasses
- **Polymorphism**: Each unit type knows its own stats and rules
- **Composition**: Army "has many" units, not "is a" collection
- **Custom Exceptions**: Specific error types for validation

✅ **Edge Cases Handled**
- Training bonus preservation during unit transformation
- Gold constraint validation
- Tie battle resolution (both armies lose 1 unit)
- Invalid operations raise specific exceptions

## Prerequisites

- **Ruby**: 2.7+
- **Rails**: 8.1.1
- **Bundler**: Latest version

## Installation

```bash
# Clone the repository
cd army-challenge

# Install dependencies
bundle install
```

## Running Tests

Execute the full test suite with direct Ruby execution:

```bash
# Directly with ruby
ruby -Itest test/army_challenge_test.rb
```

Tests cover:
- ✅ Army creation by civilization
- ✅ Unit strength calculations
- ✅ Training mechanics
- ✅ Transformation with bonus preservation
- ✅ Battle resolution (attacker wins, defender wins, ties)
- ✅ Error handling and validation
- ✅ Edge cases

## Running the Example

See a complete walkthrough of the system in action:

```bash
# Execute the example with Rails runner
rails runner example.rb
```

The example demonstrates:
1. Creating armies from different civilizations
2. Training units and viewing strength changes
3. Transforming units while preserving training bonuses
4. Battle simulation with winner determination
5. Tracking battle history

## Project Structure

```
army-challenge/
├── app/
│   ├── models/
│   ├── controllers/
│   └── views/
├── lib/
│   ├── exceptions.rb              # Custom exception classes
│   ├── civilization.rb             # Civilization configuration
│   ├── army.rb                    # Army management and operations
│   ├── battle.rb                  # Battle resolution logic
│   └── units/
│       ├── unit.rb                # Abstract base class
│       ├── pikeman.rb             # Pikeman (strength: 5)
│       ├── archer.rb              # Archer (strength: 10)
│       └── knight.rb              # Knight (strength: 20)
├── test/
│   └── army_challenge_test.rb     # Comprehensive test suite
├── config/
│   └── initializers/
│       └── army_challenge.rb      # Rails initialization and autoloading
├── example.rb                      # Runnable example
├── Rakefile
├── Gemfile
└── README.md
```

## Architecture Highlights

### Unit Types and Stats

| Unit | Strength | Training Cost | Training Bonus | Transforms To |
|------|----------|---|---|---|
| Pikeman | 5 | 10 gold | +3 | Archer |
| Archer | 10 | 20 gold | +7 | Knight |
| Knight | 20 | 30 gold | +10 | Can't transform |

### Civilizations

| Civilization | Pikemen | Archers | Knights | Total Strength |
|--|--|--|--|--|
| Chinese | 2 | 25 | 2 | 300 |
| English | 10 | 10 | 10 | 350 |
| Byzantine | 5 | 8 | 15 | 385 |

### Battle Mechanics

- **Winner**: Army with higher total unit strength
- **Loser**: Loses 2 strongest units
- **Winner Reward**: +100 gold
- **Tie**: Both armies lose 1 unit

## Code Examples

### Creating an Army

```ruby
english = Army.new(:english)
puts "Units: #{english.units.length}"      # 30 units
puts "Gold: #{english.gold_coins}"         # 1000 gold
puts "Strength: #{english.total_strength}" # 350 strength
```

### Training a Unit

```ruby
pikeman = english.units.find { |u| u.is_a?(Pikeman) }
english.train_unit(pikeman)
puts "Strength increased to: #{pikeman.current_strength}" # 5 + 3 = 8
puts "Gold spent: #{1000 - english.gold_coins}"           # 10 gold
```

### Transforming with Bonus Preservation

```ruby
archer = english.units.find { |u| u.is_a?(Archer) }
archer.train(7)
archer.train(7)
archer.train(7)  # strength: 10 + 21 = 31

knight = english.transform_unit(archer)
puts "Knight strength: #{knight.current_strength}" # 20 + 21 = 41 (bonus preserved!)
```

### Battle Example

```ruby
english.attack(byzantine)
# Winner gets 100 gold
# Loser loses 2 strongest units
# Battle added to both armies' history
```

## Key Design Decisions

1. **No Persistence**: Objects exist only in memory (as per challenge specification)
2. **Pure Domain Model**: Located in `lib/`, independent of Rails framework
3. **Immutable Base Strength**: Cannot decrease, only training bonus increases strength
4. **Training Bonus Preservation**: Transfers to new unit type on transformation
5. **Extensibility**: New unit types can be added without modifying existing classes

## Challenge Questions Addressed

### "What if we add a Wizard unit in the future?"
**Answer**: Just create a new `Wizard` class inheriting from `Unit`. No existing code needs modification due to polymorphism.

### "What happens when an Archer is trained 3 times then transformed?"
**Answer**: The training bonus (3 × 7 = 21) is preserved on the Knight, resulting in strength 20 + 21 = 41.

### "How does the program handle errors?"
**Answer**: Custom exceptions are raised:
- `InsufficientGoldError` - trying to train/transform without enough gold
- `TransformationNotAllowedError` - transforming a Knight or invalid unit
- `NoUnitsForBattleError` - attacking with no units
- `InvalidCivilizationError` - invalid civilization name

## Testing Strategy

The test suite uses Minitest and covers:
- Unit creation and composition
- Strength calculations
- Training mechanics with gold constraints
- Transformation with bonus preservation
- Battle outcomes and consequences
- Error handling for invalid operations
- Edge cases (ties, empty armies, insufficient resources)

Run tests with:
```bash
ruby -Itest test/army_challenge_test.rb    # All tests
```

## Version

**1.0** - Complete implementation with full test coverage

## License

MIT
