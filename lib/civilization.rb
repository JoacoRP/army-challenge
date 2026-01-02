class Civilization
  CIVILIZATIONS = {
    chinese: {
      pikemen: 2,
      archers: 25,
      knights: 2
    },
    english: {
      pikemen: 10,
      archers: 10,
      knights: 10
    },
    byzantine: {
      pikemen: 5,
      archers: 8,
      knights: 15
    }
  }.freeze

  attr_reader :name

  def initialize(name)
    name = name.to_sym.downcase
    raise InvalidCivilizationError, "Unknown civilization: #{name}" unless CIVILIZATIONS.key?(name)
    @name = name
  end

  def initial_units
    config = CIVILIZATIONS[@name]
    units = []
    config[:pikemen].times { units << Pikeman.new }
    config[:archers].times { units << Archer.new }
    config[:knights].times { units << Knight.new }
    units
  end

  def self.valid_civilizations
    CIVILIZATIONS.keys
  end
end
