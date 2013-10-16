require "rake/testtask"

namespace "test" do
  Rake::TestTask.new(:widgets) do |t|
    t.libs << "test"
    t.pattern = "test/#{Apotomo.widgets_path}/**/*_test.rb"
  end
end
