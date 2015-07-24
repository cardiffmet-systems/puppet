class windows_x64 {

  include nagios::export
  include 'nsclient'

  class { 'winsnmp':
  communities => ['allegro'],
  contact     => 'systems@cardiffmet.ac.uk',
  location    => 'Virtual',
  services    => 73,
  }

  windowsfeature { 'NET-Framework-Core': }
  windowsfeature { 'SNMP-Services': }
}

class windows_x86 {

  include nagios::export

  class {'nsclient': 
    package_source_location => 'http://files.nsclient.org/released/',
    package_name            => 'NSClient++ (Win32)',
    package_source          => 'NSCP-0.4.3.131-Win32.msi',
    download_destination    => "c:\\temp",
    config_template         => 'nsclient/nsclientmb.ini.erb',

  }

  class { 'winsnmp':
    communities => ['allegro'],
    contact     => 'systems@cardiffmet.ac.uk',
    location    => 'Virtual',
    services    => 73,
  }

}

node 'puppetclient.internal.uwic.ac.uk' {

#  hiera_include('classes')

#  include nagios::target
  include nagios::export
#  include '::mysql::server'


  class { '::mysql::server':
  root_password           => 'strongpassword',
  remove_default_accounts => true,
  override_options        => $override_options
  }

  mysql::db { 'mydb':
  user     => 'myuser',
  password => 'mypass',
  host     => 'localhost',
  grant    => ['SELECT', 'UPDATE'],
  }

  class { 'moodle':}


}

node 'ENDPOINT01.internal.uwic.ac.uk' {

  include nagios::export

}



node 'BILIVE01.internal.uwic.ac.uk' {

  class { 'windows_x64': }
}



node 'CAREERHUBWEB01.internal.uwic.ac.uk' {

  class { 'windows_x64': }
}


node 'CAREERHUBDB01.internal.uwic.ac.uk' {

  class { 'windows_x64': }

}

node 'cpiwmc01.internal.uwic.ac.uk' {

  include nagios::export
  include 'nsclient'
}


node 'cprps01.internal.uwic.ac.uk' {

  include nagios::export
  include 'nsclient'
}

node 'cpsql01.internal.uwic.ac.uk' {

  class { 'windows_x64': }

}


node 'cpuniflow01.internal.uwic.ac.uk' {

  class { 'windows_x64': }

}



node 'dcllcsm01.internal.uwic.ac.uk' {

  class { 'windows_x64': }

}

node 'dcllcsm02.internal.uwic.ac.uk' {

 include nagios::export::physical 

}


node 'dirsync.internal.uwic.ac.uk' {

  class { 'windows_x64': }

}

node 'helpdesk02.internal.uwic.ac.uk' {

  class { 'windows_x64': }

}


node 'usssql02.internal.uwic.ac.uk' {

  include nagios::export

}

node 'llprint01.internal.uwic.ac.uk' {

  class { 'windows_x64': }
}

node 'catering01.internal.uwic.ac.uk' {

  class { 'windows_x64': }
}


node 'cyprint01.internal.uwic.ac.uk' {

  class { 'windows_x64': }
}


node 'connect2app01.internal.uwic.ac.uk' {
  include 'nsclient'
  include nagios::export

#  class { 'nsclient':
#    allowed_hosts => ['192.168.110.94'],
#  }

}

node 'connect2db01.internal.uwic.ac.uk' {

class { 'windows_x64': }
}

node 'cisdotnetdev04.internal.uwic.ac.uk' {


  class { 'windows_x64': }

}

node 'lemss.internal.uwic.ac.uk' {
  include nagios::export

   class { 'winsnmp':
    communities => ['allegro'],
    contact     => 'systems@cardiffmet.ac.uk',
    location    => 'Virtual',
    services    => 73,
  }

}


node 'librepos.internal.uwic.ac.uk' {
  include 'nsclient'
  include nagios::export

   class { 'winsnmp':
    communities => ['allegro'],
    contact     => 'systems@cardiffmet.ac.uk',
    location    => 'Virtual',
    services    => 73,
  }

}


node 'mcgw01.internal.uwic.ac.uk' {


  class { 'windows_x64': }

}

node 'SHIBIDP.internal.uwic.ac.uk' {


  class { 'windows_x64': }

}

node 'TELMAN01.internal.uwic.ac.uk' {

}

node 'TESTO.internal.uwic.ac.uk' {

}


node 'XIBO.internal.uwic.ac.uk' {

  class { 'windows_x64': }
}


node 'XIBO01.internal.uwic.ac.uk' {

  class { 'windows_x64': }
}


node 'cisdotnetdev01.internal.uwic.ac.uk'{

  class { 'winsnmp':
    communities => ['allegro'],
    contact     => 'systems@cardiffmet.ac.uk',
    location    => 'Virtual',
    services    => 73,
  }

}

node 'puppet2012' {

  class {'windows_sql':
    features            => 'SQL,RS_SHP,RS_SHPWFE,TOOLS',
    pid                 => '748RB-X4T6B-MRM7V-RTVFF-CHC8H',
    sqlsysadminaccounts => 'Administrator',
#   agtsvcaccount       => 'Administrator',
    agtsvcaccount  => 'SQLAGTSVC',
    agtsvcpassword => 'sqlagtsvc2008demo',
    isopath             => 'C:\\SW_DVD9_SQL_Svr_Enterprise_Edtn_2012_English_MLF_X17-96957.iso',
#   sqlsvcaccount       => 'Administrator',
    sqlsvcaccount  => 'SQLSVC',
    sqlsvcpassword => 'sqlsvc2008demo',
    securitymode        => 'sql',
    sapwd               => 'MySup3rGre@tp@ssw0rDO3nOT',
    mode                => 'master',
    sqlpath	      => 'c:\sql',
    instancedir	      => 'c:\sql',
  }

}


node 'nagios.internal.uwic.ac.uk' {
  include nagios
#  include nagios::monitor
}

node 'bbdevcolab.internal.uwic.ac.uk' {

  include nagios::export

}

node 'dspace.internal.uwic.ac.uk' {

  include nagios::export

}



node 'bitest01.internal.uwic.ac.uk' {

  include nagios::export

}


node 'puppetwin'{


  hiera_include('classes')  
}

node 'devlearn02.internal.uwic.ac.uk'{

  service {"firewalld":
    ensure => "stopped",
  }


  package {"ntp":
    ensure => 'installed',
  }


  service {"ntpd":
    ensure => "running",
  }


  service {"httpd":
    ensure => "running",
  }

  file { '/tmp/eureka.txt':
    ensure => present,
  }->
    file_line { 'Append a line to /tmp/eureka.txt':
    path => '/tmp/eureka.txt',  
    line => 'Hello World',
  }->
    file_line { 'Append a 2nd line to /tmp/eureka.txt':
    path => '/tmp/eureka.txt',
    line => 'Hello World 2',
  }


  file { '/etc/ntp.conf':
    ensure => present,
  }->
    file_line { 'Append a line to /etc/ntp.conf ':
    path => '/etc/ntp.conf',
    line => 'tinker panic 0',
  }->
    file_line { 'Append a 2nd line to /etc/ntp.conf ':
    path => '/etc/ntp.conf',
    line => 'restrict 127.0.0.1',
  }->
  file_line { 'Append a 3rd line to /etc/ntp.conf ':
    path => '/etc/ntp.conf',
    line => 'restrict default kod nomodify notrap',
  }->
  file_line { 'Append a 4th line to /etc/ntp.conf ':
    path => '/etc/ntp.conf',
    line => 'server dcll01.internal.uwic.ac.uk',
  }->
  file_line { 'Append a 5th line to /etc/ntp.conf ':
    path => '/etc/ntp.conf',
    line => 'server dcll02.internal.uwic.ac.uk',
  }->
  file_line { 'Append a 6th line to /etc/ntp.conf ':
    path => '/etc/ntp.conf',
    line => 'driftfile /var/lib/ntp/drift',
  }->
  file_line { 'Append a line to /etc/ntp/step-tickers':
    path => '/etc/ntp/step-tickers',
    line => 'dcll01.internal.uwic.ac.uk',
  }->
  file_line { 'Append a 2nd line to /etc/ntp/step-tickers':
    path => '/etc/ntp/step-tickers',
    line => 'dcll02.internal.uwic.ac.uk',
  }


  file { "/MoodleData":
    ensure => "directory",
    owner  => "apache",
    group  => "apache",
    mode   => 755,
  }

  file { "/MySQL":
    ensure => "directory",
    group  => "mysql",
    mode   => 755,
  }

  # create a directory      
  file { "/MySQL/Data":
    ensure => "directory",
    group  => "mysql",
    mode   => 755,
  }

  file { "/MySQL/Logs":
    ensure => "directory",
    group  => "mysql",
    mode   => 755,
  }



  exec{'retrieve_moodle':
    command => "/usr/bin/wget -q http://downloads.sourceforge.net/project/moodle/Moodle/stable28/moodle-latest-28.tgz  -q /ztmp/moodle2.8/",
   # creates => "/tmp/moodle2.8/",
  }
}


class linux {

  $admintools = ['git','nano', 'screen']

  package { $admintools:
    ensure => 'installed',
  }

  $ntpservice = $osfamily ? {
    'redhat' => 'ntpd',
    'debian' => 'ntp',
    default => 'ntp',
  }

  package {'ntp':
    ensure => 'installed',
  }

  service {$ntpservice:
    ensure => 'running',
    enable => true,
  }


  file { '/info.txt':
    ensure  => 'present',
    content => inline_template("Create by Puppet at <%= Time.now %>\n"),
  }


}

