require 'watir'
require 'rspec/expectations'
include RSpec::Matchers


    browser = Watir::Browser.new :firefox
    @base_url = "https://censusinterim-test1.cwp.govt.nz/census-test/"
    browser.goto @base_url + "/landing"
    browser.element(id: 'Form_UniqueCodeForm_uniqueCode_0').send_keys('194')
    browser.element(id: 'Form_UniqueCodeForm_uniqueCode_1').send_keys('216')
    browser.element(id: 'Form_UniqueCodeForm_uniqueCode_2').send_keys('615')
    browser.element(id: 'Form_UniqueCodeForm_uniqueCode_3').send_keys('LSM')
    browser.element(id: 'Form_UniqueCodeForm_action_doValidateCode').click
    browser.element(xpath: "//input[@type='text']").wait_until_present
    #browser.goto(@base_url + "/census-test/census/form")
    #browser.element(:xpath, "//input[@type='text']").clear
    browser.element(xpath: "//input[@type='text']").send_keys "sunjeet"
    #browser.element(:xpath, "(//input[@type='text'])[2]").clear
    browser.element(xpath: "(//input[@type='text'])[2]").send_keys "khokhar"
    #browser.element(:xpath, "//input[@type='tel']").clear
    browser.element(xpath: "//input[@type='tel']").send_keys "01"
    #browser.element(:xpath, "(//input[@type='tel'])[2]").clear
    browser.element(xpath: "(//input[@type='tel'])[2]").send_keys "10"
    #browser.element(:xpath, "(//input[@type='tel'])[3]").clear
    browser.element(xpath: "(//input[@type='tel'])[3]").send_keys "1981"

    browser.element(name: "_form.individualFormSchema._field.sex").click
    browser.element(xpath: "(//input[@name='_form.individualFormSchema._field.sex'])[2]").click
    
    browser.close
    # browser.find_element(:name, "_form.individualFormSchema._field.ur_provide_address._field.ur_provide_address_predefined").click
    # browser.find_element(:xpath, "(//input[@type='text'])[3]").clear
    # browser.find_element(:xpath, "(//input[@type='text'])[3]").send_keys "6 venerable terrace"
    # browser.find_element(:css, "ul.autosuggest-list > li").click
    # browser.find_element(:xpath, "(//input[@type='tel'])[5]").clear
    # browser.find_element(:xpath, "(//input[@type='tel'])[5]").send_keys "2"
    # browser.find_element(:name, "_form.individualFormSchema._field.census_night_address._field.census_night_address_predefined").click
    # browser.find_element(:xpath, "(//input[@name='ethnicity_predefined'])[8]").click
    # browser.find_element(:name, "_form.individualFormSchema._field.country_birth._field.country_birth_predefined").click
    # browser.find_element(:css, "button.button-next.hide-on-mobile").click
    # browser.find_element(:xpath, "(//input[@name='_form.individualFormSchema._field.maori_descent'])[3]").click
    # browser.find_element(:name, "_form.individualFormSchema._field.address_one_year_ago._field.address_predefined").click
    # browser.find_element(:name, "languages").click
    # browser.find_element(:name, "_form.individualFormSchema._field.religion._field.religion_predefined").click
    # browser.find_element(:name, "live_with_predefined").click
    # browser.find_element(:name, "_form.individualFormSchema._field.study").click
    # browser.find_element(:name, "_form.individualFormSchema._field.travel_to_education").click
    # browser.find_element(:name, "_form.individualFormSchema._field.difficulty_seeing").click
    # browser.find_element(:name, "_form.individualFormSchema._field.difficulty_hearing").click
    # browser.find_element(:name, "_form.individualFormSchema._field.difficulty_walking").click
    # browser.find_element(:name, "_form.individualFormSchema._field.difficulty_remembering").click
    # browser.find_element(:name, "_form.individualFormSchema._field.difficulty_washing").click
    # browser.find_element(:name, "_form.individualFormSchema._field.difficulty_communicating").click
    # browser.find_element(:css, "button.button-next.hide-on-mobile").click
    # browser.find_element(:xpath, "(//input[@name='_form.individualFormSchema._field.smoking'])[2]").click
    # browser.find_element(:xpath, "(//input[@name='_form.individualFormSchema._field.used_to_smoke'])[2]").click
    # browser.find_element(:name, "_form.individualFormSchema._field.legal_marital_status").click
    # browser.find_element(:name, "_form.individualFormSchema._field.own_dwelling").click
    # browser.find_element(:name, "_form.individualFormSchema._field.highest_school_qualification._field.highest_school_qualification_predefined").click
    # browser.find_element(:xpath, "(//input[@name='_form.individualFormSchema._field.other_completed_qualification'])[2]").click
    # browser.find_element(:name, "income_source").click
    # browser.find_element(:xpath, "(//input[@name='_form.individualFormSchema._field.total_personal_income'])[11]").click
    # browser.find_element(:css, "button.button-next.hide-on-mobile").click
    # browser.find_element(:xpath, "(//input[@name='work_in_ref_week'])[2]").click
    # browser.find_element(:xpath, "(//input[@type='tel'])[9]").clear
    # browser.find_element(:xpath, "(//input[@type='tel'])[9]").send_keys "20"
    # browser.find_element(:xpath, "(//input[@name='_form.individualFormSchema._field.employment_status'])[2]").click
    # browser.find_element(:name, "_form.individualFormSchema._field.work_place_address").click
    # browser.find_element(:name, "unpaid_activities").click
    # browser.find_element(:name, "declaration").click
    # browser.find_element(:css, "button.button-submit.hide-on-mobile").click
