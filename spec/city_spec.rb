require 'spec_helper'

describe Cities::City do

  context 'toronto' do
    subject(:toronto) { Cities.cities_in_country('CA')['toronto'] }
    it      { should be_a Cities::City }
    specify { toronto.name.should eql 'Toronto' }
    specify { toronto.latitude.should be_a Float }
    specify { toronto.longitude.should be_a Float }
    specify { toronto.latlong.should be_an Array }
    specify { toronto.population.should be_an Integer }
    specify { toronto.region.should be_a String }
  end
  
  context 'dvadtsat' do
    subject(:dvadtsat) do
      Cities.cities_in_country('TJ')["22 (dvadtsat' vtorogo) parts''yezd"]
    end
    it      { should be_a Cities::City }
    specify { dvadtsat.name.should eql "22 (Dvadtsat' Vtorogo) Parts''yezd" }
    specify { dvadtsat.population.should be_nil }
  end

  describe '::cities_in_country' do
    subject { Cities.cities_in_country('US') }

    it      { should be_a Hash }
    specify { subject.keys.should include 'seattle' }
    specify { subject['seattle'].should be_a Cities::City }
  end

  describe '::cities_in_country?' do
    it 'returns true for country with cities file' do
      Cities.cities_in_country?('US').should be_true
    end

    it 'returns false otherwise' do
      Cities.cities_in_country?('XX').should be_false
    end
  end

end

