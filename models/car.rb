require './contants/defaults'

module ActiveUtility
  class Car
    include Constants
    def initialize registration_number, color, slot=nil
      @registration_number = registration_number
      @color = color
      @slot = slot
      @price = PER_HR_PRICE
      @size = MEDIUM
      @park_time = Time.now
    end

    def set_slot slot
      @slot = slot
    end

    def get_slot
      @slot
    end

    def get_colour
      @color
    end

    def get_registration_number
      @registration_number
    end
  end
end
