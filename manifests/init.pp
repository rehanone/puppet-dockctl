# Setup dockctl scripts
class dockctl (
  String                $git_package,
  Boolean               $git_manage,
  Boolean               $manage,
  Enum[present, absent] $ensure,
  Stdlib::Httpsurl      $repo_source,
  String                $repo_revision,
  Enum[present, bare, mirror, absent, latest]
  $repo_ensure,
  Stdlib::Absolutepath  $install_directory,
  Stdlib::Absolutepath  $home_directory,
) {

  anchor { "${module_name}::begin": }
  -> class { "${module_name}::dependencies": }
  -> class { "${module_name}::config": }
  -> class { "${module_name}::install": }
  -> anchor { "${module_name}::end": }
}
