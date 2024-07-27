FROM python:3.9

WORKDIR /app

COPY pyproject.toml poetry.lock /app/

RUN pip install poetry

run poetry install --no-dev

COPY . /app

EXPOSE 8501

CMD ["poetry", "run", "streamlit", "run", "main.py"]
