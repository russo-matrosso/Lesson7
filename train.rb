class Train
  include Manufacturer
  include InstanceCounter

  attr_accessor :speed, :station, :wagons
  attr_reader :type, :number, :route

  NUMBER_FORMAT = /[0-9a-z_]{3}[-]?[0-9a-z_]{2}$/

  def self.find_train(number)
    @@all_trains[number] 
  end 

  @@all_trains = {}

  def initialize(number)
    #пользователь может создавать поезда
    @number = number
    validate!
    @type = type
    @wagons = []
    @speed = 0
    register_instance
    @@all_trains[number] = self
  end

  def valid?
      validate!
      true
    rescue
      false
    end

  def list_of_wagons
    wagons.each { |wagon| yield wagon } if block_given?
  end

  def add_wagons(wagon)
    #пользователь может добавлять вагоны
    if self.speed == 0
      self.wagons << wagon
    else
      puts "You must stop"
    end
  end

  def delete_wagons(wagon)
    #пользователь может отцеплять вагоны
    if self.speed == 0
      self.wagons.delete(wagon)
    else
      puts "You must stop"
    end
  end

  def route=(route)
    #пользователь может назначать маршрут поезду
    @route = route
    self.station = self.route.stations.first
    self.station.get_train(self)
  end

  def move_next_station
    #пользователь может перемещать поезд по маршруту вперед
    self.station.send_train(self)
    self.station = self.route.stations[self.route.stations.index(self.station) + 1]
    self.station.get_train(self)
  end

  def move_previous_station
    #пользователь может перемещать поезд по маршруту назад
    self.station = self.route.stations[self.route.stations.index(self.station) - 1]
  end

  def next_station
    #пользователь может просматривать следующую станию
    self.route.stations[self.route.stations.index(self.station) + 1]
  end

  def previous_station
    #пользователь может просматривать предыдущую станию
    self.route.stations[self.route.stations.index(self.station) - 1]
  end

  protected 

  def validate!
    raise "Number must be 5 simbols" if number.length < 5
    raise "Number has invalid format" if number !~ NUMBER_FORMAT
  end

  def boost_speed(speed)
    #пользователь не может увеличивать скорость поезда
    self.speed += speed
  end

  def stop
    #пользователь не может останавливать поезд
    self.speed = 0
  end
end

