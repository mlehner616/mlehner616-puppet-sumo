# Class: sumo::install
#
#
class sumo::install inherits sumo {
  exec { 'Install sumo from sumologic.com':
    command => $sumo::get_installer_cmd,
    cwd     => $sumo::install_script_dir,
    creates => "${sumo::install_script_dir}/${sumo::install_script}",
  }->
  file { "${sumo::install_script_dir}/${sumo::install_script}":
    ensure => file,
    mode   => '0100',
    owner  => 'root',
    group  => 'root',
  }->
  exec { 'Install sumo from local':
    command => "${sumo::install_script_dir}/${sumo::install_script} -q -dir \"${sumo::install_dir}\"",
    creates => $sumo::install_dir,
  }

  # exec { 'Update sumo config':
  #   command     => "${install_script} -q",
  #   refreshonly => true,
  # }
}
