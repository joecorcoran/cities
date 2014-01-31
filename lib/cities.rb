require 'multi_json'
require 'cities/city'
require 'cities/country'

module Cities
  class << self
    attr_accessor :data_path

    def cities_in_country?(code)
      File.exist?(path_for_country(code))
    end
    
    def cities_in_country(code)
      if self.cities_in_country?(code)
        json = File.read(path_for_country(code))
        country_data = MultiJson.load(json)
        country_data.reduce({}) do |cities, city_data|
          cities[city_data.first] = City.new(city_data.last)
          cities
        end
      else
        {}
      end
    end

    private
    def has_data?
      data_path && Dir.exists?(data_path)
    end

    def path_for_country(code)
      raise DataNotFound.new unless has_data?
      File.join(data_path, "#{code}.json")
    end
  end

  class DataNotFound < StandardError
    def message
      'JSON data not found. See README.md for installation instructions.'
    end
  end
end
