#
# DO NOT EDIT THIS FILE DIRECTLY - UNLESS YOU KNOW WHAT YOU ARE DOING
#

user node[:performance][:user] do
  action :create
  supports :manage_home => true
  home "/home/#{node[:performance][:user]}"
  shell "/bin/bash"
  not_if "getent passwd #{node[:performance]['user']}"
end

group node[:performance][:group] do
  action :modify
  members ["#{node[:performance][:user]}"]
  append true
end


private_ip = my_private_ip()
public_ip = my_public_ip()



# Pre-Experiment Code



# Configuration Files


