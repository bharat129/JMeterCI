#!/bin/bash
# Simulating the Graphs Generator Plugin that doesn't work in a remote JMeter scenario.
# Make sure to input the arguments in the correct order.

REPORT_DIR_PATH=$1
TEST_RESULTS_FILE=$2

function usage()
{
	echo "Usage: $0 report_dir_path test_results_file"
}

if [ -z "$REPORT_DIR_PATH" ] || [ -z "$TEST_RESULTS_FILE" ]; then
	usage
	exit 1
fi
if [ ! -d "$REPORT_DIR_PATH" ]; then
	echo "Report directory $REPORT_DIR_PATH not found!"
	usage
	exit 1
fi

if [ ! -f "$TEST_RESULTS_FILE" ]; then
	echo "Test results file $TEST_RESULTS_FILE not found!"
	usage
	exit 1
fi

if [ -z "$JMETER_HOME" ]; then
	JMETER_HOME=/home/jenkins/workspace/02_JMeter_PublicGit/apache-jmeter-3.0
	echo "JMETER_HOME not explicitly set, defaulting to $JMETER_HOME"
fi

if [ ! -f "$JMETER_HOME/bin/jmeter.sh" ]; then
	echo "Could not find $JMETER_HOME/bin/jmeter.sh !"
	echo "JMETER_HOME=$JMETER_HOME"
	usage
	exit 1
fi
if [ ! -f "$JMETER_HOME/lib/ext/JMeterPlugins-ExtrasLibs.jar" ]; then
	echo "This script requires the JMeterPlugins-ExtrasLibs.jar library available in your jmeter installation."
	echo "Download it from jmeter-plugins.org (Extras with Libs Set) and put it in $JMETER_HOME/lib/ext/"
	usage
	exit 1
fi

CMD_RUNNER=$JMETER_HOME/lib/ext/CMDRunner.jar
if [ ! -f "$CMD_RUNNER" ]; then
	echo "This script requires the jmeter CMDRunner.jar, but it was not found in $CMD_RUNNER!"
	usage
	exit 1
fi


  JMETER_HOME=$JMETER_HOME java -jar $CMD_RUNNER --tool Reporter --generate-png $REPORT_DIR_PATH/ResponseTimesOverTime.png --input-jtl $TEST_RESULTS_FILE --plugin-type ResponseTimesOverTime --width 1024 --height 768 
  JMETER_HOME=$JMETER_HOME java -jar $CMD_RUNNER --tool Reporter --generate-png $REPORT_DIR_PATH/ResponseTimesOverTime-100-seconds-interval.png --input-jtl $TEST_RESULTS_FILE --plugin-type ResponseTimesOverTime --width 1024 --height 768 --granulation 100000
  JMETER_HOME=$JMETER_HOME java -jar $CMD_RUNNER --tool Reporter --generate-png $REPORT_DIR_PATH/ResponseTimesOverTime-1000-seconds-interval.png --input-jtl $TEST_RESULTS_FILE --plugin-type ResponseTimesOverTime --width 1024 --height 768 --granulation 1000000
  JMETER_HOME=$JMETER_HOME java -jar $CMD_RUNNER --tool Reporter --generate-png $REPORT_DIR_PATH/BytesThroughputOverTime.png --input-jtl $TEST_RESULTS_FILE --plugin-type BytesThroughputOverTime --width 1024 --height 768 --granulation 100000
  JMETER_HOME=$JMETER_HOME java -jar $CMD_RUNNER --tool Reporter --generate-png $REPORT_DIR_PATH/HitsPerSecond.png --input-jtl $TEST_RESULTS_FILE --plugin-type HitsPerSecond --width 1024 --height 768 --granulation 10000
  JMETER_HOME=$JMETER_HOME java -jar $CMD_RUNNER --tool Reporter --generate-png $REPORT_DIR_PATH/LatenciesOverTime.png --input-jtl $TEST_RESULTS_FILE --plugin-type LatenciesOverTime --width 1024 --height 768 --aggregate-rows yes
  JMETER_HOME=$JMETER_HOME java -jar $CMD_RUNNER --tool Reporter --generate-png $REPORT_DIR_PATH/ResponseCodesPerSecond.png --input-jtl $TEST_RESULTS_FILE --plugin-type ResponseCodesPerSecond --width 1024 --height 768 --granulation 10000
  JMETER_HOME=$JMETER_HOME java -jar $CMD_RUNNER --tool Reporter --generate-png $REPORT_DIR_PATH/ResponseTimesPercentiles.png --input-jtl $TEST_RESULTS_FILE --plugin-type ResponseTimesPercentiles --width 1024 --height 768 --aggregate-rows yes
  JMETER_HOME=$JMETER_HOME java -jar $CMD_RUNNER --tool Reporter --generate-png $REPORT_DIR_PATH/ResponseTimesDistribution.png --input-jtl $TEST_RESULTS_FILE --plugin-type ResponseTimesDistribution --width 1024 --height 768 --aggregate-rows yes
  JMETER_HOME=$JMETER_HOME java -jar $CMD_RUNNER --tool Reporter --generate-png $REPORT_DIR_PATH/ResponseTimesDistribution-no-aggregation.png --input-jtl $TEST_RESULTS_FILE --plugin-type ResponseTimesDistribution --width 1024 --height 768 
  JMETER_HOME=$JMETER_HOME java -jar $CMD_RUNNER --tool Reporter --generate-png $REPORT_DIR_PATH/ResponseTimesDistribution-no-aggregation-low-counts.png --input-jtl $TEST_RESULTS_FILE --plugin-type ResponseTimesDistribution --width 1024 --height 768 --force-y 40
  JMETER_HOME=$JMETER_HOME java -jar $CMD_RUNNER --tool Reporter --generate-png $REPORT_DIR_PATH/TransactionsPerSecond.png --input-jtl $TEST_RESULTS_FILE --plugin-type TransactionsPerSecond --width 1024 --height 768 --granulation 10000 --aggregate-rows yes
  JMETER_HOME=$JMETER_HOME java -jar $CMD_RUNNER --tool Reporter --generate-png $REPORT_DIR_PATH/TransactionsPerSecond-no-aggregation.png --input-jtl $TEST_RESULTS_FILE --plugin-type TransactionsPerSecond --width 1024 --height 768 --granulation 10000 
  JMETER_HOME=$JMETER_HOME java -jar $CMD_RUNNER --tool Reporter --generate-png $REPORT_DIR_PATH/TimesVsThreads.png --input-jtl $TEST_RESULTS_FILE --plugin-type TimesVsThreads --width 1024 --height 768 --aggregate-rows yes
  JMETER_HOME=$JMETER_HOME java -jar $CMD_RUNNER --tool Reporter --generate-png $REPORT_DIR_PATH/ThreadsStateOverTime.png --input-jtl $TEST_RESULTS_FILE --plugin-type ThreadsStateOverTime --width 1024 --height 768
  JMETER_HOME=$JMETER_HOME java -jar $CMD_RUNNER --tool Reporter --generate-png $REPORT_DIR_PATH/ThroughputVsThreads.png --input-jtl $TEST_RESULTS_FILE --plugin-type ThroughputVsThreads --width 1024 --height 768 
  JMETER_HOME=$JMETER_HOME java -jar $CMD_RUNNER --tool Reporter --generate-png $REPORT_DIR_PATH/ThroughputVsThreads-selected-pages.png --input-jtl $TEST_RESULTS_FILE --plugin-type ThroughputVsThreads --width 1024 --