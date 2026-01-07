#!/bin/bash

set -e
echo "🔍 Starting frontend validation..."

# HTML check
if [ ! -f index.html ]; then
  echo "❌ index.html missing"
  exit 1
fi

grep -q "<html" index.html || { echo "❌ <html> tag missing"; exit 1; }
grep -q "<body" index.html || { echo "❌ <body> tag missing"; exit 1; }

# CSS check
if [ ! -f css/style.css ]; then
  echo "❌ style.css missing"
  exit 1
fi

if [ ! -s css/style.css ]; then
  echo "❌ style.css is empty"
  exit 1
fi

# JS check
if [ ! -f js/app.js ]; then
  echo "❌ app.js missing"
  exit 1
fi

node -c js/app.js || { echo "❌ JS syntax error"; exit 1; }

echo "✅ Frontend files validated successfully"

