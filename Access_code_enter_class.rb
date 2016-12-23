 #START_BUTTON = {tag_name: 'button'}
    
  #FINISH_TEXT = {id: 'finish'}



require 'watir'
require 'rspec/expectations'
include RSpec::Matchers
require 'creek'

BASE_URL = 'https://censusinterim-uat.cwp.govt.nz/census-test/'

class Access_code_enter
  
  def initialize()
    
    
    #@driver.get "http://the-internet.herokuapp.com/dynamic_loading/1"
  end

  def parse_and_navigate(file_name)



  @file_name = file_name

  creek = Creek::Book.new ("data/"+@file_name+".xlsx")
  sheet= creek.sheets[0]

  sheet.rows.each do |row|
    row.each do |col,value|
         print value
         arr = value.to_s.split('')
      
         ac1 = arr[0..2]
         ac2 = arr[3..5]
         ac3 = arr[6..8]
         ac4 = arr[9..11]
         browser = Watir::Browser.new :chrome
         browser.goto BASE_URL + "/landing"
         browser.element(id: 'Form_UniqueCodeForm_uniqueCode_0').send_keys(ac1)
         browser.element(id: 'Form_UniqueCodeForm_uniqueCode_1').send_keys(ac2)
         browser.element(id: 'Form_UniqueCodeForm_uniqueCode_2').send_keys(ac3)
         browser.element(id: 'Form_UniqueCodeForm_uniqueCode_3').send_keys(ac4)
         browser.element(id: 'Form_UniqueCodeForm_action_doValidateCode').click
      # # explicit wait , for the dwelling form text to appear on the web page
      # #Watir::Wait.until() {browser.text.include? "Dwelling Form"}
      # #another way to write an explicit wait, is to wait for an element to load
         browser.element(css: "button.add-people-button").wait_until_present
         expect(browser.element(css: "button.add-people-button").exists?).to eql true
         browser.close
      end
    end
  end
end


# browser_1 = Access_code_enter.new()

# browser_1.parse_and_navigate('SJ_Codes_wb')






# def tear_down()
#   #browser.close
# end

#end



  
  
  