# frozen_string_literal: true

require 'spec_helper'

RSpec.describe ::Oura::Apis::UserInformation do
  class TestApisUserInformation
    include ::Oura::Apis::UserInformation
  end
  let(:instance) { TestApisUserInformation.new }

  describe '#userinfo' do
    subject { instance.userinfo }

    context 'when access_token is nil' do
      it { expect { subject }.to raise_error(StandardError) }
    end

    context 'when access_token is present' do
      xit {}
    end
  end
end
