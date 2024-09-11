

#--FROM python:3.10.2-alpine3.15


    # Create directories  
#-- RUN mkdir -p /root/workspace/src
        # Switch to project directory
#-- WORKDIR /root/workspace/src





##FROM python:3.10.2-alpine3.15
# Create directories  
##RUN mkdir -p /root/workspace/src
##COPY ./web_scraping_sample.py  /root/workspace/src
# Switch to project directory
##WORKDIR /root/workspace/src
# Install required packages
##RUN pip install --upgrade pip
##RUN pip install requests bs4 html5lib
##CMD ["web_scraping_sample.py"]
##ENTRYPOINT ["python"]

#define the command to run the python scripts

#ENTRYPOINT ["python", "web_scraping_sample.py"]




#compse docker file


FROM python:3.10.2-alpine3.15
COPY . .
# Install Postgres
RUN apk update
RUN apk add postgresql
RUN chown postgres:postgres /run/postgresql/
# Install requirements
COPY ./requirements.txt /tmp
RUN pip install -r /tmp/requirements.txt
# For psycopg2
RUN apk add --virtual postgresql-deps libpq-dev
# Create directories
RUN mkdir -p /root/workspace/src
# Mount your local file
COPY ./web_scraping_sample.py /root/workspace/src
# Switch to project directory
WORKDIR /root/workspace/src