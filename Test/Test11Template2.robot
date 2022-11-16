*** Settings ***
Library           SeleniumLibrary
Default Tags      Functional
Documentation     A test suite containing tests related to login.
Test Setup       Open Browser To Login Page
Test Teardown    Close Browser
Resource         ../Resource.robot
Test Template    Login With Invalid Credentials Should Fail

*** Test Cases ***
    
InvalidLoginTest1                invalid                        ${VALID PASSWORD}
Invalid LoginTest2               ${VALID USER}                  invalid
Invalid LoginTest3               invalid                        invalid
    
    