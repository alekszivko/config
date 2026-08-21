#!/usr/bin/env bash
# Maps an app name to a sketchybar-app-font glyph.
# Full list: https://github.com/kvndrsslr/sketchybar-app-font/blob/main/mappings/
case "$1" in
  "IntelliJ IDEA"*)            echo ":idea:" ;;
  "Google Chrome"*)            echo ":google_chrome:" ;;
  "Safari")                    echo ":safari:" ;;
  "Firefox"*)                  echo ":firefox:" ;;
  "Arc")                       echo ":arc:" ;;
  "Slack")                     echo ":slack:" ;;
  "Discord")                   echo ":discord:" ;;
  "Terminal")                  echo ":terminal:" ;;
  "iTerm2")                    echo ":iterm:" ;;
  "Ghostty")                   echo ":ghostty:" ;;
  "kitty")                     echo ":kitty:" ;;
  "WezTerm")                   echo ":wezterm:" ;;
  "Alacritty")                 echo ":alacritty:" ;;
  "Code"|"Visual Studio Code") echo ":code:" ;;
  "Cursor")                    echo ":cursor:" ;;
  "Xcode")                     echo ":xcode:" ;;
  "Finder")                    echo ":finder:" ;;
  "System Settings")           echo ":gear:" ;;
  "Notes")                     echo ":notes:" ;;
  "Obsidian")                  echo ":obsidian:" ;;
  "Notion")                    echo ":notion:" ;;
  "Spotify")                   echo ":spotify:" ;;
  "Music")                     echo ":music:" ;;
  "Mail")                      echo ":mail:" ;;
  "Messages")                  echo ":messages:" ;;
  "WhatsApp")                  echo ":whats_app:" ;;
  "Telegram")                  echo ":telegram:" ;;
  "zoom.us")                   echo ":zoom:" ;;
  "Microsoft Teams"*)          echo ":microsoft_teams:" ;;
  "Docker"*)                   echo ":docker:" ;;
  "Postman")                   echo ":postman:" ;;
  "TablePlus")                 echo ":tableplus:" ;;
  "Figma")                     echo ":figma:" ;;
  "Preview")                   echo ":pdf:" ;;
  "1Password")                 echo ":one_password:" ;;
  *)                           echo ":default:" ;;
esac
