FROM tiangolo/uwsgi-nginx-flask:python2.7

COPY ./ /app
# TODO this is ugly
COPY ./notejam/static /app/static

RUN pip install -r requirements.txt
