#
# Cookbook Name:: mapserver
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

if RUBY_PLATFORM =~ /mswin|mingw32|windows/
  require 'win32/service'
end

windows_zipfile 'c:/' do
  source node['ms4w']['source']
  action :unzip
  not_if { ::File.exists?('c:\ms4w') }
end

execute 'Apache MS4W Web Server' do
  command 'c:\ms4w\apache\bin\httpd -k install -n "Apache MS4W Web Server"'
  not_if { ::Win32::Service.exists?('ApacheMS4WWebServer') }
end

windows_service 'ApacheMS4WWebServer' do
  action :configure_startup
  startup_type :automatic
end

windows_service 'ApacheMS4WWebServer' do
  action :start
end
