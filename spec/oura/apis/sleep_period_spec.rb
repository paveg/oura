# frozen_string_literal: true

require 'spec_helper'

RSpec.describe ::Oura::Apis::SleepPeriod do
  class TestApisSleepPeriod
    include ::Oura::Apis::SleepPeriod
  end
  let(:instance) { TestApisSleepPeriod.new }
  let(:argument_file) { 'spec/fixtures/sleep_period.json' }
  let(:expected_body) { File.read(argument_file) }
  let(:start_date) { Date.new(2019, 5, 1) }
  let(:end_date) { Date.new(2019, 5, 2) }

  describe '#sleep_period' do
    subject { instance.sleep_period(start_date: start_date, end_date: end_date) }

    context 'when access_token is nil' do
      it { expect { subject }.to raise_error(StandardError) }
    end

    context 'when access_token is present' do
      before { allow(instance).to receive_message_chain(:get, :body).and_return(expected_body) }

      it { is_expected.to be_a(::Oura::Model::SleepPeriod) }
    end
  end
end
