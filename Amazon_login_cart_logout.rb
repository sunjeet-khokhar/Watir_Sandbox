
require 'watir'
require 'rspec/expectations'
include RSpec::Matchers

browser = Watir::Browser.new :firefox
browser.goto "www.amazon.com"

browser.element(:css, "#nav-link-accountList > span.nav-line-1").click


browser.text_field(:id, "ap_email").set("sunjeet81@gmail.com")
browser.text_field(:id, "ap_password").set("yorks64!@")
browser.element(:id,'signInSubmit').click
browser.element(:css,"#nav-cart-count").wait_until_present.click
print (browser.element(:id,"nav-cart-count").text)
#browser.element(:xpath,"//a[@id='nav-item-signout']/span").click
browser.back  #effectively kills the session
browser.close
