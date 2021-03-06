FROM alpine:latest

RUN apk add -U make
# dependencies for texlive
RUN apk add -U --repository http://dl-3.alpinelinux.org/alpine/edge/main \
    poppler harfbuzz-icu
# zziplib (found in edge/community repository) is a dependency to texlive-luatex
RUN apk add -U --repository http://dl-3.alpinelinux.org/alpine/edge/community \
    zziplib
RUN apk add -U --repository http://dl-3.alpinelinux.org/alpine/edge/testing \
    texlive-full

RUN ln -s /usr/bin/mktexlsr /usr/bin/mktexlsr.pl
RUN addgroup -S alplatex && adduser -S alplatex -G alplatex

CMD ["su", "-", "alplatex", "-c", "/bin/bash"]
