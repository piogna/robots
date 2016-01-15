require 'pry'
class Robot
  attr_reader :position, :items, :health
  attr_accessor :equipped_weapon, :shields


  def initialize
    @position = [0,0]
    @items = []
    @health = 100
    @shields = 50
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
      if item.is_a?(BoxOfBolts) && health <= 80
        item.feed self
      else
        @items << item
      end
    end

  end

  def items_weight
    return 0 if @items.length == 0
    items.inject(0){ |sum,item| sum + item.weight }
  end

  def wound(amount)
    if amount < shields
      @shields -= amount
    else
      amount -= shields
      @shields = 0
      @health -= amount
      @health = 0 if @health < 0
    end
  end

  def special_wound(amount)
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
      if equipped_weapon.is_a? BFG
        equipped_weapon.hit enemy
      else
        enemy_in_range? enemy, equipped_weapon.range
        equipped_weapon.hit enemy
        self.equipped_weapon = nil if equipped_weapon.is_a? Grenade
      end
    else
      enemy.wound 5 if enemy_in_range? enemy, 1
    end
  end

  def special_attack
    if equipped_weapon.is_a? BFG
      robots_up = Robot.in_position([position[0], position[1] + 1])
      robots_down = Robot.in_position([position[0], position[1] - 1])
      robots_left = Robot.in_position([position[0] - 1, position[1]])
      robots_right = Robot.in_position([position[0] + 1, position[1]])
      robots = robots_up + robots_down + robots_left + robots_right

      robots.each { |robot| attack robot }
      @equipped_weapon = nil
    else
      false
    end
  end

  def attack!(enemy)
    raise UnattackableEnemyError unless enemy.is_a? Robot
    attack enemy
  end

  def self.list
    ObjectSpace.each_object(self).to_a
  end

  def self.in_position(position)
    self.list.select { |rob| rob.position == position}
  end

  private
  def enemy_in_range?(enemy, range)
    Math.sqrt((enemy.position[0] - position[0])**2.0 +
              (enemy.position[1] - position[1])**2.0) <= range
  end
end
