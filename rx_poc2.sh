#!/bin/bash

  # This script extracts a text weather report,
   # using wttr.in a web service that provides weather information,
   # wttr.in is commonly used for retrieving weather forecasts,
   # and current conditions from the command line.
   # Author: Aria Odoh
   # Input:
   # Invoke script with a commad line argument of the city you want
   # weather information on.
  
   # Output:
   # Appends strings containing city name and temperature for present day
   # and the next day to a log file

  city=$1
  timezone=$2
  
  #To get weather report and save to file
  curl -s wttr.in/$city?T --output weather_report
  
  #To create a new entry header in log file
  echo -e "  \nNew Entry: $city" >> rx_poc.log
  
  #To extract Current Temperature into var
  obs_temp=$(curl -s wttr.in/$city?T | grep -m 1 '°.' | grep -Eo -e '-?[[:digit:]].*')
  echo "The current Temperature of $city: $obs_temp" >> rx_poc.log
  
  #To extract the forecast tempearature for noon tomorrow into var
  fc_temp=$(curl -s wttr.in/$city?T | head -23 | tail -1 | grep '°.' | cut -d 'C' -f2 | grep -Eo -e '-?[[:digit:]].*')
  echo "The forecasted temperature for noon tomorrow for $city : $fc_temp C" >> rx_poc.log
  
  #To create var for date and time variables 
  hour=$(TZ="$timezone" date -u +%H) 
  day=$(TZ="$timezone" date -u +%d) 
  month=$(TZ="$timezone" date +%m)
  year=$(TZ="$timezone" date +%Y)
  
  #To add record var of table header
  record=$(echo -e "Year: $year\tMonth: $month\tDay: $day\tCurrent_Temperature: $obs_temp\tForecasted_Temprature: $fc_temp C")
  echo $record>>rx_poc.log
  
