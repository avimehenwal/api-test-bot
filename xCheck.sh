#!/bin/bash

# AUTHOR      : avimehenwal
# DATE        : 25-Nov-2021
# PURPOSE     : test runner entrypoint
# FILENAME    : xCheck.sh
#
# Entrypoint to run test-suite, decide how and what to run tests on

output_dir="output"

CMD="robot --outputdir ${output_dir}"
test=src/test.robot

remove_older_reports () {
  [ -d ${output_dir} ] && rm -rfv ${output_dir}
}

# MAIN
remove_older_reports
${CMD} ${test}
${BROWSER} "${output_dir}/report.html"

# END
