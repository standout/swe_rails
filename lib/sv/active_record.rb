module SwedishRails
  ::ActiveRecord::Errors.default_error_messages.merge!(
      :inclusion => "finns inte i listan",
      :exclusion => "är reserverat",
      :invalid => "är ogiltigt",
      :confirmation => "stämmer inte övererens",
      :accepted  => "måste vara accepterad",
      :empty => "får ej vara tom",
      :blank => "måste anges",
      :too_long => "är för lång (maximum är %d tecken)",
      :too_short => "är för kort (minimum är %d tecken)",
      :wrong_length => "har fel längd (ska vara %d tecken)",
      :taken => "har redan tagits",
      :not_a_number => "är ej ett nummer")
end
