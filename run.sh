#!/usr/bin/env sh

INPUT=/input/
OUTPUT=/output

echo ">> Expanding Environment Variables from ${INPUT}"

for ENV_FILE in `ls ${INPUT}`; do
    echo "Sourcing $ENV_FILE"
    source $ENV_FILE
    for e in `cat ${ENV_FILE}`; do
        echo `eval "echo $e"` >> /tmp/env.out
    done
done

cat /tmp/env.out | sort -u > ${OUTPUT}
