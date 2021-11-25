*** Settings ***
Resource          common.resource

*** Variables ***
${API}           https://animechan.vercel.app/api

*** Test Cases ***

Get A Random Quote
    ${res}=    GET  ${API}/random      expected_status=200
    Validate Shape Of Response      ${res.json()}



*** Keywords ***

Validate Shape Of Response
    [Documentation]    reusable shape to be validated for each response recieved
    [Arguments]    ${response}
    Dictionary Should Contain Key     ${response}     anime
    Dictionary Should Contain Key     ${response}     character
    Dictionary Should Contain Key     ${response}     quote


# Quick Get Request Test
#     ${response}=    GET  https://www.google.com

# Quick Get Request With Parameters Test
#     ${response}=    GET  https://www.google.com/search  params=query=ciao  expected_status=200

# Quick Get A JSON Body Test
#     ${response}=    GET  https://jsonplaceholder.typicode.com/posts/1
#     Should Be Equal As Strings    1  ${response.json()}[id]
