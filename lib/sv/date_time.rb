module SwedishRails
  REPLACEMENTS = { 
    'January' => 'Januari', 'February' => 'Februari', 'March' => 'Mars',
    'May' => 'Maj', 'June' => 'Juni', 'July' => 'Juli',
    'August' => 'Augusti', 'October' => 'Oktober',
    'Sunday' => 'Söndag', 'Monday' => 'Måndag', 'Tuesday' => 'Tisdag',
    'Wednesday' => 'Onsdag', 'Thursday' => 'Torsdag', 'Friday' => 'Fredag',
    'Saturday' => 'Lördag', 'May' => 'Maj', 'Oct' => 'Okt',
    'Sun' => 'Sön', 'Mon' => 'Mån', 'Tue' => 'Tis', 'Wed' => 'Ons',
    'Thu' => 'Tors', 'Fri' => 'Fre', 'Sat' => 'Lör',
    'january' => 'januari', 'february' => 'februari', 'march' => 'mars',
    'may' => 'maj', 'june' => 'juni', 'july' => 'juli',
    'august' => 'augusti', 'october' => 'oktober',
    'sunday' => 'söndag', 'monday' => 'måndag', 'tuesday' => 'tisdag',
    'wednesday' => 'onsdag', 'thursday' => 'torsdag', 'friday' => 'fredag',
    'saturday' => 'lördag', 'may' => 'maj', 'oct' => 'okt',
    'sun' => 'sön', 'mon' => 'mån', 'tue' => 'tis', 'wed' => 'ons',
    'thu' => 'tors', 'fri' => 'fre', 'sat' => 'lör',
  }

  ::ActiveSupport::CoreExtensions::Date::Conversions::DATE_FORMATS.merge!(
     :short => "%e %b",
     :long  => "%e %B, %Y")
  ::ActiveSupport::CoreExtensions::Time::Conversions::DATE_FORMATS.merge!(
     :short  => "%d %b %H:%M",
     :long   => "%d %B, %Y %H:%M")

  ::Date::MONTHNAMES = [nil] + %w(Januari Februari Mars April Maj Juni Juli Augusti September Oktober November December)
  ::Date::DAYNAMES = %w(Söndag Måndag Tisdag Onsdag Torsdag Fredag Söndag)
  ::Date::ABBR_MONTHNAMES = [nil] + %w(Jan Feb Mar Apr Maj Jun Jul Aug Sep Okt Nov Dec)
  ::Date::ABBR_DAYNAMES = %w(Sön Mån Tis Ons Tor Fre Lör)

  class ::Time
    alias :_strftime :strftime
    def strftime(format)
      _strftime(format.gsub(/(%[aAbB])/,'$SWE$\1$SWE$')).gsub(/\$SWE\$(.*?)\$SWE\$/) do |m| 
        SwedishRails::REPLACEMENTS[ $1 ] || $1 
      end
    end
  end
end
