module CDNJS
  class Railtie < Rails::Railtie
    initializer "cdnjs-rails.view_helpers" do
      ActionView::Base.send :include, CDNJS::Rails::ViewHelpers
    end
  end
end

