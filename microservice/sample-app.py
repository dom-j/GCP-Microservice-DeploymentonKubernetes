from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from datetime import datetime
import os
import pytz

# Create a Flask web server from the Flask module:
app = Flask(__name__)

# Set up environment variables for the database connection:
user = os.getenv('DB_USER')
password = os.getenv('DB_PASS')
database = os.getenv('DB_NAME')
host ='localhost'
port = '3306'

# Describe the database connection:
app.config['SQLALCHEMY_DATABASE_URI'] = f'mysql+mysqlconnector://{user}:{password}@{host}:{port}/{database}'
db = SQLAlchemy(app)

# Define the Time model with id as the primary key and current_time as the DateTime field:
class Time(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    current_time = db.Column(db.DateTime, default=lambda: datetime.now(pytz.timezone('Europe/London')))

# Define the get_time route that returns the current time:
@app.route('/')
def get_time():
    time = Time()
    db.session.add(time)
    db.session.commit()
    return {'time': time.current_time}

# Createall the necessary tables in the database:
with app.app_context():
    db.create_all()

# Run the Flask web server:
if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)