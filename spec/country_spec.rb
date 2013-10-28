require 'spec_helper'
require 'countries'

describe ISO3166::Country do
  it 'should return correct number of cities' do
    expect(ISO3166::Country.search('WF').cities.length).to eq(39)
  end

  it 'should be empty hash for country with no cities' do
    expect(ISO3166::Country.search('VA').cities).to eq({})
  end
end

