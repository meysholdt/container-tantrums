FROM python:3.9-slim

# Create a Python script that enters an infinite loop
COPY <<EOF /app/infinite_loop.py
while True:
    pass
EOF

CMD ["python", "/app/infinite_loop.py"]