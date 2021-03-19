FROM ruby:2.6.6-slim-buster 

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
    default-libmysqlclient-dev \
    && \
    rm -rf /var/lib/apt/lists/* 
  
RUN gem install bundler -v 2.1.4
RUN mkdir /app 
WORKDIR /app 
COPY . /app

COPY entrypoint.sh /usr/bin/ 
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

  