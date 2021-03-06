require 'generators/cells/base'

module Apotomo
  module Generators
    module BasePathMethods
    private
      def base_path
        File.join('app', Apotomo.widgets_path, class_path, file_name)
      end
    end
    
    class WidgetGenerator < ::Cells::Generators::Base
      include BasePathMethods
      
      source_root File.expand_path('../../templates', __FILE__)
      
      hook_for(:template_engine)
      hook_for(:test_framework)
      
      check_class_collision :suffix => "Widget"
      
      
      def create_cell_file
        template 'widget.rb', "#{base_path}_widget.rb"
      end
    end
  end
end
