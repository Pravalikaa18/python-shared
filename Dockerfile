FROM python:3.10

WORKDIR /app

COPY . /app

# Clone sharedlib if not using pip from Git
RUN git clone https://github.com/pravalikaa18/sharedlib.git && \
    pip install ./sharedlib

RUN pip install -r requirements.txt

CMD ["python", "app/main.py"]
