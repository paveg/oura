# frozen_string_literal: true

require 'spec_helper'

RSpec.describe ::Oura::Model::Base do
  let(:instance) { described_class.new }

  describe '.attr_reader' do
    subject { described_class.attr_reader }

    it { is_expected.to be_present }
  end

  describe '.object_from_response' do
    subject { described_class.object_from_response(response) }

    let(:response) { { body: 'message body' } }

    it { expect(subject.instance_variable_get(:@attrs)).to eq('message body') }
  end

  describe '#new' do
    subject { described_class.new }

    it { is_expected.to be_a(described_class) }
  end

  describe '#[]' do
    subject { instance.[]('test_method') }

    it { is_expected.to be_nil }
  end
end
