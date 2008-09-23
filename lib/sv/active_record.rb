module SwedishRails
  # Based on activerecord-2.0.2/lib/active_record/validations.rb
  ::ActiveRecord::Errors.default_error_messages.merge!({
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
      :not_a_number => "är ej ett nummer",
      :greater_than => "måste vara större än %d",
      :greater_than_or_equal_to => "måste vara större än eller lika med %d",
      :equal_to => "måste vara samma som",
      :less_than => "måste vara mindre än %d",
      :less_than_or_equal_to => "måste vara mindre än eller lika med %d",
      :odd => "måste vara udda",
      :even => "måste vara jämnt"
  })
end
