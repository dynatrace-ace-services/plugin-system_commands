# Plugin system_commands - on windows

Git clone

    cd /D %HOMEDRIVE%%HOMEPATH%
    git clone https://github.com/dynatrace-ace-services/plugin-system_commands/
    cd plugin-system_commands
   
Manually unzip and copy 
   
    custom.python.system_commands.zip => C:\Program Files\dynatrace\oneagent\plugin_deployment
<img src="https://user-images.githubusercontent.com/40337213/133121297-ebec3ca8-2d21-43a6-b4c8-c2543798b4a5.png" width="500" height="80">

    And destart the Dynatrace OneAgent Service

Copy the scripts on

    mkdir C:\ProgramData\dynatrace\oneagent\scripts
    copy windows\scripts_windows C:\ProgramData\dynatrace\oneagent\scripts

## Lab 1 - metric (float)
Test the script
  
    C:\ProgramData\dynatrace\oneagent\scripts\random.bat
    
Apply the config
  
    {
      "metricname" : "random script on windows",
      "frequency" : "1m",
      "timeout" : "10",
      "type" : "float",
      "shell": "",
      "command": "C:\\ProgramData\\dynatrace\\oneagent\\scripts\\random.bat"
    }
    
Here is the full json structure for the OneAgent endpoint (describe on the this [documentation](../Dynatrace-Plugin-system_commands.pdf)) 

	{
	  "scripts": [
		 {
     		 "metricname" : "random script on windows",
      		 "frequency" : "1m",
      		 "timeout" : "10",
      		 "type" : "float",
     		  "shell": "",
      		 "command": "C:\\ProgramData\\dynatrace\\oneagent\\scripts\\random.bat"
    		},
		{
		 Lab2	
		},
		{
		 ...
		 }
	  ]
	}

![image](https://user-images.githubusercontent.com/40337213/133119969-9f27afa9-afd7-47be-8179-34c4356346cf.png) 

## Lab 2 - metric (float) - frequency every 2 minutes
Test the script
  
    C:\ProgramData\dynatrace\oneagent\scripts\test.bat 30

Apply the config on the endpoint

    {
      "metricname" : "Test every 2 minutes",
      "frequency" : "2m",
      "timeout" : "60",
      "type" : "float",
      "shell": "",
      "command": "C:\\ProgramData\\dynatrace\\oneagent\\scripts\\test.bat 30"
    }


## Lab 3 - status_ko_ok_on_message

Test the script several times

     C:\ProgramData\dynatrace\oneagent\scripts\scriptwindows.bat
  
Apply the config with the appropriate configuration for "pattern" and "message": 

    {
     "metricname" : "demo status on message",
     "type" : "status_ko_ok_on_message",
     "frequency" : "1m",
     "timeout" : "30",
     "shell": "",
     "command": "C:\\ProgramData\\dynatrace\\oneagent\\scripts\\scriptwindows.bat",
     "ok_pattern" : "...",
     "ok_message" : "...",
     "ko_pattern" : "...",
     "ko_message" : "..."
    }


 
    
