FROM python:3.9-slim

# Python server blocking indefinitely on a client connection
COPY <<EOF /app/blocking_server.py
import socket
server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
server.bind(('0.0.0.0', 8080))
server.listen(1)
print("Waiting for client connection...")
client_socket, addr = server.accept()  # Blocks here
EOF

CMD ["python", "/app/blocking_server.py"]