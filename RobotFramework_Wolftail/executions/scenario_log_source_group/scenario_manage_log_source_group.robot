*** Settings ***
Resource        ../../resources/locator.robot
Suite Teardown   Sleep       30s
	
*** Test case ***    
Scenario Manage Log Source Group Wolftail   
        Given Open Chrome Browser Login Should Pass
        When User Can Login With Account "dev" and Password "P@ssw0rd"
        Then User Should Found Wolftail Page
Verify User Can Select Menu Log Source Group Page
        When User Goto Log Source Group Management Page
        And User Can Verify Information On Log Source Group Management Page
Verify User Can Create Log Source Group 
        And User Can Create Log Source Group On Log Source Group Management Page
        And User Can Verify TextFill On Create New Log Source Group Page
        And User Can Input Information Log Source Group
Verify User Can Delete Log Source Group After Create
        And User Can Delete Log Source Group After Create On Log Source Group Management
        And User Can Verify Dialog Confirm Delete Log Source Group After Create On Log Source Group Management
Verify User Should Can't When Create Duplicate Log Source Group
        And User Can Verify Create Log Source Group Duplicate On Log Source Group Management Page
        And User Can Verify After Input Data Create Log Source Group Duplicated On Log Source Group Management Page
Verify User Can Edit Information Log Source Group
        And User Can Edit Data Log Source Group After Create On Log Source Group Page
Vefify User Can Create Log Source Group In Log Source Group Level
        And User Can Create Log Source Group On Log Source Group Level
        And User Can Input Information New Log Source Group
        And User Can Verify Information New Log Source Group After Create
Vefify User Should Can't Delete Log Source Group After Add Log Source Group 
        And User Can't Delete Log Source Group On Log Source Group Level After Create 
Vefify User Can Delete Sub Log Source Group After Add Log Source Group 
        And User Can Delete Log Source Group In Log Source Group Level After Create 
Verify User Can Edit Information Sub Log Source Group
        And User Can Edit Information Sub Log Source Group 
Verify User Should Can't Create Sub Log Source Group Duplicate
        And User Can't Create Sub Log Source Group Duplicate On Log Source Group Level
        And User Can Input Information Sub Log Source Group Duplicate
        And User Can Verify After Input Data Create Sub Log Source Group Duplicated On Log Source Group Management Page
