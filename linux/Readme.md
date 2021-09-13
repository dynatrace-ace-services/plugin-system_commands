# Plugin system_commands - on linux

Git clone

    cd ~
    git clone https://github.com/dynatrace-ace-services/plugin-system_commands/
    cd plugin-system_commands
   
 
Install the plugin on linux host
   
    cd;cd plugin-system_commands
    sudo apt install unzip
    sudo unzip custom.python.system_commands.zip -d /opt/dynatrace/oneagent/plugin_deployment/
    sudo service oneagent restart

Copy the script on

    cd;cd plugin-system_commands
    sudo mkdir /opt/dynatrace/oneagent/scripts/
    sudo cp -rf  ./linux/scripts_linux/* /opt/dynatrace/oneagent/scripts/
    chmod +x /opt/dynatrace/oneagent/scripts/*.ksh

## Lab 1 - metric (float)
Test the script
  
    /opt/dynatrace/oneagent/scripts/random.ksh
    
Apply the config on the endpoint
  
    {
      "metricname" : "random script on linux",
      "frequency" : "1m",
      "timeout" : "10",
      "type" : "float",
      "shell": "",
      "command": "/opt/dynatrace/oneagent/scripts/random.ksh"
    }
    
Here is the full json structure for the OneAgent endpoint (describe on the this [documentation](../Dynatrace-Plugin-system_commands.pdf))

	{
	  "scripts": [
		 {
     		 "metricname" : "random script on linux",
      		 "frequency" : "1m",
      		 "timeout" : "10",
      		 "type" : "float",
     		  "shell": "",
      		 "command": "/opt/dynatrace/oneagent/scripts/random.ksh"
    		},
		{
		 Lab2	
		},
		{
		 ...
		 }
	  ]
	}
    
## Lab 2 - metric (float) - frequency every 2 minutes
Test the script
  
    /opt/dynatrace/oneagent/scripts/TestSchedule.ksh

Apply the config on the endpoint

    {
      "metricname" : "Test every 2 minutes",
      "frequency" : "2m",
      "timeout" : "10",
      "type" : "float",
      "shell": "",
      "command": "/opt/dynatrace/oneagent/scripts/TestSchedule.ksh"
    }

## Lab 3 - status_ko_ok_on_exit_status

Install apache2 

    sudo apt install apache2
    sudo service apache2 start

Test the script

    /opt/dynatrace/oneagent/scripts/SystemctlServiceStatus.ksh apache2.service
  
Apply the config on the endpoint

    {
      "metricname" : "apache2.service status on exit status",
      "type" : "status_ko_ok_on_exit_status",
      "frequency" : "1m",
      "timeout" : "10",
      "shell": "",
      "command": "/opt/dynatrace/oneagent/scripts/SystemctlServiceStatus.ksh apache2.service"
    }

After 2 minutes 

    sudo service apache2 stop
    
After 5 minutes 

    sudo service apache2 start

## Lab 4 - status_ko_ok_on_message

Test the script

    /opt/dynatrace/oneagent/scripts/check_service_status.ksh apache2.service
  
Apply the config on the endpoint

    {
     "metricname" : "apache2.service status on message",
     "type" : "status_ko_ok_on_message",
     "frequency" : "1m",
     "timeout" : "30",
     "shell": "",
     "command": "/opt/dynatrace/oneagent/scripts/check_service_status.ksh apache2.service",
     "ok_pattern" : "Active: (.*?) \\((.*?)\\) since (.*?);",
     "ok_message" : "Service apache2 is ${word1} in status ${word2} since ${word3}",
    "ko_pattern" : "Active: inactive \\((.*?)\\)",
     "ko_message" : "Service apache2 is down with status ${word1}"
    }

After 2 minutes 

    sudo service apache2 stop

## Lab 5 - status_ok_warning_critical

Test the script

    /opt/dynatrace/oneagent/scripts/demo_metric.ksh
    
Apply the config on the endpoint

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
 
    
