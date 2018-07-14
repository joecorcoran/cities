require 'multi_json'
require 'cities/configuration'
require 'cities/city'
require 'cities/country'
require 'cities/subdivision'

module Cities
  class << self
    @@cached_data = {}

    def cities_in_country?(code)
      File.exist?(path_for_country(code))
    end

    def cities_in_country(code)
      if self.cities_in_country?(code)
        country_data = load_country_data(code)
        country_data.reduce({}) do |cities, city_data|
          cities[city_data.first] = City.new(city_data.last)
          cities
        end
      else
        {}
      end
    end

    def cities_in_state(country, state)
      if cities_in_country?(country)
        country_data = load_country_data(country).select { |_, hash| hash['region'] == state }
        country_data.reduce({}) do |cities, city_data|
          cities[city_data.first] = City.new(city_data.last)
          cities
        end
      else
        {}
      end
    end

    private
    # This will not only load country data from a given country code
    # but it will also cache if cache_data is set to true
    def load_country_data(code)
      if cache_data?
        return @@cached_data[code] if @@cached_data[code]
      end

      json = File.read(path_for_country(code))
      country_data = MultiJson.load(json)

      if cache_data?
        @@cached_data[code] = country_data
      end

      country_data
    end

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
