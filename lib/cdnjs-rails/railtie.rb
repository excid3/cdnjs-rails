class Railtie < Rails::Railtie
  initializer "cdnjs-rails.view_helpers" do
    ActionView::Base.send :include, CDNJS::ViewHelpers
  end
end

