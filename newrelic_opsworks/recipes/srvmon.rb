


case node["platform"]
  when "debian", "ubuntu"
 
    execute 'ubnt_repo_install' do 
      command "sudo /usr/bin/wget -O- https://download.newrelic.com/548C16BF.gpg | sudo /usr/bin/apt-key add - "
      action :run
    end   

    execute 'ubnt_repo_update' do 
      command "sudo /usr/bin/apt-get update "
      action :run
    end

    execute 'ubnt_newrelic_install' do 
      command "sudo /usr/bin/apt-get -y install newrelic-sysmond "
      action :run
    end

    execute 'ubnt_nrsysmon_key' do 
      command "sudo /usr/sbin/nrsysmond-config --set license_key=#{node[:newrelic][:license_key]} "
      action :run
    end

  when "redhat", "centos", "fedora", "amazon"

    execute 'repo_install' do
      command "sudo /bin/rpm -Uvh #{node[:newrelic][:repo_inst_url]} "  
      not_if { ::File.exists?("/etc/yum.repos.d/newrelic.repo")}
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
    
    execute 'newrelic-start' do
      command "sudo /etc/init.d/newrelic-sysmond start "
      action :run
    end  
  
end

