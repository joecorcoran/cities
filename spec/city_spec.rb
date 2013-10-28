require 'spec_helper'

describe City do

  let(:toronto) { City.cities_in_country('CA')['toronto'] }
  let(:dvadtsat) { City.cities_in_country('TJ')["22 (dvadtsat' vtorogo) parts''yezd"] }

  it 'should be a City' do
    toronto.should be_a City
    dvadtsat.should be_a City
  end

  it 'should have name' do
    toronto.name.should eql 'Toronto'
    dvadtsat.name.should eql "22 (Dvadtsat' Vtorogo) Parts''yezd"
  end

  it 'should have latitude' do
    toronto.latitude.should be_a Float
  end

  it 'should have longitude' do
    toronto.longitude.should be_a Float
  end

  it 'should have latlong' do
    toronto.latlong.should be_an Array
  end

  it 'should have population' do
    toronto.population.should be_an Integer
    dvadtsat.population.should be_nil
  end

  it 'should have region' do
    toronto.region.should be_a String
  end

  describe '::cities_in_country' do
    subject { City.cities_in_country('US') }

    it { should be_a Hash }
    specify { subject.keys.should include 'seattle' }
    specify { subject['seattle'].should be_a City }
  end

  describe '::cities_in_country?' do
    it 'returns true for country with cities file' do
      City.cities_in_country?('US').should be_true
    end

    it 'returns false otherwise' do
      City.cities_in_country?('XX').should be_false
    end
  end

end

