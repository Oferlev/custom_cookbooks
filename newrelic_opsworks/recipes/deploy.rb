bash 'deploy_report' do
	user 'root'
 	cwd '/tmp'
	code <<-EOH
    app_revision=`sudo /usr/bin/git ls-remote https://e62121cae92091078efcc054cc6ed3be6d90f6d7@github.com/ConduitMiddlewareServices/cep_traffic_proxy.git refs/heads/master|awk '{print $1 }'`"
     
	sudo /usr/bin/curl  -H  "x-api-key:d8e5a2523288764fe274df9f2ca2e13dba42a49ff1f7ddb"  -d "deployment[app_name]=Proxy" -d "deployment[revision]=${app_revision:0:10}" -d "deployment[user]=OpsWorks"  https://api.newrelic.com/deployments.xml
	
	  EOH
end

