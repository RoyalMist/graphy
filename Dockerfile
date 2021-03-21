FROM alpine:3.13 as app
COPY ./target /app
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
EXPOSE 4000
ENTRYPOINT ["/app/bin/graphy"]
CMD ["start"]