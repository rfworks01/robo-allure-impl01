*** Settings ***
Library    SeleniumLibrary
Library    DependencyLibrary
Library    FakerLibrary
Resource   ${EXECDIR}/resources/snipeit_kw.resource
Suite Setup  Open Browser   browser=${browserMode}    url=https://amazon.in/
Suite Teardown   Close Browser

*** Variables ***
${browserMode}   chrome
# ${EXECDIR}     E:/JenkinsGitDemo/PythonDemo/rfPOM01


*** Test Cases ***
Test_search_product
   Search for product   derby hats for women 2024

Test_navigation_bar
   Depends on test  Test_search_product
   Scroll to amazon option



*** Keywords ***
Search for product
    [Arguments]  ${search_item}
    Click Element    id=twotabsearchtextbox
    Input Text       id=twotabsearchtextbox    ${search_item}
    Click Element    id=nav-search-submit-button
    Sleep    5s
    ${search_found}    Get Text    css=div.a-section.a-spacing-small.a-spacing-top-small
    Log To Console    ${search_found}
    Capture Page Screenshot   EMBED

Scroll to amazon option
    Click Element   id=nav-hamburger-menu
    sleep   5s
    Scroll Element Into View      xpath=//ul[contains(@class,'hmenu hmenu-visible')]/li[25]
    Capture Element Screenshot    id=hmenu-content     EMBED