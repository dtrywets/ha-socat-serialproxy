#!/usr/bin/env bash
set -e

echo "[INFO] Remote target: ${REMOTE_HOST}:${REMOTE_PORT}"
echo "[INFO] Virtual device: ${DEVICE_NAME}"

if [ -e "${DEVICE_NAME}" ]; then
  echo "[WARN] Device ${DEVICE_NAME} already exists. Removing..."
  rm -f "${DEVICE_NAME}"
fi

echo "[INFO] Starte socat..."
exec socat -d -d PTY,link="${DEVICE_NAME}",raw TCP:"${REMOTE_HOST}":"${REMOTE_PORT}"
