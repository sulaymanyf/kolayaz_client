#!/usr/bin/env bash
set -e

TAG="$1"
if [ -z "$TAG" ]; then
  echo "Usage: ./generate_version_json.sh v1.0.0"
  exit 1
fi

OWNER="sulaymanyf"
REPO="kolayaz_client"

DARWIN="Kolayaz-darwin.dmg"
WIN="Kolayaz-windows.exe"
LINUX="Kolayaz-linux.AppImage"

PUBLISHED_AT=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

cat > version.json <<EOF
{
  "version":"${TAG}",
  "darwin_url":"https://github.com/${OWNER}/${REPO}/releases/download/${TAG}/${DARWIN}",
  "windows_url":"https://github.com/${OWNER}/${REPO}/releases/download/${TAG}/${WIN}",
  "linux_url":"https://github.com/${OWNER}/${REPO}/releases/download/${TAG}/${LINUX}"
  "published_at":"${PUBLISHED_AT}"
}
EOF

echo "Generated version.json:"
cat version.json