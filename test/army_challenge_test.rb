require_relative '../lib/exceptions'
require_relative '../lib/units/unit'
require_relative '../lib/units/pikeman'
require_relative '../lib/units/archer'
require_relative '../lib/units/knight'
require_relative '../lib/civilization'
require_relative '../lib/army'
require_relative '../lib/battle'

class ArmyTest
  def run
    puts "Army Challenge Test Suite"
    test_unit_creation
    test_civilization_initialization
    test_training
    test_transformation
    test_battle
    test_error_handling
    puts "\nAll tests passed!"
  end

  private

  def test_unit_creation
    puts "\n[TEST] Unit Creation"
    pikeman = Pikeman.new
    archer = Archer.new
    knight = Knight.new

    assert_equal 5, pikeman.base_strength, "Pikeman base strength"
    assert_equal 10, archer.base_strength, "Archer base strength"
    assert_equal 20, knight.base_strength, "Knight base strength"
    puts "Unit creation successful"
  end

  def test_civilization_initialization
    puts "\n[TEST] Civilization Initialization"
    chinese_army = Army.new(:chinese)
    english_army = Army.new(:english)
    byzantine_army = Army.new(:byzantine)

    assert_equal 29, chinese_army.units.length, "Chinese army unit count (2+25+2)"
    assert_equal 30, english_army.units.length, "English army unit count (10+10+10)"
    assert_equal 28, byzantine_army.units.length, "Byzantine army unit count (5+8+15)"
    assert_equal 1000, chinese_army.gold_coins, "Initial gold"
    puts "Civilization initialization successful"
  end

  def test_training
    puts "\n[TEST] Training Units"
    army = Army.new(:english)
    pikeman = army.units.find { |u| u.is_a?(Pikeman) }

    initial_strength = pikeman.strength
    army.train_unit(pikeman)
    assert_equal initial_strength + 3, pikeman.strength, "Pikeman trained strength"
    assert_equal 1000 - 10, army.gold_coins, "Gold deducted after training"

    # Train 3 times
    3.times { army.train_unit(pikeman) }
    assert_equal initial_strength + (3 * 4), pikeman.strength, "Pikeman trained 4 times total"
    assert_equal 1000 - (4 * 10), army.gold_coins, "Gold deducted for 4 trainings"
    puts "Training successful"
  end

  def test_transformation
    puts "\n[TEST] Transformation"
    army = Army.new(:english)
    pikeman = army.units.find { |u| u.is_a?(Pikeman) }

    # Train pikeman 3 times then transform
    3.times { army.train_unit(pikeman) }
    training_bonus = pikeman.training_bonus
    initial_unit_count = army.units.length

    new_archer = army.transform_unit(pikeman)

    assert_equal true, new_archer.is_a?(Archer), "Transformed to Archer"
    assert_equal training_bonus, new_archer.training_bonus, "Training bonus preserved"
    assert_equal initial_unit_count, army.units.length, "Unit count unchanged"
    assert_equal 1000 - (3 * 10) - 30, army.gold_coins, "Gold deducted for training and transformation"
    puts "Transformation successful with bonus preservation"
  end

  def test_battle
    puts "\n[TEST] Battle Resolution"
    attacker = Army.new(:english)
    defender = Army.new(:chinese)

    initial_attacker_gold = attacker.gold_coins
    initial_defender_units = defender.units.length

    battle = attacker.attack(defender)

    # Check that battle was resolved
    assert_equal true, battle.is_a?(Battle), "Battle resolved"
    
    # If attacker won
    if battle.winner == attacker
      assert_equal initial_attacker_gold + 100, attacker.gold_coins, "Winner received gold"
      assert_equal true, initial_defender_units > defender.units.length, "Loser lost units"
    elsif battle.winner == defender
      assert_equal initial_attacker_gold + 100, defender.gold_coins, "Winner received gold"
    else
      # Tie case
      assert_equal initial_defender_units - 1, defender.units.length, "Both lost weakest unit in tie"
    end

    assert_equal 1, attacker.battle_history.length, "Battle recorded in attacker history"
    assert_equal 1, defender.battle_history.length, "Battle recorded in defender history"
    puts "Battle resolution successful"
  end

  def test_error_handling
    puts "\n[TEST] Error Handling"
    army = Army.new(:english)
    knight = army.units.find { |u| u.is_a?(Knight) }

    # Test transformation not allowed
    begin
      army.transform_unit(knight)
      raise "Should have raised TransformationNotAllowedError"
    rescue TransformationNotAllowedError
      puts "Transformation error caught correctly"
    end

    # Test insufficient gold
    army.instance_variable_set(:@gold_coins, 5)
    pikeman = army.units.find { |u| u.is_a?(Pikeman) }
    begin
      army.train_unit(pikeman)
      raise "Should have raised InsufficientGoldError"
    rescue InsufficientGoldError
      puts "Insufficient gold error caught correctly"
    end

    # Test invalid civilization
    begin
      Army.new(:martian)
      raise "Should have raised InvalidCivilizationError"
    rescue InvalidCivilizationError
      puts "Invalid civilization error caught correctly"
    end
  end

  def assert_equal(expected, actual, message)
    unless expected == actual
      raise "Assertion failed: #{message}\nExpected: #{expected}\nActual: #{actual}"
    end
  end
end

# Run tests
ArmyTest.new.run
