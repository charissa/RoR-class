# the following is intentionallly written badly for illustrative purposes
# you shouldn't have methods with the same name as
# the methods created by attr_accessor...

class Foo
  attr_accessor :a, :b, :c, :cc
  def initialize
    @a,@b=0,0
    @c=@a+@b
    @cc=99
  end
  
  def cc
   @a+@b
  end
 #this overwrited the attr_accessor 
 # be careful of this kind of thing because the inside is not what the outside can see .....

  
end

class Goo
  def initialize
    @a,@b=0,0
    @c=@a+@b
    @cc=99
  end
  
  def cc
   @a+@b
  end
  
  attr_accessor :a, :b, :c, :cc # since this is called last and creates a new method cc, our method cc is overwritten
  
end
  
  
  ## test it
  p f=Foo.new
  #<Foo:0x0000010105e3b0 @b=0, @a=0, @c=0, @cc=99>
  
  p g=Goo.new
  #<Goo:0x0000010105e248 @b=0, @a=0, @c=0, @cc=99>
  
  f.a, g.a= 2, 2
  
  p f.cc, g.cc
 # 2
 # 99 
  f.cc, g.cc= 55,55
  p f.cc, g.cc
  
 # 2
 # 55
 
  
  p f
  p g
  
  
  