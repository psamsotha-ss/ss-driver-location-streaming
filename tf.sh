#!/bin/bash


if ! type terraform >/dev/null  2>&1 ; then
  echo "Terraform is not installed."
  exit 1
else
  CMD="$1"
fi

WORKDIR="./terraform"

case "$CMD" in
  "up" | "UP") terraform -chdir="$WORKDIR" apply;;
  "down" | "DOWN") terraform -chdir="$WORKDIR" destroy;;
  *) terraform -chdir="$WORKDIR" $*
  ;;
esac
