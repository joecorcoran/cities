require 'multi_json'

class City
  
  def initialize(data)
    @data = data
  end

  def name
    @data['accentcity']
  end

  def latitude
    return nil if @data['latitude'].nil?
    @data['latitude'].to_f
  end

  def longitude
    return nil if @data['longitude'].nil?
    @data['longitude'].to_f
  end

  def latlong?
    latitude && longitude
  end

  def latlong
    latlong? ? [latitude, longitude] : nil
  end

  def population
    return nil if @data['population'].nil?
    @data['population'].to_i
  end

  def region
    @data['region']
  end

  class << self

    def path_for_country(code)
      File.join(File.dirname(__FILE__), '..', 'data', 'cities', "#{code}.json")
    end

    def cities_in_country?(code)
      File.exist?(self.path_for_country(code))
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

  end
  
end
