FROM debian:bullseye-slim

# Bash script that spawns a zombie process
COPY <<EOF /app/spawn_zombie.sh
#!/bin/bash
# Create a child process and wait forever
child_process() { sleep 1000; }
child_process &
while true; do sleep 1; done
EOF

RUN chmod +x /app/spawn_zombie.sh

CMD ["/app/spawn_zombie.sh"]