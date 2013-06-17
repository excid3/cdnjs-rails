require File.dirname(__FILE__) + '/config/environment'

cdnjs = [
  {'cdnjs' => 'jquery/2.0.2/jquery.min.js', 'localpath' => 'assets/jquery/jquery.min.js'},
  {'cdnjs' => 'jqueryui/1.10.3/jquery-ui.min.js','localpath' => 'assets/jquery/jquery-ui.min.js'}
]

cdnjs.each do |js_file_config|

puts js_file_config['cdnjs']
puts js_file_config['localpath']

end

# cdnjs.each do |js_file|
#   js_file.each do |js_file_config|

#     puts js_file
#     puts js_file_config['cdnjs']
#     puts js_file_config['localpath']

#   end
# end

