module ISO3166

  class Country

    def cities
      Cities.cities_in_country(alpha2)
    end

    def cities?
      Cities.cities_in_country?(alpha2)
    end

  end

end
