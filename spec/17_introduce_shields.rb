require_relative 'spec_helper'

describe Robot do
  before :each do
    @rob = Robot.new
  end
  describe "Shields" do
    it "should be 50 by default" do
      expect(@rob.shields).to eq(50)
    end

    it "should be affected by damage before health" do
      @rob.wound(25)
      expect(@rob.shields).to eq(25)
      expect(@rob.health).to eq(100)
    end
  end
end
