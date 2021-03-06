*** Settings ***
Resource                common.resource
Default Tags            animechan

*** Variables ***
${API}                  https://animechan.vercel.app/api
@{response_keys}        anime       character       quote


*** Test Cases ***

Get A Random Quote and validate its shape
    [TAGS]          fast
    ${res}=         GET  ${API}/random      expected_status=200
    Log Many        ${res.json()}
    Validate Shape Of Response      ${res.json()}

Get 10 Random Quotes and validate the shape of each item in list
    [TAGS]          fast
    ${res}=         GET  ${API}/quotes      expected_status=200
    Log Many        ${res.json()}
    Length Should Be    ${res.json()}       10    msg="length is not 10"
    Validate Shape Of Each item  ${res.json()}

If Can Get Quote By Anime Title
    [TAGS]          slow
    [Template]      Get Quote By Anime Title
    naruto
    kino

If Can Get Quote By Character Name
    [TAGS]          slow    smoke
    [Template]      Get Quotes By Character Name
    saitama

Can list all the available anime
    [TAGS]          smoke
    ${res}=         GET  ${API}/available/anime      expected_status=200
    Log Many        ${res.json()}
    ${res_len}=     Get Length      ${res.json()}
    Should Be True      ${res_len} >= 795
    # Length Should Be    ${res.json()}       795


*** Keywords ***

Get Quote By Anime Title
    [Arguments]     ${anime_title}
    ${res}=         GET  ${API}/quotes/anime     params=title=${anime_title}    expected_status=200
    Log Many        ${res.json()}
    ${res_len}=     Get Length      ${res.json()}
    Should Be True      ${res_len} > 1
    Validate Shape Of Each item  ${res.json()}

Get Quotes By Character Name
    [Arguments]     ${character_name}
    ${res}=         GET  ${API}/quotes/character     params=name=${character_name}    expected_status=200
    Log Many        ${res.json()}
    ${res_len}=     Get Length      ${res.json()}
    Should Be True      ${res_len} > 1
    Validate Shape Of Each item  ${res.json()}

Validate Shape Of Response
    [Documentation]    response should contain all keys @{response_keys}
    [Arguments]        ${response}
    Shape Of Response    ${response}    @{response_keys}

Validate Shape Of Each item
    [Documentation]    loop through list of items in response and validate shape for each item
    [Arguments]        ${list_of_dict}
    FOR    ${item}    IN    @{list_of_dict}
        Log     ${item}
        Validate Shape Of Response      ${item}
    END