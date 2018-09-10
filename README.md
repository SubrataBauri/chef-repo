
chef-client --local-mode goodbye.rb
chef generate cookbook cookbooks/chef_apache2
chef generate template cookbooks/chef_apache2 hello.html
sudo chef-client --local-mode --runlist 'recipe[chef_apache2]'

## Upload cookbok to server:
knife cookbook upload chef_apache2

## Bootstrapping : (install chef-client and node connects to server) :-
knife bootstrap 54.85.242.189 --ssh-user ubuntu --sudo --identity-file /path/file.pem --node-name subrata --run-list 'recipe[chef_apache2]'

## Update your node using key-based authentication:
knife ssh 'name:node1-ubuntu' 'sudo chef-client' --ssh-user USER --identity-file IDENTITY_FILE --attribute ipaddress
knife ssh 'name:subrata' 'sudo chef-client' --ssh-user ubuntu --ssh-identity-file /path/file.pem --attribute 54.85.242.189
**OR**
knife ssh 'name:subrata' 'sudo chef-client' --ssh-user ubuntu --ssh-identity-file /path/file.pem --attribute cloud.public_hostname

knife role from file roles/web.json
knife role list
knife role show web
knife node run_list set subrata "role[web]"

knife ssh 'role:web' 'sudo chef-client' --ssh-user ubuntu --ssh-identity-file /path/file.pem --attribute cloud.public_hostname

knife status 'role:web' --run-list
