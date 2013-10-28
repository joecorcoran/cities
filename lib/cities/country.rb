module ISO3166

  class Country

    def cities
      City.cities_in_country(alpha2)
    end

    def cities?
      City.cities_in_country?(alpha2)
    end

  end

end
