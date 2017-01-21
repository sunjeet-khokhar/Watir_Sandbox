require 'watir'
require 'rspec/expectations'
include RSpec::Matchers

class ICS_wrong_access_code_class
  def initialize()
    #@driver.get "http://the-internet.herokuapp.com/dynamic_loading/1"
    @browser = Watir::Browser.new :firefox
    @base_url_test = "https://censusinterim-test1.cwp.govt.nz/census-test/"
    @base_url_UAT = "https://censusinterim-uat.cwp.govt.nz/census-test/"
  end

  def ics_enter_code()
    @browser.goto @base_url_UAT + "/landing"
    @browser.element(id: 'Form_UniqueCodeForm_uniqueCode_0').send_keys('123')
    @browser.element(id: 'Form_UniqueCodeForm_uniqueCode_1').send_keys('456')
    @browser.element(id: 'Form_UniqueCodeForm_uniqueCode_2').send_keys('789')
    @browser.element(id: 'Form_UniqueCodeForm_uniqueCode_3').send_keys('snj')
    @browser.element(id: 'Form_UniqueCodeForm_action_doValidateCode').click
  end

  def validate_error_message()
    @browser.element(id: 'Form_UniqueCodeForm_error').wait_until_present
    #expect(browser.text.include?('Please check the access code')).to eql true
    expect(@browser.element(id: 'Form_UniqueCodeForm_error').text).to eql 'Please check the access code and try againdjdjjd'
  end

  def test_tear_down
    @browser.close
  end
end
