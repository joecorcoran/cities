require 'bundler/setup'
require 'csv'
require 'fileutils'
require 'logger'
require 'multi_json'
require 'rspec/core/rake_task'

logger = Logger.new(STDOUT)

desc 'Run specs'
RSpec::Core::RakeTask.new(:spec)

task :default => :spec

namespace :cities do
  desc 'Create directories needed to generate data'
  task :setup do
    logger.info('Setting up...')

    FileUtils.mkdir_p('./_tmp')
    FileUtils.mkdir_p('./data/cities')
  end

  desc 'Split the world cities database file into smaller CSVs'
  task :split_csv, [:original] => :setup do |task, args|
    original     = args[:original]
    file_count   = 10

    header_lines = 1
    lines        = `cat #{original} | wc -l`.to_i - header_lines
    max_lines    = (lines / file_count) + header_lines
    header       = `head -n #{header_lines} #{original}`

    start = header_lines
    file_count.times do |i|
      finish    = start + max_lines
      file_path = "./_tmp/cities-#{i}.csv"

      logger.info("Creating #{file_path}")

      File.open(file_path, 'w') { |f| f.write header }
      `tail -n #{lines - start} #{original} | head -n #{max_lines} >> #{file_path}`

      start = finish
    end
  end

  desc 'Generate JSON data'
  task :generate, [:original] => [:setup, :split_csv] do |task, args|
    csv_files = Dir['./_tmp/cities-*.csv']

    csv_files.each do |file_path|
      logger.info("Reading #{file_path}")
      
      arr    = CSV.read(file_path, :encoding => 'windows-1251:utf-8', :quote_char => '@')
      hash   = {}
      header = arr.shift

      header.shift
      header.map!(&:downcase)

      arr.each do |row|
        code      = row.shift
        city_name = row[0]

        hash[code] ||= {}
        hash[code][city_name] = {}

        row.each_with_index do |field, i|
          hash[code][city_name][header[i]] = field
        end
      end

      hash.each do |city_code, city_data|
        json_path = "./data/cities/#{city_code.upcase}.json"

        File.open(json_path, 'a') do |file|
          logger.info("  -> Reopening #{json_path}") if file.size > 0
          logger.info("  -> Writing #{json_path}")

          file << MultiJson.dump(city_data)
        end
      end
    end

    Rake::Task['cities:cleanup'].invoke
  end

  desc 'Clean up after data is generated'
  task :cleanup do
    logger.info('Cleaning up...')

    FileUtils.rm_rf('./_tmp')
  end
end
