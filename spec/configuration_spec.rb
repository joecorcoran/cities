require 'spec_helper'
require 'countries'

describe "Cities::City configuration" do
  context 'cache_data?' do
    subject(:cache_data_flag) { Cities.cache_data? }

    it "should be by default false" do
      expect(cache_data_flag).to be_falsey
    end
  end
end