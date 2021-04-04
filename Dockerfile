FROM ruby:2.7.1
RUN apt-get update -qq && apt-get install -y nodejs 
WORKDIR /ms-navigation-submodule
COPY Gemfile /ms-navigation-submodule/Gemfile
COPY Gemfile.lock /ms-navigation-submodule/Gemfile.lock
RUN bundle install
COPY . /ms-navigation-submodule


COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000


CMD ["rails", "server", "-b", "0.0.0.0"]