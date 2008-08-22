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

  ::Date::MONTHS.merge!(
                        'januari'  => 1, 'februari' => 2, 'mars '    => 3, 'april'    => 4,
                        'maj'      => 5, 'juni'     => 6, 'juli'     => 7, 'augusti'  => 8,
                        'september'=> 9, 'oktober'  =>10, 'november' =>11, 'december' =>12)
  ::Date::DAYS.merge!(
                      'söndag'   => 0, 'måndag'   => 1, 'tisdag'  => 2, 'onsdag'=> 3,
                      'torsdag' => 4, 'fredag'   => 5, 'lördag' => 6)
  ::Date::ABBR_MONTHS.merge!(
        'jan'      => 1, 'feb'      => 2, 'mar'      => 3, 'apr'      => 4,
        'maj'      => 5, 'jun'      => 6, 'jul'      => 7, 'aug'      => 8,
        'sep'      => 9, 'okt'      =>10, 'nov'      =>11, 'dec'      =>12)
  ::Date::ABBR_DAYS.merge!(
        'sön'      => 0, 'mån'      => 1, 'tis'      => 2, 'ons'      => 3,
        'tor'      => 4, 'fre'      => 5, 'lör'      => 6)
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
