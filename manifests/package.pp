# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include kexectools::package
class kexectools::package(
  ### START Package Configuration ###
  $package_ensure           = $kexectools::package_ensure,
  $package_source           = $kexectools::package_source,
  $package_flavor           = $kexectools::package_flavor,
  $manage_repo              = $kexectools::manage_repo,
  $repo_release             = $kexectools::repo_release,
  $passenger_package_ensure = $kexectools::passenger_package_ensure,
  $repo_source              = $kexectools::repo_source,
  ### END Package Configuration ###
)inherits kexectools {
  assert_private()
  package { $package_name:
    ensure => $package_ensure,
    flavor => $package_flavor,
    source => $package_source,
  }
}
