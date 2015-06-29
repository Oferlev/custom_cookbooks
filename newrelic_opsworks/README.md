# newrelic cookbook

## Description

This cookbook provides an easy way to install the New Relic server monitor and API for deployment report.

## Requirements

### Chef version:

Make sure you run Chef >= 0.10.0.

### Cookbooks:

* python
* curl
* apt
* yum

### Platforms:

* Debian
* Ubuntu
* RHEL
* CentOS
* Fedora
* Amazon

#### BASIC

* `node['newrelic']['license_key']` - Your New Relic license key. 
   Default is '0000ffff0000ffff0000ffff0000ffff0000ffff'
* `node['newrelic']['api_key'] - Your New Relic license key for API purposes. 
   Default is 'aaeecc0000ffff0000ffff0000ffff0000ffff0000ffff'
* `node[:newrelic][:yum_repo] - URL of New Relic rpm repository
   Default is 'http://yum.newrelic.com/pub/newrelic/el5/x86_64/newrelic-repo-5-3.noarch.rpm'

   All values cann be replaced by change in "AWS Stack Settings"

   Custom JSON:
{
"newrelic": { 
   "license_key" : "0000ffff0000ffff0000ffff0000ffff0000ffff",
   "api_key" : "aaeecc0000ffff0000ffff0000ffff0000ffff0000ffff",
   "gits_url" : "https://0000eeee0000eeee0000eeee0000eeee@github.com/ConduitMiddlewareServices/cep_traffic_proxy.git",
    "yum_repo" : "http://yum.newrelic.com/pub/newrelic/el5/x86_64/newrelic-repo-5-3.noarch.rpm",
    "apt_repo" : "https://download.newrelic.com/548C16BF.gpg",
    "app_naem" : "application name"
  }
}


### 'newrelic_opsworks::srvmon'

This cookbook is intended for installing the server monitor agent


### 'newrelic_opsworks::rep-deploy'

This cookbook is intended for deployments reporting.

## References

* [New Relic home page](http://newrelic.com/)
* [New Relic for Server Monitoring](https://docs.newrelic.com/docs/server/new-relic-for-server-monitoring)


## License and Authors

Author: Leonid Gresserman <leonidg@perion.com>


Unless otherwise noted, all files are released under the MIT license,
possible exceptions will contain licensing information in them.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.





