FROM ubuntu:latest

RUN apt-get update
RUN apt-get install python==3.9 -y
RUN apt-get install pip -y
RUN pip install django==1.11
RUN pip install --user pipenv

COPY . .

RUN pip install -r requirements.txt

RUN cd lets_quiz

WORKDIR lets_quiz
RUN from collections import Iterable
RUN python3 manage.py migrate
RUN python3 manage.py createsuperuser

COPY . .

CMD ["python3", "manage.py", "runserver"]
