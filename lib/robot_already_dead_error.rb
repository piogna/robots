class RobotAlreadyDeadError < StandardError
  def initialize(message = "The robot is already dead!")
    super
  end
end
