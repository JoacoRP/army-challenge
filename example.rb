#!/usr/bin/env ruby
# Example usage of the Army Challenge system
# Execute with: rails runner example.rb

puts "ARMY CHALLENGE - EXAMPLE"

# Create two armies from different civilizations
puts "\n1. Creating armies"
english_army = Army.new(:english)
byzantine_army = Army.new(:byzantine)

puts "English Army: #{english_army.units.length} units, #{english_army.gold_coins} gold"
puts "Byzantine Army: #{byzantine_army.units.length} units, #{byzantine_army.gold_coins} gold"

# Train some units
puts "\n2. Training units"
english_pikeman = english_army.units.find { |u| u.is_a?(Pikeman) }
puts "English Pikeman strength before training: #{english_pikeman.strength}"

3.times do
  english_army.train_unit(english_pikeman)
  puts "  - Trained pikeman, strength now: #{english_pikeman.strength}, gold left: #{english_army.gold_coins}"
end

# Transform a unit
puts "\n3. Transforming units"
english_archer = english_army.units.find { |u| u.is_a?(Archer) }
puts "English Archer strength before transformation: #{english_archer.strength}"

new_knight = english_army.transform_unit(english_archer)
puts "Transformed to Knight with strength: #{new_knight.strength} (training bonus preserved)"
puts "Gold remaining: #{english_army.gold_coins}"

# Battle
puts "\n4. Battle Time!"
puts "English Army total strength: #{english_army.total_strength}"
puts "Byzantine Army total strength: #{byzantine_army.total_strength}"

battle = english_army.attack(byzantine_army)

puts "\nBattle Result:"
if battle.winner
  puts "  Winner: #{battle.winner.civilization.name.upcase}"
  puts "  Winner received 100 gold"
else
  puts "  Result: TIE - Both armies lost their weakest unit"
end

puts "  English Army units remaining: #{english_army.units.length}"
puts "  Byzantine Army units remaining: #{byzantine_army.units.length}"

puts "\n5. Final Status"
puts "English Army: #{english_army.units.length} units, #{english_army.gold_coins} gold, #{english_army.battle_history.length} battles"
puts "Byzantine Army: #{byzantine_army.units.length} units, #{byzantine_army.gold_coins} gold, #{byzantine_army.battle_history.length} battles"

puts "Example completed successfully!"
