#!/bin/bash
# Small script that uses wmctrl and awk to switch to an existing chrome window
# if it exists; otherwise it launches a new instance

BROWSERPATTERN=".+ - google chrome$"
CURDESK=$(wmctrl -d | awk '{if($2 == "*") print $1}')
WINDOWNUM=$(wmctrl -l | \
  awk -v brows_pat="$BROWSERPATTERN" -v curdesk="$CURDESK" \
  '{if($2 == curdesk) {win_num=$1; for(i = 5; i <= NF; i++) $4 = $4 " " $i; if(tolower($4) ~ brows_pat) print win_num}}' | \
  head -n1)

if [ -n "$WINDOWNUM" ]
then
  wmctrl -i -a $WINDOWNUM
else
  exo-open --launch WebBrowser
fi

