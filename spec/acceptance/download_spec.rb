require 'spec_helper_acceptance'

# Tests for define fetchtool::download
describe 'fetchtool::download', unless: UNSUPPORTED_PLATFORMS.include?(fact('osfamily')) do
  let(:download_pp) { example('fetchtool::download') }

  it 'should work with no errors' do
    result = apply_manifest(download_pp, catch_failures: true)
    expect(result.exit_code).to be(2)
  end
  it 'should work idempotently' do
    apply_manifest(download_pp, catch_changes: true)
  end
  describe file('/tmp/flyway-4.2.0.tgz') do
    it { is_expected.to exist }
  end
end
