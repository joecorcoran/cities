require 'bundler/setup'
require 'cities'

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.order = 'random'
  config.formatter = :progress
  config.before(:all) do
    Cities.data_path = ENV['DATA_PATH'] || File.expand_path('../../data/cities', __FILE__)
    Cities.cache_data = false
  end
end
