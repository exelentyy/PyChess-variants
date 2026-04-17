FROM python:3.11-slim

# Instalacja niezbędnych bibliotek systemowych (GTK, Introspection, Cairo)
RUN apt-get update && apt-get install -y \
    python3-gi \
    python3-gi-cairo \
    gir1.2-gtk-3.0 \
    gir1.2-gtksource-3.0 \
    libgirepository1.0-dev \
    libcairo2-dev \
    pkg-config \
    # Dodatkowe zależności dla ikon i silnika
    adwaita-icon-theme \
    stockfish \
    && rm -rf /var/lib/apt/lists/*

# Instalacja PyChess
RUN pip install -r requirements.txt

# Ustawienie zmiennej środowiskowej dla X11
ENV DISPLAY=:0

# Uruchomienie za pomocą interpretera python
CMD ["python", "-m", "pychess"]
