# frozen_string_literal: true

require 'spec_helper'

RSpec.describe ::Oura::Apis::UserInformation do
  class TestApisUserInformation
    include ::Oura::Apis::UserInformation
  end
  let(:instance) { TestApisUserInformation.new }
  let(:argument_file) { 'spec/fixtures/user_information.json' }
  let(:expected_body) { File.read(argument_file) }

  describe '#userinfo' do
    subject { instance.userinfo }

    context 'when access_token is nil' do
      it { expect { subject }.to raise_error(StandardError) }
    end

    context 'when access_token is present' do
      before { allow(instance).to receive_message_chain(:get, :body).and_return(expected_body) }

      it { is_expected.to be_a(::Oura::Model::UserInformation) }
    end
  end
end
