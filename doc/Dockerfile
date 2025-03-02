FROM python:3.11-alpine3.19 AS builder

ARG WITH_PLUGINS=true

WORKDIR /app

RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir --trusted-host \
      pypi.python.org \
      htmlark[gttp,parsers] \
      mkdocs \
      mkdocs-material \
      mkdocs-panzoom-plugin \
      mkdocs-simple-hooks \
      mkdocs-plugin-inline-svg \
      mkdocs-include-markdown-plugin \
      mkdocs-inline-select-svg-plugin

# expose port 81 for mkdocs html server
EXPOSE 81

COPY ["./mkdocs_templates/.", "."]
COPY ["./readme.md", "./docs/"]
COPY ["./build_coverage", "./docs/build_coverage"]
COPY ["./build_shellcheck", "./docs/build_shellcheck"]
COPY ["./build_zsdoc", "./docs/build_zsdoc"]

RUN python -m mkdocs build

CMD ["python", "-m", "mkdocs", "serve", "-a", "0.0.0.0:81"]

FROM nginx:alpine
COPY --from=builder /app/site/. /usr/share/nginx/html
