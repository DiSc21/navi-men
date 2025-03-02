FROM ubuntu:24.04

# install basic libraries
RUN apt-get update && apt-get install -y
RUN apt-get install -y --no-install-recommends --fix-missing vim make curl gnupg2 wget lsb-release software-properties-common
RUN apt-get install -y --no-install-recommends --fix-missing git
RUN apt-get install -y --no-install-recommends --fix-missing doxygen

# install external commands dependencies
RUN apt-get install -y --no-install-recommends --fix-missing boxes lolcat

# install ruby (needed for gem to install bashcov) and bashcov
RUN apt-get install -y --no-install-recommends --fix-missing ruby
RUN gem install bashcov
RUN apt-get install -y --no-install-recommends --fix-missing bats bats-assert bats-file bats-support

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

# set timezone
ENV TZ=Europe/Berlin
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update && apt-get install -y --fix-missing tzdata

# add (temporary?) json parser external commands dependencies
RUN apt-get install -y --no-install-recommends --fix-missing jq

CMD ["mkdir", "/ws/"]
WORKDIR /ws/
