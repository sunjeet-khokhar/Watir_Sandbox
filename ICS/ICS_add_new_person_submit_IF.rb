$LOAD_PATH << "./class"
require "ICS_access_code_class.rb"

    ics_enter_IF = ICS_access_code_class.new()
    ics_enter_IF.ics_enter_code
    #ics_fail_login.validate_error_message
    #(1..5).each do
    ics_enter_IF.add_new_person
    #end
    (2..10).each do |i|
    ics_enter_IF.add_IF_adult_long_path(i.to_s)
    end
    ics_enter_IF.test_tear_down
