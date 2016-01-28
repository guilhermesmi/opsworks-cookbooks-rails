## cookbooks/aws/recipes/default.rb
execute "python-pip" do
  command "sudo apt-get install -y python-pip"
  user "root"
  action :run
end

execute "aws-cli" do
  command "sudo pip install awscli"
  user "root"
  action :run
end


execute "aws-cli update" do
  command "pip install --upgrade awscli"
  user "root"
  action :run
end
