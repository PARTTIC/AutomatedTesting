SET /A TIME=30000
START CMD /K robot -T -l Log -r Report -d D:\RobotFramework_Wolftail\executions\Report .\scenario_poc.robot
REM START CMD /K robot -T --logtitle New_Log --reporttitle New_Report -d D:\RobotFramework_Wolftail\executions\Report .\scenario_poc.robot
