module ISO3166; end

class ISO3166::Country

  def cities
    City.cities_in_country(alpha2)
  end

  def cities?
    City.cities_in_country?(alpha2)
  end

end
