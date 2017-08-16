# COI-fetchtool Puppet module

Allow to fetch files, in chosen by user way. Default way to download files is wget.
It is possible to change tool by change settings configuration - ```fetchtool::settings::fetch_tool```.

## Example usage of srptime module

```puppet
fetchtool::download { 'flyway-commandline-4.2.0-linux-x64.tar.gz':
  fetch_dir => '/usr/src',
  mode      => '0660',
  owner     => 'flyway',
  group     => 'flyway',
  address   => 'https://repo1.maven.org/maven2/org/flywaydb/flyway-commandline/4.2.0/'
}
```
