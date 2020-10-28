from flask import Flask

from src import make_celery

app = Flask(__name__)
app.config.update(
    CELERY_BROKER_URL='redis://localhost:6379',
    CELERY_RESULT_BACKEND='redis://localhost:6379'
)
celery = make_celery(app)


@app.route('/')
def hello():
    return 'Hello, World!'


@celery.task()
def add(a, b):
    return a + b
