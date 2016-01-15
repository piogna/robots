require_relative 'spec_helper'
describe BFG do
  before :each do
    @bfg = BFG.new
  end
  it "should be a type of weapon" do
    expect(@bfg).to be_a Weapon
  end

  it "should weigh 70" do
    expect(@bfg.weight).to eq(70)
  end

  it "should do 30 damage" do
    expect(@bfg.damage).to eq(30)
  end

  describe "#attack with BFG" do
    before :each do
      @rob = Robot.new
      @en1 = Robot.new
      @en1.move_up
      @en2 = Robot.new
      @en2.move_down
      @en3 = Robot.new
      @en3.move_left
      @en4 = Robot.new
      @en4.move_right
      @rob.equipped_weapon = @bfg
    end

    it "should attack all adjacent enemies" do
      expect(@en1).to receive(:special_wound)
      expect(@en2).to receive(:special_wound)
      expect(@en3).to receive(:special_wound)
      expect(@en4).to receive(:special_wound)
      @rob.special_attack
    end

    it "should ignore shields" do
      @rob.special_attack
      expect(@en1.health).to eq(70)
      expect(@en2.health).to eq(70)
      expect(@en3.health).to eq(70)
      expect(@en4.health).to eq(70)
    end
  end
end
