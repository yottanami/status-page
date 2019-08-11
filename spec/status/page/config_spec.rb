require "spec_helper"
require 'yaml'

RSpec.describe do
  context "Check if setting exists and is file" do
    it {  expect(File).to exist("settings.yml")}
  end

  context "Check if setting exists and is file" do
    it {  expect(File).to exist("test_settings.yml")}
  end

  context "at least one test service should exists" do
    it { expect(SETTING["services"].count).to be >= 1 }
  end

  context "at least one service should exists" do
    setting = YAML::load_file 'settings.yml'
    it { expect(setting["services"].count).to be >= 3 }
  end

end
