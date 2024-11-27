FROM debian:bullseye-slim

# Entrypoint script introducing delays
COPY <<EOF /app/entrypoint.sh
#!/bin/bash
echo "Sleeping forever in entrypoint..."
while true; do sleep 1; done
EOF

RUN chmod +x /app/entrypoint.sh

ENTRYPOINT ["/app/entrypoint.sh"]