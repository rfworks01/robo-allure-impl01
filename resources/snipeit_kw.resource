*** Settings ***
Library    SeleniumLibrary
Resource   ${EXECDIR}/resources/locators/snipeITLogin.resource
Resource   ${EXECDIR}/resources/locators/newUserInfo.resource
 

*** Keywords ***
Open browser And Navigate to login 
  [Arguments]   ${username}      ${password}
  Input Text     ${LoginPage.username}    admin
  Input Text     ${LoginPage.password}     password
  Sleep    3s
  Click Button   ${LoginPage.login_button} 
  Wait Until Element Is Visible    css=h1.pull-left.pagetitle    timeout=5s

Logout from application
  Click Element    css=li.dropdown.user.user-menu
  Sleep    1s
  Click Element    xpath=//li[@class="dropdown user user-menu open"]//li[8]
  Wait Until Page Contains    Please Login      timeout=5s


Click and Input text
    [Arguments]   ${eleLocator}   ${textInput}
    Click Element    ${eleLocator}
    Input Text       ${eleLocator}      ${textInput}
Enter New User Information
   [Documentation] 
   ...    enter input text data
   ...    firstname,lastname,username,password,useremail

   [Arguments]   ${firstname}   ${lastname}  ${new_username}  ${pw}  ${useremail}
   Click and Input text    ${NewUserInfo.firstname}      ${firstname}   
   Click and Input text    ${NewUserInfo.lastname}       ${lastname}  
   Click and Input text    ${NewUserInfo.username}       ${new_username} 
   Click and Input text    ${NewUserInfo.pw}             ${pw}  
   Click and Input text    ${NewUserInfo.confirm_pw}     ${pw}  
   Click and Input text    ${NewUserInfo.useremail}      ${useremail}  
   Capture Page Screenshot   EMBED