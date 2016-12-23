require 'watir'
require 'rspec/expectations'
include RSpec::Matchers

def enter_access_code(ac)

browser = Watir::Browser.new :chrome
@base_url = "https://censusinterim-uat.cwp.govt.nz/census-test"
browser.goto @base_url + "/landing"
arr = ac.split('')
    ac1 = arr[0..2]
    ac2 = arr[3..5]
    ac3 = arr[6..8]
    ac4 = arr[9..11]
browser.element(id: 'Form_UniqueCodeForm_uniqueCode_0').send_keys(ac1)
browser.element(id: 'Form_UniqueCodeForm_uniqueCode_1').send_keys(ac2)
browser.element(id: 'Form_UniqueCodeForm_uniqueCode_2').send_keys(ac3)
browser.element(id: 'Form_UniqueCodeForm_uniqueCode_3').send_keys(ac4)
browser.element(id: 'Form_UniqueCodeForm_action_doValidateCode').click
# explicit wait , for the dwelling form text to appear on the web page
#Watir::Wait.until() {browser.text.include? "Dwelling Form"}
#another way to write an explicit wait, is to wait for an element to load
browser.element(css: "button.add-people-button").wait_until_present
browser.close
end

enter_access_code('100000008snj')


