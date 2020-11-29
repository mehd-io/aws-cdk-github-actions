FROM python:3.8-slim

# Configure apt and install packages
RUN apt-get update \
  && export DEBIAN_FRONTEND=noninteractive \
  #
  # Verify git, common tools / libs installed, add/modify non-root user, optionally install zsh
  && apt-get -y install --no-install-recommends curl ca-certificates 2>&1 

RUN curl -sL https://deb.nodesource.com/setup_14.x | bash - \
&& apt-get install -y nodejs && npm install -g aws-cdk

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
