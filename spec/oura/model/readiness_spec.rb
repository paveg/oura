# frozen_string_literal: true

require 'spec_helper'

RSpec.describe ::Oura::Model::Readiness do
  let(:argument_file) { 'spec/fixtures/readiness.json' }
  let(:arguments) { JSON.parse(File.read(argument_file)).deep_symbolize_keys }
  let(:readiness) { described_class.new(arguments) }

  describe '#initialize' do
    subject { described_class.new(arguments) }

    it do
      expect(subject.instance_variable_get(:@attrs).keys).to eq(arguments.keys)
      expect(subject).to be_a(described_class)
    end
  end

  describe '#scores' do
    subject { readiness.scores }

    let(:readiness) { described_class.new(arguments) }

    it { is_expected.to include(70, 62) }
  end

  describe '#average_score' do
    subject { readiness.average_score }

    it { is_expected.to eq(66) }
  end

  describe '#scores_resting_hrs' do
    subject { readiness.score_resting_hrs }

    let(:readiness) { described_class.new(arguments) }

    it { is_expected.to include(78, 78) }
  end

  describe '#average_resting_hr' do
    subject { readiness.average_resting_hr }

    it { is_expected.to eq(78.0) }
  end
end
