#!/bin/bash
# Check if the file exists and is writable
if [ -f /etc/gitlab-runner/config.toml ]; then
  # Modify the config.toml to add Docker socket volume
  sed -i '/\[runners.docker\]/a volumes = ["/var/run/docker.sock:/var/run/docker.sock", "/cache"]' /etc/gitlab-runner/config.toml
fi

# Call the original entrypoint of the GitLab Runner container
exec /entrypoint "$@"
