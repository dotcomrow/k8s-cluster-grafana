#!/bin/bash
set -euo pipefail

dashboard_file="${1}"
folder_uid="${2}"
grafana_instance="${3#https://}"
grafana_token="${4}"

echo "📤 Uploading $(basename "$dashboard_file") to folder UID: $folder_uid..."

jq --arg folderUid "$folder_uid" \
   --argjson overwrite true \
   --arg message "Deployed via Terraform" \
   '{dashboard: ., folderUid: $folderUid, overwrite: $overwrite, message: $message}' \
   "$dashboard_file" |
  curl -s -f -X POST \
    -H "Content-Type: application/json" \
    -H "Authorization: Bearer $grafana_token" \
    --data-binary @- \
    "$grafana_instance/api/dashboards/db"
