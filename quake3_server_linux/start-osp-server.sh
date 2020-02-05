#!/bin/sh
# start-osp-server.sh -- start a Quake 3 OSP server


### Settings -- adapt to your machine

ip="ip_of_your_server"        # The IP address of your server, e.g., "123.45.67.89"
port="port_of_your_server"    # The port that the Quake server should listen on. If you run several servers (e.g., for different mods) every instance needs a unique port. Example: "27960"
name="q3a-osp"                # Freeform name of the server to identify it. If you only run one OSP server, the name should fit pretty well. No spaces or special chars please.

### No need to change stuff below

apptag="[START_OSP_SRV]"

echo "$apptag INFO: Running server $name on $ip : $port"

q3_basepath="/usr/local/games/quake3"

# Some sanity checks
if [ ! -d "${q3_basepath}" ]; then
    echo "$apptag ERROR: Quake 3 basepath directory '${q3_basepath}' does not exist."
fi

screen -A -m -d -S $name "${q3_basepath}/q3ded" +set sv_punkbuster 1 +set fs_basepath "${q3_basepath}" +set fs_game osp +set dedicated 1 +set com_hunkMegs 32 +set net_ip $ip +set net_port $port +set g_log $name.log +exec q3ded-osp-ffa.cfg
