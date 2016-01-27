puts "Inflating template database.yml.erb"
template "#{deploy[:deploy_to]}/shared/config/database.yml" do
  source "database.yml.erb"
  cookbook "rails"
  group 'root'
  owner "#{node[:deploy][:user]}"
  mode   "0755"
end
