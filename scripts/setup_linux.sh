#!/usr/bin/env bash
set -euo pipefail
cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.."
mkdir -p app scripts config logs backup
if [[ ! -f logs/application.log ]]; then
    cat > logs/application.log <<'LOG'
INFO Application started
INFO User logged in
WARNING Configuration file missing
INFO Database connected
ERROR Database connection failed
INFO Application restarted
WARNING Memory usage is high
INFO Request received
ERROR Request failed
INFO Application stopped
LOG
fi
touch backup/ignored-example.txt
chmod 600 private.txt
chmod 644 public.txt
chmod +x scripts/*.sh
printf 'Linux environment is ready.\n'
