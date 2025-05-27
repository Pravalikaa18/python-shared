FROM python:3.10

WORKDIR /app

COPY . /app

# Clone sharedlib if not using pip from Git
RUN git clone https://github.com/pravalikaa18/shared-library.git && \
    pip install ./shared-library

RUN pip install -r requirements.txt

CMD ["python", "app/main.py"]
