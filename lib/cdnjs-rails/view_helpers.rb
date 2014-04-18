module CDNJS
  module ViewHelpers
    def cdnjs_include_tag(cdn_vars=nil)
      cdn_vars       ||= Rails.application.config.cdnjs
      js_string_output = Array.new

      cdn_vars.each do |js_file_config|
        js_string_output << javascript_include_tag("//cdnjs.cloudflare.com/ajax/libs/#{js_file_config.fetch(:cdnjs)}")
        js_string_output << javascript_tag("window.jQuery || document.write(unescape('#{asset_path(js_file_config.fetch(:localpath)).gsub('<','%3C')}'))")
      end

      js_string_output.join("\n").html_safe
    end
  end
end


