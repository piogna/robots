class UnattackableEnemyError < StandardError
  def initialize(message = "That enemy is unattackable")
    super
  end
end
