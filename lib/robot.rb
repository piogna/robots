class Robot
  attr_reader :position, :items, :health
  attr_accessor :equipped_weapon

  def initialize
    @position = [0,0]
    @items = []
    @health = 100
  end

  def move_left
    @position[0] -= 1
  end

  def move_right
    @position[0] += 1
  end

  def move_up
    @position[1] += 1
  end

  def move_down
    @position[1] -= 1
  end

  def pick_up(item)
    if items_weight + item.weight <= 250
      @equipped_weapon = item if item.is_a? Weapon
      @items << item
    end

  end

  def items_weight
    return 0 if @items.length == 0
    items.inject(0){|sum,item| sum += item.weight }
  end

  def wound(amount)
    @health -= amount
    @health = 0 if @health < 0
  end

  def heal(amount)
    @health += amount
    @health = 100 if @health > 100
  end

  def heal!(amount)
    raise RobotAlreadyDeadError if health <= 0
    heal amount
  end

  def attack(enemy)
    unless equipped_weapon.nil?
      equipped_weapon.hit enemy
    else
      enemy.wound 5
    end
  end

  def attack!(enemy)
    raise UnattackableEnemyError unless enemy.is_a? Robot
    attack enemy
  end
end
