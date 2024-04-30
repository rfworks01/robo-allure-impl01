*** Settings ***
Library    SeleniumLibrary
Library    FakerLibrary
Resource   ${EXECDIR}/resources/snipeit_kw.resource
Test Setup  Open Browser   browser=${browserMode}    url=https://demo.snipeitapp.com/login
Test Teardown   Close Browser

*** Variables ***
${browserMode}   chrome
# ${EXECDIR}     E:/JenkinsGitDemo/PythonDemo/rfPOM01


*** Test Cases ***
TC001_new_asset
   Open browser And Navigate to login    admin  password
   Create new asset
   Enter New Asset data
   Logout from application
   

*** Keywords ***
Create new asset
    Click Element    //ul[contains(@class,'nav navbar-nav')]/li[7]
    Click Element    //ul[@class='dropdown-menu']/li[1]/a[1]
Enter New Asset data
   Sleep    5s
   Click Element    id=select2-company_select-container     #css=span.selection.needsclick
   Sleep    5s
   Wait Until Element Is Visible     //ul[@class='select2-results__options']/li[3]        timeout=3s
   Click Element     //ul[@class='select2-results__options']/li[3] 
   Capture Page Screenshot    EMBED

Click Save button
    click Element    xpath=//form[@id='userForm']/div/div[2]/button/i
    Sleep    5s



