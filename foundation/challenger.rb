=begin
  
  What is supposed to do here ?
  Your code must change the local_variable value assigned in the run method
  in the changer method.

  You 
     . can not change the method signature
     . can not use return statement

=end

def changer(argument)
  variable = "accepted"
 
  #
  # WRITE YOUR CODE HERE.
  #
  
end

def run

  local_variable = 1_000_000
 
  #
  # WRITE YOUR CODE HERE
  # YOUR CODE MUST CALL THE 'changer' METHOD
  # YOU CAN NOT MAKE ANY ASSIGNMENT TO 'local_variable' VARIABLE HERE
  #
  
  return local_variable

end

if( (value = run) == 'accepted')
  puts 'Congratulations :)'
else
  puts "Try it again ! You must return 'accepted' instead of #{value} :("
end
