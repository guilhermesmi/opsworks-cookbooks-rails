node[:deploy].each do |application, deploy|
  deploy = node[:deploy][application]
  puts "Inflating template mongoid.yml.erb"
  template "#{deploy[:deploy_to]}/shared/config/mongoid.yml" do
    source "mongoid.yml.erb"
    cookbook "rails"
    group 'root'
    owner "#{deploy[:user]}"
    mode   "0755"
  end
end
