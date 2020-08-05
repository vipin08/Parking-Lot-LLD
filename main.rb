require_relative 'utility/parking_utility'
require_relative 'helper/extra_helper'

parking_utility = ParkingUtility.new(3, 2)

p parking_utility.park_car('KA-01-AA-1111', 'White')

p parking_utility.park_car('KA-01-AA-1112', 'White')

p parking_utility.park_car('KA-01-AA-1112', 'White')

p parking_utility.park_car('KA-01-AA-1112', 'White')

p parking_utility.park_car('KA-01-AA-1112', 'White')

p parking_utility.park_car('KA-01-AA-1112', 'White')

# parking_utility.park_car('KA-01-AA-1112', 'White')
#
# parking_utility.park_car('KA-01-AA-1112', 'White')

p parking_utility.car_departure('100')

p parking_utility.car_departure('101')

p parking_utility.car_by_colour('White')

# parking_utility.slot_by_car_number('KA-01-AA-1113')