FROM  cyberdojofoundation/ubuntu-build-essential:17.04
LABEL maintainer=jon@jaggersoft.com

RUN apt-get update
RUN apt-get install --yes erlang

RUN erl -eval 'erlang:display(erlang:system_info(otp_release)), halt().' -noshell | grep -q 19