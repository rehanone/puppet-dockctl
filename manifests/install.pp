class dockctl::install () inherits dockctl {

  assert_private("Use of private class ${name} by ${caller_module_name}")

  $link_ensure = $dockctl::ensure ? {
    'present' => link,
    default   => $dockctl::ensure,
  }

  if $dockctl::manage {
    vcsrepo { $dockctl::install_directory:
      ensure   => $dockctl::repo_ensure,
      provider => git,
      source   => $dockctl::repo_source,
      revision => $dockctl::repo_revision,
      require  => Package['git'],
    }
    -> file { '/usr/local/bin/dockctl':
      ensure => $link_ensure,
      target => "${dockctl::install_directory}/dockctl",
    }
  }
}
