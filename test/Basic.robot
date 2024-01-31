*** Settings ***
Library     Collections
Library    DateTime
Library    String
#berguna untuk running
Default Tags    disable
#memberikan tags secara paksa ke tiap tiap test case
Force Tags      regression

#memberikan command di awal semua test case
Suite Setup

#memberikan command di akhir semua test case
Suite Teardown

#memberikan command di awal test case
Test Setup

#memberikan command di akhir test case
Test Teardown

*** Variables ***
#tipe data
${name}  andi suryo
&{planes}  us=boeing    eu=airbus
@{car}     sedan    SUV     Trail
${umur}  22
${hobi}  Badminton


#HashMap di java
&{new_dictionary}   first_name=andi     last_name=suryo     middle_name=laksono

#array di java
@{list}     andi    suryo   laksono


*** Test Cases ***
Tunjukan Nama Saya
    [Tags]   that
    Log     Nama adalah ${name}     console=${True}

Tunjukan Umur Saya
    [Tags]   that
    Log     Nama adalah ${umur}     console=${True}

Tunjukan Hobi Saya
    [Tags]   that
    ${name}     set variable    joni
    &{new_dictionary}    create dictionary     first=andi
    ${new_list}  Create List     andi    suryo   laksono
    Log     Nama adalah ${hobi}     console=${True}

Pembuatan Huruf Besar
    [Tags]  that
    ${name}      set variable    contoh test lower case
    ${result_UpperCase}     Jadikan huruf kapital    ${name}
    Log     ${result_UpperCase}     console=${True}


#https://robotframework.org/robotframework/latest/libraries/Collections.html
Percobaan Panggil Variables and Dictionaries
    [Tags]      this
    #Log     nama adalah ${planes}     console=${True}
    #Log     nama adalah ${planes.us}     console=${True}
    Dictionary Should Contain Item    ${planes}    us    boeing

Buat Variable dan Dictionary Baru
    [Tags]  that
    ${binatang}     Set Variable    kucing
    Log    show binatang   ${binatang}  console=${True}

Banyak isi
    [Tags]  this
    ${negara}  Create List  indonesia
    ${province}  Create Dictionary  dki=jakarta pusat   jabar= bandung  sumbar=padang
    Append To List    ${negara}     ${province}
    Log    isi dari negara ${negara}    console=${True}




#Keyword bisa juga disebut sebagai function atau method
*** Keywords ***
Jadikan huruf kapital
   #https://robotframework.org/robotframework/latest/libraries/String.html
    [Arguments]     ${input}
    ${result}       Convert To Upper Case   ${input}
    [Return]       ${result}