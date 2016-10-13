##!bash

    apt-get -y install curl && \
    curl -sL https://deb.nodesource.com/setup_4.x | bash - && \
    apt-get -y install nodejs git bzip2 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*


npm install -g gulp bower


npm install && bower install --allow-root --config.interactive=false -s



