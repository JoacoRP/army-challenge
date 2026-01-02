class Knight < Unit
  def base_strength
    20
  end

  def training_cost
    30
  end

  def training_bonus_gain
    10
  end

  def transformable?
    false
  end

  def transform_target
    nil
  end

  def transformation_cost
    nil
  end
end
