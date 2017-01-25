require 'watir'
require 'rspec/expectations'
include RSpec::Matchers

class ICS_access_code_class
  def initialize()
    #@driver.get "http://the-internet.herokuapp.com/dynamic_loading/1"
    @browser = Watir::Browser.new :chrome
    @base_url_test = "https://censusinterim-test1.cwp.govt.nz/census-test/"
    @base_url_UAT = "https://censusinterim-uat.cwp.govt.nz/census-test/"
  end

  def ics_enter_code()
    @browser.goto @base_url_UAT + "/landing"
    @browser.element(id: 'Form_UniqueCodeForm_uniqueCode_0').send_keys('777')
    @browser.element(id: 'Form_UniqueCodeForm_uniqueCode_1').send_keys('111')
    @browser.element(id: 'Form_UniqueCodeForm_uniqueCode_2').send_keys('001')
    @browser.element(id: 'Form_UniqueCodeForm_uniqueCode_3').send_keys('snj')
    @browser.element(id: 'Form_UniqueCodeForm_action_doValidateCode').click
  end

  def validate_error_message()
    @browser.element(id: 'Form_UniqueCodeForm_error').wait_until_present
    #expect(browser.text.include?('Please check the access code')).to eql true
    expect(@browser.element(id: 'Form_UniqueCodeForm_error').text).to eql 'Please check the access code and try againdjdjjd'
  end

  def add_new_person()
    @browser.element(css: 'button.add-people-button').wait_until_present
    @browser.element(css: 'button.add-people-button').click

    #@driver.find_element(:xpath, "//input[@type='text']").clear
    @browser.element(xpath: "//input[@type='text']").send_keys "first name"

    #@driver.find_element(:xpath, "(//input[@type='text'])[2]").clear
    @browser.element(xpath: "(//input[@type='text'])[2]").send_keys "last name"
    #@driver.find_element(:xpath, "//input[@type='tel']").clear
    @browser.element(xpath: "//input[@type='tel']").send_keys "21"
    #Selenium::WebDriver::Support::Select.new(@driver.find_element(:css, "select")).select_by(:text, "son or daughter")

  #  @browser.select_list(xpath: "//fieldset[@id='fieldwrapper-relationship']/div/select").select_value("sonordaughter")
    @browser.select_list(xpath: "//fieldset[@id='fieldwrapper-relationship']/div/select").select_value("sonordaughter")


    @browser.element(name: '_hsp._addPersonForm.newPerson._field.type').click
    @browser.element(css: 'button.button-save').wait_until_present.click
    sleep(5)

  end

  def add_IF_adult_long_path(form_number)
      #@browser.element(css: 'button.button-start-form').wait_until_present.click
      @browser.element(xpath: "/html/body/main/div/my-app/router-outlet[2]/div/form/div[2]/table/tbody/tr["+form_number+"]/td[2]/button").wait_until_present.click
       sleep(5)
       begin
       @browser.back
     rescue Selenium::WebDriver::Error::UnknownError
        # @browser.switch.alert
       @browser.alert.ok
       end
  end

  def test_tear_down
    @browser.close
  end
end
