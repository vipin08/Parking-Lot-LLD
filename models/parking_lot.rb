module ActiveUtility
  class ParkingLot
    def initialize size, floor
      @parked_cars = 0
      # total_parking_size = size * floor
      @all_slots = generate_slots(size, floor) #Hash[total_parking_size.times.map {|x| x}.map {|k| [k, nil]}]
    end

    def generate_slots size, floor
      starting = 100
      hash = {}
      floor.times.each do |f|
        hash.merge!(Hash[size.times.map {|x| x + starting}.map {|k| [k, nil]}])
        starting += 100
      end
      return hash
    end

    def increment_parked_cars
      @parked_cars += 1
    end

    def decrement_parked_cars
      @parked_cars -= 1
    end

    def get_parked_cars
      @parked_cars
    end

    def get_slots
      @all_slots
    end

    def set_slots slot, value
      @all_slots[slot] = value
    end
  end
end