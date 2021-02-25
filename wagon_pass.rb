class PassengerWagon < Wagon
  attr_accessor :total_taken_seats
  attr_reader :wagon_type, :total_seats

  def initialize(wagon_number, total_seats)
    @wagon_number = wagon_number
    @wagon_type = :passenger
    @total_seats = total_seats
    @total_taken_seats = 0 
  end

  def take_seat
    self.total_taken_seats += 1
  end

  def total_free_seats
    total_seats - total_taken_seats
  end


end