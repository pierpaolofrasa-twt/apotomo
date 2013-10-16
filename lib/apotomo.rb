module Apotomo
  class << self
    def js_framework=(js_framework)
      @js_framework = js_framework
      @js_generator = JavascriptGenerator.new(js_framework)
    end
    
    attr_reader :js_generator, :js_framework, :widgets_path
    
    # Apotomo setup/configuration helper for initializer.
    #
    # == Usage/Examples:
    #
    #   Apotomo.setup do |config|
    #     config.js_framework = :jquery
    #   end
    def setup
      yield self
    end
  end
end

require 'apotomo/widget'

module Apotomo
  class << self
    def widgets_path=(widgets_path)
      @widgets_path = widgets_path
      Apotomo::Widget.view_paths = Apotomo::Widget.view_paths
    end
  end
end

require 'apotomo/railtie'
require 'apotomo/widget_shortcuts'
require 'apotomo/rails/controller_methods'
require 'apotomo/javascript_generator'
require 'apotomo/test_case' if Rails.env == "test"

Apotomo.js_framework = :jquery ### DISCUSS: move to rails.rb
Apotomo.widgets_path = "widgets"
