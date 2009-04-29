class Converter
  attr_reader :dec, :ra
  
  def initialize(dec=0, ra=0)
    @dec = to_dec(Float(dec))
    @ra = to_ra(Float(ra))
  end
  
  private
  
  def to_ra(num)
    if num < 0
      deg = deg + 360
    end

    hour = (num/15).to_i()
    min = ((num-15*hour)*4).to_i()
    sec = (4*num-60*hour-min)*60

    final = "#{hour}h#{min}m#{sec}s"
  end

  def to_dec(num)
    num = num.to_f()
    if num < 0 then
      sign = "-"
      num = num*(-1)
    else
      sign = ""
    end

    if num > 90
      # exceeds 90, so sign is negative
      num -= 90
      sign = "-"
    end

    hour = num.to_i()
    min = (( num - num.to_i() ) * 60).to_i()
    sec = ( (num-num.to_i() ) * 60 - min ) * 60

    sign + "#{hour}h#{min}m#{sec}s"
  end 
   
end