*** Settings ***
Resource        ../../resources/locator.robot
Suite Teardown   Sleep       5s
	
*** Test case ***    
Scenario_Json_Wolftail   
        Given Open Chrome Browser Login Should Pass
        When User Can Login With Account "dev" and Password "P@ssw0rd"
        Then User Should Found Wolftail Page
        When User Goto Discover Page
        And Select Index Data Type Json EventLog
        And User Can Select Filter Period Time
        And User Can Search On Filter Bar By Computername Json
        Then User Should Found Information Data EventLog
        And User Can Search Data EventLog On Search Field Names Json
        And User Can Verify ComputerJson On Field Grid View
        And User Can Verify DomainJson On Field Grid View
        And User Can Verify TagsJson On Field Grid View
        Then User Can Search Data EventLog & Verify EventLog Parser Failure 

        # And User Can Search On Filter Bar By Devicename EventLog LEEF
        # And User Should Found Information Data EventLog
        # And User Should View Information Data EventLog By Click Button Expand EventLog LEEF
        # And User Can Search Data EventLog On Search Field Names LEEF 
        # And User Can Verify Devicename On Field Grid View
        # And User Can Verify DataSteamDataset On Field Grid View
        # And User Can Verify Tags LEEF On Field Grid View
        # Then User Can Verify Sort Time Data On Field Grid View



                


