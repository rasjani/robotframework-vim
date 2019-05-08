"=============================================================================
" File:         after/syntax/robot.vim
" Author:       Michael Foukarakis
" Version:      0.2
" Created:      Fri 17 Dec 2010 11:31:46 AM EET
" Last Update:  Tue 28 Jul 2015 15:39:21 AM CEST
"------------------------------------------------------------------------
" Description:
"       Syntax file for Robot test framework files.
"------------------------------------------------------------------------
" Installation:
"       Drop this file into {rtp}/after/syntax
"       Requires Vim 7+
" History:
"       0.1 - Robot now has a standard library, containing all sorts of goodies.
"       0.2 - Add all built-in, ssh and selenium library keywords.
"             Fix to match longest pattern instead of the first one.
" TODO:
"       * Figure out a neater alternative for the monster path regex
"=============================================================================
let s:cpo_save=&cpo
set cpo&vim
"------------------------------------------------------------------------
" Matches
"------------------------------------------------------------------------
syn match robotNumber               display "\<\d\+\>"
syn match robotEllipsis             display "\.\.\."
" Special (escaped) character as defined in Robot's syntax.
syn match robotSpecial              display "\\\(\${.*}\|\\\|#\|[n|r|t]\)"
" As variables may be used next to each other, do a non-greedy match.
" Alternatively, match only alphanumeric chars inside brackets.
syn match robotVariable             "\(\$\|@\|&\|%\){.\{-}}"
" This is by far the most stupid regex you'll see in here..
syn match robotPath                 display "\(\.\{1,2}\/\)\=\(\(\h\|\d\)\+\/\)\+\(\(\h\|\d\)\+\.\h\+\)\{,1}$"
" Operators
syn match robotOperator             "==\|="
" Table headers
syn match robotTable                "\c^\(\*\+\)\s*\(settings\|variables\|test cases\|tasks\|\(user \)\?keywords\)\s*\1$"
" Common settings
syn match robotCommonSet            "\c\[\(Documentation\|Timeout\)\]"
" Keyword settings
syn match robotKeywordSet           "\c\[\(Arguments\|Return\)\]"
" Testcase settings
syn match robotTestcaseSet          "\c\[\(Tags\|Setup\|Teardown\|Precondition\|Postcondition\|Template\)\]"

" Robot Gherkin support
syn match robotGherkin              "\c\<\(Given\|When\|Then\|And\|But\)\>"

" Settings (global)
syn match robotSetup                "\c\<\(Suite\|Test\|Task\) \(Setup\|Teardown\|Precondition\|Postcondition\)\>"
syn match robotSettings             "\c\<\(Library\|Resource\|Variables\|Documentation\|Metadata\|Force Tags\|Default Tags\|Test Template\|Test Timeout\)\>"

" Standard libraries
" List variables in reverse order to match the longest pattern not the first one.
syn match collectionsLibrary        "\c\<\(Append To List\|Combine Lists\|Convert To Dictionary\|Convert To List\|Copy Dictionary\|Copy List\|Count Values In List\|Dictionaries Should Be Equal\|Dictionary Should Contain Item\|Dictionary Should Contain Key\|Dictionary Should Contain Sub Dictionary\|Dictionary Should Contain Value\|Dictionary Should Not Contain Key\|Dictionary Should Not Contain Value\|Get Dictionary Items\|Get Dictionary Keys\|Get Dictionary Values\|Get From Dictionary\|Get From List\|Get Index From List\|Get Match Count\|Get Matches\|Get Slice From List\|Insert Into List\|Keep In Dictionary\|List Should Contain Sub List\|List Should Contain Value\|List Should Not Contain Duplicates\|List Should Not Contain Value\|Lists Should Be Equal\|Log Dictionary\|Log List\|Pop From Dictionary\|Remove Duplicates\|Remove From Dictionary\|Remove From List\|Remove Values From List\|Reverse List\|Set List Value\|Set To Dictionary\|Should Contain Match\|Should Not Contain Match\|Sort List\)\>"
syn match dateTimeLibrary           "\c\<\(Add Time To Date\|Add Time To Time\|Convert Date\|Convert Time\|Get Current Date\|Subtract Date From Date\|Subtract Time From Date\|Subtract Time From Time\)\>"
syn match dialogLibrary             "%%dialogLibrary%%"
syn match operatingSystemLibrary    "\c\<\(Append To Environment Variable\|Append To File\|Copy Directory\|Copy Files\|Copy File\|Count Directories In Directory\|Count Files In Directory\|Count Items In Directory\|Create Binary File\|Create Directory\|Create File\|Directory Should Be Empty\|Directory Should Exist\|Directory Should Not Be Empty\|Directory Should Not Exist\|Empty Directory\|Environment Variable Should Be Set\|Environment Variable Should Not Be Set\|File Should Be Empty\|File Should Exist\|File Should Not Be Empty\|File Should Not Exist\|Get Binary File\|Get Environment Variables\|Get Environment Variable\|Get File Size\|Get File\|Get Modified Time\|Grep File\|Join Paths\|Join Path\|List Directories In Directory\|List Directory\|List Files In Directory\|Log Environment Variables\|Log File\|Move Directory\|Move Files\|Move File\|Normalize Path\|Remove Directory\|Remove Environment Variable\|Remove Files\|Remove File\|Run And Return Rc And Output\|Run And Return Rc\|Run\|Set Environment Variable\|Set Modified Time\|Should Exist\|Should Not Exist\|Split Extension\|Split Path\|Touch\|Wait Until Created\|Wait Until Removed\)\>"
syn match processLibrary            "\c\<\(Get Process Id\|Get Process Object\|Get Process Result\|Is Process Running\|Join Command Line\|Process Should Be Running\|Process Should Be Stopped\|Run Process\|Send Signal To Process\|Split Command Line\|Start Process\|Switch Process\|Terminate All Processes\|Terminate Process\|Wait For Process\)\>"
syn match screenshotLibrary         "\c\<\(Set Screenshot Directory\|Take Screenshot Without Embedding\|Take Screenshot\)\>"
syn match stringLibrary             "\c\<\(Convert To Lowercase\|Convert To Uppercase\|Decode Bytes To String\|Encode String To Bytes\|Fetch From Left\|Fetch From Right\|Format String\|Generate Random String\|Get Line Count\|Get Lines Containing String\|Get Lines Matching Pattern\|Get Lines Matching Regexp\|Get Line\|Get Regexp Matches\|Get Substring\|Remove String Using Regexp\|Remove String\|Replace String Using Regexp\|Replace String\|Should Be Byte String\|Should Be Lowercase\|Should Be String\|Should Be Titlecase\|Should Be Unicode String\|Should Be Uppercase\|Should Not Be String\|Split String From Right\|Split String To Characters\|Split String\|Split To Lines\|Strip String\)\>"
syn match telnetLibrary             "\c\<\(Close All Connections\|Close Connection\|Execute Command\|Login\|Open Connection\|Read Until Prompt\|Read Until Regexp\|Read Until\|Read\|Set Default Log Level\|Set Encoding\|Set Newline\|Set Prompt\|Set Telnetlib Log Level\|Set Timeout\|Switch Connection\|Write Bare\|Write Control Character\|Write Until Expected Output\|Write\)\>"
syn match xmlLibrary                "\c\<\(Add Element\|Clear Element\|Copy Element\|Element Attribute Should Be\|Element Attribute Should Match\|Element Should Exist\|Element Should Not Exist\|Element Should Not Have Attribute\|Element Text Should Be\|Element Text Should Match\|Element To String\|Elements Should Be Equal\|Elements Should Match\|Evaluate Xpath\|Get Child Elements\|Get Element Attributes\|Get Element Attribute\|Get Element Count\|Get Element Text\|Get Elements Texts\|Get Elements\|Get Element\|Log Element\|Parse Xml\|Remove Element Attributes\|Remove Element Attribute\|Remove Elements Attributes\|Remove Elements Attribute\|Remove Elements\|Remove Element\|Save Xml\|Set Element Attribute\|Set Element Tag\|Set Element Text\|Set Elements Attribute\|Set Elements Tag\|Set Elements Text\)\>"

" Other libraries
" See and follow listing order as above.
syn match seleniumLibrary           "\c\<\(Add Cookie\|Add Location Strategy\|Alert Should Be Present\|Alert Should Not Be Present\|Assign Id To Element\|Capture Element Screenshot\|Capture Page Screenshot\|Checkbox Should Be Selected\|Checkbox Should Not Be Selected\|Choose Cancel On Next Confirmation\|Choose File\|Choose Ok On Next Confirmation\|Clear Element Text\|Click Button\|Click Element At Coordinates\|Click Element\|Click Image\|Click Link\|Close All Browsers\|Close Browser\|Close Window\|Confirm Action\|Cover Element\|Create Webdriver\|Current Frame Contains\|Current Frame Should Contain\|Current Frame Should Not Contain\|Delete All Cookies\|Delete Cookie\|Dismiss Alert\|Double Click Element\|Drag And Drop By Offset\|Drag And Drop\|Element Attribute Value Should Be\|Element Should Be Disabled\|Element Should Be Enabled\|Element Should Be Focused\|Element Should Be Visible\|Element Should Contain\|Element Should Not Be Visible\|Element Should Not Contain\|Element Text Should Be\|Element Text Should Not Be\|Execute Async Javascript\|Execute Javascript\|Focus\|Frame Should Contain\|Get Alert Message\|Get All Links\|Get Cookie Value\|Get Cookies\|Get Cookie\|Get Element Attribute\|Get Element Count\|Get Element Size\|Get Horizontal Position\|Get List Items\|Get Locations\|Get Location\|Get Matching Xpath Count\|Get Selected List Labels\|Get Selected List Label\|Get Selected List Values\|Get Selected List Value\|Get Selenium Implicit Wait\|Get Selenium Speed\|Get Selenium Timeout\|Get Session Id\|Get Source\|Get Table Cell\|Get Text\|Get Title\|Get Value\|Get Vertical Position\|Get WebElements\|Get WebElement\|Get Window Handles\|Get Window Identifiers\|Get Window Names\|Get Window Position\|Get Window Size\|Get Window Titles\|Go Back\|Go To\|Handle Alert\|Input Password\|Input Text Into Alert\|Input Text Into Prompt\|Input Text\|List Selection Should Be\|List Should Have No Selections\|List Windows\|Location Should Be\|Location Should Contain\|Locator Should Match X Times\|Log Location\|Log Source\|Log Title\|Maximize Browser Window\|Mouse Down On Image\|Mouse Down On Link\|Mouse Down\|Mouse Out\|Mouse Over\|Mouse Up\|Open Browser\|Open Context Menu\|Page Should Contain Button\|Page Should Contain Checkbox\|Page Should Contain Element\|Page Should Contain Image\|Page Should Contain Link\|Page Should Contain List\|Page Should Contain Radio Button\|Page Should Contain Textfield\|Page Should Contain\|Page Should Not Contain Button\|Page Should Not Contain Checkbox\|Page Should Not Contain Element\|Page Should Not Contain Image\|Page Should Not Contain Link\|Page Should Not Contain List\|Page Should Not Contain Radio Button\|Page Should Not Contain Textfield\|Page Should Not Contain\|Press Keys\|Press Key\|Radio Button Should Be Set To\|Radio Button Should Not Be Selected\|Register Keyword To Run On Failure\|Reload Page\|Remove Location Strategy\|Scroll Element Into View\|Select All From List\|Select Checkbox\|Select Frame\|Select From List By Index\|Select From List By Label\|Select From List By Value\|Select From List\|Select Radio Button\|Select Window\|Set Browser Implicit Wait\|Set Focus To Element\|Set Screenshot Directory\|Set Selenium Implicit Wait\|Set Selenium Speed\|Set Selenium Timeout\|Set Window Position\|Set Window Size\|Simulate Event\|Simulate\|Submit Form\|Switch Browser\|Table Cell Should Contain\|Table Column Should Contain\|Table Footer Should Contain\|Table Header Should Contain\|Table Row Should Contain\|Table Should Contain\|Textarea Should Contain\|Textarea Value Should Be\|Textfield Should Contain\|Textfield Value Should Be\|Title Should Be\|Unselect All From List\|Unselect Checkbox\|Unselect Frame\|Unselect From List By Index\|Unselect From List By Label\|Unselect From List By Value\|Unselect From List\|Wait For Condition\|Wait Until Element Contains\|Wait Until Element Does Not Contain\|Wait Until Element Is Enabled\|Wait Until Element Is Not Visible\|Wait Until Element Is Visible\|Wait Until Page Contains Element\|Wait Until Page Contains\|Wait Until Page Does Not Contain Element\|Wait Until Page Does Not Contain\|Xpath Should Match X Times\)\>"
syn match sshLibrary                "\c\<\(Close All Connections\|Close Connection\|Create Local Ssh Tunnel\|Directory Should Exist\|Directory Should Not Exist\|Enable Ssh Logging\|Execute Command\|File Should Exist\|File Should Not Exist\|Get Connections\|Get Connection\|Get Directory\|Get File\|Get Pre Login Banner\|List Directories In Directory\|List Directory\|List Files In Directory\|Login With Public Key\|Login\|Open Connection\|Put Directory\|Put File\|Read Command Output\|Read Until Prompt\|Read Until Regexp\|Read Until\|Read\|Set Client Configuration\|Set Default Configuration\|Start Command\|Switch Connection\|Write Bare\|Write Until Expected Output\|Write\)\>"
syn match requestsLibrary           "\c\<\(Create Client Cert Session\|Create Custom Session\|Create Digest Session\|Create Ntlm Session\|Create Session\|Delete All Sessions\|Delete Request\|Delete\|Get Request\|Get\|Head Request\|Head\|Options Request\|Options\|Patch Request\|Patch\|Post Request\|Post\|Put Request\|Put\|To Json\|Update Session\)\>"
syn match fakerLibrary              "\c\<\(Add Provider\|Address\|Am Pm\|Ascii Company Email\|Ascii Email\|Ascii Free Email\|Ascii Safe Email\|Bank Country\|Bban\|Binary\|Boolean\|Bothify\|Bs\|Building Number\|Catch Phrase\|Century\|Chrome\|City Prefix\|City Suffix\|City\|Color Name\|Company Email\|Company Suffix\|Company\|Coordinate\|Country Code\|Country\|Credit Card Expire\|Credit Card Full\|Credit Card Number\|Credit Card Provider\|Credit Card Security Code\|Cryptocurrency Code\|Cryptocurrency Name\|Cryptocurrency\|Currency Code\|Currency Name\|Currency\|Date Between Dates\|Date Between\|Date Object\|Date Of Birth\|Date This Century\|Date This Decade\|Date This Month\|Date This Year\|Date Time Ad\|Date Time Between Dates\|Date Time Between\|Date Time This Century\|Date Time This Decade\|Date Time This Month\|Date Time This Year\|Date Time\|Date\|Day Of Month\|Day Of Week\|Domain Name\|Domain Word\|Ean 13\|Ean 8\|Ean\|Ein\|Email\|File Extension\|File Name\|File Path\|Firefox\|First Name Female\|First Name Male\|First Name\|Format\|Free Email Domain\|Free Email\|Future Datetime\|Future Date\|Generator Format Token\|Get Formatter\|Get Providers\|Hex Color\|Hexify\|Hostname\|Iban\|Image Url\|Init\|Internet Explorer\|Ipv 4\|Ipv 6\|Ipv4 Network Class\|Ipv4 Private\|Ipv4 Public\|Isbn 10\|Isbn 13\|Iso 8601\|Itin\|Job\|Language Code\|Last Name Female\|Last Name Male\|Last Name\|Latitude\|Latlng\|Lexify\|License Plate\|Linux Platform Token\|Linux Processor\|Local Latlng\|Locale\|Location On Land\|Longitude\|Mac Address\|Mac Platform Token\|Mac Processor\|Md 5\|Military Apo\|Military Dpo\|Military Ship\|Military State\|Mime Type\|Month Name\|Month\|Msisdn\|Name Female\|Name Male\|Name\|Null Boolean\|Numerify\|Opera\|Paragraphs\|Paragraph\|Parse\|Password\|Past Datetime\|Past Date\|Phone Number\|Postalcode In State\|Postalcode Plus4\|Postalcode\|Postcode In State\|Postcode\|Prefix Female\|Prefix Male\|Prefix\|Profile\|Provider\|Pybool\|Pydecimal\|Pydict\|Pyfloat\|Pyint\|Pyiterable\|Pylist\|Pyset\|Pystruct\|Pystr\|Pytuple\|Random Choices\|Random Digit Not Null Or Empty\|Random Digit Not Null\|Random Digit Or Empty\|Random Digit\|Random Elements\|Random Element\|Random Int\|Random Letters\|Random Letter\|Random Lowercase Letter\|Random Number\|Random Sample\|Random Uppercase Letter\|Randomize Nb Elements\|Rgb Color\|Rgb Css Color\|Safari\|Safe Color Name\|Safe Email\|Safe Hex Color\|Secondary Address\|Seed Instance\|Sentences\|Sentence\|Set Formatter\|Sha 1\|Sha 256\|Simple Profile\|Slug\|Ssn\|State Abbr\|State\|Street Address\|Street Name\|Street Suffix\|Suffix Female\|Suffix Male\|Suffix\|Text\|Time Delta\|Time Object\|Time Series\|Timezone\|Time\|Tld\|Unix Device\|Unix Partition\|Unix Time\|Uri Extension\|Uri Page\|Uri Path\|Uri\|Url\|User Agent\|User Name\|Uuid 4\|Windows Platform Token\|Words\|Word\|Year\|Zipcode In State\|Zipcode Plus4\|Zipcode\)\>"
syn match appiumLibrary             "\c\<\(Background App\|Capture Page Screenshot\|Clear Text\|Click A Point\|Click Button\|Click Element At Coordinates\|Click Element\|Click Text\|Close All Applications\|Close Application\|Element Attribute Should Match\|Element Name Should Be\|Element Should Be Disabled\|Element Should Be Enabled\|Element Should Be Visible\|Element Should Contain Text\|Element Should Not Contain Text\|Element Text Should Be\|Element Value Should Be\|Execute Async Script\|Execute Script\|Get Activity\|Get Appium SessionId\|Get Appium Timeout\|Get Capability\|Get Contexts\|Get Current Context\|Get Element Attribute\|Get Element Location\|Get Element Size\|Get Matching Xpath Count\|Get Network Connection Status\|Get Source\|Get Text\|Get Webelements\|Get Webelement\|Get Window Height\|Get Window Width\|Go Back\|Go To Url\|Hide Keyboard\|Input Password\|Input Text\|Input Value\|Install App\|Landscape\|Launch Application\|Lock\|Log Source\|Long Press Keycode\|Long Press\|Open Application\|Page Should Contain Element\|Page Should Contain Text\|Page Should Not Contain Element\|Page Should Not Contain Text\|Pinch\|Portrait\|Press Keycode\|Pull File\|Pull Folder\|Push File\|Quit Application\|Register Keyword To Run On Failure\|Remove Application\|Reset Application\|Scroll Down\|Scroll Up\|Scroll\|Set Appium Timeout\|Set Location\|Set Network Connection Status\|Shake\|Start Activity\|Swipe By Direction\|Swipe By Percent\|Swipe\|Switch Application\|Switch To Context\|Tap\|Text Should Be Visible\|Toggle Touch Id Enrollment\|Touch Id\|Wait Activity\|Wait Until Element Is Visible\|Wait Until Page Contains Element\|Wait Until Page Contains\|Wait Until Page Does Not Contain Element\|Wait Until Page Does Not Contain\|Xpath Should Match X Times\|Zoom\)\>"
syn match restInstanceLibrary       "\c\<\(Array\|Boolean\|Clear Expectations\|Delete\|Expect Request\|Expect Response Body\|Expect Response\|Get\|Head\|Input\|Integer\|Missing\|Null\|Number\|Object\|Options\|Output Schema\|Output\|Patch\|Post\|Put\|Rest Instances\|Set Client Cert\|Set Headers\|String\)\>"
syn match archiveLibrary            "\c\<\(Archive Should Contain File\|Create Tar From Files In Directory\|Create Zip From Files In Directory\|Extract Tar File\|Extract Zip File\)\>"
syn match ftpLibrary                "\c\<\(Cwd\|Delete\|Dir Names\|Dir\|Download File\|Ftp Close\|Ftp Connect\|Get All Ftp Connections\|Get Welcome\|Mkd\|Pwd\|Rename\|Rmd\|Send Cmd\|Size\|Upload File\)\>"

" The built-in standard library comes last to re-match the keywords already caught.
" See and follow listing order as above.
syn match builtInLibrary            "\c\<\(Call Method\|Catenate\|Comment\|Continue For Loop If\|Continue For Loop\|Convert To Binary\|Convert To Boolean\|Convert To Bytes\|Convert To Hex\|Convert To Integer\|Convert To Number\|Convert To Octal\|Convert To String\|Create Dictionary\|Create List\|Evaluate\|Exit For Loop If\|Exit For Loop\|Fail\|Fatal Error\|Get Count\|Get Length\|Get Library Instance\|Get Time\|Get Variable Value\|Get Variables\|Import Library\|Import Resource\|Import Variables\|Keyword Should Exist\|Length Should Be\|Log Many\|Log To Console\|Log Variables\|Log\|No Operation\|Pass Execution If\|Pass Execution\|Regexp Escape\|Reload Library\|Remove Tags\|Repeat Keyword\|Replace Variables\|Return From Keyword If\|Return From Keyword\|Run Keyword And Continue On Failure\|Run Keyword And Expect Error\|Run Keyword And Ignore Error\|Run Keyword And Return If\|Run Keyword And Return Status\|Run Keyword And Return\|Run Keyword If All Critical Tests Passed\|Run Keyword If All Tests Passed\|Run Keyword If Any Critical Tests Failed\|Run Keyword If Any Tests Failed\|Run Keyword If Test Failed\|Run Keyword If Test Passed\|Run Keyword If Timeout Occurred\|Run Keyword If\|Run Keyword Unless\|Run Keywords\|Run Keyword\|Set Global Variable\|Set Library Search Order\|Set Log Level\|Set Suite Documentation\|Set Suite Metadata\|Set Suite Variable\|Set Tags\|Set Task Variable\|Set Test Documentation\|Set Test Message\|Set Test Variable\|Set Variable If\|Set Variable\|Should Be Empty\|Should Be Equal As Integers\|Should Be Equal As Numbers\|Should Be Equal As Strings\|Should Be Equal\|Should Be True\|Should Contain Any\|Should Contain X Times\|Should Contain\|Should End With\|Should Match Regexp\|Should Match\|Should Not Be Empty\|Should Not Be Equal As Integers\|Should Not Be Equal As Numbers\|Should Not Be Equal As Strings\|Should Not Be Equal\|Should Not Be True\|Should Not Contain Any\|Should Not Contain\|Should Not End With\|Should Not Match Regexp\|Should Not Match\|Should Not Start With\|Should Start With\|Sleep\|Variable Should Exist\|Variable Should Not Exist\|Wait Until Keyword Succeeds\)\>"

"------------------------------------------------------------------------
" Regions
"------------------------------------------------------------------------
" Single-line comments. Are there multi-line comments?
syn region robotComment     display start="\(^\|  \|\t\)[ \t]*#" excludenl end="$"
syn region robotString      start="\"" excludenl end="\""
syn region robotString      start="'" excludenl end="'"

"------------------------------------------------------------------------
" Keywords
"------------------------------------------------------------------------

"------------------------------------------------------------------------
" Links
"------------------------------------------------------------------------
hi def link robotVariable           Type
hi def link robotSetup              Include
hi def link robotSettings           Include
hi def link robotTestCaseName       Function
hi def link robotComment            Comment
hi def link robotEllipsis           String
hi def link robotTable              Identifier
hi def link robotImport             Include
hi def link robotSpecial            Special
hi def link robotString             String
hi def link robotNumber             Number
hi def link robotPath               Constant
hi def link robotOperator           Operator
hi def link robotCommonSet          Keyword
hi def link robotKeywordSet         Keyword
hi def link robotTestcaseSet        Keyword
hi def link robotGherkin            Keyword

hi def link builtInLibrary          Keyword
hi def link collectionsLibrary      Keyword
hi def link dateTimeLibrary         Keyword
hi def link dialogLibrary           Keyword
hi def link operatingSystemLibrary  Keyword
hi def link processLibrary          Keyword
hi def link screenshotLibrary       Keyword
hi def link stringLibrary           Keyword
hi def link telnetLibrary           Keyword
hi def link xmlLibrary              Keyword
hi def link seleniumLibrary         Keyword
hi def link sshLibrary              Keyword
hi def link requestsLibrary         Keyword
hi def link fakerLibrary            Keyword
hi def link appiumLibrary           Keyword
hi def link restInstanceLibrary     Keyword

let b:current_syntax = "robot"
"------------------------------------------------------------------------
let &cpo=s:cpo_save
" vim700: set fdm=marker:
