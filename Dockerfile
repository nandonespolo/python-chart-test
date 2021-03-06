FROM python:3.9

WORKDIR /usr/src/app

COPY src/requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY src/app.py .

# latest added
EXPOSE 5000 

CMD [ "python", "./app.py" ]