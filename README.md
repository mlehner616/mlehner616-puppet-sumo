Sumo Collector Puppet Module
======

##Overview
Puppet module to install Sumo Collector

##Compatibility

Tested on the following (PR welcome):

* Puppet Enterprise 3.3.2 (Puppet 3.6.2)
* EL 6
* Amazon 2014.03

#Parameters

## Required
A pair of credentials is required to install the sumo collector

Either
* [access_id](#access_id)
* [access_key](#access_key)

Or
* [email](#email)
* [password](#password)

## Others

access_id
---
Access ID generated in the Security page. See [Generating Access API Keys](https://service.sumologic.com/help/Generating_Collector_Installation_API_Keys.htm).
Recommended to eyaml encrypt this.

* Default: ```null```
* Type: string

#####Example
```
sumo::access_id: 'MboxeezMzN8S'
```

access_key
---
Access Key generated in the Security page. See [Generating Access API Keys](https://service.sumologic.com/help/Generating_Collector_Installation_API_Keys.htm)
Recommended to eyaml encrypt this.

* Default: ```null```
* Type: string

#####Example
```
sumo::access_key: 'dBorwTn8TxF8ofounEXnsQ4hPpuqCzw'
```

clobber
---
Sets the clobber flag; don't include unless you'd like to clobber the Collector.
 (See [Forcing or overwriting a Collector's name with clobber](https://service.sumologic.com/help/Using_Clobber.htm))
 
* Default: ```null (false)```
* Type: bool

#####Example
```
sumo::clobber: true
```
 
collector_name
---
Name used to register the Collector. If no name is specified, the hostname is used.

* Default: ```$::hostname```
* Type: string

#####Example
```
sumo::collector_name: 'my-syslog-collector-01'
```

config_dir
---
The location on the host where the configuration file gets staged. This is set to the default location the Sumo installer looks and should not normally be changed.

* Default: ```/etc```
* Type: string (absolute_path)

#####Example
```
sumo::config_dir: '/etc'
```

config_file
---
The file that the Sumo installer reads on unattended install. This is a set to the default location the Sumo installer looks and should not normally be changed.

* Default: ```sumo.conf```
* Type: string

#####Example
```
sumo::config_file: 'sumo.conf'
```

config_template
---
The puppet template to use to build the ```$config_file```. This shouldn't normally need to be changed.

* Default: ```sumo/sumo.conf.erb```
* Type: string

#####Example
```
sumo::config_template: 'sumo/mycustomtemplate.conf.erb'
```

download_url
---
The web location to pull the install script from. This is set by default based on the architecture (32 vs 64 bit) and shouldn't normally need to be changed. You can override this based on other facts via hiera, etc.

* Default: ```download_url```
* Type: string

#####Example
```
sumo::download_url: 'https://collectors.sumologic.com/rest/download/linux/64'
```

email
---
Email used to register the Collector.

* Default: ```null```
* Type: string

#####Example
```
sumo::email: 'example@example.org'
```

ephemeral
---
Sets the Collector as ephemeral. Don't specify unless you'd like to flag the Collector as ephemeral. (See [Automatically deleting offline Collectors with ephemeral](https://service.sumologic.com/help/Ephemeral.htm).)

* Default:```null```
* Type: string

#####Example
```
sumo::ephemeral: true
```

get\_installer_cmd
---

* Default: '/usr/bin/curl -o ${install_script} ${download_url}'
* Type: string

#####Example
```
sumo::get_installer_cmd: '/usr/bin/wget -o ${install_script} ${download_url}'
```

install_dir
---
The directory Sumo get installed to. This is used to verify the install was successful (not to actually set the install location). This should not normally need to be changed.

* Default: '/opt/SumoCollector'
* Type: string (absolute_path)

#####Example:
```
sumo::install_dir: '/some/other/dir'
```

install_script
---
The local name of the install script that gets downloaded via the ```$get_installer_cmd``` and ```$download_url```

* Default: 'sumo_install.sh'
* Type: string

#####Example
```
sumo::install_script: 'sumo_some_other_install.sh'
```

install\_script_dir
---
The local directory where the ```$get_installer_cmd``` installs the ```$install_script``` to.

* Default: '/tmp'
* Type: string (absolute_path)

#####Example
```
sumo::install_script_dir: '/home/myuser/sumo'
```

override
---
Overrides a Collector's existing Sources to delete all Sources except for the one specified by the sources parameter (above). Don't specify unless you specifically need to use this flag.

* Default:```null```
* Type: string

#####Example
```
sumo::override: true
```

password
---
Password used to register the Collector.

* Default:```null```
* Type: string

#####Example
```
sumo::password: mypassword
```

proxy_host
---
Sets the host the Collector should use to connect via a proxy. (Learn more [here](https://service.sumologic.com/help/Configuring_a_Collector_Behind_a_Proxy.htm).)

* Default:```null```
* Type: string

#####Example
```
sumo::proxy_host: proxy.example.org
```

proxy\_ntlm_domain
---
When using an NTML proxy, the URL used to connect. (Learn more [here](https://service.sumologic.com/help/Configuring_a_Collector_Behind_a_Proxy.htm).)

* Default:```null```
* Type: string

#####Example
```
sumo::proxy_ntlm_domain: sumoexchange.com
```

proxy_password
---
The password associated with the proxyUser setting. (Learn more [here](https://service.sumologic.com/help/Configuring_a_Collector_Behind_a_Proxy.htm).)

* Default:```null```
* Type: string

#####Example
```
sumo::proxy_password: password
```

proxy_port
---
The port number a Collector should use to connect via a proxy. (Learn more [here](https://service.sumologic.com/help/Configuring_a_Collector_Behind_a_Proxy.htm).)

* Default:```null```
* Type: string

#####Example
```
sumo::proxy_port: 9090
```

service_ensure
---
```not_implemented```

service_enable
---
```not_implemented```

sources_file
---
The sources file to be used to initially install sumo.

* Default: 'sumo.json'
* Type: string

#####Example
```
sumo::sources_file: 'sumo_custom.json'
```

sources_template
---
The template used to build the ```$sources_file```.

* Default: 'sumo/sumo.json.erb'
* Type: string

#####Example
```
sumo::sources_template: 'sumo/customsources.json.erb'
```
