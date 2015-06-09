template "/etc/monit.d/node_web_app-proxy.monitrc" do
  source "node_web_app-proxy_monitrc.erb"
  mode '0755'
  owner "ubuntu"
  group "ubuntu"
end

template "/etc/logrotate.d/nodejs" do
  source "node_log_rotate.erb"
  mode '0755'
  owner "root"
  group "root"
end
