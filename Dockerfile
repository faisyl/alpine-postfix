FROM faisyl/alpine-runit:3.8

RUN apk --update add postfix ca-certificates
COPY postfix.runit /etc/service/postfix/run
COPY mklinks.sh /etc/runit_init.d
RUN chmod a+x /etc/runit_init.d/*


