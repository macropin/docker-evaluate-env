#!/usr/bin/env bash

# This will fail if this script fails, but not fail if an environment can't be evaled
set -e

INPUT_DIR=${1-/input/}
OUTPUT_FILE=${2-/output}

echo ">> Expanding Environment Variables from ${INPUT_DIR} to ${OUTPUT}"

# Sourcing
for ENV_FILE in ${INPUT_DIR}*; do
    echo "Sourcing $ENV_FILE"
    source "${ENV_FILE}"
done

# Evaluating each line
cat ${INPUT_DIR}* | sort -u | while IFS=$'\n' read -r e
do
    echo "Evaluating: ${e}"
    echo "$(eval echo "${e}")" >> /tmp/env.out
done

# Produce the output
cat /tmp/env.out > "${OUTPUT_FILE}"
