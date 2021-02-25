class CargoWagon < Wagon
  attr_reader :wagon_type, :total_volume
  attr_accessor :total_load_volume

  def initialize(wagon_number, total_volume)
    @wagon_number = wagon_number
    @wagon_type = :cargo 
    @total_volume = total_volume
    @total_load_volume = 0
  end

  def load_wagon(volume)
    self.total_load_volume += volume
  end

  def total_free_volume
    total_volume - total_load_volume
  end

end