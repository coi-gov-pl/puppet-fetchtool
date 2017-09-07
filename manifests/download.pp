# A wrapper to download files
define fetchtool::download (
    $address    = $name,
    $fetch_dir  = '/usr/src',
    $filename   = undef,
    $mode       = '0640',
    $owner      = undef,
    $group      = undef,
    $fetch_tool = undef,
    $attributes = {},
  ) {

    include fetchtool::settings
    $actual_owner = $owner ? {
      undef   => $fetchtool::settings::user,
      default => $owner
    }
    $actual_group = $group ? {
      undef   => $fetchtool::settings::group,
      default => $group
    }
    $actual_fetch_tool = $fetch_tool ? {
      undef   => $fetchtool::settings::fetch_tool,
      default => $fetch_tool,
    }

    validate_string($address)

    $all_attrs = {
      $address => merge($attributes, {
        'filename'  => $filename,
        'fetch_dir' => $fetch_dir,
        'mode'      => $mode,
        'owner'     => $actual_owner,
        'group'     => $actual_group,
      })
    }

    create_resources($actual_fetch_tool, $all_attrs)
  }
