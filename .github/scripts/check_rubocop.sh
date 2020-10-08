#!/bin/bash
EXPECTED=$1
[[ -z $EXPECTED ]] && EXPECTED=6000

OUTPUT=$(rubocop -P | tail -1)
regex='([0-9]+) files inspected, ([0-9]+) offenses detected'

[[ $OUTPUT =~ $regex ]]

OFFENSES="${BASH_REMATCH[2]}"

if ((OFFENSES > EXPECTED)); then
  echo "Rubocop failed: Found $OFFENSES, expected $EXPECTED"
  exit 1
fi

echo "Rubocop passed!"
exit 0
