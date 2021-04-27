from flask import Flask
from datetime import datetime

app = Flask(__name__)


def datetimenow():
    now = datetime.now()
    dt_string = now.strftime("%d/%m/%Y %H:%M:%S")
    return dt_string


@app.route('/')
def index():
    return f'Hello world {datetimenow()}'


if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')
