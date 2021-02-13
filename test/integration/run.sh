#!/bin/bash
set -eu

readonly base_dir=$(dirname "$(dirname "$(cd "$(dirname "$0")" || exit; pwd)")")

"${base_dir}/bin/kubectl" exec -it client-node-0 -- "$@"
