module SwedishRails
  class ::String
    alias :_downcase :downcase
    alias :_downcase! :downcase!
    alias :_upcase :upcase
    alias :_upcase! :upcase!
    alias :_swapcase :swapcase
    alias :_swapcase! :swapcase!
    alias :_capitalize :capitalize
    alias :_capitalize! :capitalize!
    
    def downcase
      _downcase.tr 'ÅÄÖ', 'åäö'
    end
    def downcase!
      _downcase!
      tr! 'ÅÄÖ', 'åäö'
    end
    def upcase
      _upcase.tr 'åäö', 'ÅÄÖ'
    end
    def upcase!
      _upcase!
      tr! 'åäö', 'ÅÄÖ'
    end
    def swapcase
      _swapcase.tr 'åäöÅÄÖ', 'ÅÄÖåäö'
    end
    def swapcase!
      _swapcase!
      tr! 'åäöÅÄÖ', 'ÅÄÖåäö'
    end
    def capitalize
      _capitalize.tr('ÅÄÖ', 'åäö').gsub(/^å/, 'Å').gsub(/^ä/, 'Ä').gsub(/^ö/, 'Ö')
    end
    def capitalize!
      _capitalize!
      tr! 'ÅÄÖ', 'åäö'
      gsub! /^å/, 'Å'
      gsub! /^ä/, 'Ä'
      gsub! /^ö/, 'Ö'
    end
  end
end
