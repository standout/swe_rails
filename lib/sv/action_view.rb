module SwedishRails
  module ::ActionView
    module Helpers
      class InstanceTag #:nodoc:
        def to_boolean_select_tag(options = {})
          options = options.stringify_keys
          add_default_name_and_id(options)
          tag_text = "<select"
          tag_text << tag_options(options)
          tag_text << "><option value=\"false\""
          tag_text << " selected" if value == false
          tag_text << ">Falskt</option><option value=\"true\""
          tag_text << " selected" if value
          tag_text << ">Sant</option></select>"
        end
      end
      
      module DateHelper
        def distance_of_time_in_words(from_time, to_time = 0, include_seconds = false)
          from_time = from_time.to_time if from_time.respond_to?(:to_time)
          to_time = to_time.to_time if to_time.respond_to?(:to_time)
          distance_in_minutes = (((to_time - from_time).abs)/60).round
          distance_in_seconds = ((to_time - from_time).abs).round

          case distance_in_minutes
          when 0..1
            return (distance_in_minutes==0) ? 'mindre än en minut' : '1 minut' unless include_seconds
            case distance_in_seconds
            when 0..5   then 'mindre än 5 sekunder'
            when 6..10  then 'mindre än 10 sekunder'
            when 11..20 then 'mindre än 20 sekunder'
            when 21..40 then 'en halv minut'
            when 41..59 then 'mindre än en minut'
            else             '1 minut'
            end
          when 2..45      then "#{distance_in_minutes} minuter"
          when 46..90     then 'ungefär 1 timma'
          when 90..1439   then "ungefär #{(distance_in_minutes.to_f / 60.0).round} timmar"
          when 1440..2879 then '1 dygn'
          else                 "#{(distance_in_minutes / 1440).round} dygn"
          end
        end
      end
    end
  end
end
