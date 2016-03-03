#!/bin/bash

exec 1> >(logger -s -t $(basename $0)) 2>&1

# download Riak source
curl -O http://s3.amazonaws.com/downloads.basho.com/riak/$1/$2/riak-$2.tar.gz
tar zxvf riak-$2.tar.gz
rm riak-$2.tar.gz

cd riak-$2

# build Riak manually from source
make rel

ulimit -n

# start a single-node cluster
rel/riak/bin/riak start
rel/riak/bin/riak ping

# view the status of the node in the cluster
rel/riak/bin/riak-admin member-status

# create a $3-node cluster
make devrel DEVNODES=$3

cd dev

# configuring riak.conf settings
for node in dev*; do echo "storage_backend=leveldb" >> $node/etc/riak.conf; done >> ../../provision.log 2>&1

# start the nodes
for node in dev*; do $node/bin/riak start; done
for node in dev*; do $node/bin/riak ping; done

# stage the nodes to be joined
for node in $(seq 2 $3); do dev$node/bin/riak-admin cluster join dev1@127.0.0.1; done

# view the planned cluster changes
dev1/bin/riak-admin cluster plan

# commit the staged node joins to the cluster
dev2/bin/riak-admin cluster commit

# view the status of the nodes in the cluster
dev1/bin/riak-admin member-status
