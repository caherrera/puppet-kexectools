# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include kexectools::params
class kexectools::params(
  ### START Package Configuration ###
  $package_ensure                        = present,
  $package_name                          = 'kexec-tools',
  $package_source                        = 'kexec-tools',
  $package_flavor                        = undef,
  $manage_repo                           = false,
  Boolean $mime_types_preserve_defaults  = false,
  Optional[String] $repo_release         = undef,
  $passenger_package_ensure              = 'present',
  Optional[Stdlib::HTTPUrl] $repo_source = undef,
  ### END Package Configuration ###

  ### START Service Configuation ###
  $service_ensure                        = running,
  $service_enable                        = true,
  $service_flags                         = undef,
  $service_restart                       = undef,
  $service_name                          = 'kexec',
  $service_manage                        = true,
  ### END Service Configuration ###
) {

  case $facts['os']['family'] {
    'redhat': {

    }
    'debian': {

    }
    'sles': {

    }
    default: {
      fail("os family not supported : '${facts['os']['family']}'")
    }
  }
}
