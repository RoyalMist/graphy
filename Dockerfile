FROM alpine:3.13 as app
COPY release.tar .
ENV TIMEZONE "Europe/Zurich"
ENV SECRET_KEY "{secret_key}"
ENV APP_NAME = "graphy"
RUN apk update && \
    apk upgrade && \
    apk add --no-cache \
    ncurses-libs \
    tzdata && \
    cp /usr/share/zoneinfo/${TIMEZONE} /etc/localtime && \
    echo "${TIMEZONE}" > /etc/timezone && \
    tar -xf release.tar -C /opt && \
    rm release.tar && \
    mv /opt/release /opt/${APP_NAME} && \
    chown -R nobody:nobody /opt/${APP_NAME}
USER nobody:nobody
EXPOSE 4000
ENTRYPOINT /opt/${APP_NAME}/bin/graphy
CMD start