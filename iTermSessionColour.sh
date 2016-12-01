#!/bin/bash
# Add the following lines to your bash_profile, log out, log in
# alias ssh='/path/to/script ssh'
# alias sftp='/path/to/script sftp'
# Env names should translate to iTerm Profiles


function tabc() {
  NAME=$1; if [ -z "$NAME" ]; then NAME="Default"; fi
  echo -e "\033]50;SetProfile=$NAME\a"
}

function tab-reset() {
    NAME="Default"
    echo -e "\033]50;SetProfile=$NAME\a"
}

function colorssh() {
    if [[ -n "$ITERM_SESSION_ID" ]]; then
        trap "tab-reset" INT EXIT
        if [[ "$2" =~ <HOST_REGEX> ]]; then
            tabc Env1
        elif [[ "$2" =~ <HOST_REGEX> ]]; then
            tabc Env2
        elif [[ "$2" =~ <HOST_REGEX> ]]; then
            tabc Env3
        elif [[ "$2" =~ <HOST_REGEX> ]]; then
            tabc Env4
        else
            tabc Other
        fi
    fi
    $*
}

colorssh $1 $2
