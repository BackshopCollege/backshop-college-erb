require 'erb'

template = '<html><body> STATIC TEMPLATE </body></html>'
compiled = ERB.new(template)

puts compiled.result