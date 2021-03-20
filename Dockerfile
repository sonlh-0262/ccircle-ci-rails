FROM ruby:2.6.6-slim-buster

ARG gid
ARG uid

RUN apt-get update && \
    apt-get install -y --no-install-recommends curl apt-transport-https build-essential && \
    curl -sL https://deb.nodesource.com/setup_12.x | bash - && \
    curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
    git \
    nodejs \
    yarn \
    libssl-dev \
    vim \
    default-libmysqlclient-dev \
    && \
    rm -rf /var/lib/apt/lists/*
RUN echo 'root:root' | chpasswd
EXPOSE 3000
RUN mkdir /home/userapp
RUN mkdir /home/userapp/app
WORKDIR /home/userapp/app
COPY . /home/userapp/app

RUN groupadd -g ${gid} groupapp
RUN useradd -l -u ${uid} -g ${gid} userapp
RUN chown -R userapp:groupapp /home/userapp
USER userapp

RUN gem install bundler -v 2.1.4

# RUN chmod +x entrypoint.sh
# ENTRYPOINT ["./entrypoint.sh"]
RUN bundle install
