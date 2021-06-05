*** Settings ***
Library      AppiumLibrary
*** Variables ***
${PASSWORD1}     Yasmeen42014118
${PASSWORD2}     Nm7619941031983@
#*** Test Variables ***
&{USER1-DETAILS}     email=nermeenrays20@gmail.com  password=${PASSWORD1}   name=Nermeen El Rays
&{USER2-DETAILS}     email=n@yahoo.com        password=${PASSWORD2}   name=Noura Hamouda
&{USER3-DETAILS}     email=nermeen@gmail.com    password=${PASSWORD1}   name=nermeen mahmoud
${APPIUM-PORT-DEVICE1}     4723
${APPIUM-PORT-DEVICE2}     4725



${UGU-STAGING-ID}          com.humansoftsolution.ugu.debug:id

#*** Login Page ***
${LOGIN-EMAIL-FIELD}   //android.widget.EditText[contains(@text,"Email")]
${LOGIN-PASSWORD-FIELD}  //android.widget.LinearLayout//android.widget.EditText[@text="Password"]
${LOGIN-SIGNIN-BUTTON}  id=${UGU-STAGING-ID}/login_btn

#*** Chat Page ***
${CHAT-BUTTON}                           id=${UGU-STAGING-ID}/chatNavGraph
${CHAT-FAV-CONTACT}                      id=${UGU-STAGING-ID}/tv_favourite_contacts
${CHAT-SEARCH-ICON}                      id=${UGU-STAGING-ID}/actionSearch
${CHAT-SEARCH-TEXT-FIELD}                id=${UGU-STAGING-ID}/et_search
${CHAT-ARCHIVE-LIST-BUTTON}              id=${UGU-STAGING-ID}/tv_archived
${CHAT-CREATE-NEW-GROUP}                 id=${UGU-STAGING-ID}/actionAddNewChat
${CHAT-ADD-MEMBERS-TO-GROUP-BUTTON}      id=${UGU-STAGING-ID}/iv_add_users



#*** Group Chat Page ***
${GROUP-SERACH-TEXT}              id=${UGU-STAGING-ID}/et_search
${GROUP-SELECT-MEMBER-BUTTON}     id=${UGU-STAGING-ID}/checkbox_select
${GROUP-NEXT-BUTTON}              id=${UGU-STAGING-ID}/actionNext
${GROUP-SUBJECT-TEXT}             id=${UGU-STAGING-ID}/et_group_name
${GROUP-PHOTO-BUTTON}             id=${UGU-STAGING-ID}/iv_group_image
${GROUP-CREATE-GROUP-BUTTON}       id=${UGU-STAGING-ID}/actionCreateGroup
${GROUP-CAMERA-BUTTON}             id=com.android.camera2:id/shutter_button
${GROUP-CHAT-REMOVE-MEMBER-FROM-GROUP}       id=${UGU-STAGING-ID}/bt_remove_from_group
${GROUP-CHAT-CLEAR-CHAT-BUTTON}              id=${UGU-STAGING-ID}/tv_clear_chat
${GROUP-CHAT-CHANGE-GROUP-IMAGE}              id=${UGU-STAGING-ID}/iv_edit_image
${GROUP-CHAT-CONFIRM-ACTION-BUTTON}           id=${UGU-STAGING-ID}/actionUpdateGroup


#*** Feed Page ***
${FEED-SEARCH-ICON}    id=${UGU-STAGING-ID}/action_search
${FEED-SEARCH-TEXT-FIELD}     id=${UGU-STAGING-ID}/et_search_box
${FEED-USER-CHAT-PROFILE-BUTTON}   id=${UGU-STAGING-ID}/iv_chat

#*** Conversation Window ***
${CONVERSATION-INPUT-FIELD}   id=${UGU-STAGING-ID}/et_send_text_msg
${CONVERSATION-SEND-BUTTON}   id=${UGU-STAGING-ID}/iv_send_message
${CONVERSATION-ONLINE-STATUS}   //android.widget.TextView[contains(@resource-id,'tv_status') and @text="Online"]
${CONVERSATION-SPECIFIC-MESSAGE}   //android.widget.TextView[contains(@resource-id,'messageText') and @text="Hi Noura It's Automation Run"]
${CONVERSATION-USER-TAB}          id=${UGU-STAGING-ID}/layout_image_title
${CONVERSATION-CLEAR-CHAT}        id=${UGU-STAGING-ID}/tv_clear_chat
${CONVERSATION-CONFIRM-BUTTON-CHAT}     id=${UGU-STAGING-ID}/btn_positive
${CONVERSATION-UPLOAD-MEDIA-FROM-GALLERY-BUTTON}       id=${UGU-STAGING-ID}/iv_add_attachments
${CONVERSATION-FORWARD-BUTTON}                         id=${UGU-STAGING-ID}/bt_forward
${CONVERSATION-TEXT-INPUT}                             id=${UGU-STAGING-ID}/et_send_text_msg
${CONVERSATION-STICKER-BUTTON}                         id=${UGU-STAGING-ID}/iv_pick_emotions
${CONVERSATION-DETAILS-ARCHIVE-CHAT}                   id=${UGU-STAGING-ID}/tv_archive_group
${CONVERSATION-DELETE-FOR-ME-BUTTON}                   id=${UGU-STAGING-ID}/bt_delete_for_me



#*** Profile Page ***
${PROFILE-PIC-PHOTO}    id=${UGU-STAGING-ID}/profile_avatar_iv
${SETTINGS-BUTTON}      id=${UGU-STAGING-ID}action_settings
${UG-BUNDLES-BUTTON}     //androidx.cardview.widget.CardView[@index='0'and @resource-id='main_settings_item_container]
${ACCOUNT-MANAGEMENT-BUTTON}   id=${UGU-STAGING-ID}/layout_item_settings
${LOGOUT-BUTTON}      id=${UGU-STAGING-ID}/tv_account_logout
${CONFIRM-LOGOUT-BUTTON}    id=${UGU-STAGING-ID}/btn_positive

*** Keywords ***
Open-Application
    [Arguments]          ${APPIUM-PORT}     ${DEVICE-NAME}
    Open Application     http://localhost:${APPIUM-PORT}/wd/hub   platformName=Android   deviceName=${DEVICE-NAME}   appPackage=com.humansoftsolution.ugu.debug    automationName=uiautomator2   app=C:\\Users\\Nermeen Elrays\\Downloads\\ugu-v1.1.8-787-debug.apk

Open Ugu App On First Device
    Open-Application     ${APPIUM-PORT-DEVICE1}      emulator-5554

Open Ugu App On Second Device
    Open-Application     ${APPIUM-PORT-DEVICE2}      emulator-5556

Open Ugu App On Third Device
    Open-Application     ${APPIUM-PORT-DEVICE3}


Sign in With User
    [Arguments]        ${EMAIL}  ${PASSWORD}
    sleep              15s
    Input User Email   ${EMAIL}
    Input User Password  ${PASSWORD}
    Submit Login


Input User Email
    [Arguments]        ${EMAIL}
    Input Text         ${LOGIN-EMAIL-FIELD}  ${EMAIL}


Input User Password
    [Arguments]        ${PASSWORD}
    Input Text         ${LOGIN-PASSWORD-FIELD}   ${PASSWORD}

Submit Login
    Click Element       ${LOGIN-SIGNIN-BUTTON}

Go To Profile Page
    sleep               7s
    Click Element       ${PROFILE-PIC-PHOTO}
    Wait Until Page Contains Element   ${SETTINGS-BUTTON}
    Click Element     ${SETTINGS-BUTTON}
    Scroll       ${UG-BUNDLES-BUTTON}  ${ACCOUNT-MANAGEMENT-BUTTON}
    Click Element    ${ACCOUNT-MANAGEMENT-BUTTON}

Go To Chat Tab
    sleep               5s
    Click Element       ${CHAT-BUTTON}

Create New Conversation
    [Arguments]         ${NAME}
    sleep                17s
    Search For Contact   ${NAME}
    Click Element       //android.widget.TextView[contains(@resource-id,'search_user_full_name') and @text="${NAME}"]
    sleep                5s
    Click On Chat Profile
    Wait Until Conversation Window Is Open       ${NAME}

Search For Contact
    sleep               15s
    [Arguments]         ${NAME}
    Click Element       ${FEED-SEARCH-ICON}
    Input Text          ${FEED-SEARCH-TEXT-FIELD}   ${NAME}
    sleep               6s
    Wait Until Page Contains Element     //android.widget.TextView[contains(@resource-id,'search_user_full_name') and @text="${NAME}"]

Click On Chat Profile
    Click Element       ${FEED-USER-CHAT-PROFILE-BUTTON}


Wait Until Conversation Window Is Open
    [Arguments]         ${NAME}
    Wait Until Page Contains Element     //android.widget.TextView[contains(@resource-id,'tv_name') and @text="${NAME}"]


Open Conversation
    sleep               5s
    [Arguments]         ${NAME}
    Click Element       //android.widget.TextView[contains(@resource-id,'tv_name') and @text="${NAME}"]
    Wait Until Conversation Window Is Open      ${NAME}


Send Message Inside Conversation Window
    [Arguments]         ${MESSAGE}
    Wait Until Page Contains Element     ${CONVERSATION-INPUT-FIELD}
    Input Text      ${CONVERSATION-INPUT-FIELD}    ${MESSAGE}
    Click Element   ${CONVERSATION-SEND-BUTTON}
    Wait Until Conversation Contains Message        ${MESSAGE}


Wait Until Conversation Contains Message
    [Arguments]         ${MESSAGE}
    Wait Until Page Contains Element       //android.widget.TextView[contains(@resource-id,'messageText') and @text="${MESSAGE}"]

Check User Online Status
    Wait Until Page Contains Element       ${CONVERSATION-ONLINE-STATUS}

Check User Offline Status
   sleep                                  4s
   Page Should Not Contain Element          ${CONVERSATION-ONLINE-STATUS}


Select Sticker And send
    Click Element                          ${CONVERSATION-STICKER-BUTTON}
    sleep                                  3s
    Click Element                          id=${UGU-STAGING-ID}/imgSticker

Check That Sticker Sent to the other user successfully
    sleep                                  2s
    Wait Until Page Contains Element       id=${UGU-STAGING-ID}/iv_emoji


Select Message and delete it for all
    Long Press                             ${CONVERSATION-SPECIFIC-MESSAGE}
    Click Element                          //android.widget.Button[contains(@resource-id,'bt_delete_for_all')and @text="Delete For All"]
    Check Message Deleted successfully From User1


Check Message Deleted successfully From User1
    sleep                                  3s
    Wait Until Page Contains Element       //android.widget.TextView[contains(@resource-id,'tv_deleted_my_msg')and @text="You deleted this message"]

Check Message Deleted successfully From User2
    sleep                                  4s
    Wait Until Page Contains Element       //android.widget.TextView[contains(@resource-id,'tv_deleted_msg') and @text="This message was deleted" ]


Upload Media In chat with text
    Click Element                         ${CONVERSATION-UPLOAD-MEDIA-FROM-GALLERY-BUTTON}
    sleep                                 2s
    Three Allows
    sleep                                 3s
    Click Element                         //android.widget.RelativeLayout[1]
    Click Element                         id=com.android.camera2:id/shutter_button
    Click Element                         id=com.android.camera2:id/done_button
    Click Element                         id=${UGU-STAGING-ID}/action_done
    sleep                                 2s
    Click Element                         id=${UGU-STAGING-ID}/iv_send_message
    sleep                                 6s
    Wait Until Page Contains Element      id=${UGU-STAGING-ID}/iv_media_one
    sleep                                 3s

Three Allows Emulator1

    Click Element                         id=com.android.permissioncontroller:id/permission_allow_foreground_only_button

    Click Element                         id=com.android.permissioncontroller:id/permission_allow_foreground_only_button
    sleep                                  2s
    Click Element                         id=com.android.permissioncontroller:id/permission_allow_button

Three Allows Emulator2
    Click Element                         id=com.android.packageinstaller:id/permission_allow_button
    Click Element                         id=com.android.packageinstaller:id/permission_allow_button
    Click Element                         id=com.android.packageinstaller:id/permission_allow_button

Click On Account User Chat And select Clear Chat
    Open Chat Details
    sleep                           2s
    Click Element                   ${CONVERSATION-CLEAR-CHAT}
    sleep                           3s
    Click Element                   ${CONVERSATION-CONFIRM-BUTTON-CHAT}

Check That Chat Cleared All Messages
    [Arguments]         ${MESSAGE}
    Page Should Not Contain Element      //android.widget.TextView[contains(@resource-id,'tv_name') and @text="${MESSAGE}"]


Select Message
    [Arguments]         ${MESSAGE}
    Page Should Not Contain Element      //android.widget.TextView[contains(@resource-id,'tv_name') and @text="${MESSAGE}"]


Select Message To Delete it
    sleep               3s
    [Arguments]         ${MESSAGE}
    Page Should Contain Element      //android.widget.TextView[contains(@resource-id,'messageText') and @text="${MESSAGE}"]

Delete Message For Me
    sleep               3s
    [Arguments]         ${MESSAGE}
    Long Press          //android.widget.TextView[contains(@resource-id,'messageText') and @text="${MESSAGE}"]
    Click Element       ${CONVERSATION-DELETE-FOR-ME-BUTTON}

Check Message disappeared From My Chat
    sleep               5s
    [Arguments]         ${MESSAGE}
    Page Should Not Contain Element      //android.widget.TextView[contains(@resource-id,'messageText') and @text="${MESSAGE}"]

Forward Message to another user
    [Arguments]         ${CAPTION}
    Long Press          ${CONVERSATION-SPECIFIC-MESSAGE}
    sleep               2s
    Click Element       ${CONVERSATION-FORWARD-BUTTON}
    sleep               10s
    Click Element       //android.widget.TextView[contains(@resource-id,'tv_name') and @text="Noura Hamouda"]
    sleep               3s
    Input Text          ${CONVERSATION-TEXT-INPUT}   ${CAPTION}
    sleep               3s
    Click Element       ${CONVERSATION-SEND-BUTTON}

Check Forward message delivered successfully in The other device
    [Arguments]         ${CAPTION}
    Wait Until Page Contains Element       //android.widget.TextView[contains(@resource-id,'messageText') and @text="${CAPTION}"]

Select Sticker and forward it
    [Arguments]         ${CAPTION}
    Long Press          id=${UGU-STAGING-ID}/iv_emoji
    sleep               3s
    Click Element       ${CONVERSATION-FORWARD-BUTTON}
    sleep               7s
    Click Element       //android.widget.TextView[contains(@resource-id,'tv_name') and @text="Noura Hamouda"]
    sleep               3s
    Input Text          ${CONVERSATION-TEXT-INPUT}    ${CAPTION}
    sleep               3s
    Click Element       ${CONVERSATION-SEND-BUTTON}

Check Forward Sticker delivered successfully to the second user
    sleep               2s
    [Arguments]         ${CAPTION}
    Wait Until Page Contains Element         //android.widget.TextView[contains(@resource-id,'messageText') and @text="${CAPTION}"]


Open Chat Details
    sleep                           6s
    Click Element                   ${CONVERSATION-USER-TAB}

Select Archive Chat
       sleep                        2s
       Click Element                ${CONVERSATION-DETAILS-ARCHIVE-CHAT}
       sleep                        2s
       Click Element                ${CONVERSATION-CONFIRM-BUTTON-CHAT}
       sleep                        2s

Confirm That Chat Removed From Chat list
       [Arguments]         ${NAME}
       Page Should Not Contain Element        //android.widget.TextView[contains(@resource-id,'tv_name') and @text="${NAME}"]
       sleep               2s

Open Archived Chat List
       sleep                         5s
       Click Element                 ${CHAT-ARCHIVE-LIST-BUTTON}

Confirm That Moved to Archived chat list
       [Arguments]         ${NAME}
       sleep               3s
       Wait Until Page Contains Element         //android.widget.TextView[contains(@resource-id,'tv_name') and @text="${NAME}"]


Click To Create New Group Chat
        sleep               7s
        Click Element       ${CHAT-CREATE-NEW-GROUP}


Add Members To The Group

    [Arguments]             ${NAME1}   ${NAME2}   ${NAME3}
    sleep                   6s
    Input Text              ${GROUP-SERACH-TEXT}   ${NAME1}
    sleep                   7s
    Click Element           ${GROUP-SELECT-MEMBER-BUTTON}
    Clear Text              ${GROUP-SERACH-TEXT}
    Input Text              ${GROUP-SERACH-TEXT}   ${NAME2}
    sleep                   5s
    Click Element           ${GROUP-SELECT-MEMBER-BUTTON}
    Clear Text              ${GROUP-SERACH-TEXT}
    Input Text              ${GROUP-SERACH-TEXT}   ${NAME3}
    sleep                   5s
    Click Element           ${GROUP-SELECT-MEMBER-BUTTON}
    Click Element           ${GROUP-NEXT-BUTTON}


Add Group Photo
    sleep                   4s
    Click Element           ${GROUP-PHOTO-BUTTON}
    sleep                   7s
    Three Allows Emulator1
    sleep                   5s
    Click Element           id=com.humansoftsolution.ugu.debug:id/iv_photo
    sleep                   5s
    Click ELement           ${GROUP-CAMERA-BUTTON}
    sleep                   5s
    Click Element           id=com.android.camera2:id/done_button
    sleep                   3s


Add Group Name
    [Arguments]             ${NAME}
    Input Text              ${GROUP-SUBJECT-TEXT}     ${NAME}
    sleep                   2s
    Click Element           ${GROUP-CREATE-GROUP-BUTTON}
    sleep                   5s


Send Message To The Group
    sleep                   3s
    [Arguments]              ${NAME}    ${MESSAGE}
    Open Conversation           ${NAME}
    sleep                     3s
    Send Message Inside Conversation Window       ${MESSAGE}

Open The Group In Second Device
    [Arguments]                   ${NAME}

    Open Conversation           ${NAME}

Check Messages Delivered To Group Memebrs
    [Arguments]           ${MESSAGE}
    Wait Until Conversation Contains Message        ${MESSAGE}


Click To Add Members
    [Arguments]            ${NAME}
    sleep                  4s
    Click Element          ${CHAT-ADD-MEMBERS-TO-GROUP-BUTTON}
    Input Text             ${GROUP-SERACH-TEXT}    ${NAME}
    sleep                  3s
    Click Element          ${GROUP-SELECT-MEMBER-BUTTON}
    sleep                  2s
    Click Element          ${GROUP-NEXT-BUTTON}


Check That Member add successfully From Device 1
    Wait Until Page Contains Element       //android.widget.TextView[contains(@resource-id,'tv_msg_action') and @text="Raoul Kihn is added to this group"]

Check That Member add successfully From Device 2
    Wait Until Page Contains Element       //android.widget.TextView[contains(@resource-id,'tv_msg_action') and @text="Raoul Kihn is added to this group"]


Select Members To Remove Them
      [Arguments]              ${NAME}
      Wait UntiL Page Contains Element         //android.widget.TextView[contains(@resource-id,'tv_user_name') and @text="${NAME}"]
      Long Press                               //android.widget.TextView[contains(@resource-id,'tv_user_name') and @text="${NAME}"]
      sleep                                    2s
      Click Element                            ${GROUP-CHAT-REMOVE-MEMBER-FROM-GROUP}
      sleep                                    3s
      Go Back

Check That Member Removed Successfully From Device2
    Wait Until Page Contains Element             //android.widget.TextView[contains(@resource-id,'tv_msg_action') and @text="ahmed is removed from this group"]


Select Clear Chat And Confirm it
    sleep                            4s
    ##Scroll Down                      ${GROUP-CHAT-CLEAR-CHAT-BUTTON}
    Click Element                    ${GROUP-CHAT-CLEAR-CHAT-BUTTON}
    sleep                            3s
    Click Element                    ${CONVERSATION-CONFIRM-BUTTON-CHAT}


Confirm That Messages Cleared From Chat List
    [Arguments]           ${MESSAGE}
    Open The Group In Second Device         Gathering
    sleep                              2s
    Page Should Not Contain Element     //android.widget.TextView[contains(@resource-id,'messageText') and @text="${MESSAGE}"]


Select Archive Chat And Confirm it
    sleep                              4s
   ## Scroll                           id=${UGU-STAGING-ID}/tv_view_media     ${GROUP-CHAT-CLEAR-CHAT-BUTTON}
    Click Element                     ${CONVERSATION-DETAILS-ARCHIVE-CHAT}
    sleep                              3s
    Click Element                     ${CONVERSATION-CONFIRM-BUTTON-CHAT}
    sleep                              5s



Click To Change Group Photo
    sleep                             3s
    Click Element                     ${GROUP-CHAT-CHANGE-GROUP-IMAGE}
    sleep                             6s
    Click Element                     id=${UGU-STAGING-ID}/iv_photo
    sleep                             4s
    Click Element                     id=${UGU-STAGING-ID}/iv_photo
    sleep                             8s
    Click Element                     id=${GROUP-CHAT-CONFIRM-ACTION-BUTTON}
    sleep                             7s



Check Confirmation Of Changing Photo Sent To The Group
    sleep                             4s
    Go Back
    Go Back
    Open The Group In Second Device
    wait until conversation contains message             //android.widget.TextView[contains(@reource-id,'tv_msg_action') and @text="You changed group photo"]


Click The Logout Button
    Wait Until Page Contains Element   ${LOGOUT-BUTTON}
    Click Element    ${LOGOUT-BUTTON}
    Click Element    ${CONFIRM-LOGOUT-BUTTON}

Verify Login Email Field Is Displayed
    Wait Until Page Contains Element       ${LOGIN-EMAIL-FIELD}