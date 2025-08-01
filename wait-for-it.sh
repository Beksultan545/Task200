#!/usr/bin/env bash

set -e

host="$1"
port="$2"
shift 2

echo "⏳ Waiting for $host:$port..."

while ! nc -z "$host" "$port"; do
  sleep 1
done

echo "✅ $host:$port is ready!"

exec "$@"
