# cities

All the cities of the world (according to the periodically updated MaxMind.com database).

The database is exhaustive and certainly stretches the definition of the word "city".

    City.cities_in_country("GB")["buchlyvie"].population
      #=> 448

## Usage

Countries are identified by their [ISO 3166-1 alpha-2](http://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) codes.

    cities = City.cities_in_country("GB")
      #=> { "abberley"=> #<City:0x000001049b9ba0>, "abberton"=> #<City:0x000001049b9b50>, ... }

    mcr = cities["manchester"]
      #=> #<City:0x00000102fb4ea8>

    mcr.name
      #=> "Manchester"

    mcr.population
      #=> 395516

    mcr.latlong
      #=> [53,5, -2.216667]

## countries gem

This gem was designed as an extension to the [countries gem](https://github.com/hexorx/countries).

    gem install countries

Search for cities through a Country:

    us = Country.search("US")
      #=> #<Country:0x000001020cf5f0>

    us.cities
      #=> { "abanda" => #<City:0x00000114b34a38>, ...  }

    us.cities.length
      #=> 85964

## Data

There are over 2.7 million cities here, which makes for around 300MB.  The cities data is stored as YAML and _will_ be downloaded when you install this gem.

Having all of this data at your fingertips can be very useful, but don't abuse it: returning all of the 125,333 cities in Russia isn't lightning-fast.

This product includes data created by MaxMind, available from http://www.maxmind.com

All data provided copyright (c) 2008 MaxMind Inc.

## License 

Released under an MIT license (see LICENSE.txt).

Thanks to [hexorx](https://github.com/hexorx) for the countries gem that brought this idea about.
