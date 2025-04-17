#!/bin/bash
set -euo pipefail

dashboard_file="${1}"
folder_uid="${2}"
grafana_instance="${3}"
grafana_token="${4}"

echo "📤 Uploading $(basename "$dashboard_file") to folder UID: $folder_uid..."

jq --arg folderUid "$folder_uid" '.folderUid = $folderUid' "$dashboard_file" |
  curl -s -X POST \
    -H "Content-Type: application/json" \
    -H "Authorization: Bearer $grafana_token" \
    --data-binary @- \
    "https://$grafana_instance/api/dashboards/db"
