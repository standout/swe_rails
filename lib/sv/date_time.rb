module SwedishRails
  REPLACEMENTS = {
    'January' => 'januari', 'February' => 'februari', 'March' => 'mars', 'May' => 'maj',
    'June' => 'juni', 'July' => 'juli', 'August' => 'augusti', 'September' => 'september', 
    'October' => 'oktober', 'November' => 'november', 'December' => 'december',

    'january' => 'januari', 'february' => 'februari', 'march' => 'mars',
    'may' => 'maj', 'june' => 'juni', 'july' => 'juli',
    'august' => 'augusti', 'october' => 'oktober',

    'Jan' => 'jan', 'Feb' => 'feb', 'Mar' => 'mar', 'Apr' => 'apr', 'May' => 'maj', 
    'Jun' => 'jun', 'Jul' => 'jul', 'Aug' => 'aug', 'Sep' => 'sep', 'Oct' => 'okt', 
    'Nov' => 'nov', 'Dec' => 'dec',

    'may' => 'maj', 'oct' => 'okt',

    'Sunday' => 'söndag', 'Monday' => 'måndag', 'Tuesday' => 'tisdag',
    'Wednesday' => 'onsdag', 'Thursday' => 'torsdag', 'Friday' => 'fredag',
    'Saturday' => 'lördag', 
            
    'sunday' => 'söndag', 'monday' => 'måndag', 'tuesday' => 'tisdag',
    'wednesday' => 'onsdag', 'thursday' => 'torsdag', 'friday' => 'fredag',
    'saturday' => 'lördag', 

    'Sun' => 'sön', 'Mon' => 'mån', 'Tue' => 'tis', 'Wed' => 'ons',
    'Thu' => 'tors', 'Fri' => 'fre', 'Sat' => 'lör',
        
    'sun' => 'sön', 'mon' => 'mån', 'tue' => 'tis', 'wed' => 'ons',
    'thu' => 'tors', 'fri' => 'fre', 'sat' => 'lör'
  }

  ::ActiveSupport::CoreExtensions::Date::Conversions::DATE_FORMATS.merge!(
     :short => "%e %b",
     :long  => "%e %B, %Y")
  ::ActiveSupport::CoreExtensions::Time::Conversions::DATE_FORMATS.merge!(
     :short  => "%d %b %H:%M",
     :long   => "%d %B, %Y %H:%M")

  ::Date::MONTHNAMES = [nil] + %w(januari februari mars april maj juni juli augusti september oktober november december)
  ::Date::DAYNAMES = %w(söndag måndag tisdag onsdag torsdag fredag lördag)
  ::Date::ABBR_MONTHNAMES = [nil] + %w(jan feb mar apr maj jun jul aug sep okt nov dec)
  ::Date::ABBR_DAYNAMES = %w(sön mån tis ons tor fre lör)

  class ::Time
    alias :_strftime :strftime
    def strftime(format)
      _strftime(format.gsub(/(%[aAbB])/,'$SWE$\1$SWE$')).gsub(/\$SWE\$(.*?)\$SWE\$/) do |m| 
        SwedishRails::REPLACEMENTS[ $1 ] || $1 
      end
    end
  end
end
