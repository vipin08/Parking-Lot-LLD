module ExtraHelper
  def nil_zero?(obj)
    obj.nil? || obj == 0
  end

  def assertEqual(arg_1, arg_2)
    arg_1 == arg_2
  end
end
