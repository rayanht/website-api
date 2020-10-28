FROM python:3.8

RUN pip install pipenv
RUN mkdir -p usr/app/src
COPY src usr/app/src

COPY Pipfile usr/app/
COPY Pipfile.lock usr/app/

WORKDIR usr/app/
RUN pipenv install --system --deploy --ignore-pipfile

CMD ["pipenv", "run", "gunicorn", "-b", "0.0.0.0:$PORT" , "--pythonpath", "src/", "app:app"]