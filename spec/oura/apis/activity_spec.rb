# frozen_string_literal: true

require 'spec_helper'

RSpec.describe ::Oura::Apis::Activity do
  class TestApisActivity
    include ::Oura::Apis::Activity
  end
  let(:instance) { TestApisActivity.new }
  let(:argument_file) { 'spec/fixtures/activity.json' }
  let(:expected_body) { File.read(argument_file) }
  let(:start_date) { Date.new(2019, 5, 1) }
  let(:end_date) { Date.new(2019, 5, 2) }

  describe '#activity' do
    subject { instance.activity(start_date: start_date, end_date: end_date) }

    context 'when access_token is nil' do
      it { expect { subject }.to raise_error(StandardError) }
    end

    context 'when access_token is present' do
      before { allow(instance).to receive_message_chain(:get, :body).and_return(expected_body) }

      it { is_expected.to be_a(::Oura::Model::Activity) }
    end
  end
end
