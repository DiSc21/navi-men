#FROM ubuntu:24.04
FROM python:3.12

# install basic libraries
RUN apt-get update && apt-get install -y
RUN apt-get install -y --no-install-recommends --fix-missing vim make curl gnupg2 wget lsb-release software-properties-common
RUN apt-get install -y --no-install-recommends --fix-missing git
RUN apt-get install -y --no-install-recommends --fix-missing doxygen
RUN apt-get install -y --no-install-recommends --fix-missing gawk

# install external commands dependencies
RUN apt-get install -y --no-install-recommends --fix-missing boxes lolcat

# install ruby (needed for gem to install bashcov) and bashcov
RUN apt-get install -y --no-install-recommends --fix-missing ruby
RUN gem install bashcov
RUN gem install simplecov
RUN gem install simplecov-cobertura
RUN apt-get install -y --no-install-recommends --fix-missing bats bats-assert bats-file bats-support
RUN apt-get install -y --no-install-recommends --fix-missing parallel
RUN apt-get install -y --no-install-recommends --fix-missing shellcheck xmlstarlet
RUN apt-get install -y --no-install-recommends --fix-missing expect-dev
RUN apt-get install -y --no-install-recommends --fix-missing highlight

# install ansi2html
RUN /bin/bash -c "mkdir -p /git_repos/ansi2html \
  && cd /git_repos/ansi2html \
  && curl -O https://raw.githubusercontent.com/pixelb/scripts/refs/heads/master/scripts/ansi2html.sh \
  && PATH=$PATH:/git_repos/ansi2html"

# install bash doxygen
RUN /bin/bash -c "mkdir -p /git_repos/bash_doxygen_filter \
  && cd /git_repos/bash_doxygen_filter \
  && git clone https://github.com/Anvil/bash-doxygen.git . \
  && PATH=$PATH:/git_repos/bash_doxygen_filter"

# install zsdoc
RUN apt-get install -y --no-install-recommends --fix-missing zsh tree
RUN /bin/bash -c "mkdir -p /git_repos/zsdoc \
  && cd /git_repos/zsdoc \
  && git clone https://github.com/z-shell/zsdoc.git . \
  && make \
  && make install "

RUN chmod -R 777 /git_repos/ansi2html
RUN chmod -R 777 /git_repos/zsdoc
RUN chmod -R 777 /git_repos/bash_doxygen_filter

RUN gem install asciidoctor
RUN apt-get install -y --no-install-recommends --fix-missing xmlstarlet pandoc
RUN apt-get install -y --no-install-recommends --fix-missing colorized-logs

RUN apt-get install -y --no-install-recommends --fix-missing pip
RUN apt-get install -y --no-install-recommends --fix-missing python3-pip
RUN apt-get install -y --no-install-recommends --fix-missing python3-setuptools

RUN pip3 install --no-cache-dir --upgrade pip
RUN pip3 install --no-cache-dir --break-system-packages termgraph

## install junit2html
#RUN /bin/bash -c "mkdir -p /git_repos/junit2html \
#  && cd /git_repos/junit2html \
#  && git clone https://github.com/inorton/junit2html.git . \
#  && python3 setup.py install \
#  && PATH=$PATH:/git_repos/junit2html"

# # install cppcheck
# RUN /bin/bash -c "mkdir -p /git_repos/cppcheck \
#   && cd /git_repos/cppcheck \
#   && git clone https://github.com/danmar/cppcheck.git . \
#   && PATH=$PATH:/git_repos/cppcheck"

RUN apt-get install -y --no-install-recommends --fix-missing cppcheck
# set timezone
ENV TZ=Europe/Berlin
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update && apt-get install -y --fix-missing tzdata

# add (temporary?) json parser external commands dependencies
RUN apt-get install -y --no-install-recommends --fix-missing jq

CMD ["mkdir", "/ws/"]
WORKDIR /ws/
