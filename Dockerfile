FROM node:23-bookworm-slim

RUN apt-get update || : && apt-get install python-is-python3 -y
RUN apt-get install python3-pip -y
RUN apt-get install python3-full -y
# RUN python -m ensurepip --upgrade

WORKDIR /app

# make folders
RUN mkdir build

#create a defualt venv
# RUN python -m venv Volume/Environments/default

# copy in the data
# COPY example.com.* ./
# COPY Volume/Models/Helper.py Volume/Models
COPY requirements.txt .
# copy packages
COPY package* ./
RUN npm install

# Must Build FrontEnd before running dockerfile
#ADD FrontEnd/dist FrontEnd/dist
ADD build build

# copy Back end
COPY *.js ./
COPY *.py ./
COPY config.json ./


EXPOSE 7377

CMD [ "npm","run","dev"]