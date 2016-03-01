require 'spec_helper'

describe 'Java' do
  describe command('java -version') do
    its(:stderr) { should match /java version "1.7.0_95"/ }
  end
end

describe 'Jenkins' do
  describe package('jenkins') do
    it { should be_installed }
  end
end
