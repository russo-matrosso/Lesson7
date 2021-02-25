class Station
  include InstanceCounter
  
  attr_reader :name, :trains

  def self.all_stations
    @@all_stations
  end

  @@all_stations = []

  def initialize(name)
    #пользователь может создавать станции
    @name = name
    validate!
    @trains = []
    register_instance
    @@all_stations << self
  end

  def valid?
    validate!
    true
  rescue
    false
  end

  def list_of_trains(block)
    trains.each do |train|
      block.call(train)
    end
  end

  def get_train(train)
    #пользователь не может принять станцией поезд
    self.trains << train
  end

  def send_train(train)
    #пользователь не может послать станией поезд
    self.trains.delete(train)
  end
  
  protected

  def validate!
    raise "Name can't be nill" if name == "" || name.nil?
         
  end


end






