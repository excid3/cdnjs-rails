module CDNJS
  module ViewHelpers
    def cdnjs_include_tag(cdn_vars)
      js_string_output = ''


      cdn_vars.each do |js_file|
        js_file.each do |js_file_config|
          
          cdnjs = js_file_config['cdnjs']
          localpath = js_file_config['localpath']
          
          js_string_output = [ 
            javascript_include_tag("//cdnjs.cloudflare.com/ajax/libs/#{cdnjs}"),
            javascript_tag("window.jQuery || document.write(unescape('#{javascript_include_tag(localpath).gsub('<','%3C')}'))")
          ].join("\n").html_safe

        end
      end

      return js_string_output

    end
  end
end


