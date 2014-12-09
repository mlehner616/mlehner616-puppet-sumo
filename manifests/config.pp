# Class: sumo::config
#
#
class sumo::config inherits sumo {
  file { 'sumo.conf':
    ensure  => file,
    name    => "${sumo::config_dir}/${sumo::config_file}",
    owner   => root,
    group   => root,
    mode    => '0500',
    content => template($sumo::config_template),
  }
  file { 'sumo.json':
    ensure  => file,
    name    => "${sumo::config_dir}/${sumo::sources_file}",
    owner   => root,
    group   => root,
    mode    => '0500',
    content => template($sumo::sources_template),
  }
}