*** Settings ***
Documentation       GHD Technical Assessment
...                 Author: Rae Azcueta
Resource            ../PageObjects/LoginPage.robot
Resource            ../PageObjects/ContactPage.robot

Suite Setup         LoginPage.Start Test Case
Suite Teardown      LoginPage.End Test Case

*** Variables ***
&{ContactPage}      countryName=Philippines  name=Rae Azcueta  emailAddress=desiree_rae_azcueta@yahoo.com
...                 attachedFile=DummySample.txt

*** Test Cases ***
Step 1: Navigate to Contact Menu
    LoginPage.Allow Cookies
    ContactPage.Navigate To Contact Menu

Step 2: Select Philippines Label Tab
    ContactPage.Select Office       ${ContactPage}[countryName]

Step 3: Zoom In Map
    ContactPage.Zoom In Map

Step 4: Select GHD Cebu Office in Google Map
    ContactPage.Select Cebu Office in Google Map

Step 5: Close the Window Pop-Up
    ContactPage.Close Dialog Pop-Up

Step 6: Hover Contact Menu → Select Feedback Form
    ContactPage.Navigate To Feedback Form

Step 7: Populate Fields
    ContactPage.Populate Feedback Form Required Fields      &{ContactPage}

Step 8: Add Attachment
    ContactPage.Add Attachment      ${ContactPage}[attachedFile]

Step 9: Reload Captcha
    ContactPage.Reload Captcha