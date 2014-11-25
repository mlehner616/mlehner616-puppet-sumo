# Class: sumo::params
#
#
class sumo::params {

  $access_id          = undef
  $access_key         = undef
  $clobber            = undef
  $collector_name     = $::hostname
  $config_dir         = '/etc'
  $config_file        = 'sumo.conf'
  $config_template    = 'sumo/sumo.conf.erb'
  $email              = undef
  $ephemeral          = undef
  $install_dir        = '/opt/SumoCollector'
  $install_script_dir = '/tmp'
  $override           = undef
  $password           = undef
  $proxy_host         = undef
  $proxy_ntlm_domain  = undef
  $proxy_password     = undef
  $proxy_port         = undef
  $service_ensure     = 'running'
  $service_enable     = true
  $sources_file       = 'sumo.json'
  $sources_template   = 'sumo/sumo.json.erb'

  case $::architecture {
    'x86_64': {
      $install_script = "${install_script_dir}/sumo64.sh"
      $download_url   = 'https://collectors.sumologic.com/rest/download/linux/64'
    }
    'x86': {
      $install_script = "${install_script_dir}/sumo32.sh"
      $download_url   = 'https://collectors.sumologic.com/rest/download/linux/32'
    }
  }

  $get_installer_cmd  = "/usr/bin/curl -o ${install_script} ${download_url}"
}