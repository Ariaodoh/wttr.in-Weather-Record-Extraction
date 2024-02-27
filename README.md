# wttr.in-Weather-Record-Extraction
Extracts a weather record from wttr.in
This script extracts a text weather report using wttr.in a web service that provides weather information, wttr.in is commonly used for retrieving weather forecasts, and current conditions from the command line. 

rx_poc.sh:
This script returns a output to terminal
   Input:
      Invoke script with a commad line argument of the city you want weather information on.
   Output:
      Text strings containing city name and weather for present day and the next day

rx_poc2.sh:
This is a logging script to log weather output to a log file. This script can be automated in the crontab to perform a repetitive weather logging automation.
   Input:
      Invoke script with a commad line argument of the city you want weather information on.
   Output:
      Creates (if not exists) and appends extracted weather data to log file

