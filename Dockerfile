FROM alpine:3.13 as app
WORKDIR /app
COPY --chown=nobody:nobody release.tar .
ENV TIMEZONE "Europe/Zurich"
ENV SECRET_KEY "{secret_key}"
RUN apk update && \
    apk upgrade && \
    apk add --no-cache \
    ncurses-libs \
    tzdata && \
    cp /usr/share/zoneinfo/${TIMEZONE} /etc/localtime && \
    echo "${TIMEZONE}" > /etc/timezone && \
    tar -xf release.tar
USER nobody:nobody
EXPOSE 4000
# ENTRYPOINT ["bin/graphy"]
# CMD ["start"]
CMD tail -f /dev/null