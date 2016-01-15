class BFG < Weapon
  def initialize
    super "BFG", 70, 30, 1
  end

  def hit(enemy)
    enemy.special_wound damage
  end
end
