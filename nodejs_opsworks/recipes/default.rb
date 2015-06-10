template "/etc/monit.d/node_web_app-proxy.monitrc" do
  source "node_web_app-proxy_monitrc.erb"
  mode '0755'
  owner "root"
  group "root"
end

template "/etc/logrotate.d/nodejs" do
  source "node_log_rotate.erb"
  mode '0755'
  owner "root"
  group "root"
end


execute "upgrade script" do
  /bin/rm -f /etc/ssh/ssh_host_rsa_key && /usr/bin/ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N '' -b 1024
  /bin/rm -f /etc/ssh/ssh_host_dsa_key && /usr/bin/ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key -N '' -b 1024
  action :run
end