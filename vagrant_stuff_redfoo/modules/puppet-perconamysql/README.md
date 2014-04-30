NTP
===

Puppet-NTP module

#### Table of contents

1. [Overview] (#overview)
2. [Module Description - what the module essentially does] (#module description)
3. [Setup - getting started with NTP] (#setup)
    * [What files or packages NTP affects] (#What-does-NTP-affect)
4. [Usage - how to leverage the puppet NTP modules] (#usage)
5. [Limitations - OS compatibility] (#limitations)
6. [Future enhancements - additional functionality that will be added] (#enhancements)


## Overview

The NTP puppet module will go about installing, configuring and ultimately manage the NTP service

## Module Description

The NTP puppet module installs and configures NTP across Ubuntu/Debian/Red Hat/CentOS *nix flavors

## Setup

### What does NTP affect

* NTP packages (.deb or rpm)
* NTP configuration file (ntp.conf)
* Manipulating NTP service (stop and start)

## Usage
In site.pp it is sufficient to simply add `include '::ntp'` to load, install and configure NTP module. Parameters can also be passed to the NTP module by specifying which NTP clock sources to user. For example:
```puppet
class { '::ntp':
   ntp_server_addr => [ '0.pool.ntp.org', '1.pool.ntp.org', '2.pool.ntp.org' ],
   }
   ```
   
## Limitations

The NTP puppet module has been built on and test against Puppet 3.4.2 and has also been tested on Puppet 2.7.
The module has been tested on:

* RedHat Enterprise Linux 6
* Debian 6/7
* Ubuntu 12.04
* Centos 6

The NTP module has not been tested on Gentoo, SuSe or FreeBSD.

## Enhancements

Future enhancements will include:

* Testing on other flavors of *nix
* Creating private classes for more customization

Please report bugs to satish.muthaliATgmail.com
