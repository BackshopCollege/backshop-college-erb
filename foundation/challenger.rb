=begin
  
 Congratulations
 Now, you know how to capture the scope and assign it to other variable.
 To read more about it:
   http://www.ruby-doc.org/core-2.0.0/Binding.html
   
=end

def changer(argument)
  variable = "accepted"
  
  # argument is the captured scoped bindings
  eval("local_variable='#{variable}'", argument)

end

def run

  local_variable = 1_000_000
  #capture all visible bindings (scope)
  changer(binding)
  return local_variable

end

if( (value = run) == 'accepted')
  puts 'Congratulations :)'
else
  puts "Try it again ! You must return 'accepted' instead of #{value} :("
end
