# Class: sumo
class sumo (
  $access_id          = $sumo::params::access_id,
  $access_key         = $sumo::params::access_key,
  $clobber            = $sumo::params::clobber,
  $collector_name     = $sumo::params::collector_name,
  $config_dir         = $sumo::params::config_dir,
  $config_file        = $sumo::params::config_file,
  $config_template    = $sumo::params::config_template,
  $download_url       = $sumo::params::download_url,
  $email              = $sumo::params::email,
  $ephemeral          = $sumo::params::ephemeral,
  $get_installer_cmd  = $sumo::params::get_installer_cmd,
  $install_dir        = $sumo::params::install_dir,
  $install_script     = $sumo::params::install_script,
  $install_script_dir = $sumo::params::install_script_dir,
  $override           = $sumo::params::override,
  $password           = $sumo::params::password,
  $proxy_host         = $sumo::params::proxy_host,
  $proxy_ntlm_domain  = $sumo::params::proxy_ntlm_domain,
  $proxy_password     = $sumo::params::proxy_password,
  $proxy_port         = $sumo::params::proxy_port,
  $service_ensure     = $sumo::params::service_ensure,
  $service_enable     = $sumo::params::service_enable,
  $sources_file       = $sumo::params::sources_file,
  $sources_template   = $sumo::params::sources_template
) {

  include sumo::params

  if ($email and $password) or ($access_id and $access_key) {
    if $email {
      validate_string($email)
      validate_string($password)
    }

    if $access_id {
      validate_string($access_id)
      validate_string($access_key)
    }
  }
  else {
    fail('Class[::sumo] requires either an email/password pair or an access_id/access_key pair')
  }

  if $clobber { validate_bool($clobber) }
  validate_string($collector_name)
  validate_absolute_path($config_dir)
  validate_string($config_file)
  validate_string($config_template)
  validate_string($download_url)
  if $ephemeral { validate_bool($ephemeral) }
  validate_string($get_installer_cmd)
  validate_absolute_path($install_dir)
  validate_string($install_script)
  validate_absolute_path($install_script_dir)
  if $override { validate_bool($override) }
  if $proxy_host { validate_string($proxy_host) }
  if $proxy_ntlm_domain { validate_string($proxy_ntlm_domain) }
  if $proxy_password { validate_string($proxy_password) }
  if $proxy_port { validate_string($proxy_port) }
  validate_string($service_ensure)
  validate_bool($service_enable)
  validate_string($sources_file)
  validate_string($sources_template)

  Class['sumo::config'] -> Class['sumo::install']

  contain sumo::install
  contain sumo::config
}