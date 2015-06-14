
execute 'ssh_host' do
  command "sudo /bin/rm -f /etc/ssh/ssh_host_rsa_key && /usr/bin/ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N '' -b 1024"
  action :run
end

execute 'ssh_host' do
  command "sudo /bin/rm -f /etc/ssh/ssh_host_dsa_key && /usr/bin/ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key -N '' -b 1024"
  action :run
end
