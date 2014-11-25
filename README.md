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


access_key
---

clobber
---

collector_name
---
The name the collector should register as. This value will only apply when the
collector is first installed

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

ephemeral
---

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

password
---

proxy_host
---

proxy\_ntlm_domain
---

proxy_password
---

proxy_port
---

service_ensure
---

service_enable
---

sources_file
---

sources_template
---
