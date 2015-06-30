#!/usr/bin/env sh

ENV_FILE=/environment

echo "Expanding Environment Variables from ${ENV_FILE}"
source ${ENV_FILE}
for e in `cat ${ENV_FILE}`; do
    echo `eval "echo $e"` >> /tmp/env.out
done

cat /tmp/env.out | sort > ${ENV_FILE}
