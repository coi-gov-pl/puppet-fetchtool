# Default download method for fetchtool
define fetchtool::internal::wget (
  $filename,
  $fetch_dir,
  $mode,
  $owner,
  $group,
  )
{
  if !defined(Package['wget']) {
  ensure_packages(['wget'])
  }

  if !defined(Group[$group]) {
    ensure_resource('group', $group, {
      ensure => 'present',
    })
  }

  if !defined(User[$owner]) {
    ensure_resource('user', $owner, {
      ensure => 'present',
      gid    => $group,
    })
  }
  exec{"wget -q '${name}${filename}' -P '${fetch_dir}' && chmod ${mode} '${fetch_dir}' && chown ${owner}:${group} '${fetch_dir}'":
    path      => '/usr/bin:/usr/sbin:/bin:/usr/local/bin:/opt/local/bin',
    timeout   => 60,
    require   => Package['wget'],
    logoutput => 'on_failure',
    onlyif    => "test ! -e ${fetch_dir}/${filename}"
  }
}
