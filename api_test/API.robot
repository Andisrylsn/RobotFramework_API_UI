*** Settings ***

Documentation    Robot Framework API Automation
Library  OperatingSystem
Library  RequestsLibrary
Library  Collections

*** Variables ***

${BASE_URL}  https://reqres.in/api
${HEADERS}   Content-Type=application/json
${EXPECTED_NAME}  andi
${EXPECTED_JOB}  Software Quality Assurance

*** Test Cases ***

Get User List
    Create Session  my_session  ${BASE_URL}
    ${response}=  GET On Session  my_session  /users
    Log  ${response.status_code}
    Log  ${response.content}
    Log   "Andi Suryo Laksono"
    Should Be Equal As Numbers    ${response.status_code}  200


Positive Case

    &{req_body}=  Create Dictionary    name=andi        job=software Quality Assurance
    ${response}=     POST        ${base_url}/users     json=${req_body}    expected_status=201
    log      ${response.json()}
    Dictionary Should Contain Key     ${response.json()}     id
    ${name}=    Get From Dictionary     ${response.json()}    name
    Should Be Equal As Strings    ${expectedname}   ${name}


Negative Case: Missing Request Body Fields
    &{req_body}=  Create Dictionary
    ${response_fail}=     POST        ${base_url}/users     json=${req_body}    expected_status=201
    log      ${response_fail.json()}
    Dictionary Should Contain Key     ${response_fail.json()}     id
    Dictionary Should Not Contain Key    ${response_fail.json()}  name


Negative Case: Missing Response
    #seharusnya  400 karena end pointnya tidak sesuai
    &{req_body}=  Create Dictionary    name=andi        job=software Quality Assurance
    ${response}=     POST        ${base_url}/invalid-endpoint     json=${req_body}    expected_status=400
    log      ${response.json()}
    Dictionary Should Contain Key     ${response.json()}     id
    ${name}=    Get From Dictionary     ${response.json()}    name
    Should Be Equal As Strings    ${expectedname}   ${name}



Negative Case: Response Not Equals with Request
    &{req_body}=  Create Dictionary    name=joko        job=software Quality Assurance
    ${response}=     POST        ${base_url}/invalid-endpoint     json=${req_body}    expected_status=201
    log      ${response.json()}
    Dictionary Should Contain Key     ${response.json()}     id
    ${name}=    Get From Dictionary     ${response.json()}    name
    Should Not Be Equal As Strings      ${expectedname}   ${name}