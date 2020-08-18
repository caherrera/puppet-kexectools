# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include kexectools::service
class kexectools::service(
  $service_restart = $kexectools::service_restart,
  $service_ensure  = $kexectools::service_ensure,
  $service_enable  = $kexectools::service_enable,
  $service_name    = $kexectools::service_name,
  $service_flags   = $kexectools::service_flags,
  $service_manage  = $kexectools::service_manage,
)inherits kexectools {
  assert_private()

  if $service_manage {
    case $facts['os']['name'] {
      'OpenBSD': {
        service { $service_name:
          ensure     => $service_ensure,
          enable     => $service_enable,
          flags      => $service_flags,
          hasstatus  => true,
          hasrestart => true,
        }
      }
      default: {
        service { $service_name:
          ensure     => $service_ensure,
          enable     => $service_enable,
          hasstatus  => true,
          hasrestart => true,
        }
      }
    }
  }

  # Allow overriding of 'restart' of Service resource; not used by default
  if $service_restart {
    Service[$service_name] {
      restart => $service_restart,
    }
  }
}
