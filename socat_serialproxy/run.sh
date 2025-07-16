#!/usr/bin/env bash
set -e

# Supervisor übergibt Umgebungsvariablen aus options.json automatisch

echo "[INFO] Remote target: ${REMOTE_HOST}:${REMOTE_PORT}"
echo "[INFO] Virtual device: ${DEVICE_NAME}"

# Falls das Gerät bereits existiert, löschen
if [ -e "${DEVICE_NAME}" ]; then
  echo "[WARN] Device ${DEVICE_NAME} already exists. Removing..."
  rm -f "${DEVICE_NAME}"
fi

# Start socat
exec socat -d -d PTY,link="${DEVICE_NAME}",raw TCP:"${REMOTE_HOST}":"${REMOTE_PORT}"
