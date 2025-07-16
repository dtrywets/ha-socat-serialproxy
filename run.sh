#!/usr/bin/env bash

set -e

echo "[INFO] Starting socat serial proxy..."
echo "[INFO] Remote target: ${REMOTE_HOST}:${REMOTE_PORT}"
echo "[INFO] Local device: ${DEVICE_NAME}"

# Prüfen ob Gerät bereits existiert
if [ -e "${DEVICE_NAME}" ]; then
    echo "[WARN] Device ${DEVICE_NAME} already exists. Removing..."
    rm -f "${DEVICE_NAME}"
fi

exec socat -d -d PTY,link="${DEVICE_NAME}",raw TCP:"${REMOTE_HOST}":"${REMOTE_PORT}"
