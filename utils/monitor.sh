#!/usr/bin/env sh

show_help() {
  echo "Usage: $(basename "$0") [options]"
  echo
  echo "Options:"
  echo "  -o <output>      Specify the number of the Display Port output."
  echo "  -s <scale>       Set the scale factor."
  echo "  -d <direction>   Specify the direction of the screen."
  echo "  -h               Display this help message."
  echo
  echo "Example:"
  echo "  $(basename "$0") -o 0 -s 1.7 -d right"
}

# Parse command-line options
while getopts ":o:s:d:h:" opt; do
  case $opt in
    o) output="${OPTARG}"
      ;;
    s) scale="${OPTARG}"
      ;;
    d) direction="${OPTARG}"
      ;;
    h) show_help
       exit 0
      ;;
    \?) echo "Invalid option: -$OPTARG" >&2
        show_help
        exit 1
      ;;
    :) echo "Option -$OPTARG requires an argument." >&2
       show_help
       exit 1
      ;;
  esac
done

if [ -z "$output" ]; then
  echo "No output provided, using 0"
  output=0
fi

if [ -z "$scale" ]; then
  echo "No scale provided, using 1.7"
  scale=1.7
fi

if [ -z "$direction" ]; then
  echo "No direction provided, using left"
  direction="right"
fi

xrandr --auto --output DisplayPort-"${output}" --"${direction}"-of eDP --scale "${scale}"x"${scale}"

