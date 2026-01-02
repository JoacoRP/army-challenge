class Archer < Unit
  def base_strength
    10
  end

  def training_cost
    20
  end

  def training_bonus_gain
    7
  end

  def transformable?
    true
  end

  def transform_target
    Knight
  end

  def transformation_cost
    40
  end
end
