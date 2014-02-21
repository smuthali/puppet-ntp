# Puppet module for NTP
# The ntp server can be customized via a parameter
# The NTP config file will be present as an .erb

# = Class: ntp
#
# Author: Satish Muthali <satish.muthali@gmail.com>
 class puppet-ntp ( $ntp_server_addr = [] ) {
    notice("The value is: '${ntp_server_addr}'")
    case $operatingsystem {
        centos, ubuntu, redhat, debian: {
            package {
                'ntp':
                    ensure => latest,
                    }
        }
        default: {
            # Noop
        }
    }

     # Source the NTP configuration file
     file {
         '/etc/ntp.conf':
             ensure  => file,
             content => template ('puppet-ntp/ntp.conf.erb'),
             owner   => 'root',
             group   => 'root',
             mode    => '0644',
             notify  => Service['ntp'];
         }

     # NTP service block
     service {
         'ntp':
             ensure      => running,
             enable      => true,
             hasrestart  => true,
             hasstatus   => true,
             require     => [ Package['ntp'], File['/etc/ntp.conf'] ];
     }

    }
