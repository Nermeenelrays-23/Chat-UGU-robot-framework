*** Settings ***
Library      AppiumLibrary
Resource   ..//Resources/Android-Data.robot


*** Test Cases ***
#Login
Login And Send Text Message

    Set Appium Timeout          25s
    Open Ugu App On First Device
    Sign in With User           ${USER1-DETAILS}[email]   ${USER1-DETAILS}[password]
    Open Ugu App On Second Device
    Sign in With User           ${USER2-DETAILS}[email]   ${USER2-DETAILS}[password]
    sleep                        1s
    Switch Application           1
    Create New Conversation      ${USER2-DETAILS}[name]
    Send Message Inside Conversation Window      Hi Noura It's Automation Run
    sleep                       2s
    Switch Application          2
    Go To Chat Tab
    Open Conversation                             ${USER1-DETAILS}[name]
    Wait Until Conversation Contains Message      Hi Noura It's Automation Run
    Send Message Inside Conversation Window       Hi Nermeen It's Automation Run
    sleep                       2s
    Switch Application          1
    Wait Until Conversation Contains Message      Hi Noura It's Automation Run


*** Test Cases ***
#Test forward functionality
Forward Funcation
      Set Appium Timeout          10s
      Select Message                       Hi Nermeen It's Automation Run
      Forward Message to another user      Test Forward Function
      Switch Application                   2
      Check Forward message delivered successfully in The other device       Test Forward Function

*** Test Cases ***
#Test Delete For Me Functionality
Delete For Me Functionality
      Select Message To Delete it                 Hi Nermeen It's Automation Run
      Delete Message For Me                       Hi Nermeen It's Automation Run
      Check Message disappeared From My Chat      Hi Nermeen It's Automation Run

*** Test Cases ***
#Test Delete For All functionality
Delete For all Message Function
     Switch Application          1
     Set Appium Timeout          10s
     Select Message and delete it for all
     Switch Application          2
     Check Message Deleted successfully From User2


*** Test Cases ***
#Test Stickers
Ugu Stickers Function
    Set Appium Timeout          10s
    Select Sticker And send
    Switch Application           1
    Check That Sticker Sent to the other user successfully


*** Test Cases ***
#Forward Sticker
Forward Sticker Function
    Set Appium Timeout          10s
    Select Sticker and forward it                                          Forward Sticker Test
    Switch Application          2
    Check Forward Sticker delivered successfully to the second user        Forward Sticker Test


*** Test Cases ***
#Test Clear chat functionality
Clear Chat Function
    Set Appium Timeout          10s
    Click On Account User Chat And select Clear Chat
    Check That Chat Cleared All Messages        Hi Nermeen It's Automation Run


*** Test Cases ***
#Test Online And Offline Status
Online And Offline Status Function
    Open Conversation           ${USER1-DETAILS}[name]
    Switch Application          1
    Check User Online Status
    Switch Application          2
    Go Back
    Go Back
    Go Back
    Switch Application          1
    Check User Offline Status


*** Test Cases ***
#Test Archive Chat Function
Archive Chat Functionality
    Set Appium Timeout          10s
    Open Ugu App On Second Device
    Sign in With User           ${USER2-DETAILS}[email]   ${USER2-DETAILS}[password]
    Go To Chat Tab
    Open Conversation                             ${USER1-DETAILS}[name]
    Open Chat Details
    Select Archive Chat
    Confirm That Chat Removed From Chat list      ${USER1-DETAILS}[name]
    Open Archived Chat List
    Confirm That Moved to Archived chat list      ${USER1-DETAILS}[name]
    Go Back


*** Test Cases ***
#Test add new group chat
Create New Group Functionality
    Set Appium Timeout               10s
    Switch Application               2
    #Go Back
    Click To Create New Group Chat
    Add Members To The Group         Nermeen El Rays     ahmed shafik     nermeen mahmoud
    Set Appium Timeout               10s
    Add Group Photo
    Add Group Name                   Gathering
    Send Message To The Group        Gathering      Hello All
    Switch Application               1
    Go Back
    Open The Group In Second Device     Gathering
    Check Messages Delivered To Group Memebrs       Hello All

*** Test Cases ***
#add Members To the group
Add Members To The Group
    Set Appium Timeout                10s
    sleep                             3s
    Switch Application                1
    Open Chat Details
    Click To Add Members              Raoul kihn Miss Adrienne Howe
    Go Back
    Go Back
    #Open The Group In Second Device        Gathering
    Check That Member add successfully From Device 1
    Switch Application                2
    Go Back
    sleep                             3s
    Open The Group In Second Device    Gathering
    Check That Member add successfully From Device 2

*** Test Cases ***
#Remove Normal Members From The Group Chat
Remove Members From The Group Chat
    Set Appium Timeout                10s
    Switch Application                  1
    Open Chat Details
    Select Members To Remove Them        ahmed shafik
    Check That Member Removed Successfully From Device2
    Switch Application                  2
    Check That Member Removed Successfully From Device2

*** Test Cases ***
#Clear Group Chat
Clear Group Chat
    Set Appium Timeout                10s
    Open Chat Details
    Select Clear Chat And Confirm it
    Confirm That Messages Cleared From Chat List         Gathering

*** Test Cases ***
#Archive Group Chat
Archive Group Chat
    Set Appium Timeout                10s
    Switch Application                      1
    Open Chat Details
    Select Archive Chat And Confirm it
    Confirm That Chat Removed From Chat list          Gathering
    Open Archived Chat List
    Confirm That Moved to Archived chat list          Gathering
    #Go Back

*** Test Cases ***
#Change Group Photo
Change Group Photo
      Set Appium Timeout                               10s
      Open The Group In Second Device                  Gathering
      Open Chat Details
      Click To Change Group Photo
      Check Confirmation Of Changing Photo Sent To The Group


