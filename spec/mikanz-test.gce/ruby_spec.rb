require 'spec_helper'

describe command('ruby -v') do
  let(:disable_sudo) { true }
  its(:stdout) { should match /ruby 2\.2\.2/ }
end

describe command('gem list') do
  let(:disable_sudo) { true }
  its(:stdout) { should match /bundler/ }
end
