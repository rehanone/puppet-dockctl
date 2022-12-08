class dockctl::config () inherits dockctl {
  assert_private("Use of private class ${name} by ${caller_module_name}")

  if $dockctl::manage {
    file { $dockctl::home_directory:
      ensure => directory,
      path   => $dockctl::home_directory,
      owner  => 'root',
      group  => 'root',
    }
  }
}
