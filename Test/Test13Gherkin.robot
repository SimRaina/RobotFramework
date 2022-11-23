*** Settings ***
Documentation     A test suite with a single Gherkin style test.
...
...               This test is functionally identical to the example in
...               valid_login.robot file.
Resource          ../Resource.robot
Test Teardown     Close Browser

*** Test Cases ***
Valid Login
    Given browser is opened to login page
    When user "Admin" logs in with password "admin123"
    Then dashboard page should be open

*** Keywords ***
Browser is opened to login page
    Open browser to login page
    
User "${username}" logs in with password "${password}"
    Input username    ${username}
    Input password    ${password}
    Sleep             ${timer}    
    Submit credentials
    Sleep             ${timer}

Dashboard page should be open
    Location Should Be    ${DASHBOARD URL}
    Title Should Be    OrangeHRM