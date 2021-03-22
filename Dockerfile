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
COPY --chown=nobody:nobody ./target .
USER nobody:nobody
EXPOSE 4000
# ENTRYPOINT ["bin/graphy"]
# CMD ["start"]
ENTRYPOINT ["tail"]
CMD ["-f","/dev/null"]