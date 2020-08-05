require './models/car'
require './models/parking_lot'
require './exceptions/parking_lot_full'
require './exceptions/parking_lot_not_define'
require './exceptions/parking_lot_empty'

class ParkingUtility
  include ActiveUtility

  def initialize size, floor
    @parking_lot = ParkingLot.new(size.to_i, floor)
  end

  def parking_lot_is_full
    @parking_lot.get_slots.length <= @parking_lot.get_parked_cars
  end

  def park_car registration_number, colour
    raise ParkingLotNotDefine if @parking_lot.nil?
    raise ParkingLotFull if parking_lot_is_full
    parking_slot = @parking_lot.get_slots
    parking_slot.keys.each do |slot|
      if parking_slot[slot] == nil
        car = Car.new(registration_number, colour)
        @parking_lot.set_slots(slot, car)
        car.set_slot(slot)
        @parking_lot.increment_parked_cars
        return "Allocated slot number: #{@parking_lot.get_slots}"
      end
    end
  end

  def car_departure input_slot
    raise ParkingLotNotDefine if @parking_lot.nil?
    if @parking_lot.get_parked_cars == 0
      return 'Sorry, parking lot is empty'
    elsif input_slot.to_i >= 1  and input_slot.to_i <= @parking_lot.get_slots.length
      parking_slot = @parking_lot.get_slots
      value = parking_slot[input_slot]
      if value
        @parking_lot.set_slots(input_slot, nil)
        @parking_lot.decrement_parked_cars
        return "Slot number #{input_slot} is free"
      else
        return "No car at Slot number #{input_slot}"
      end
    else
      return "Cannot exit slot: #{input_slot} as no such exist!"
    end
  end

  def lot_status
    raise ParkingLotNotDefine if @parking_lot.nil?
    str = ''
    p "Slot No.\tRegistration No\tColour"
    parking_slot = @parking_lot.get_slots
    parking_slot.values.each do |parked_car|
      if parked_car
        str += "#{parked_car.get_slot} \t #{parked_car.registration_number} \t #{parked_car.get_colour}"
      end
    end
    return str
  end

  def car_by_colour input_colour
    raise ParkingLotNotDefine if @parking_lot.nil?
    str = ''
    flag = false
    parking_slot = @parking_lot.get_slots
    parking_slot.values.each do |parked_car|
      if parked_car
        if parked_car.get_colour == input_colour
          flag = true
          str += "#{parked_car.get_slot}, "
          break
        end
      end
    end
    if !flag
      return 'Not found'
    end
  end

  def slot_by_color input_color
    raise ParkingLotNotDefine if @parking_lot.nil?
    raise ParkingLotEmpty if @parking_lot.get_parked_cars == 0
    flag = false
    return_str = ''
    parking_slot = @parking_lot.get_slots
    parking_slot.values.each do |parked_car|
      if parked_car != nil
        if parked_car.get_color == input_color
          flag = true
          return_str += "#{parked_car.get_slot}, "
        end
      end
    end
    if !flag
      return 'Not found'
    end
    return return_str
  end

  def slot_by_car_number number
    raise ParkingLotNotDefine if @parking_lot.nil?
    raise ParkingLotEmpty if @parking_lot.get_parked_cars == 0
    flag = false
    parking_slot = @parking_lot.get_slots
    parking_slot.values.each do |parked_car|
      if parked_car != nil
        if parked_car.get_registration_number == number
          flag = true
          return parked_car.get_slot
          # assuming that for the cars, there is one and only one registration number exits
        end
      end
    end
    return 'Not found'
  end
end
