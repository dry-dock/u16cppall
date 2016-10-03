FROM drydock/u16all:{{%TAG%}}

ADD . /u16cppall

RUN /u16cppall/install.sh
