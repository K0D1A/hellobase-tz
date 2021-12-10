require 'test_helper'

class TimeZonesTest < Minitest::Test
  TZInfo::Country.all_codes.sort.each do |code|
    define_method :"test_#{code}_select_values" do
      domestic = Hellobase::TimeZones.domestic_select_values(code)
      assert domestic.is_a? Array
      domestic.each do |vals|
        assert_equal 2, vals.length
        assert vals.first.is_a? String
        assert vals.last.is_a? String
      end

      foreign = Hellobase::TimeZones.foreign_select_values(code)
      assert foreign.length > 0
      foreign.each do |vals|
        assert_equal 2, vals.length
        assert vals.first.is_a? String
        assert vals.last.is_a? String
      end

      assert (domestic & foreign).empty?

      all = Hellobase::TimeZones.all_select_values(code)
      assert_equal domestic.map(&:first) + ['UTC'] + foreign.map(&:first), all.map(&:first)
    end
  end

  def test_display_names
    Hellobase::TimeZones.all_select_values('US').map(&:last).each do |tz_name|
      assert !Hellobase::TimeZones.display_name_for(tz_name).nil?
    end
  end
end
