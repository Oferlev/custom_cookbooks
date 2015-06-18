

execute 'repo_install' do
  command "sudo /bin/rpm -Uvh <%= node[:newrelic][:repo_inst_url] %> "
  action :run
end

execute 'newrelic-sysmond' do
  command "sudo /usr/bin/yum  -y install newrelic-sysmond --nogpgcheck"
  action :run
end

execute 'newrelic-sysmond' do
  command "sudo /usr/sbin/nrsysmond-config --set license_key=<%=node[:newrelic][:license_key]%>"
  action :run
end

