require_relative 'spec_helper'

describe Robot do
  before :each do
    @robot = Robot.new
    @enemy = Robot.new
    @item = Item.new "Beans", 5
  end

  describe "#attack!" do
    it "should deal damage to enemy robots" do
      11.times do
        @robot.attack(@enemy)
      end
      expect(@enemy.health).to eq(95)
    end

    it "should raise a UnattackableEnemyError if the robot is dead" do
      expect { @robot.attack!(@item)}.to raise_error(UnattackableEnemyError)
    end
  end

end
