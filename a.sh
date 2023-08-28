#!/bin/sh

# Wrapper for cleaner, easy-to-read output.
# WHAT IT DOES: 
#       Saves ${1} (the first argument) into a variable called playbook. 
#       Uses a shift to move all arguments to the left, so $@ will now not contain the playbook as the first argument.

playbook=${1?"Missing playbook"}
shift

echo -n "$@" | grep -q -- "-v" && export ANSIBLE_STDOUT_CALLBACK=yaml

ansible-playbook "$playbook" "$@"
