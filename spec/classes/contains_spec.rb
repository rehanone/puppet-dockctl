# To check the correct dependencies are set up for dockctl.

require 'spec_helper'
describe 'dockctl' do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts
      end

      it { is_expected.to compile.with_all_deps }
      describe 'Testing the dependencies between the classes' do
        it { is_expected.to contain_class('dockctl::dependencies') }
        it { is_expected.to contain_class('dockctl::config') }
        it { is_expected.to contain_class('dockctl::install') }

        it { is_expected.to contain_class('dockctl::dependencies').that_comes_before('Class[dockctl::config]') }
        it { is_expected.to contain_class('dockctl::config').that_comes_before('Class[dockctl::install]') }
      end
    end
  end
end
