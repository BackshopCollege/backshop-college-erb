require 'erb'

class Template
  def self.index
    '<html><title> <%= title %> </title></html>'
  end
end


def title
  "Backshop College"
end

compiled = ERB.new(Template.index)

#Capture the scope and call erb with the bindings
captured_bindings = binding
puts compiled.result(captured_bindings)