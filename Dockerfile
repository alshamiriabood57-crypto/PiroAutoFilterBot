# استخدام نسخة أحدث ومستقرة تماماً
FROM python:3.10-slim-bullseye

WORKDIR /app

# تحديث وتثبيت الأدوات الأساسية فقط بدون المستودعات القديمة
RUN apt-get update && apt-get install -y --no-install-recommends \
    gcc \
    git \
    ffmpeg \
    libffi-dev \
    && rm -rf /var/lib/apt/lists/*

# تثبيت المكتبات البرمجية
COPY requirements.txt .
RUN pip3 install --no-cache-dir -U pip
RUN pip3 install --no-cache-dir -r requirements.txt

# نسخ ملفات البوت
COPY . .

# أمر التشغيل
CMD ["python3", "bot.py"]
