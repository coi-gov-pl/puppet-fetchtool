$baseuri = 'https://repo1.maven.org/maven2/org/flywaydb/flyway-commandline/4.2.0'
$filename = 'flyway-commandline-4.2.0-linux-x64.tar.gz'

fetchtool::download { 'alias-for-flyway-4.2.0.tgz':
  address    => "${baseuri}/${filename}",
  mode       => '0660',
  owner      => 'flyway',
  group      => 'flyway',
  fetch_dir  => '/tmp',
  filename   => 'flyway-4.2.0.tgz',
  attributes => {
    # Additional attibutes to specific implementation - in this case WGET
    'timeout'      => 1200,
    'install_wget' => true,
  }
}
