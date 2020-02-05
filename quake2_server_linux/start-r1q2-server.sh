#!/bin/sh
ip="CHANGEME"
port="27910"
name="r1q2"
q2dir="${HOME}/quake2/"

echo "Running server $name on $ip : $port"

cd $q2dir

q2bin="./r1q2ded-old"
if [ ! -x "${q2bin}" ]; then
    echo "ERROR: Quake 2 binary '${q2bin}' does not exist and/or is not executable."
fi

screen -A -m -d -S $name "${q2bin}" +set dedicated 1 +set ip $ip +set port $port +exec q2srv.cfg +exec r1q2srv.cfg +map q2dm1 &
