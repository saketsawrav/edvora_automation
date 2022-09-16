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
    Click Element    //div[@class="chakra-input__group css-b61uh7"]
    Page Should Contain Element    //input[@class="chakra-input css-y572l6"][@autocomplete="username"]
    Input Text    //input[@class="chakra-input css-y572l6"][@autocomplete="username"]    testa

Validate password field
    Comment    User should be able to enter password in the password field
    Page Should Contain Element    //input[@class="chakra-input css-y572l6"][@autocomplete="current-password"]
    # Click Element    //label[@class="chakra-form__label css-1etjwrz"]
    Input Password    //input[@class="chakra-input css-y572l6"][@autocomplete="current-password"]    testp

Verify the Login Button is present
    Comment    User should be able to find the Login Button
    Page Should Contain Element    //button[@class="chakra-button css-8h0nsd"]

Login Button should be clickable
    Comment    User should be able to click login button after submitting username & Password and be logged in
    Click Button    //button[@class="chakra-button css-8h0nsd"]

Profile Settings Page should be opened
    Comment    User should be in the profile settings page containing Personal info, Security & services Section
    Set Selenium Implicit Wait    2 seconds
    Page Should Contain Element    xpath://*[@id="__next"]/div/main/div/div[1]/div[2]
    Capture Element Screenshot    xpath://*[@id="__next"]/div/main/div/div[1]/div[2]
    Page Should Contain Element    xpath://*[@id="__next"]/div/main/div/div[2]/div[2]
    Capture Element Screenshot    xpath://*[@id="__next"]/div/main/div/div[2]/div[2]

Personal Info Edit button should be functional
    Comment    User should be able to Edit Personal Info by clicking Edit Button
    Set Selenium Implicit Wait    2 seconds
    Click Button    //button[@class="chakra-button css-1mh6pc0"]

Personal Info-Validate Full Name Input
    Comment    User should be able to enter their Full Name in the input field
    Set Selenium Implicit Wait    2 seconds
    Click Element    //input[@class="chakra-input css-zkkb9l"][@autocomplete="name"]
    Press Keys    //input[@class="chakra-input css-zkkb9l"][@autocomplete="name"]    CTRL+a+BACKSPACE
    Input Text    //input[@class="chakra-input css-zkkb9l"][@autocomplete="name"]    John Doe

Personal Info-Validate Date of Birth Field
    Comment    User should be able to enter their Birthdate in mm/dd/yyyy format
    Set Selenium Implicit Wait    2 seconds
    Click Element    //input[@class="chakra-input css-yxvhn"][@type="date"][@name="dateOfBirth"]
    Input Text    //input[@class="chakra-input css-yxvhn"][@type="date"][@name="dateOfBirth"]    011221990

Personal Info- Date of Birth should be under 09/15/2022
    Comment    User should not be able to enter D.O.B more than 09/15/2022
    Set Selenium Implicit Wait    2 seconds
    Click Element    //input[@class="chakra-input css-yxvhn"][@type="date"][@name="dateOfBirth"]
    Input Text    //input[@class="chakra-input css-yxvhn"][@type="date"][@name="dateOfBirth"]    009162022
    Set Selenium Timeout    10 seconds
    Capture Element Screenshot   //input[@class="chakra-input css-yxvhn"][@type="date"][@name="dateOfBirth"]     ${OUTPUT_DIR}/dob-fail.png
    Fail    msg=The Date of Birth takes value greater than 09/15/2022

Personal Info- Mobile Number input field should not accept alphabets
    Comment    User should not be able to enter alphabets in mobile Number input field
    Set Selenium Implicit Wait    2 seconds
    Click Element    //input[@class="chakra-input css-zkkb9l"][@type="tel"][@name="mobileNumber"]
    Press Keys    //input[@class="chakra-input css-zkkb9l"][@type="tel"][@name="mobileNumber"]    CTRL+a+BACKSPACE
    Input Text      //input[@class="chakra-input css-zkkb9l"][@type="tel"][@name="mobileNumber"]    asdwasdwwasd
    Set Selenium Timeout    10 seconds
    Capture Element Screenshot    //input[@class="chakra-input css-zkkb9l"][@type="tel"][@name="mobileNumber"]    ${OUTPUT_DIR}/mobile-alphabets-fail.png
    Fail    msg=Alphabets are accepted in the Mobile number field.

Personal Info- Validate Mobile Number input Field
    Comment    User should be able to enter their mobile Number
    Set Selenium Implicit Wait    2 seconds
    Click Element    //input[@class="chakra-input css-zkkb9l"][@type="tel"][@name="mobileNumber"]
    Press Keys    //input[@class="chakra-input css-zkkb9l"][@type="tel"][@name="mobileNumber"]    CTRL+a+BACKSPACE
    Input Text      //input[@class="chakra-input css-zkkb9l"][@type="tel"][@name="mobileNumber"]    9090909090

Personal Info- Validate Gender field
    Comment    User should be able to select their gender as desired,upon clicking the arrow button: "men", "women" & "other" option should be present
    Set Selenium Implicit Wait    2 seconds
    Click Element    //select[@class="chakra-select css-ibs81u"]
    Capture Element Screenshot    //select[@class="chakra-select css-ibs81u"]


Personal Info- Select Male Gender field
    Comment    User should be able to select their gender as desired,upon clicking the arrow button: "men", "women" & "other" option should be present
    Set Selenium Implicit Wait    2 seconds
    Click Element    //select[@class="chakra-select css-ibs81u"]
    Click Element    //option[@value="male"]

Personal Info- Validate Address Field
    Comment    User should be able to enter their address in the address input field
    Set Selenium Implicit Wait    2 seconds
    Click Element    //input[@class="chakra-input css-zkkb9l"][@name="address"]
    Press Keys    //input[@class="chakra-input css-zkkb9l"][@name="address"]    CTRL+a+BACKSPACE
    Input Text    //input[@class="chakra-input css-zkkb9l"][@name="address"]    420 Forest Hill Drive

Security Section- Validate change password field
    Comment    User should be able to enter new password in new password input field
    Set Selenium Implicit Wait    2 seconds
    Input Password    //input[@class="chakra-input css-zkkb9l"][@name="Password"]    testp2

 
Validate Logout Button
    Comment    User should be able to click logout button and logoff
    Set Selenium Implicit Wait    2 seconds
    Click Element    xpath://*[@id="__next"]/div/main/div/div[3]/div[2]/div[2]/button
    Close Browser
