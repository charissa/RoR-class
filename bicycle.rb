#!/opt/local/bin/ruby
include Math

# still has a bit of an odor...

class Bicycle
  attr_accessor :wheel_size, :chainring, :cassette, :name

  # Create the object
  def initialize(arg={name: "A Bicycle",wheel_size: 27,chainring: 42,cassette: [28,24,21,18,16,14,12,11]})
    @name = arg[:name]
    @wheel_size=arg[:wheel_size]
    @chainring=arg[:chainring]
    @cassette=arg[:cassette]
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
puts %{
Information for: #{@name}
This bicycle has the following characteristics:
Wheel size: #{@wheel_size} inches
Front gear has #{@chainring} teeth
Rear gears have #{@cassette} teeth
}
# How horrible is this --- mixing puts-ing a string and printf! Gross.
  printf("At cadence of 100 rpm this bike can go approximately %.1f mph in gear %2d", self.mph(100), 1+@gear_i)

    end
end


if __FILE__ == $0
  bike=Bicycle.new
  bf_tikit=Bicycle.new({name: "my bike",wheel_size: 16.375,chainring: 53, cassette: [28,24,21,18,16,14,12,11]})
  
  bike.set_gear(8)
  bf_tikit.set_gear(8)
  puts ""
  # need to learn how to format to the console some day...
  # You would think that someone would have devised a more intuitive way to format stuff by now. 
  # printf goes back to Fortan, COBOL and the stone ages...
  #
  printf("Bike Friday can go about %.1f mph at a cadence of 80.\n", bf_tikit.mph(80))
  # and I am pretty sure that this is not Ruby-like... but I couldn't find any thing else for the time being...
  printf("Regular bike can go about %.1f mph at a cadence of 80.\n", bike.mph(80))
  
  puts ""
  puts bike.info
  puts bf_tikit.info
  

  
end