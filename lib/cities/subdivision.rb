module ISO3166
  module CountryClassMethods
    def subdivisions(alpha2)
      @subdivisions ||= {}
      @subdivisions[alpha2] ||= create_subdivisions(subdivision_data(alpha2), alpha2)
    end

    def create_subdivisions(subdivision_data, country_code)
      subdivision_data.each_with_object({}) do |(k, v), hash|
        v['code'] = k
        hash[k] = Subdivision.new(v).tap { |obj| obj.country= country_code }
      end
    end
  end

  class Subdivision
    attr_accessor :country

    def cities
      Cities.cities_in_state(country, code)
    end
  end
end
