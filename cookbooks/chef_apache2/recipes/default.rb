#
# Cookbook:: chef_apache2
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
apt_update 'Update the apt cache daily' do
  frequency 86_400
  action :periodic
end

package 'apache2'

service 'apache2' do
  supports status: true
  action [:enable, :start]
end

group 'web_admin2'

user 'web_admin2' do
  group 'web_admin2'
  system true
  shell '/bin/bash'
end

template '/var/www/html/hello.html' do
  source 'index.html.erb'
  mode '0644'
  owner 'web_admin2'
  group 'web_admin2'
end
