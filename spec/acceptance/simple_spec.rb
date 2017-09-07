require 'spec_helper_acceptance'

# Tests for define fetchtool::download
describe 'fetchtool::simple', unless: UNSUPPORTED_PLATFORMS.include?(fact('osfamily')) do
  let(:download_pp) { example('fetchtool::simple') }

  it 'should work with no errors' do
    result = apply_manifest(download_pp, catch_failures: true)
    expect(result.exit_code).to be(2)
  end
  it 'should work idempotently' do
    apply_manifest(download_pp, catch_changes: true)
  end
  describe file('/usr/src/eicar.com') do
    it { is_expected.to exist }
    its(:content) { is_expected.to eq 'X5O!P%@AP[4\PZX54(P^)7CC)7}$EICAR-STANDARD-ANTIVIRUS-TEST-FILE!$H+H*' }
  end
end
