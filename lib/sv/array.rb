module SwedishRails
  class ::Array
    alias :_to_sentence :to_sentence
    def to_sentence(options = {})
      options.reverse_merge! :connector => 'och', :skip_last_comma => true
      _to_sentence(options)
    end
  end
end
