#!/bin/bash

websites=(
  "https://google.com"
  "https://facebook.com"
  "https://twitter.com"
  "https://sfs3s.com" 
)


log_file="website_status.log"

> "$log_file"

check_website() {
  local url="$1"
  status_code=$(curl -s -o /dev/null -w "%{http_code}" -L "$url")

  if [[ "$status_code" -eq 200 ]]; then
    status="UP"
  else
    status="DOWN"
  fi

  echo "$url is $status" >> "$log_file"
}

for url in "${websites[@]}"; do
  check_website "$url"
done

echo "Результати перевірки записано у файл: $log_file"