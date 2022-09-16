*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Library    Screenshot

*** Test Cases ***
Open Edvora Page
    Comment    Chrome should open up with Edvora Test assessment website
    Open Browser    https://testing-assessment-foh15kew9-edvora.vercel.app/    chrome
    Set Selenium Speed    2 seconds

Button To register a new User should pe present
    Comment    User should have a button to press & register a new account
    Page Should Contain Button    //button[@class="chakra-button css-d509a4"]

Button to Register should be Clickable
    Comment    User should be able to click the SignIn Button to register a new user
    Click Button    //button[@class="chakra-button css-d509a4"]

Validate username Field
    Comment    User should be able to enter the desired username in the Username entry field
    Click Element    //div[@class="chakra-input__group css-b61uh7"]
    Page Should Contain Element    //input[@class="chakra-input css-y572l6"][@autocomplete="username"]
    # Click Element    //input[@class="chakra-input css-y572l6"][@autocomplete="username"]
    Input Text    //input[@class="chakra-input css-y572l6"][@autocomplete="username"]    testa

Validate password field
    Comment    User should be able to enter password in the password field
    Page Should Contain Element    //input[@class="chakra-input css-y572l6"][@autocomplete="current-password"]
    # Click Element    //label[@class="chakra-form__label css-1etjwrz"]
    Input Password    //input[@class="chakra-input css-y572l6"][@autocomplete="current-password"]    testp

Validate Button to Create an account
    Comment    User should be able to click the button to register a new account
    Click Button    //button[@class="chakra-button css-8h0nsd"]

Alert for successful Registration
    Comment    User should be alerted for successful registration
    Alert Should Be Present    Account sucessfully created.    ACCEPT
    Sleep    5s
    Take Screenshot    ${OUTPUT_DIR}/successful-registration.png
    Sleep    10s
    Close Browser

Register using valid username & empty password
    Comment    User should not be able to register using valid username & empty password
    Open Browser    https://testing-assessment-foh15kew9-edvora.vercel.app/    chrome
    Set Selenium Speed    2 seconds
    Click Button    //button[@class="chakra-button css-d509a4"]
    Sleep    5s
    Input Text    //input[@class="chakra-input css-y572l6"][@autocomplete="username"]    testa
    Sleep    5s
    Click Button    //button[@class="chakra-button css-8h0nsd"]
    Sleep    5s
    Close Browser

Register using empty username & valid password
    Comment    User should not be able to register using empty username & valid password
    Open Browser    https://testing-assessment-foh15kew9-edvora.vercel.app/    chrome
    Set Selenium Speed    2 seconds
    Click Button    //button[@class="chakra-button css-d509a4"]
    Sleep    5s
    Input Password    //input[@class="chakra-input css-y572l6"][@autocomplete="current-password"]    testp
    Sleep    5s
    Click Button    //button[@class="chakra-button css-8h0nsd"]
    Sleep    5s
    Close Browser


Register using empty username & password
    Comment    User Registration should not be successful without entering username & password
    Open Browser    https://testing-assessment-foh15kew9-edvora.vercel.app/    chrome
    Set Selenium Speed    2 seconds
    Click Button    //button[@class="chakra-button css-d509a4"]
    Sleep    5s
    Input Text    //input[@class="chakra-input css-y572l6"][@autocomplete="username"]    testa
    Input Password    //input[@class="chakra-input css-y572l6"][@autocomplete="current-password"]    testp
    Click Button    //button[@class="chakra-button css-8h0nsd"]
    Sleep    15s
    Capture Page Screenshot    ${OUTPUT_DIR}/valid-credential-successful-registration.png
    Sleep    5s
    Close Browser


