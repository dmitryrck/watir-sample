from ruby

env CHROMEDRIVER_VERSION=2.42 \
  GECKODRIVER_VERSION=v0.21.0 \
  FIREFOX_VERSION=62.0.2

run \
  wget -q -O- https://dl.google.com/linux/linux_signing_key.pub | apt-key add - && \
  echo "deb http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google.list && \
  apt-get update && \
  apt-get install -y google-chrome-stable libappindicator1 fonts-liberation \
    xvfb unzip \
    libdbus-glib-1-2 && \
  gem install --no-ri --no-rdoc rspec watir watir-rspec headless && \
  wget -q http://chromedriver.storage.googleapis.com/$CHROMEDRIVER_VERSION/chromedriver_linux64.zip && \
  unzip chromedriver_linux64.zip -d /usr/local/bin && \
  rm chromedriver_linux64.zip && \
  wget -q https://github.com/mozilla/geckodriver/releases/download/$GECKODRIVER_VERSION/geckodriver-$GECKODRIVER_VERSION-linux64.tar.gz -O- | tar xfz - -C /usr/local/bin && \
  wget -q https://download-installer.cdn.mozilla.net/pub/firefox/releases/$FIREFOX_VERSION/linux-x86_64/en-US/firefox-$FIREFOX_VERSION.tar.bz2 -O- | tar xfj - -C /opt && \
  ln -s /opt/firefox/firefox /usr/local/bin && \
  chmod +x /usr/local/bin/chromedriver /usr/local/bin/geckodriver
