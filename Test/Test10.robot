*** Settings ***
Library           SeleniumLibrary
Default Tags      Functional
Documentation     A test suite containing tests related to login.
Test Setup       Open Browser To Login Page
Test Teardown    Close Browser
Resource         ../Resource.robot

*** Test Cases ***
    
InvalidLoginTest1
    Login With Invalid Credentials Should Fail        invalid                        ${VALID PASSWORD}
Invalid LoginTest2
    Login With Invalid Credentials Should Fail        ${VALID USER}                   invalid
Invalid LoginTest3
    Login With Invalid Credentials Should Fail         invalid                        invalid
    
    