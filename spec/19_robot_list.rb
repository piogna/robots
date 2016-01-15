require_relative 'spec_helper'

describe "Robot List" do
  before :each do
    @rob = Robot.new
  end

  it "should be able to access all created robots" do
    expect(Robot.list[0]).to eq(@rob)
  end
end
