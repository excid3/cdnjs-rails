module CDNJS
  module ViewHelpers
    def cdnjs_include_tag(cdn_vars)

      js_string_output = Array.new

      cdn_vars.each do |js_file_config|
          
        js_string_output << javascript_include_tag("//cdnjs.cloudflare.com/ajax/libs/#{js_file_config['cdnjs']}")
        js_string_output << javascript_tag("window.jQuery || document.write(unescape('#{javascript_include_tag(js_file_config['localpath']).gsub('<','%3C')}'))")
      
      end

      return js_string_output.join("\n").html_safe

    end
  end
end


