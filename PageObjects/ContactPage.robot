*** Settings ***
Documentation           Page Objects for Contact Page Keywords
...                     Author: Rae Azcueta
Library                 SeleniumLibrary
Variables               ../ConfigEnvironment.py

*** Variables ***
${contact_menu}         id:navTab05
${feedback_form}        link:Feedback Form
${full_name}            css:#ctl00_ContentPlaceHolder1_txtName
${country}              css:#ctl00_ContentPlaceHolder1_txtCountry
${email}                css:#ctl00_ContentPlaceHolder1_txtEmail
${choose_file_btn}      css:#ctl00_ContentPlaceHolder1_fuAttachment
${reload_captcha}       css:#c_message_ctl00_contentplaceholder1_cap1_ReloadIcon
${captcha_image}        css:#c_message_ctl00_contentplaceholder1_cap1_CaptchaImage
${office_container}     xpath://div[@class="ic-col-md-3 officeList"]
${street_map_btn}       xpath://button[@title="Show street map"]
${zoom_in_btn}          xpath://button[@title="Zoom in"]
${cebu_pin}             xpath://div[@title="Cebu City"]
${map_details}          xpath://div[@role="dialog"]
${close_dialog}         xpath://button[@title="Close"]

*** Keywords ***
Navigate To Contact Menu
    Click Element       ${contact_menu}

Navigate To Feedback Form
    Mouse Over          ${contact_menu}
    Click Element       ${feedback_form}

Populate Feedback Form Required Fields
    [Arguments]     &{ContactPage}
    Input Text      ${full_name}      ${ContactPage}[name]
    Input Text      ${country}       ${ContactPage}[countryName]
    Input Text      ${email}     ${ContactPage}[emailAddress]

# countryName options are Australia, Canada, Chile, Fiji, Guam, New Zealand, Papua New Guinea, Philippines, Qatar,
# Saipan, Singapore, UAE, United Kingdom, United States
Select Office
    [Arguments]                         ${countryName}
    Scroll Element Into View            ${office_container}
    Wait Until Element Is Visible       link:${countryName}
    Click Element                       link:${countryName}

Zoom In Map
    Scroll Element Into View            ${zoom_in_btn}
    Wait Until Element Is Visible       ${zoom_in_btn}
    Click Button                        ${zoom_in_btn}

Select Cebu Office in Google Map
    Set Focus To Element                ${cebu_pin}
    Click Element                       ${cebu_pin}
    Wait Until Element Is Visible       ${map_details}

Close Dialog Pop-Up
    Click Button        ${close_dialog}

Add Attachment
    [Arguments]     ${attachedFile}
    Choose File     ${choose_file_btn}     ${CURDIR}/FilesToUpload/${attachedFile}

Reload Captcha
    Click Element                       ${reload_captcha}
    Wait Until Element Is Visible       ${captcha_image}

