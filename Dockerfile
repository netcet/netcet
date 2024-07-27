FROM python:3.9

# download this https://github.com/danielgatis/rembg/releases/download/v0.0.0/u2net.onnx
# copy model to avoid unnecessary download

RUN curl -o "u2net.onnx" "https://github.com/danielgatis/rembg/releases/download/v0.0.0/u2net.onnx"


WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 5100

CMD ["python", "app.py"]