#!/bin/bash
cd /opt
git clone https://github.com/artmur1/shvirtd-example-python
docker compose -f /opt/shvirtd-example-python/compose.yaml up -d
echo "The project has been launched.";
