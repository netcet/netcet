FROM python:3.9

# download this https://github.com/danielgatis/rembg/releases/download/v0.0.0/u2net.onnx
# copy model to avoid unnecessary download

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt
RUN curl -o "u2net.onnx" "https://github.com/danielgatis/rembg/releases/download/v0.0.0/u2net.onnx"

COPY . .

EXPOSE 8501

CMD ["streamlit", "run", "app.py", "--server.port", "8501"]