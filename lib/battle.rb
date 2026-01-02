class Battle
  attr_reader :attacker, :defender, :winner, :timestamp

  VICTORY_GOLD_REWARD = 100

  def initialize(attacker, defender)
    @attacker = attacker
    @defender = defender
    @timestamp = Time.now
    @winner = nil
  end

  # Resolve the battle and apply consequences
  def resolve
    attacker_strength = @attacker.total_strength
    defender_strength = @defender.total_strength

    case
    when attacker_strength > defender_strength
      resolve_attacker_victory
    when defender_strength > attacker_strength
      resolve_defender_victory
    else
      resolve_tie
    end

    # Record battle in both armies' history
    @attacker.record_battle(self)
    @defender.record_battle(self)

    self
  end

  def winner_name
    @winner ? @winner.civilization.name : "Tie"
  end

  private

  def resolve_attacker_victory
    @winner = @attacker
    @defender.lose_two_strongest_units
    @attacker.add_gold(VICTORY_GOLD_REWARD)
  end

  def resolve_defender_victory
    @winner = @defender
    @attacker.lose_two_strongest_units
    @defender.add_gold(VICTORY_GOLD_REWARD)
  end

  def resolve_tie
    @winner = nil
    @attacker.lose_weakest_unit
    @defender.lose_weakest_unit
  end
end
