#!/bin/bash
   # This script extracts a text weather report,
   # using wttr.in a web service that provides weather information,
   # wttr.in is commonly used for retrieving weather forecasts,
   # and current conditions from the command line.
   # Author: Aria Odoh
   # Input:
   # call script with a commad line argument of the city you want
   # weather information on.
  
   # Output:
   # Text strings containing city name and weather for present day
   # and the next day
   
    city=$1
    
    #To get weather report and save to file
    #This saves a copy of wttr.in report to a file
    curl -s wttr.in/$city?T --output weather_report
    
    #To extract Current Temperature into variable 
    obs_temp=$(curl -s wttr.in/$city?T | grep -m 1 '°.' | grep -Eo -e '-?[[:digit:]].*')
    echo "The current Temperature of $city: $obs_temp"
    
    #To extract the forecast tempearature for noon tomorrow into variable
    fc_temp=$(curl -s wttr.in/$city?T | head -23 | tail -1 | grep '°.' | cut -d 'C' -f2 | grep -Eo -e '-?[[:digit:]].*')
    echo "The forecasted temperature for noon tomorrow for $city : $fc_temp C"
    


