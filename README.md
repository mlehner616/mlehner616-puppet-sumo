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
sumo::access_id: MboxeezMzN8S
```

access_key
---
Access Key generated in the Security page. See [Generating Access API Keys](https://service.sumologic.com/help/Generating_Collector_Installation_API_Keys.htm)
Recommended to eyaml encrypt this.

* Default: ```null```
* Type: string

#####Example
```
sumo::access_key: dBorwTn8TxF8ofounEXnsQ4hPpuqCzw
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
sumo::collector_name: my-syslog-collector-01
```

config_dir
---

config_file
---

config_template
---

download_url
---

email
---
Email used to register the Collector.

* Default: ```null```
* Type: string

#####Example
```
sumo::email: example@example.org
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

install_dir
---

install_script
---

install\_script_dir
---

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

service_enable
---

sources_file
---

sources_template
---
