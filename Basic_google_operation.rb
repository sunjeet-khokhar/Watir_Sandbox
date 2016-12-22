require 'watir'
require 'rspec/expectations'
include RSpec::Matchers

browser = Watir::Browser.new :firefox
browser.goto "http://google.com"
browser.button(name: 'btnI').click
puts browser.url + "\n" + browser.title
browser.element(xpath: "//div[@id='highlight']/ul/li[2]/div/div[1]/a/img").click
browser.element(id: 'archive-link').wait_until_present
browser.select_list(id: "lang-chooser").select_value("da")
#browser.select_list(id: "lang-chooser").option(:text => "da").select
puts(browser.url)
expect(browser.url).to eql 'https://www.google.com/doodles?hl=da'
browser.close

