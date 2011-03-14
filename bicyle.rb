#!/opt/local/bin/ruby1.9
include Math

class Bicycle
  attr_accessor :wheel_size, :chainring, :cassette, :name

  # Create the object
  def initialize(name = "A Bicycle",wheel_size=27,chainring=42,cassette=[28,24,21,18,16,14,12,11])
    @name = name
    @wheel_size=wheel_size
    @chainring=chainring
    @cassette=cassette
    @gear_i=0
  end

  # change gear
  def set_gear(gear=1)
    @gear_i=gear-1
  end

  # speed based on cadence
  def mph(cadence)
    # this may be imprecise/wrong so don't take my word for it....
    # BTW 63360 is the number of inches in a mile
    cadence*Math::PI*@wheel_size*(@chainring/@cassette[@gear_i])*60/63360
  end

  def info
%{
Information for: #{@name}
This bicycle has the following characteristics:
Wheel size: #{@wheel_size} inches
Front gear has #{@chainring} teeth
Rear gears have #{@cassette} teeth
At a cadence of 100 rpm this bike can go approximately #{self.mph(100)} mph in gear #{1+@gear_i}
%}
end
end


if __FILE__ == $0
  bike=Bicycle.new
  bf_tikit=Bicycle.new("my bike",16.375,53,[28,24,21,18,16,14,12,11])
  
  bike.set_gear(8)
  bf_tikit.set_gear(8)
  puts ""
  # need to learn how to format to the console some day...
  puts bf_tikit.mph(80)
  puts bike.mph(80)
  
  puts ""
  puts bike.info
  puts bf_tikit.info
  
  
end