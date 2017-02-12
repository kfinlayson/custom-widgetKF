*** Settings ***
Library         SwingLibrary
Library         keywords.CustomWidgetKeywords


*** Keywords ***

    
    
*** Test Cases ***
Hexagon Is Not Selected Initially
    Start Application       edu.jsu.mcis.Main
    Select Window           Main
    Label Text Should Be    label   HEXAGON
    Close Window            Main

Octagon Is Selected After Center Click
    Start Application       edu.jsu.mcis.Main
    Select Window           Main
    Click Octagon
    Label Text Should Be    label   OCTAGON
    Close Window            Main
    
Widget Is Unchanged After Edge Click
    Start Application       edu.jsu.mcis.Main
    Select Window           Main
    Click Outside
    Label Text Should Be    label   HEXAGON
    Close Window            Main

Widget Toggles With Successive Center Clicks
    Start Application       edu.jsu.mcis.Main
    Select Window           Main
    Click Octagon
    Label Text Should Be    label   OCTAGON
    Click Hexagon
    Label Text Should Be    label   HEXAGON
    Close Window            Main
