#!/bin/bash

WORKDIR=~/LogiiLabsSync
LOGFILE="$WORKDIR/sync.log"

mkdir -p "$WORKDIR"
cd "$WORKDIR" || exit 1

for file in *.sh; do
  if ! grep -q '^#!/bin/bash' "$file"; then
    echo "Fixing shebang in $file..."
    tmp=$(mktemp)
    echo '#!/bin/bash' > "$tmp"
    cat "$file" >> "$tmp"
    mv "$tmp" "$file"
    chmod +x "$file"
  fi

  # Append logging if not already present
  if ! grep -q 'sync.log' "$file"; then
    echo "Adding logging to $file..."
    echo -e "\nLOGFILE=$LOGFILE\necho \"[\$(date '+%Y-%m-%d %H:%M:%S')] Script completed: \$0\" >> \"\$LOGFILE\"" >> "$file"
  fi
done
