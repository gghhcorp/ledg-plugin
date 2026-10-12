#!/bin/sh
# Builds dist/ledg-openai.zip, the package uploaded to OpenAI's plugin
# directory (platform.openai.com/plugins) for ChatGPT and Codex.
#
# The ZIP holds plugin.json and mcp.json from openai/ at its root, plus
# skills/ and assets/. It leaves out what only Claude reads
# (.claude-plugin/ and .mcp.json) and everything that is not part of the
# package: .git, dist, scripts, openai and any .DS_Store.
#
# Usage, from anywhere: sh scripts/build-openai-zip.sh
set -eu

root=$(cd "$(dirname "$0")/.." && pwd)
out="$root/dist/ledg-openai.zip"

for f in openai/plugin.json openai/mcp.json; do
  if [ ! -f "$root/$f" ]; then
    echo "Missing $f" >&2
    exit 1
  fi
done
for d in skills assets; do
  if [ ! -d "$root/$d" ]; then
    echo "Missing $d/" >&2
    exit 1
  fi
done

stage=$(mktemp -d)
trap 'rm -rf "$stage"' EXIT

cp "$root/openai/plugin.json" "$stage/plugin.json"
cp "$root/openai/mcp.json" "$stage/mcp.json"
cp -R "$root/skills" "$stage/skills"
cp -R "$root/assets" "$stage/assets"
find "$stage" -name .DS_Store -type f -delete

mkdir -p "$root/dist"
rm -f "$out"
(cd "$stage" && zip -q -r -X "$out" plugin.json mcp.json skills assets)

echo "Built $out"
unzip -l "$out"
