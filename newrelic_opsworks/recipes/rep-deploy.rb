bash 'deploy_report' do
	user 'root'
 	cwd '/tmp'
	code <<-EOH

    app_revision=`sudo /usr/bin/git ls-remote #{node[:newrelic][:gits_url]} refs/heads/master|awk '{print $1 }'`
     
	sudo /usr/bin/curl  -H  "x-api-key:#{node[:newrelic][:api_key]}"  -d "deployment[app_name]=#{node[:newrelic][:app_name]}" -d "deployment[revision]=${app_revision:0:10}" -d "deployment[user]=OpsWorks"  https://api.newrelic.com/deployments.xml
	
	EOH
end


case node["platform"]
when "debian", "ubuntu"
  echo " =====11 #{node['platform']} 11=====" >  /tmp/test222 
when "redhat", "centos", "fedora", "amazon"
  echo " =====22 #{node['platform']} 22=====" >  /tmp/test222 
end



