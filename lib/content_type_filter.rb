module SwedishRails
  class ContentTypeFilter
    def self.filter(controller)
      if !controller.headers['Content-Type']
        controller.headers['Content-Type'] = 'text/html; charset=utf-8'
      elsif /^(\w+)\/(\w+)$/ =~ controller.headers['Content-Type']
        controller.headers['Content-Type'] = "$1/$2; charset=utf-8"
      end
    end
  end
end
