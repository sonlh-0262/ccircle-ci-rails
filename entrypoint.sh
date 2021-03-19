#!/bin/bash

rm -f /app/tmp/pids/server.pid 

bundle check || bundle install 

rails s -b 0.0.0.0
