# Author::    Paul Stack  (mailto:pstack@opentable.com)
# Copyright:: Copyright (c) 2013 OpenTable Inc
# License::   MIT

# == Class nsclient::params
#
# This privaye class is meant to be called from `nsclient`
# It sets variables according to platform
#
class nsclient::params {
  $allowed_hosts           = []
  $service_state           = 'running'
  $service_enable          = true
  $package_source_location = 'http://files.nsclient.org/released/'
  $package_name            = 'NSClient++ (x64)'
  $package_source          = 'NSCP-0.4.3.131-x64.msi'
  $download_destination    = "c:\\temp"
  $config_template         = 'nsclient/nsclientmb.ini.erb'
}
