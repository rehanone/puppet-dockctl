class dockctl::dependencies () inherits dockctl {
  assert_private("Use of private class ${name} by ${caller_module_name}")

  if $dockctl::git_manage {
    package { [$dockctl::git_package]:
      ensure => $dockctl::ensure,
    }
  }
}
