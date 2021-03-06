require 'spec_helper_puppet'

describe 'fetchtool::download', type: :define do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) { facts }

      context 'with default values for all parameters' do
        let(:title) { 'http://dload.pl/file.zip' }
        let(:params) do
          {
            fetch_dir: '/opt',
            owner: 'mark',
            group: 'wheel'
          }
        end
        it { is_expected.to compile }
        it { is_expected.to contain_class('fetchtool::settings') }
        it { is_expected.to contain_exec('wget-http://dload.pl/file.zip') }
        it { is_expected.to contain_user('mark') }
        it { is_expected.to contain_group('wheel') }
        it { is_expected.to contain_package('wget') }
        it { is_expected.to contain_fetchtool__internal__wget('http://dload.pl/file.zip') }
      end
    end
  end
end
