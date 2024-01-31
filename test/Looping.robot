*** Settings ***
Library     Collections
Library    DateTime
Library    String

*** Variables ***
@{people}    ${EMPTY}

*** Test Cases ***
Set Up People List
    ${person1}    Create Person    Andi    25
    ${person2}    Create Person    Budi    30
    Append To List    ${people}    ${person1}
    Append To List    ${people}    ${person2}

Print People Info
    FOR    ${person}    IN    @{people}
    Log    [Nama]: ${people}[1]\[nama], Umur: ${people}[1]\[umur]   console=${True}
    END

Loop With Range

    FOR    ${i}    IN RANGE    3
        Log   i adalah ${i}     console=${True}
        Exit For Loop If    ${i}==1
    END


*** Keywords ***
Create Person
    [Arguments]    ${nama}    ${umur}
    ${person}    Create Dictionary    nama=${nama}    umur=${umur}
    [Return]    ${person}