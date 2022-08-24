FROM ubuntu:latest

RUN apt-get update
RUN apt-get install python 3.6
RUN apt-get install pip
RUN pip install django 1.11
RUN pip install --user pipenv
RUN pipenv shell
RUN pip install -r requirements.txt
RUN python manage.py migrate
RUN python manage.py createsuperuser

COPY . .
EXPOSE 8080
CMD ["python", "manage.py", "runserver"]
