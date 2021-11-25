*** Settings ***
Resource                common.resource


*** Variables ***
${API}                  https://animechan.vercel.app/api
@{response_keys}        anime       character       quote


*** Test Cases ***

Get A Random Quote and validate its shape
    ${res}=    GET  ${API}/random      expected_status=200
    Validate Shape Of Response      ${res.json()}

Get 10 Random Quotes and validate the shape of each item in list
    ${res}=    GET  ${API}/quotes      expected_status=200
    Length Should Be    ${res.json()}       10    msg="length is not 10"
    FOR    ${item}    IN    @{res.json()}
        Log     ${item}
        Validate Shape Of Response      ${item}
    END


*** Keywords ***

Validate Shape Of Response
    [Documentation]    response should contain all keys @{response_keys}
    [Arguments]    ${response}
    Shape Of Response    ${response}    @{response_keys}
