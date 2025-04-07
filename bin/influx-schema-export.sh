#!/bin/bash

# CONFIG
BUCKET="${INFLUX_BUCKET:-your-bucket-name}"
ORG="${INFLUX_ORG:-your-org}"
OUTFILE="influxdb_schema.json"

# Check dependencies
if ! command -v influx &> /dev/null || ! command -v jq &> /dev/null; then
  echo "❌ This script requires both 'influx' and 'jq'."
  exit 1
fi

echo "📦 Exporting InfluxDB schema from bucket: $BUCKET (org: $ORG)"
TMP_FILE=$(mktemp)

# === Get all measurements ===
MEASUREMENT_QUERY=$'import "influxdata/influxdb/schema"\nschema.measurements(bucket: "'$BUCKET'")'

MEASUREMENTS=$(influx query --org "$ORG" --raw <<< "$MEASUREMENT_QUERY" \
  | grep -v '^#' \
  | cut -d ',' -f4 \
  | tr -d '\r' \
  | grep -v '^$' \
  | sort -u)

if [ -z "$MEASUREMENTS" ]; then
  echo "❌ No measurements found in bucket '$BUCKET'."
  exit 1
fi

# Start JSON array
echo "[" > "$TMP_FILE"
COUNT=0
TOTAL=$(echo "$MEASUREMENTS" | wc -l | tr -d ' ')

while IFS= read -r MEASUREMENT; do
  echo "🔍 Processing: $MEASUREMENT"

  # --- FIELD KEYS ---
  FIELD_QUERY=$(cat <<EOF
import "influxdata/influxdb/schema"
schema.fieldKeys(
  bucket: "$BUCKET",
  predicate: (r) => r._measurement == "$MEASUREMENT"
)
EOF
)
  RAW_FIELDS=$(influx query --org "$ORG" --raw <<< "$FIELD_QUERY" | tr -d '\r')
  FIELDS=$(echo "$RAW_FIELDS" \
    | grep -v '^#' \
    | cut -d ',' -f3,4 \
    | awk -F',' '{print "{\"key\": \"" $1 "\", \"type\": \"" $2 "\"}"}' \
    | jq -s '.' 2>/dev/null || echo "[]")

  # --- TAG KEYS ---
  TAG_QUERY=$(cat <<EOF
import "influxdata/influxdb/schema"
schema.tagKeys(
  bucket: "$BUCKET",
  predicate: (r) => r._measurement == "$MEASUREMENT"
)
EOF
)
  RAW_TAGS=$(influx query --org "$ORG" --raw <<< "$TAG_QUERY" | tr -d '\r')
  TAGS=$(echo "$RAW_TAGS" \
    | grep -v '^#' \
    | cut -d ',' -f3 \
    | jq -R -s -c 'split("\n") | map(select(length > 0))' 2>/dev/null || echo "[]")

  # --- Assemble JSON ---
  jq -n \
    --arg measurement "$MEASUREMENT" \
    --argjson fields "$FIELDS" \
    --argjson tags "$TAGS" \
    '{measurement: $measurement, fields: $fields, tags: $tags}' >> "$TMP_FILE"

  COUNT=$((COUNT + 1))
  if [ "$COUNT" -lt "$TOTAL" ]; then
    echo "," >> "$TMP_FILE"
  fi

done <<< "$MEASUREMENTS"

echo "]" >> "$TMP_FILE"
mv "$TMP_FILE" "$OUTFILE"
echo "✅ Export complete! Schema written to $OUTFILE"
