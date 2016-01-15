require_relative 'spec_helper'

describe Battery do
  before :each do
    @battery = Battery.new
  end

  it "should be named 'Battery'" do
    expect(@battery.name).to eq("Battery")
  end

  it "should weigh 25" do
    expect(@battery.weight).to eq(25)
  end

  it "should be a kind of Item" do
    expect(@battery).to be_kind_of(Item)
  end

  it "should be able to recharge a robots shield" do
    robot = Robot.new
    robot.wound(25)
    @battery.recharge(robot)
    expect(robot.shields).to eq(50)
  end
end
