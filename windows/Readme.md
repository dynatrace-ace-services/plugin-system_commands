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
      "metricname" : "random script on linux",
      "frequency" : "1m",
      "timeout" : "10",
      "type" : "float",
      "shell": "",
      "command": "C:\ProgramData\dynatrace\oneagent\scripts\random.bat"
    }
    

## Lab 2 - status_ko_ok_on_message

Test the script

    cd /opt/dynatrace/oneagent/scripts
    /opt/dynatrace/oneagent/scripts/check_service_status.ksh apache2.service
  
Apply the config

    {
     "metricname" : "httpd.service status on message",
     "type" : "status_ko_ok_on_message",
     "frequency" : "1m",
     "timeout" : "30",
     "shell": "",
     "command": "/opt/dynatrace/oneagent/scripts/check_service_status.ksh httpd.service",
     "ok_pattern" : "Active: (.*?) \\((.*?)\\) since (.*?);",
     "ok_message" : "Service httpd is ${word1} in status ${word2} since ${word3}",
    "ko_pattern" : "Active: inactive \\((.*?)\\)",
     "ko_message" : "Service httpd is down with status ${word1}"
    }

After 2 minutes 

    sudo service apache2 stop

## Lab 5 - status_ok_warning_critical

Test the script

    cd /opt/dynatrace/oneagent/scripts
    /opt/dynatrace/oneagent/scripts/demo_metric.ksh
    
 Apply the config

    {
	"metricname" : "cft_status",
	"type" : "status_ok_warning_critical",
	"frequency" : "1m",
	"timeout" : "10",
	"shell": "",
	"command": "/opt/dynatrace/oneagent/scripts/demo_metric.ksh",
	"ok_pattern" : "Application: (.*?), Server: (.*?), Status: Ok",
	"ok_message" : "${word1} ${word2} server is OK",
	"warning_pattern" : "Application: (.*?), Server: (.*?), Status: Warning, ErrorCode: (.+)",
	"warning_message" : "Nouveau warning message ${word1} ${word2} server is in Warning status. Error code is : ${word3}",
	"critical_pattern" : "Application: (.*?), Server: (.*?), Status: Critical, ErrorCode: (.+)",
	"critical_message" : "${word1} ${word2} server is in Critial status. Error code is : ${word3}"
    }
    
After 2 minutes : 

     sudo cp demo_metric_warning.txt demo_metric.txt
     
     
5 minutes later :

     sudo cp demo_metric_critical.txt demo_metric.txt
     
 back to nomal status
 
     sudo cp demo_metric_ok.txt demo_metric.txt
 
    
