require 'em/pure_ruby'
require 'appium_lib'
require 'rspec'
require 'yaml'
require 'allure-cucumber'
require 'faker'
require 'httparty'
require 'fileutils'
require 'date'
require_relative '../config/base_config'

Dir["#{Dir.pwd}/features/util/*.rb"].each do |file_path|
  require_relative file_path
end


caps = YAML.load_file(File.expand_path("./platform_config/appium_caps.yml"))

case BaseConfig.device_type
when 'cloud'
  #todo
else
  device = `adb devices -l`.strip.split("attached")[1]
  caps['caps']['udid'] = device.split(" ")[0]
  caps['caps']['deviceName'] = 'Android Device'
  caps['caps']['platformVersion'] = `adb shell getprop ro.build.version.release`.strip
end

begin
  Appium::Driver.new(caps, true)
  Appium.promote_appium_methods Object
rescue Exception => e
  puts e.message
  Process.exit(0)
end

