require 'test_helper'
require 'generators/apotomo/widget_generator'

class WidgetGeneratorTest < Rails::Generators::TestCase
  destination File.join(Rails.root, "tmp")
  setup :prepare_destination
  tests ::Apotomo::Generators::WidgetGenerator

  def setup
    Apotomo.widgets_path = "widgets"
  end

  # describe "Running rails g apotomo::widget" do
  #   describe "Gerbil squeak snuggle" do
      test "create the standard assets" do

        run_generator %w(Gerbil squeak snuggle -t test_unit)

        assert_file "app/widgets/gerbil_widget.rb", /class GerbilWidget < Apotomo::Widget/
        assert_file "app/widgets/gerbil_widget.rb", /def snuggle/
        assert_file "app/widgets/gerbil_widget.rb", /def squeak/
        assert_file "app/widgets/gerbil/snuggle.html.erb", %r(app/widgets/gerbil/snuggle\.html\.erb)
        assert_file "app/widgets/gerbil/snuggle.html.erb", %r(<p>)
        assert_file "app/widgets/gerbil/squeak.html.erb", %r(app/widgets/gerbil/squeak\.html\.erb)

        assert_file "test/widgets/gerbil_widget_test.rb", %r(class GerbilWidgetTest < Apotomo::TestCase)
        assert_file "test/widgets/gerbil_widget_test.rb", %r(widget\(:gerbil\))
      end

      test "create haml assets with -e haml" do
        run_generator %w(Gerbil squeak snuggle -e haml -t test_unit)

        assert_file "app/widgets/gerbil_widget.rb", /class GerbilWidget < Apotomo::Widget/
        assert_file "app/widgets/gerbil_widget.rb", /def snuggle/
        assert_file "app/widgets/gerbil_widget.rb", /def squeak/
        assert_file "app/widgets/gerbil/snuggle.html.haml", %r(app/widgets/gerbil/snuggle\.html\.haml)
        assert_file "app/widgets/gerbil/snuggle.html.haml", %r(%p)
        assert_file "app/widgets/gerbil/squeak.html.haml", %r(app/widgets/gerbil/squeak\.html\.haml)
        assert_file "test/widgets/gerbil_widget_test.rb"
      end

      test "create slim assets with -e slim" do
        run_generator %w(Gerbil squeak snuggle -e slim -t test_unit)

        assert_file "app/widgets/gerbil_widget.rb", /class GerbilWidget < Apotomo::Widget/
        assert_file "app/widgets/gerbil_widget.rb", /def snuggle/
        assert_file "app/widgets/gerbil_widget.rb", /def squeak/
        assert_file "app/widgets/gerbil/snuggle.html.slim", %r(app/widgets/gerbil/snuggle\.html\.slim)
        assert_file "app/widgets/gerbil/snuggle.html.slim", %r(p)
        assert_file "app/widgets/gerbil/squeak.html.slim", %r(app/widgets/gerbil/squeak\.html\.slim)
        assert_file "test/widgets/gerbil_widget_test.rb"
      end

      test "work with namespaces" do
        run_generator %w(Gerbil::Mouse squeak -t test_unit)

        assert_file "app/widgets/gerbil/mouse_widget.rb", /class Gerbil::MouseWidget < Apotomo::Widget/
        assert_file "app/widgets/gerbil/mouse_widget.rb", /def squeak/
        assert_file "app/widgets/gerbil/mouse/squeak.html.erb", %r(app/widgets/gerbil/mouse/squeak\.html\.erb)
        assert_file "test/widgets/gerbil/mouse_widget_test.rb"
      end

      test "create the standard assets with a custom path" do

        Apotomo.widgets_path = "apotomo"
        run_generator %w(Gerbil squeak snuggle -t test_unit)

        assert_file "app/apotomo/gerbil_widget.rb", /class GerbilWidget < Apotomo::Widget/
        assert_file "app/apotomo/gerbil_widget.rb", /def snuggle/
        assert_file "app/apotomo/gerbil_widget.rb", /def squeak/
        assert_file "app/apotomo/gerbil/snuggle.html.erb", %r(app/apotomo/gerbil/snuggle\.html\.erb)
        assert_file "app/apotomo/gerbil/snuggle.html.erb", %r(<p>)
        assert_file "app/apotomo/gerbil/squeak.html.erb", %r(app/apotomo/gerbil/squeak\.html\.erb)

        assert_file "test/apotomo/gerbil_widget_test.rb", %r(class GerbilWidgetTest < Apotomo::TestCase)
        assert_file "test/apotomo/gerbil_widget_test.rb", %r(widget\(:gerbil\))
      end


    # end
  # end
end
