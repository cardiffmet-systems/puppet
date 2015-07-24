class nagios::export {
  @@nagios_host { $::fqdn:
    use           => 'windows-server',
    address       => $::ipaddress,
#    check_command => 'check-host-alive!3000.0,80%!5000.0,100%!10',
    hostgroups    => 'windows-servers',
#    target        => "/usr/local/nagios/etc/objects/host_${::fqdn}.cfg"
    target        => "/usr/local/nagios/etc/objects/servers.cfg"
  }
}


class nagios::export::physical {
  @@nagios_host { $::fqdn:
    use           => 'windows-server',
    address       => $::ipaddress,
#    check_command => 'check-host-alive!3000.0,80%!5000.0,100%!10',
    hostgroups    => 'windows-servers,physical-windows-servers',
#    target        => "/usr/local/nagios/etc/objects/host_${::fqdn}.cfg"
    target        => "/usr/local/nagios/etc/objects/servers.cfg"
  }
}

