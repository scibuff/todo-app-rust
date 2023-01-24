FROM rust:alpine3.17

ARG HOMEDIR="/src"

# create the app folder
RUN mkdir -p ${HOMEDIR}

# set the app folder to be the work directory
WORKDIR ${HOMEDIR}

# copy the src folder to the homedir

COPY . ./