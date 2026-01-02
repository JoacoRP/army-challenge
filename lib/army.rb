class Army
  attr_reader :civilization, :units, :gold_coins, :battle_history

  INITIAL_GOLD = 1000

  def initialize(civilization_name)
    @civilization = Civilization.new(civilization_name)
    @gold_coins = INITIAL_GOLD
    @units = @civilization.initial_units
    @battle_history = []
  end

  # Calculate total strength of the army
  def total_strength
    @units.sum(&:strength)
  end

  # Train a specific unit
  # Raises InsufficientGoldError if not enough gold
  def train_unit(unit)
    raise NoUnitsAvailableError, "Unit is not part of this army" unless @units.include?(unit)

    cost = unit.training_cost
    raise InsufficientGoldError, "Insufficient gold (need #{cost}, have #{@gold_coins})" if @gold_coins < cost

    @gold_coins -= cost
    unit.train
  end

  # Transform a unit to a new type
  # Raises TransformationNotAllowedError if unit cannot be transformed
  # Raises InsufficientGoldError if not enough gold
  def transform_unit(unit)
    raise NoUnitsAvailableError, "Unit is not part of this army" unless @units.include?(unit)
    raise TransformationNotAllowedError, "#{unit.unit_type} cannot be transformed" unless unit.transformable?

    cost = unit.transformation_cost
    raise InsufficientGoldError, "Insufficient gold (need #{cost}, have #{@gold_coins})" if @gold_coins < cost

    @gold_coins -= cost
    new_unit = unit.transform
    @units.delete(unit)
    @units << new_unit
    new_unit
  end

  # Get the unit with the most strength
  def strongest_unit
    @units.max_by(&:strength)
  end

  # Get the unit with the least strength
  def weakest_unit
    @units.min_by(&:strength)
  end

  # Remove the two strongest units (used when losing a battle)
  def lose_two_strongest_units
    raise NoUnitsAvailableError, "Not enough units to lose" if @units.length < 2

    strongest = strongest_unit
    @units.delete(strongest)
    second_strongest = strongest_unit
    @units.delete(second_strongest)
  end

  # Remove one unit (used in case of tie in battle)
  def lose_weakest_unit
    raise NoUnitsAvailableError, "No units available to lose" if @units.empty?

    weak = weakest_unit
    @units.delete(weak)
  end

  # Add gold to the army
  def add_gold(amount)
    @gold_coins += amount
  end

  # Attack another army
  def attack(defender)
    raise NoUnitsForBattleError, "Attacker army has no units" if @units.empty?
    raise NoUnitsForBattleError, "Defender army has no units" if defender.units.empty?

    Battle.new(self, defender).resolve
  end

  # Record a battle in history
  def record_battle(battle)
    @battle_history << battle
  end
end
