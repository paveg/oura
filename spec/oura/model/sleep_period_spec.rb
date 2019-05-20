# frozen_string_literal: true

require 'spec_helper'

RSpec.describe ::Oura::Model::SleepPeriod do
  let(:argument_file) { 'spec/fixtures/sleep_period.json' }
  let(:arguments) { JSON.parse(File.read(argument_file)).deep_symbolize_keys }
  let(:sleep_period) { described_class.new(arguments) }

  describe '#initialize' do
    subject { sleep_period }

    it do
      expect(subject.instance_variable_get(:@attrs).keys).to eq(arguments.keys)
      expect(subject).to be_a(described_class)
    end
  end
end
