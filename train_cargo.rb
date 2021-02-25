class CargoTrain < Train
  attr_reader :type
  
  def initialize(number)
    super
    @type = :cargo
  end


  protected

  def boost_speed(speed)
    #пользователь не может увеличивать скорость поезда
    self.speed += speed
  end

  def stop
    #пользователь не может останавливать поезд
    self.speed = 0
  end
end

