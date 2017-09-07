# COI-fetchtool Puppet module

Allow to fetch files, in chosen by user way. By default it will utulize WGET to download files.
To change the way of downloading an artifact, one should change setting - `fetchtool::settings::fetch_tool`, to use some other definition.

## Simple example usage of fetchtool module

```puppet
# Will download file to /usr/src/eicar.com
fetchtool::download { 'http://www.eicar.org/download/eicar.com': }
```

## More complex example of fetchtool module

```puppet
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
```
