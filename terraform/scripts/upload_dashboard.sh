#!/bin/bash
set -euo pipefail

DASHBOARD_FILE="$1"
FOLDER_UID="$2"
GRAFANA_URL="$3"
API_TOKEN="$4"

LOG_FILE="/tmp/grafana_upload_$(basename "$DASHBOARD_FILE" .json).log"

if [[ ! -f "$DASHBOARD_FILE" ]]; then
  echo "❌ Dashboard file not found : $DASHBOARD_FILE" | tee -a "$LOG_FILE"
  exit 1
fi

if [[ -z "$FOLDER_UID" || -z "$GRAFANA_URL" || -z "$API_TOKEN" ]]; then
  echo "❌ One or more required parameters are missing. " | tee -a "$LOG_FILE"
  exit 1
fi

echo "📤 Uploading dashboard : $DASHBOARD_FILE" | tee "$LOG_FILE"

curl -s -w "\nHTTP %{http_code}\n" --http1.1 -X POST \
  -H "Authorization: Bearer ${API_TOKEN}" \
  -H "Content-Type: application/json" \
  -d "{
    \"dashboard\": $(jq . "$DASHBOARD_FILE"),
    \"folderUid\": \"$FOLDER_UID\",
    \"overwrite\": true
  }" \
  "${GRAFANA_URL}/api/dashboards/db" | tee -a "$LOG_FILE"

cat "$LOG_FILE"