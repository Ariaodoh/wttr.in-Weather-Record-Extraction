#!/bin/bash

#To store the city value in a city var
city=$1

#To get weather report and save to file
curl -s wttr.in/$city?T --output weather_report

#To extract Current Temperature into var
obs_temp=$(curl -s wttr.in/$city?T | grep -m 1 '°.' | grep -Eo -e '-?[[:digit:]].*')
echo "The current Temperature of $city: $obs_temp" >> rx_poc.log

#To extract the forecast tempearature for noon tomorrow into var
fc_temp=$(curl -s wttr.in/$city?T | head -23 | tail -1 | grep '°.' | cut -d 'C' -f2 | grep -Eo -e '-?[[:digit:]].*')
echo "The forecasted temperature for noon tomorrow for $city : $fc_temp C" >> rx_poc.log

#To create var for date and time variables 
hour=$(TZ='Morocco/Casablanca' date -u +%H) 
day=$(TZ='Morocco/Casablanca' date -u +%d) 
month=$(TZ='Morocco/Casablanca' date +%m)
year=$(TZ='Morocco/Casablanca' date +%Y)

#To add record var of table header
record=$(echo -e "Year: $year\tMonth: $month\tDay: $day\tCurrent_Temperature: $obs_temp\tForecasted_Temprature: $fc_temp C")
echo $record>>rx_poc.log

