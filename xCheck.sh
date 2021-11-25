#!/bin/zsh

# AUTHOR      : avimehenwal
# DATE        : 25-Nov-2021
# PURPOSE     : test runner entrypoint
# FILENAME    : xCheck.sh
#
# Entrypoint to run test-suite, decide how and what to run tests on

typeset -A APIS

output_dir="output"
APIS[animechan]=src/animechan.robot

# run from virtual environemnr
run_from_virtual_env () {
  if [[ -d venv ]]
  then
    python3 -m venv venv
    source venv/bin/activate
    pip install -r requirements.txt
  else
    source venv/bin/activate
  fi
}

run_from_virtual_env
CMD="./venv/bin/robot --outputdir ${output_dir}"

remove_older_reports() {
  [ -d ${output_dir} ] && rm -rfv ${output_dir}
}

# MAIN
remove_older_reports
echo ${(kv)APIS}

${CMD} "${APIS[animechan]}"
${BROWSER} "${output_dir}/report.html"

# END
