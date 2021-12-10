require 'tzinfo'

module Hellobase
  module TimeZones
    class << self
      def domestic_select_values(country_code)
        TZInfo::Country.get(country_code).zone_info.map {|z| [z.description || z.timezone.friendly_identifier(true), z.identifier] }
      end

      def foreign_select_values(country_code)
        TZInfo::Country.all.reject {|c| c.code == country_code }.map(&:zone_info).flatten.uniq.map {|z| [z.description || z.timezone.friendly_identifier(false), z.identifier] }
      end

      def all_select_values(country_code)
        domestic_select_values(country_code) + [['UTC', 'UTC']] + foreign_select_values(country_code)
      end

      def display_name_for(tz_name)
        (@display_names ||= all_select_values('US').to_h.invert)[tz_name]
      end
    end
  end
end
