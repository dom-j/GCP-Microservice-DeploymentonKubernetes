from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from datetime import datetime
import os
import pytz

app = Flask(__name__)
user = os.getenv('DB_USER')
password = os.getenv('DB_PASS')
database = os.getenv('DB_NAME')
host = os.getenv('DB_HOST')
app.config['SQLALCHEMY_DATABASE_URI'] = f'mysql+mysqlconnector://{user}:{password}@{host}/{database}'
db = SQLAlchemy(app)

class Time(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    current_time = db.Column(db.DateTime, default=datetime.utcnow)

@app.route('/')
def get_time():
    time = Time()
    db.session.add(time)
    db.session.commit()
    # Convert the time to GMT+1 timezone
    gmt_plus_one_time = time.current_time.replace(tzinfo=pytz.utc).astimezone(pytz.timezone('Etc/GMT-1'))
    return {'time': gmt_plus_one_time}

with app.app_context():
    db.create_all()

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)