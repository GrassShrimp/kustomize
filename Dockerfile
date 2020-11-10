FROM alpine AS base

ENV VERSION=v3.8.6

RUN apk update && \
    apk add curl && \
    curl -LJO kustomize_${VERSION}_linux_amd64.tar.gz https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2F${VERSION}/kustomize_${VERSION}_linux_amd64.tar.gz | tar zxvf - -C /usr/local/bin/

FROM alpine
COPY --from=base /usr/local/bin/kustomize /usr/local/bin/kustomize

ENTRYPOINT [ "kustomize" ]