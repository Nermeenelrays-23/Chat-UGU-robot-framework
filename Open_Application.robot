*** Settings ***
Library         AppiumLibrary
Resource       ..//Resources/password.robot
*** Variables ***

${LOGIN-SUBMIT-BUTTON}   //android.widget.Button[contains(@text,"login")]
${EMAIL-TEXT-FIELD}      //android.widget.EditText[contains(@text,"Email")]
*** Test Cases ***
Open_Application
    Open Application  http://localhost:4723/wd/hub  platformName=Android  deviceName=emulator-5554 appPackage=ugu-v0.14.10-540-gms-staging.apk
     Wait Until Page Contains Element       ${LOGIN-SUBMIT-BUTTON}
