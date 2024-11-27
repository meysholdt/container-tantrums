FROM debian:bullseye-slim

# Script that locks a file indefinitely
COPY <<EOF /app/lock_file.sh
#!/bin/bash
exec 3>/app/locked_file
flock 3
echo "File locked, sleeping forever"
while true; do sleep 1; done
EOF

RUN chmod +x /app/lock_file.sh

CMD ["/app/lock_file.sh"]