#!/bin/sh

RESULTS_FILE="$1"

if [ -z "$RESULTS_FILE" ] || [ ! -f "$RESULTS_FILE" ]; then
	echo "No jmeter results file found! $RESULTS_FILE"
	exit 0;
fi

SIMPLIFIED_RESULTS_FILE="$(dirname ${RESULTS_FILE})/test-results-simple.xml"
rm -f $SIMPLIFIED_RESULTS_FILE

echo "<?xml version=\"1.0\" encoding=\"UTF-8\"?>" > $SIMPLIFIED_RESULTS_FILE
echo "<testResults version=\"1.2\">" >> $SIMPLIFIED_RESULTS_FILE
cat $RESULTS_FILE | grep "<httpSample" | sed 's/\(.*\)>\s*$/\1\/>/' >> $SIMPLIFIED_RESULTS_FILE
echo "</testResults>" >>