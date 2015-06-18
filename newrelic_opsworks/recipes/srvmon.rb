
execute 'repo_install' do
  command "sudo /bin/rpm -Uvh " <%= node[:newrelic][:repo_inst_url] %> 
  action :run
end

execute 'newrelic-sysmond' do
  command "sudo /usr/bin/yum  -y install newrelic-sysmond --nogpgcheck "
  action :run
end

template "/etc/newrelic/nrsysmond.cfg" do
  source "newrelic_nrsysmond.erb"
  mode '0766'
  owner "root"
  group "newrelic"
end

