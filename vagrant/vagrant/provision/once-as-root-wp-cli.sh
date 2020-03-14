#!/usr/bin/env bash
curl -sSL https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -o /tmp/wp-cli.phar
mv /tmp/wp-cli.phar /usr/local/bin/wp
chmod +x /usr/local/bin/wp