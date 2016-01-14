require_relative 'spec_helper'

describe Robot do
  before :each do
    @robot = Robot.new
  end

  describe "#heal!" do
    it "should heal the robot if it is not dead" do
      @robot.wound(40)
      @robot.heal!(20)
      expect(@robot.health).to eq(80)
    end

    it "should raise a RobotAlreadyDeadError if the robot is dead" do
      @robot.wound(100)
      expect { @robot.heal!(10)}.to raise_error(RobotAlreadyDeadError)
    end
  end

end
