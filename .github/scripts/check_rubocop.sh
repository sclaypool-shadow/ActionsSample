#!/bin/bash
EXPECTED=$1
[[ -z $EXPECTED ]] && EXPECTED=0

OUTPUT=$(rubocop -P | tail -1)
echo "$OUTPUT"

regex='([0-9]+) file.* inspected, ([0-9]+) offense.* detected'

[[ $OUTPUT =~ $regex ]]

OFFENSES="${BASH_REMATCH[2]}"

if ((OFFENSES > EXPECTED)); then
  echo "Rubocop failed: Found $OFFENSES, expected $EXPECTED"
  exit 1
fi


echo "Rubocop passed! only $OFFENSES Errors (Less than $EXPECTED errors)"
exit 0
