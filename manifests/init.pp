# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include kexectools
class kexectools(
  ### START Package Configuration ###
  $package_ensure                        = $kexectools::params::package_ensure,
  $package_name                          = $kexectools::params::package_name,
  $package_source                        = $kexectools::params::package_source,
  Boolean $manage_repo                   = $kexectools::params::manage_repo,
  Optional[String] $repo_release         = $kexectools::params::repo_release,
  Optional[Stdlib::HTTPUrl] $repo_source = $kexectools::params::repo_source,
  ### END Package Configuration ###

  ### START Service Configuation ###
  $service_ensure                        = $kexectools::params::service_ensure,
  $service_enable                        = $kexectools::params::service_enable,
  $service_restart                       = $kexectools::params::service_restart,
  $service_name                          = $kexectools::params::service_name,
  $service_manage                        = $kexectools::params::service_manage,
  ### END Service Configuration ###
)inherits kexectools::params {

  contain kexectools::package
  contain kexectools::config
  contain kexectools::service

  Class['kexectools::package'] -> Class['kexectools::config'] ~> Class['kexectools::service']
  Class['kexectools::package'] ~> Class['kexectools::service']
}
