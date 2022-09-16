*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Library    Process

*** Test Cases ***
Open Edvora Login Page
    Comment    Chrome should open up with Gmail website
    Open Browser    https://testing-assessment-foh15kew9-edvora.vercel.app/    chrome
    Set Selenium Speed    2 seconds
    Delete All Cookies


Validate Username entry Field
    Comment    User should be able to enter their username
    Set Selenium Implicit Wait    2 seconds
    Click Element    //div[@class="chakra-input__group css-b61uh7"]
    Page Should Contain Element    //input[@class="chakra-input css-y572l6"][@autocomplete="username"]
    Input Text    //input[@class="chakra-input css-y572l6"][@autocomplete="username"]    testa

Validate password field
    Comment    User should be able to enter password in the password field
    Set Selenium Implicit Wait    2 seconds
    Page Should Contain Element    //input[@class="chakra-input css-y572l6"][@autocomplete="current-password"]
    # Click Element    //label[@class="chakra-form__label css-1etjwrz"]
    Input Password    //input[@class="chakra-input css-y572l6"][@autocomplete="current-password"]    testp

Verify the Login Button is present
    Set Selenium Implicit Wait    2 seconds
    Comment    User should be able to find the Login Button
    Page Should Contain Element    //button[@class="chakra-button css-8h0nsd"]
    Close Browser

Login using empty Username & empty Password
    Comment    User should not be able to login using empty username
    Open Browser    https://testing-assessment-foh15kew9-edvora.vercel.app/    chrome
    Set Selenium Speed    2 seconds
    Delete All Cookies
    Set Selenium Implicit Wait    2 seconds
    Click Button    //button[@class="chakra-button css-8h0nsd"]
    Set Selenium Timeout    10 seconds
    Close Browser

Login using valid Username & empty password
    Comment    User should not be able to login with empty username
    Open Browser    https://testing-assessment-foh15kew9-edvora.vercel.app/    chrome
    Set Selenium Speed    2 seconds
    Delete All Cookies
    Set Selenium Implicit Wait    2 seconds
    Click Element    //div[@class="chakra-input__group css-b61uh7"]
    Page Should Contain Element    //input[@class="chakra-input css-y572l6"][@autocomplete="username"]
    Input Text    //input[@class="chakra-input css-y572l6"][@autocomplete="username"]    testa
    Click Button    //button[@class="chakra-button css-8h0nsd"]
    Set Selenium Timeout    10 seconds
    Close Browser

Login using empty username & valid password
    Comment    User should not be able to login with empty password
    Open Browser    https://testing-assessment-foh15kew9-edvora.vercel.app/    chrome
    Set Selenium Speed    2 seconds
    Delete All Cookies
    Set Selenium Implicit Wait    2 seconds
    Page Should Contain Element    //input[@class="chakra-input css-y572l6"][@autocomplete="current-password"]
    Input Password    //input[@class="chakra-input css-y572l6"][@autocomplete="current-password"]    testp
    Click Button    //button[@class="chakra-button css-8h0nsd"]
    Set Selenium Timeout    10 seconds
    Close Browser

Login using valid credential
    Comment    User should be able to login using valid username & password
    Open Browser    https://testing-assessment-foh15kew9-edvora.vercel.app/    chrome
    Set Selenium Speed    2 seconds
    Delete All Cookies
    Set Selenium Implicit Wait    2 seconds
    Click Element    //div[@class="chakra-input__group css-b61uh7"]
    Page Should Contain Element    //input[@class="chakra-input css-y572l6"][@autocomplete="username"]
    Input Text    //input[@class="chakra-input css-y572l6"][@autocomplete="username"]    testa
    Set Selenium Implicit Wait    2 seconds
    Page Should Contain Element    //input[@class="chakra-input css-y572l6"][@autocomplete="current-password"]
    Input Password    //input[@class="chakra-input css-y572l6"][@autocomplete="current-password"]    testp
    Click Button    //button[@class="chakra-button css-8h0nsd"]
    Set Selenium Timeout    20 seconds
    Capture Page Screenshot    ${OUTPUT_DIR}/successful-login-profile-page.png
    Set Selenium Timeout    20 seconds
    Close Browser



