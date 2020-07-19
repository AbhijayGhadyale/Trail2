require 'bundler/setup'
Bundler.require

require 'capybara/cucumber'
require 'rspec'
include Capybara::DSL
require 'capybara/dsl'
require 'rspec/core'
require 'rspec/expectations'
include RSpec::Matchers
require 'selenium/webdriver'
require 'webdrivers'

require './features/support/automation_context'
include AutomationContext

# Capybara.default_driver = :selenium
# Capybara.app_host="https://parabank.parasoft.com/"
#
#
#
#  Capybara.register_driver :selenium do |app|
#    Capybara::Selenium::Driver.new(app, :browser => :chrome)
#  end

begin
  config_file = ENV['TEST_CONFIG'] || 'local'
  config_path = "/conf/#{config_file}.yaml"
  all_config_filepath = File.expand_path(File.dirname(File.basename(Dir.getwd))) + config_path


  AutomationContext.startup all_config_filepath

rescue Exception => e
  puts e.message
  Process.exit(0)
end



# Capybara.register_driver :selenium do |app|
#   options = {
#        :js_errors => false,
#    }
#   options = Selenium::WebDriver::Firefox::Options.new(args: %w[--headless])
#   #options = Selenium::WebDriver::Firefox::Options.new
#   capabilities = Selenium::WebDriver::Remote::Capabilities.firefox(
#       acceptInsecureCerts: true,
#       )
#   Capybara::Selenium::Driver.new(
#       app,
#       browser: :firefox,
#       options: options,
#       desired_capabilities: capabilities
#   )
#   end

# Capybara.register_driver :selenium do |app|
#   client = Selenium::WebDriver::Remote::Http::Default.new
#   client.read_timeout = 100
#
#   capabilities=Selenium::WebDriver::Remote::Capabilities.internet_explorer
#   capabilities['ignoreProtectedModeSettings']=true,
#   capabilities['ignoreZoomSetting']=true,
#   capabilities['nativeEvents']=true,
#   capabilities['requireWindowFocus'] = true
#
#   Capybara::Selenium::Driver.new(app,browser: :internet_explorer,
#                                  desired_capabilities: capabilities,http_client:client)
#
# end


