*** Settings ***
Documentation     Base API testing resource file
Resource          common.resource
Library           RequestsLibrary
Library           Collections

*** Variables ***


*** Keywords ***

Shape Of Response
    [Documentation]    reusable keyword to be validated for each response recieved
    [Arguments]        ${response}    @{response_keys}
    FOR    ${key}    IN    @{response_keys}
        Dictionary Should Contain Key     ${response}     ${key}
        Should Not Be Empty               ${response}[${key}]            msg="value is empty in key ${key}"
    END