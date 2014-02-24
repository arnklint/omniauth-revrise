require 'spec_helper'

describe OmniAuth::Strategies::Revrise do
  let(:request) { double('Request', :params => {}, :cookies => {}, :env => {}) }

  subject do
    args = ['appid', 'secret', @options || {}].compact
    OmniAuth::Strategies::Revrise.new(*args).tap do |strategy|
      strategy.stub(:request) {
        request
      }
    end
  end

  describe 'client options' do
    it 'should have correct name' do
      expect(subject.options.name).to eq('revrise')
    end

    it 'should have correct site' do
      expect(subject.options.client_options.site).to eq('https://api2.revrise.com')
    end

    it 'should have correct authorize url' do
      expect(subject.options.client_options.authorize_path).to eq('/oauth/authenticate')
    end
  end

  describe 'request_phase' do
    context 'with no request params set and x_auth_access_type specified' do
      before do
        subject.stub(:request).and_return(
          double('Request', {:params => {'x_auth_access_type' => 'read'}})
        )
        subject.stub(:old_request_phase).and_return(:whatever)
      end

      it 'should not break' do
        expect { subject.request_phase }.not_to raise_error
      end
    end
  end
end
