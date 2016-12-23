
$LOAD_PATH << "."
require "Access_code_enter_class.rb"
# require 'watir'
# require 'rspec/expectations'
# include RSpec::Matchers
# require 'creek'

browser_1 = Access_code_enter.new()

browser_1.parse_and_navigate('SJ_Codes_wb')

# browser.tear_down()

puts('check')








