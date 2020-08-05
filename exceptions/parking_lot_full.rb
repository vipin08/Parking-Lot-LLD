class ParkingLotFull < RuntimeError
  def initialize(msg = "Sorry, parking lot is full")
    super(msg)
  end
end
