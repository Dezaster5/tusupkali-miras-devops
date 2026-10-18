#!/usr/bin/env bash
set -euo pipefail
cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.."
bash scripts/setup_linux.sh
printf '\nProject location:\n'; pwd
printf '\nProject files:\n'; ls -la
printf '\nStudent file:\n'; cat Tusupkali_Miras_info.txt
demo_dir="$(mktemp -d backup/file-demo.XXXXXX)"
touch "$demo_dir/original.txt"
cp "$demo_dir/original.txt" "$demo_dir/copied.txt"
mv "$demo_dir/copied.txt" "$demo_dir/moved.txt"
rm -- "$demo_dir/original.txt" "$demo_dir/moved.txt"
rmdir -- "$demo_dir"
printf '\nFind log:\n'; find logs -name application.log
printf '\nErrors:\n'; grep ERROR logs/application.log
printf '\nWarnings:\n'; grep WARNING logs/application.log
printf '\nError count:\n'; grep -c ERROR logs/application.log
printf '\nFirst lines:\n'; head -n 3 logs/application.log
printf '\nLast five lines:\n'; tail -n 5 logs/application.log
printf '\nPermissions:\n'; ls -l private.txt public.txt
printf '\nIgnored files:\n'; git check-ignore logs/application.log backup/ignored-example.txt
printf '\nProcesses:\n'; ps
ps aux | sed -n '1,8p'
printf '\nTop snapshot:\n'; top -b -n 1 | sed -n '1,12p'
bash scripts/Tusupkali_Miras_system.sh
