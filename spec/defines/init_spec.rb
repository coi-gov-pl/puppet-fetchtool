require 'spec_helper_puppet'

describe 'fetchtool::download', type: :define do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) { facts }

      context 'with default values for all parameters' do
        let(:title) { 'file.zip' }
        let(:params) do
          { fetch_dir: '/opt',
            address:   'http://dload.pl/' }
        end
        it { is_expected.to compile }
        it { is_expected.to contain_class('fetchtool::settings') }
        it { is_expected.to contain_exec('wget-file.zip') }
        it { is_expected.to contain_user('mark') }
        it { is_expected.to contain_group('wheel') }
        it { is_expected.to contain_package('wget') }
        it { is_expected.to contain_fetchtool__internal__wget('http://dload.pl/') }
      end
    end
  end
end
