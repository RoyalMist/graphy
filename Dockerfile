FROM alpine:3.13 as app
WORKDIR /app
ENV TIMEZONE "Europe/Zurich"
ENV SECRET_KEY "{secret_key}"
RUN apk update && \
    apk upgrade && \
    apk add --no-cache \
    ncurses-libs \
    tzdata && \
    cp /usr/share/zoneinfo/${TIMEZONE} /etc/localtime && \
    echo "${TIMEZONE}" > /etc/timezone && \
    chown nobody:nobody /app
USER nobody:nobody
COPY --chown=nobody:nobody ./target .
EXPOSE 4000
ENTRYPOINT ["bin/bazzile_api"]
CMD ["start"]