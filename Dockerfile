FROM adoptopenjdk/openjdk11:alpine-slim

ENV VERSION=5.6.0

RUN apk add --no-cache --update \
    curl \
    openjdk11-jre \
    fontconfig \
    ttf-dejavu \
    && curl https://s3.amazonaws.com/downloads.eviware/soapuios/${VERSION}/SoapUI-x64-${VERSION}.sh -o /tmp/SoapUI-x64-${VERSION}.sh \
    && chmod +x /tmp/SoapUI-x64-${VERSION}.sh \
    && echo -e 'o\n\nX\nn\nn\n\nn\nn\n' | /tmp/SoapUI-x64-${VERSION}.sh \
    && rm -r /tmp/* \
    && ln -s /opt/SmartBear/SoapUI-${VERSION} /opt/SoapUI \
    && rm /opt/SoapUI/lib/xmlbeans-xpath-2.6.0.jar

WORKDIR /opt/SoapUI/bin

ENTRYPOINT ["testrunner.sh"]
