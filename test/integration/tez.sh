#!/bin/bash
set -eu

readonly integration_dir=$(cd "$(dirname "$0")"; pwd)

"${integration_dir}/divider.sh" "Start running a Tez job"

"${integration_dir}/run.sh" gohdfs rm -rf /user/zookage/tez-wordcount-input
"${integration_dir}/run.sh" gohdfs rm -rf /user/zookage/tez-wordcount-output
"${integration_dir}/run.sh" gohdfs put /etc/hosts /user/zookage/tez-wordcount-input
"${integration_dir}/run.sh" bash -c "
  hadoop \
  jar \
  /opt/tez/tez-examples-*.jar \
  orderedwordcount \
  /user/zookage/tez-wordcount-input \
  /user/zookage/tez-wordcount-output
"
"${integration_dir}/run.sh" gohdfs cat /user/zookage/tez-wordcount-output/part-v002-o000-r-00000

"${integration_dir}/divider.sh" "Finished running a Tez job"
echo "The test job succeeded."
echo

"${integration_dir}/tez_log.sh"
