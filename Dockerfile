FROM alpine:3.6

# Install Python3 and Pip
RUN sed -i -e 's/dl-cdn/dl-4/' /etc/apk/repositories && \
    apk add --no-cache python3 && \
    python3 -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip3 install --upgrade pip setuptools && \
    if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi && \
    rm -r /root/.cache

# Set the working directory
WORKDIR /app

# Bundle app source
COPY . /app

# Modify permissions so we can run scripts
RUN chmod -R a+rwx /app

# Add jenkins group
RUN addgroup jenkins

# Add jenkins user
RUN adduser -S -G jenkins jenkins
USER jenkins
