class ParkingLotEmpty < RuntimeError
  def initialize(msg = "Parking lot are empty")
    super(msg)
  end
end
