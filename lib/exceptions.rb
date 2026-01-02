class ArmyError < StandardError; end
class InsufficientGoldError < ArmyError; end
class TransformationNotAllowedError < ArmyError; end
class InvalidCivilizationError < ArmyError; end
class NoUnitsAvailableError < ArmyError; end
class NoUnitsForBattleError < ArmyError; end
