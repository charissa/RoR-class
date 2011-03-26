=begin 
  Random learnings
=end


a='asdf'
puts a.freeze
# now we can't change a
#  a[0]='z' # this will FAIL!!
#but we can reassign it
puts a='qwer'
# there is no way to unfreeze an object
# (Reassigning to itself is a pointer op and doesn't change the value)
puts a=a
a
# if you can find an op that does a no-op you "unfreeze" this way
puts a=(a.reverse).reverse

a[0]='b' # =>  produces no error
puts a
# now arrays
# why doesn't this work
puts [1..6].shuffle
# [1..6] is not equivalent to [1,2,3,4,5,6]
p (1..6).to_a  # is
p (1..6).to_a.shuffle
