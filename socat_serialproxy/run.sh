#!/usr/bin/env bash
set -e

echo "[INFO] Remote target: ${REMOTE_HOST}:${REMOTE_PORT}"
echo "[INFO] Virtual device: ${DEVICE_NAME}"

# Falls das Gerät bereits existiert, löschen
if [ -e "${DEVICE_NAME}" ]; then
  echo "[WARN] Device ${DEVICE_NAME} already exists. Removing..."
  rm -f "${DEVICE_NAME}"
fi

# socat starten
echo "[INFO] Starte socat..."
socat -d -d PTY,link="${DEVICE_NAME}",raw TCP:"${REMOTE_HOST}":"${REMOTE_PORT}" &
SOCAT_PID=$!

# Warte auf Beendigung oder Fehler
wait "${SOCAT_PID}"
EXIT_CODE=$?

echo "[INFO] Socat beendet mit Exit-Code ${EXIT_CODE}"
exit "${EXIT_CODE}"
