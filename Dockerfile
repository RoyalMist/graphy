FROM alpine:3.13 as app
COPY app.tar .
ENV TIMEZONE "Europe/Zurich"
ENV SECRET_KEY "{secret_key}"
RUN apk update && \
    apk upgrade && \
    apk add --no-cache \
    ncurses-libs \
    tzdata && \
    cp /usr/share/zoneinfo/${TIMEZONE} /etc/localtime && \
    echo "${TIMEZONE}" > /etc/timezone && \
    tar -xf app.tar && rm app.tar && \
    chown -R nobody:nobody /app
USER nobody:nobody
EXPOSE 4000
# ENTRYPOINT ["bin/graphy"]
# CMD ["start"]
CMD tail -f /dev/null