FROM python:3.9

WORKDIR /app

COPY pyproject.toml /app/

RUN poetry

RUN pip install poetry

run poetry install --no-dev

COPY . /app

EXPOSE 8501

CMD ["poetry", "run", "streamlit", "run", "main.py"]
