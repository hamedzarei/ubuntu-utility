#!/usr/bin/env bash

RED='\033[0;31m'
NC='\033[0m'
#printf "${RED} You must have curl as requirements!${NC}\n"
./check_package.sh curl
#exit 1
get_latest_release() {
  curl --silent "https://api.github.com/repos/$1/releases/latest" | # Get latest release from GitHub api
    grep '"tag_name":' |                                            # Get tag line
    sed -E 's/.*"([^"]+)".*/\1/'                                    # Pluck JSON value
}

latest=$(get_latest_release docker/compose)

sudo curl -L "https://github.com/docker/compose/releases/download/$latest/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

sudo curl -L https://raw.githubusercontent.com/docker/compose/$latest/contrib/completion/bash/docker-compose -o /etc/bash_completion.d/docker-compose

docker-compose --version