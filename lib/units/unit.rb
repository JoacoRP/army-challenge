class Unit
  attr_reader :training_bonus

  def initialize(training_bonus = 0)
    @training_bonus = training_bonus
  end

  # Subclasses must implement these methods
  def base_strength
    raise NotImplementedError, "Subclasses must implement base_strength"
  end

  def training_cost
    raise NotImplementedError, "Subclasses must implement training_cost"
  end

  def training_bonus_gain
    raise NotImplementedError, "Subclasses must implement training_bonus_gain"
  end

  def transformable?
    raise NotImplementedError, "Subclasses must implement transformable?"
  end

  def transform_target
    raise NotImplementedError, "Subclasses must implement transform_target"
  end

  def transformation_cost
    raise NotImplementedError, "Subclasses must implement transformation_cost"
  end

  # Calculate total strength (base + training bonuses)
  def strength
    base_strength + training_bonus
  end

  # Train this unit - increases training bonus, no decrease allowed
  def train
    @training_bonus += training_bonus_gain
  end

  # Return a new unit of the transformed type with training bonus preserved
  def transform
    raise TransformationNotAllowedError, "#{self.class.name} cannot be transformed" unless transformable?
    transform_target.new(training_bonus)
  end

  def unit_type
    self.class.name
  end
end
