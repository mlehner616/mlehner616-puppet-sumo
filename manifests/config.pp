# Class: sumo::config
#
#
class sumo::config inherits sumo {
  file { 'sumo.conf':
    ensure    => file,
    name      => "${config_dir}/${config_file}",
    owner     => root,
    group     => root,
    mode      => '0500',
    content   => template($config_template),
  }
  file { 'sumo.json':
    ensure  => file,
    name    => "${config_dir}/${sources_file}",
    owner   => root,
    group   => root,
    mode    => '0500',
    content => template($sources_template),
  }
}