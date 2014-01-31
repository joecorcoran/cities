module Cities

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

  end

end
