# encoding: UTF-8
execute 'echo "deb https://packages.elastic.co/beats/apt stable main" |  sudo tee -a /etc/apt/sources.list.d/beats.list'
execute 'wget -qO - https://packages.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -'
execute 'sudo apt-get update'
apt_package "filebeat" do
  action :install
  options "--force-yes"
end

template "/etc/filebeat/filebeat.yml" do
  source 'filebeat.yml.erb'
  owner 'root'
  group 'root'
  variables(
    host: node['filebeat']['host'],
    path: node['filebeat']['path'],
    cert: node['filebeat']['cert']
  )
end

cert_content = []
cert_content = node['filebeat']['cert_content'] if  !node['filebeat']['cert_content'].nil?
if cert_content
  file "#{node['filebeat']['cert']}" do
    owner 'root'
    group 'root'
    content cert_content.join("\n")
  end
end

execute 'sudo service filebeat restart'
