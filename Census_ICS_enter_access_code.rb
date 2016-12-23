require 'watir'
require 'rspec/expectations'
include RSpec::Matchers
require 'spreadsheet'

def enter_access_code(file_name)

browser = Watir::Browser.new :chrome
@base_url = "https://censusinterim-uat.cwp.govt.nz/census-test"
browser.goto @base_url + "/landing"
Spreadsheet.client_encoding = 'UTF-8'
book = Spreadsheet.open 'data/' + file_name + '.xls'
sheet1 = book.worksheet 0
sheet1.each do |ac|
	puts ac.to_s
	arr = ac.to_s.split('')
	puts arr
    ac1 = arr[2..4]
    ac2 = arr[5..7]
    ac3 = arr[8..10]
    ac4 = arr[11..13]
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
end

enter_access_code('SJ_Codes_wb_1')


