FROM ruby:2.6
WORKDIR /discord-bot
RUN gem install qwtf_discord_bot
RUN git clone https://github.com/FortressOne/qstat.git
RUN cd qstat \
      && ./autogen.sh \
      && ./configure \
      && make install
ENTRYPOINT ["qwtf_discord_bot"]
