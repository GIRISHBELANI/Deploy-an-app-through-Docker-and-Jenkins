FROM ubuntu:latest

RUN apt-get update
RUN apt-get install python3 -y
RUN apt-get install pip -y
RUN pip install django==1.11
RUN pip install --user pipenv
RUN pip install -r requirements.txt
RUN python manage.py migrate
RUN python manage.py createsuperuser

COPY . .
EXPOSE 8080
CMD ["python", "manage.py", "runserver"]
