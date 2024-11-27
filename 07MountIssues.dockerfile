FROM debian:bullseye-slim

# Script accessing a pseudo-device indefinitely
COPY <<EOF /app/device_lock.sh
#!/bin/bash
tail -f /dev/null
EOF

RUN chmod +x /app/device_lock.sh

CMD ["/app/device_lock.sh"]