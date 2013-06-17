module CDNJS
  module ViewHelpers
    def cdnjs_include_tag(version = nil)




      # version ||= Jquery::Rails::JQUERY_VERSION
      # [ javascript_include_tag("//ajax.googleapis.com/ajax/libs/jquery/#{version}/jquery.min.js"),
      #   javascript_tag("window.jQuery || document.write(unescape('#{javascript_include_tag('jquery/jquery.min').gsub('<','%3C')}'))")
      # ].join("\n").html_safe


    end
  end
end
