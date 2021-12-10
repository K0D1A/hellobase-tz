require 'minitest/autorun'

# suppress warnings from gem dependencies
require 'warning'
Gem.path.each {|path| Warning.ignore(//, path) }

require 'hellobase/time_zones'

class Minitest::Test
  protected

  def assert_error(type, &block)
    begin
      yield
    rescue Hellobase::Error => e
      assert_equal type, e.type
      return
    end

    flunk "no #{type.inspect} error raised"
  end
end
