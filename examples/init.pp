node default {
  notify { 'enduser-before': }
  notify { 'enduser-after': }

  class { 'dockctl':
    ensure  => present,
    require => Notify['enduser-before'],
    before  => Notify['enduser-after'],
  }
}
