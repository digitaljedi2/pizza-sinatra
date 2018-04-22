FROM ubuntu:18.04

MAINTAINER digitaljedi2 "https://github.com/digitaljedi2"

# Install packages for building ruby
RUN apt-get update
RUN apt-get install -y --force-yes build-essential wget git rubygems ruby-dev ruby zlib1g-dev libssl-dev libreadline-dev libyaml-dev libxml2-dev libxslt-dev
RUN apt-get clean

RUN gem update --system
RUN gem install bundler 

RUN git clone https://github.com/digitaljedi2/pizza-sinatra /root/sinatra
RUN cd /root/sinatra; bundle install

EXPOSE 9876
CMD ["/usr/local/bin/foreman","start","-d","/root/sinatra"]
