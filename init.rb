require 'content_type_filter'

class ActionController::Base
  append_before_filter SwedishRails::ContentTypeFilter
end

$lang ||= 'sv'

if /^sv/ =~ $lang
  require 'sv/inflections'
  require 'sv/date_time'
  require 'sv/integer'
  require 'sv/array'
  require 'sv/action_view'
  require 'sv/active_record'

  SwedishRails.inflections do |i|
    SwedishRails::inflections_plural(i)
    SwedishRails::inflections_singular(i)
    SwedishRails::inflections_irregular(i)
    SwedishRails::inflections_uncountable(i)
  end
end
