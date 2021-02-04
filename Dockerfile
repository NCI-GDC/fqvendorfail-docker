FROM quay.io/ncigdc/bio-alpine:latest as build

RUN apk add make build-base zlib-dev

COPY ./fqvendorfail/ /opt

RUN cd /opt \
	&& rm -rf seqtk-1.3 \
	&& wget https://github.com/lh3/seqtk/archive/v1.3.tar.gz \
	&& ls /opt \
	&& tar xvf v1.3.tar.gz \
	&& ls /opt \
	&& make

FROM quay.io/ncigdc/bio-alpine

COPY --from=build /opt /opt

ENTRYPOINT ["/opt/fqvendorfail"]
