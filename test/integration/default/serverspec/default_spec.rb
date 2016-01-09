require 'spec_helper'

describe 'mapserver::default' do
  describe file 'c:\ms4w' do
   it { should be_directory }
  end

  describe service('ApacheMS4WWebServer') do
    it { should be_installed }
    it { should have_start_mode('Automatic') }
  end

  describe port(80) do
    it { should be_listening.with('tcp') }
  end

  describe file('c:\ms4w\VERSION.txt') do
    its(:content) { should match /MS4W 3.1.1/ }
  end
end
