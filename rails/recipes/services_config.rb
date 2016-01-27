node[:deploy].each do |application, deploy|
  deploy = node[:deploy][application]
  puts "Inflating template services_config.yml.erb"
  template "#{deploy[:deploy_to]}/shared/config/services_config.yml" do
    source "services_config.yml.erb"
    cookbook "rails"
    group 'root'
    owner "#{node[:deploy][:user]}"
    mode   "0755"
  end
end
