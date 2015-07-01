#!/usr/bin/env sh

INPUT_DIR=${1-/input/}
OUTPUT_FILE=${2-/output}

echo ">> Expanding Environment Variables from ${INPUT_DIR}"

# Sourcing
for ENV_FILE in `ls ${INPUT_DIR}`; do
    echo "Sourcing $ENV_FILE"
    source ${INPUT_DIR}/$ENV_FILE
done

# Evaluating
IFS=$'\n'
for e in `cat ${INPUT_DIR}/*`; do
    echo "Evaluating: $e"
    echo $(eval echo "${e}") >> /tmp/env.out
done

cat /tmp/env.out | sort -u > ${OUTPUT_FILE}
