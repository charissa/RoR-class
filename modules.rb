class Mother
  def disposition
    "Cheery"
  end
  
end

module Father
  attr_accessor :hair
  def initialize
  @hair="brown"
end
  def personality
    "Introvert"
  end
  def disposition
    "Grumpy"
  end
end

class Child <Mother
  include Father
end


kid=Child.new

p kid.personality
p kid.disposition
p kid.hair

kid.hair="pink"
p kid.hair

# the "include module" allows you to bring in instance vars(but not their value?) and methods from the module without direct inheiretance
# Because the module comes in after the formal inheirance reltationship is defined, methods in the module
# with the same name as what the object inheirits from are overwritten by those in the module.
# and of course, if the object had a mehtod of the same name defined after the include statement it would "win"

# if you really wanted to model a kid, I think you would not use inheiretance this way. 
# The kid would have to have an instance of a mother and of a father at the time of initialization (passed as args).
# Then on initialize, you would randomly mix the attributes of the mother and father.