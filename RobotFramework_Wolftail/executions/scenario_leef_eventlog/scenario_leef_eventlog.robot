*** Settings ***
Resource        ../../resources/locator.robot
Suite Teardown   Sleep       30s
	
*** Test case ***    
Scenario_LEEF_Wolftail   
        Given Open Chrome Browser Login Should Pass
        When User Can Login With Account "dev" and Password "P@ssw0rd"
        Then User Should Found Wolftail Page
        When User Goto Discover Page
        And Select Index Data Type LEEF EventLog
        And User Can Select Filter Period Time
        And User Can Search On Filter Bar By Devicename EventLog LEEF
        And User Should Found Information Data EventLog
        And User Should View Information Data EventLog By Click Button Expand EventLog LEEF
        And User Can Search Data EventLog On Search Field Names LEEF 
        And User Can Verify Devicename On Field Grid View
        And User Can Verify DataSteamDataset On Field Grid View
        And User Can Verify Tags LEEF On Field Grid View
        Then User Can Verify Sort Time Data On Field Grid View

        # And User Should View Information Data EventLog By Click Button Expand EventLog CEF
        # And User Can Search Data EventLog On Search Field Names
        # And User Can Verify Tags On Field Grid View CEF

        # Then User Should Found Information Data EventLog
        # And User Can Search On Filter Bar By EventID
        # Then User Should Found Information Data EventLog
        # And User Can Search On Filter Bar By Kibana Query Language
        # When User Search EventLog On Filter Bar By False Data
        # Then User Should Not Found Information Data EventLog 
        # When User Search EventLog Type CEF
        # And User Should Found EventLog 
        # And User Should View Information Data EventLog By Click Button Expand EventLog


        # Goto Discover Page
        # Select Filter Period
        # Search Fill Textarea
        # Select Filter On Meta Fields 
        # Search Fill Textarea




                


