# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Oura::Client do
  let(:access_token) { 'test' }

  describe '#initialize' do
    subject(:client) { described_class.new(access_token: access_token) }

    it {
      expect(client).to be_kind_of(described_class)
      expect(client.oauth_client).to be_kind_of(OAuth2::Client)
      expect(client.access_token).to be_kind_of(OAuth2::AccessToken)
      expect(client.access_token.token).to eq(access_token)
    }
  end
end
