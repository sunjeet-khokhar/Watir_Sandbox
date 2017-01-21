$LOAD_PATH << "./class"
require "ICS_wrong_access_code_class.rb"

    ics_fail_login = ICS_wrong_access_code_class.new()
    ics_fail_login.ics_enter_code
    ics_fail_login.validate_error_message
    ics_fail_login.test_tear_down
