#!/bin/bash

i=1
while [ $i -le 5 ]; do
  response=$(curl -s "https://api.open-meteo.com/v1/forecast?latitude=33.9069&longitude=-118.0833&current_weather=true&temperature_unit=celsius")
  if [ $? -eq 0 ]; then
    temp=$(echo "$response" | grep -o '"temperature":[0-9.]*' | grep -o '[0-9.]*')
    weathercode=$(echo "$response" | grep -o '"weathercode":[0-9]*' | grep -o '[0-9]*')
    windspeed=$(echo "$response" | grep -o '"windspeed":[0-9.]*' | grep -o '[0-9.]*')
    if [ -n "$temp" ]; then
      text="${temp}°C"
      tooltip="Los Angeles | ${temp}°C | Wind: ${windspeed} km/h | Code: ${weathercode}"
      echo "{\"text\":\"$text\", \"tooltip\":\"$tooltip\"}"
      exit
    fi
  fi
  sleep 2
  i=$((i + 1))
done
echo "{\"text\":\"error\", \"tooltip\":\"error\"}"
