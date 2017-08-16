fetchtool::download { 'flyway-commandline-4.2.0-linux-x64.tar.gz':
  fetch_dir => '/usr/src',
  mode      => '0660',
  owner     => 'flyway',
  group     => 'flyway',
  address   => 'https://repo1.maven.org/maven2/org/flywaydb/flyway-commandline/4.2.0/'
}
