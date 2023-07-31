FROM Python:3.10-slim

ENV PYTHONUNBIFFERED True


WORKDIR /app

COPY requirement.txt requirement.txt 

RUN pip intall --upgrade pip
RUN pip install --no-cache-dir -r requirement.txt

ENV PORT=80
EXPOSE $PORT

COPY . ./

CMD exec uvicorn app:app --host 0.0.0.0 --port ${PORT}