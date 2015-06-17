#
# Cookbook Name:: chef_test
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
execute "run_something" do
  command '/usr/bin/echo "$(date)" >> /tmp/CHEF_WORKED'
end
