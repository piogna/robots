require_relative 'spec_helper'

describe "Robot.in_position" do
  it "should return all robots that are at a given position" do
    rob1 = Robot.new
    rob2 = Robot.new
    rob3 = Robot.new

    Robot.list[0].move_left
    Robot.list[1].move_left
    Robot.list[2].move_right
    expect(Robot.in_position([-1,0]).length).to eq(2)
  end
end
