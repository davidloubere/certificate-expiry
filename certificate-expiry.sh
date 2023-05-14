#!/bin/bash

declare -a VHOSTS=(
  "www.google.com"
)

for VHOST in "${VHOSTS[@]}"; do
  OUTPUT=$(echo echo "Q" | openssl s_client -quiet -no_ign_eof -connect $VHOST:443 -servername $VHOST 2>&1 | grep "errno")

  if [ "$OUTPUT" ]; then
    echo "$VHOST : $OUTPUT"
  fi
done

exit 0
