FROM mcr.microsoft.com/devcontainers/java:21-bookworm

# install taplo
RUN curl -fsSL https://github.com/tamasfe/taplo/releases/latest/download/taplo-linux-aarch64.gz \
  | gzip -d - | install -m 755 /dev/stdin /usr/local/bin/taplo

# install uv
COPY --from=ghcr.io/astral-sh/uv:latest /uv /bin/uv
ENV UV_LINK_MODE=copy

CMD ["sleep", "infinity"]

# user 'vscode' is already created by the base image