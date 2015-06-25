# vagrant-build-riak
A script-supported Vagrantfile, to work with [Vagrant](http://vagrantup.com) that builds [Riak KV](http://basho.com/riak/) from source.

## About this 
This project goes through the effort of downloading and building Riak from source, including its pre-requisites. This is **not** designed to be a quick provisioning effort. There are other Vagrantfiles in Basho Labs that provision from [Packagecloud.io](packagecloud.io/basho/riak), which will be much faster. This process is all about learning.


By default, upon `vagrant up`, you have: 
* A `1` Riak node running on one VM
* HTTP interface available on `http://localhost:27018`
* Protobuff interface available on `http://localhost:27017`
* It will take around 10 minutes to provision

These parameters are all customizeable within the `Vagrantfile` provided. 

## Getting Started

Simple clone this repo, `cd` in and `vagrant up`.

## How it works

TODO


### What to do next

* `vagrant ssh` in and familiar yourself with the `riak` and `riak-admin` commands
* `vagrant ssh` in and play around


### What if I mess up?

The beauty of Vagrant is that re-building is simple. At the command line of your host system (not the VM) you can force a reprovision: 

```
vagrant destroy -f && vagrant up
```

This will delete everything -- including your data stored in Riak -- and build from source.

## Contributing

**TODO** - note that projects that extend on this repository will be linked to in the [vagrant-riak-meta](https://github.com/basho-labs/vagrant-riak-meta). Share them via issues on [the Community repo](https://github.com/basho-labs/the-riak-community)!


## License and Authors

* [Danny Lau](https://github.com/dannylauca)
* [Matt Brender](https://github.com/mjbrender)

Copyright (c) 2015 Basho Technologies, Inc.

Licensed under the Apache License, Version 2.0 (the "License"); you may
not use this file except in compliance with the License. You may obtain
a copy of the License at

[http://www.apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0)

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
implied.

See the License for the specific language governing permissions and
limitations under the License.

