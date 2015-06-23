bash 'deploy_report' do
	user 'root'
 	cwd '/tmp'
	case node[:platform]
  when "centos","redhat","fedora","suse"
    code <<-EOH
    echo "centos" > /tmp/test222 
    EOH
  when "debian","ubuntu"
    code <<-EOH
    echo "debian" > /tmp/test222 
    EOH
  end
	
	code <<-EOH

    app_revision=`sudo /usr/bin/git ls-remote #{node[:newrelic][:gits_url]} refs/heads/master|awk '{print $1 }'`
     
	sudo /usr/bin/curl  -H  "x-api-key:#{node[:newrelic][:api_key]}"  -d "deployment[app_name]=#{node[:newrelic][:app_name]}" -d "deployment[revision]=${app_revision:0:10}" -d "deployment[user]=OpsWorks"  https://api.newrelic.com/deployments.xml
	
	EOH
end

