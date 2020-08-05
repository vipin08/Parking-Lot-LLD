class ParkingLotNotDefine < RuntimeError
  def initialize(msg = "Parking lot not define")
    super(msg)
  end
end
