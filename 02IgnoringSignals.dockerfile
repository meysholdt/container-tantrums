FROM python:3.9-slim

# Python script that ignores SIGTERM
COPY <<EOF /app/ignore_sigterm.py
import signal, time
def ignore_signal(signum, frame):
    print(f"Signal {signum} ignored")
signal.signal(signal.SIGTERM, ignore_signal)
while True:
    time.sleep(1)
EOF

CMD ["python", "/app/ignore_sigterm.py"]