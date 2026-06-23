#!/usr/bin/env bash
# Regenerate the generated client from the vendored openapi.json.
# Hand-written files (CurrencyCoreSDK/Classes/OpenAPIs/CurrencyCore.swift, README)
# are protected by .openapi-generator-ignore.
set -euo pipefail
cd "$(dirname "$0")/.."
npx -y @openapitools/openapi-generator-cli generate \
  -i openapi.json -g swift5 -o . \
  --additional-properties=projectName=CurrencyCoreSDK,responseAs=AsyncAwait
