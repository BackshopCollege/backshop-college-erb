require 'erb'

class Template
  def self.index
    '<html><body> STATIC TEMPLATE </body></html>'
  end
end

compiled = ERB.new(Template.index)

puts compiled.result