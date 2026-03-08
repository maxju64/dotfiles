#!/bin/sh
for i in {1..5}; do
  response=$(curl -s "https://api.open-meteo.com/v1/forecast?latitude=34.05&longitude=-118.24&current_weather=true&temperature_unit=celsius")
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
done
echo "{\"text\":\"error\", \"tooltip\":\"error\"}"
