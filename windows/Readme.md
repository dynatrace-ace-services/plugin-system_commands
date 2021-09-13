# Plugin system_commands - on host windows

Git clone

    cd /D %HOMEDRIVE%%HOMEPATH%
    git clone https://github.com/dynatrace-ace-services/plugin-system_commands/
    cd plugin-system_commands
   
 
Copy the script on

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
    
## Lab 2 - metric (float) - frequency every 2 minutes
Test the script
  
   C:\ProgramData\dynatrace\oneagent\scripts\test.bat

Apply the config on the endpoint

    {
      "metricname" : "Test every 2 minutes",
      "frequency" : "2m",
      "timeout" : "10",
      "type" : "float",
      "shell": "",
      "command": "C:\\ProgramData\\dynatrace\\oneagent\\scripts\\test.bat"
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


 
    
