#
# Cookbook Name:: jenkins-ato
# Recipe:: _jenkins_repo
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
include_recipe 'java'

case node['platform']
when 'debian', 'ubuntu'
  apt_repository 'jenkins' do
    uri 'http://pkg.jenkins-ci.org/debian'
    distribution 'binary/'
    key 'https://jenkins-ci.org/debian/jenkins-ci.org.key'
    action :add
  end
when 'redhat', 'centos', 'fedora'
  yum_repository 'jenkins' do
    description 'Jenkins repo'
    baseurl 'http://pkg.jenkins-ci.org/redhat'
    gpgkey 'https://jenkins-ci.org/redhat/jenkins-ci.org.key'
    action :create
  end
end
package 'jenkins' do
  action :install
end
