#!/bin/sh

echo "************ Starting to Install custom plugins ************"
## For each custom plugin
## cd /usr/local/custom/kong/plugins/<plugin_name>
## luarocks make

cd /usr/local/custom/kong/plugins/auth-middleware
luarocks make

echo "************ Done Installing custom plugins ************"
