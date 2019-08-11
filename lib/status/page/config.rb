require 'yaml'

file_name = ENV['RACK_ENV'] == 'test' ? "settings.yml" : "test_settings.yml"
SETTING = YAML::load_file file_name
