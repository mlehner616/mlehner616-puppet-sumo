# Class: sumo::install
#
#
class sumo::install inherits sumo {
  exec { 'Install sumo from sumologic.com':
    command => "${get_installer_cmd}",
    cwd     => "${install_script_dir}",
    creates => "${install_script}",
  }->
  file { "${install_script}":
    ensure  => file,
    mode    => '0100',
    owner   => 'root',
    group   => 'root',
  }->
  exec { 'Install sumo from local':
    command => "${install_script} -q",
    creates => "${install_dir}",
  }

  # exec { 'Update sumo config':
  #   command     => "${install_script} -q",
  #   refreshonly => true,
  # }
}