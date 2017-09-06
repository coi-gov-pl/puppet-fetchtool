# Default download method for fetchtool
define fetchtool::internal::wget(
  $filename,
  $fetch_dir,
  $mode,
  $owner,
  $group,
  $address      = $name,
  $timeout      = 900,
  $install_wget = true,
  )
{
  include fetchtool::settings

  if $filename == undef {
    $base = basename($address)
    $targetfile = $base
  } else {
    $targetfile = $filename
  }
  $dest = "${fetch_dir}/${targetfile}"

  validate_string($dest)
  validate_re($dest, '^.+$')

  case $address {
    /^(?:http|https|ftp|sftp|ftps):/ : {
      if ! defined(Package['wget']) and $install_wget {
        ensure_packages(['wget'])
        Package['wget'] -> Exec["wget-${name}"]
      }

      if ! defined(Group[$group]) {
        ensure_resource('group', $group, {
          ensure => 'present',
        })
      }

      if ! defined(User[$owner]) {
        ensure_resource('user', $owner, {
          ensure => 'present',
          gid    => $group,
        })
      }

      exec { "wget-${name}":
        command   => "wget -q '${address}' -O '${dest}' && chmod ${mode} '${dest}' && chown ${owner}:${group} '${dest}'",
        logoutput => 'on_failure',
        path      => $::path,
        creates   => $dest,
        timeout   => $timeout,
        require   => [
          Group[$group],
          User[$owner],
        ],
      }
    }
    default : {
      file { $dest:
        alias  => "copy-${name}",
        mode   => $mode,
        owner  => $owner,
        group  => $group,
        source => $address,
      }
    }
  }
}
