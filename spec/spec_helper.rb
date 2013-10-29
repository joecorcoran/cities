require 'bundler/setup'
require 'cities'

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.order = 'random'
  config.formatter = :progress
  config.before(:all) do
    City.data_path = File.expand_path('../../data', __FILE__)
  end
end
