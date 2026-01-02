class Pikeman < Unit
  def base_strength
    5
  end

  def training_cost
    10
  end

  def training_bonus_gain
    3
  end

  def transformable?
    true
  end

  def transform_target
    Archer
  end

  def transformation_cost
    30
  end
end
