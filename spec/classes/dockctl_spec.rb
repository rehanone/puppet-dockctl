require 'spec_helper'

describe 'dockctl' do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts
      end

      it { is_expected.to compile.with_all_deps }

      describe 'ensure dockctl is managed and present' do
        let(:params) do
          {
            manage: true,
            ensure: 'present',
          }
        end

        it {
          is_expected.to contain_vcsrepo('/opt/dockctl').with(
            ensure: 'present',
            provider: 'git',
            source: 'https://github.com/rehanone/dockctl.git',
            revision: 'master',
          )
        }

        it {
          is_expected.to contain_file('/usr/local/bin/dockctl').with(
            ensure: 'link',
            target: '/opt/dockctl/dockctl',
          )
        }
      end

      describe 'ensure dockctl is managed and absent' do
        let(:params) do
          {
            manage: true,
            ensure: 'absent',
          }
        end

        it {
          is_expected.to contain_vcsrepo('/opt/dockctl').with(
            ensure: 'absent',
            provider: 'git',
            source: 'https://github.com/rehanone/dockctl.git',
            revision: 'master',
          )
        }

        it {
          is_expected.to contain_file('/usr/local/bin/dockctl').with(
            ensure: 'absent',
            target: '/opt/dockctl/dockctl',
          )
        }
      end
    end
  end
end
