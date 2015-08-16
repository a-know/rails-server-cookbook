require 'spec_helper'

describe command('rbenv -v') do
  let(:disable_sudo) { true }
  its(:stdout) { should match /rbenv/ }
end
