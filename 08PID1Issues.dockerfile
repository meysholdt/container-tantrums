FROM debian:bullseye-slim

# No proper init system, processes are left unreaped
COPY <<EOF /app/pid1_issue.sh
#!/bin/bash
while true; do
    sleep 1 &
    sleep 1
done
EOF

RUN chmod +x /app/pid1_issue.sh

CMD ["/app/pid1_issue.sh"]