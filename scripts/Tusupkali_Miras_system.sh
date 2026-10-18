#!/usr/bin/env bash
set -euo pipefail
project_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
printf '==============================\nStudent Information\n==============================\n\n'
printf 'Name: Miras\nSurname: Tusupkali\nGroup: IT2-2312\nStudent ID: 38366\n\n'
printf '==============================\nSystem Information\n==============================\n\n'
printf 'Username: '; whoami
printf 'Hostname: '; hostname
printf 'Current Date: '; date
printf 'Operating System: '; uname -a
printf '\nDisk Usage:\n'; df -h "$project_dir"
printf '\nMemory Usage:\n'; free -h
if [[ -f "$project_dir/Tusupkali_Miras_info.txt" ]]; then
    printf '\nStudent information file exists.\n'
else
    printf '\nStudent information file does not exist.\n'
fi
