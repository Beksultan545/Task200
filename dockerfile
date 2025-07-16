FROM python:3.10

WORKDIR /app

RUN apt-get update && apt-get install -y netcat-openbsd

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .
RUN chmod +x wait-for-it.sh

# ❗МІНЕ ОСЫ ЖЕРДЕ ҚАТЕ БОЛҒАН
CMD ["./wait-for-it.sh", "postgres", "5432", "--", "uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
