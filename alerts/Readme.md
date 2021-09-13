# Alerts

Create the 3 custom alerts based on this specific metrics : 

- **oneagent_system_commands_ok_ko_metrics_on_message_alerting**
- **oneagent_system_commands_ok_ko_metrics_on_exit_status_alerting**
- **oneagent_system_commands_ok_warning_critical_metrics_alerting**

## from the UI 
*Settings > Anomalie Detection > Custom event for alerting > Create Custom event for alerting*  

Each of this alert has the same type of configuration : 
![image](https://user-images.githubusercontent.com/40337213/133106142-189e91af-c757-426d-ae53-b7f27c53d7ad.png)
![image](https://user-images.githubusercontent.com/40337213/133106233-96aa694e-1e2f-4aab-85e5-7348e7d36a57.png)
![image](https://user-images.githubusercontent.com/40337213/133106322-0d0b4e9e-88ae-4e25-995c-b74df39f8f3f.png)
![image](https://user-images.githubusercontent.com/40337213/133110325-49f4f32a-679e-48f2-a2a4-b055c56d70c6.png)

    host : {dims:dt.entity.host.name}
    metric_name : {dims:metric_name}
    message : {dims:message}

## from monaco

use monaco with this configuration : (lab on monaco [here](https://github.com/dynatrace-ace-services/easy-dynatrace-with-monaco/tree/main/00-install-Monaco) )
 
     export NEW_CLI=1
     cd; cd plugin-system_commands/alerts
     ./monaco deploy -e=environment.yaml alert
		
   
