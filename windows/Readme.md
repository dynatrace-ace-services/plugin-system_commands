# Plugin system_commands - on windows

Git clone

    cd /D %HOMEDRIVE%%HOMEPATH%
    git clone https://github.com/dynatrace-ace-services/plugin-system_commands/
    cd plugin-system_commands
   
Manually unzip and copy 
   
    custom.python.system_commands.zip => C:\Program Files\dynatrace\oneagent\plugin_deployment
<img src="https://user-images.githubusercontent.com/40337213/133121297-ebec3ca8-2d21-43a6-b4c8-c2543798b4a5.png" width="500" height="90">

    Restart the Dynatrace OneAgent Service

Copy the scripts on C:\ProgramData\dynatrace\oneagent\scripts

    cd /D %HOMEDRIVE%%HOMEPATH%
    mkdir C:\ProgramData\dynatrace\oneagent\scripts
    copy plugin-system_commands\windows\scripts_windows C:\ProgramData\dynatrace\oneagent\scripts

## Lab 1 - metric (float)
Test the script
  
    python C:\ProgramData\dynatrace\oneagent\scripts\random_number.py
    
Apply the config 

    {
      "metricname" : "random script on windows with python",
      "frequency" : "1m",
      "timeout" : "10",
      "type" : "float",
      "shell": "python",
      "command": "C:\\ProgramData\\dynatrace\\oneagent\\scripts\\random_number.py"
    }
    
Here is the full json structure for the OneAgent endpoint (describe on the this [documentation](../Dynatrace-Plugin-system_commands.pdf)) 

	{
	  "scripts": [
		 {
     		 "metricname" : "random script on windows with python",
      		 "frequency" : "1m",
      		 "timeout" : "10",
      		 "type" : "float",
     		  "shell": "",
      		 "command": "C:\\ProgramData\\dynatrace\\oneagent\\scripts\\random_number.py"
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


## Lab 2 - status_ko_ok_on_message

Test the script several times

     python C:\ProgramData\dynatrace\oneagent\scripts\scriptwindows.py
  
Apply the config with the appropriate configuration for "pattern" and "message":
In this example, the result is splited by *demo_value*.

	{
	"metricname" : "demo status on message ",
	"type" : "status_ok_warning_critical",
	"frequency" : "1m",
	"timeout" : "30",
	"shell": "python",
	"command": "C:\\ProgramData\\dynatrace\\oneagent\\scripts\\scriptwindows.py",
	"ok_pattern" : "OK;value=([0-9]+)",
	"ok_message" : "Status OK,demo_'${word1}'",
	"warning_pattern" : "WARNING;value=([0-9]+)",
	"warning_message" : "Status WARNING,demo_'${word1}'",
	"critical_pattern" : "CRITICAL;value=([0-9]+)",
	"critical_message" : "Status CRITICAL,demo_'${word1}'"
	}

 
    
