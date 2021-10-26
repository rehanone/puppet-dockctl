require 'spec_helper_acceptance'

describe 'dockctl class:', unless: UNSUPPORTED_PLATFORMS.include?(fact('osfamily')) do
  context 'run with default settings' do
    before(:each) do
      shell 'rm -fv /etc/dockctl/*'
    end

    let(:manifest) do
      <<-EOS
        class { 'dockctl': }
      EOS
    end

    let(:result) { apply_manifest(manifest, catch_failures: true) }

    it 'runs without errors' do
      expect(result.exit_code).to eq 2
    end
  end

  context 'run with manage => true, ensure => present and server client settings:' do
    let(:manifest) do
      <<-EOS
         class { 'dockctl':
                 manage => true,
                 ensure => 'present',
               }
      EOS
    end

    let(:result) { apply_manifest(manifest, catch_failures: true) }

    it 'runs without errors' do
      expect(result.exit_code).to eq 0
    end

    it 'dockctl shell script is installed' do
      result = shell('test -e /opt/dockctl/dockctl')
      expect(result.exit_code).to eq 0
    end
  end
end
