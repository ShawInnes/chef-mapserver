#
# Cookbook Name:: mapserver
# Spec:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

require 'spec_helper'

describe 'mapserver::default' do
  context 'When all attributes are default, on an unspecified platform' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new(platform: 'windows', version: '2012r2')
      runner.converge(described_recipe)
    end

    it 'downloads package' do
      expect(chef_run).to unzip_windows_zipfile_to('c:/').with(source: 'http://www.ms4w.com/release/ms4w_3.1.1.zip')
    end
  end
end
