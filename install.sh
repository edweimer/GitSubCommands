#!/bin/bash

set -e -u -o pipefail;

progname=${0##*/};
progname=${progname##*\\};

declare basefile="";
declare installedext="GitSubCommands";

function usage() {
  returncode=${1:-0};

  cat << EOF >&2
Usage: ${progname}
EOF

  exit ${returncode};
}

while getopts ":h" opt; do
  case "${opt}" in
    h)
      usage;
      ;;
    *)
      usage 1;
      ;;
  esac
done;
shift $((OPTIND - 1));

if [ $# -ne 0 ]; then
  usage 1;
fi;

# Remove existing scripts that are no longer present.
for file in ~/bin/*".${installedext}"; do
  basefile=${file##*/};
  basefile=${basefile%.${installedext}};

  if [ ! -e "bash/${basefile}" ]; then
    echo $basefile missing.;

    rm -v ~/bin/"${basefile}";
    rm -v ~/bin/"${basefile}.${installedext}";
  fi;
done;

# Install/update scripts.
for file in bash/*; do
  basefile=${file#bash/};

  cp -v "$file" ~/bin/;
  touch ~/bin/"${basefile}.${installedext}";
done;
