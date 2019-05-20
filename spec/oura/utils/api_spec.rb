# frozen_string_literal: true

require 'spec_helper'

RSpec.describe ::Oura::Utils::Api do
  class TestOuraApi
    include ::Oura::Utils::Api
  end
  let(:instance) { TestOuraApi.new }

  describe '#transform_date' do
    subject { instance.send(:transform_date, argument) }

    let(:expected) { '2019-05-01' }

    context 'when string argument' do
      let(:argument) { '2019-05-01' }

      it { is_expected.to eq(expected) }
    end

    context 'when date argument' do
      let(:argument) { Date.new(2019, 5, 1) }

      it { is_expected.to eq(expected) }
    end

    context 'when raises error' do
      let(:argument) { nil }

      it { expect { subject }.to raise_error(ArgumentError) }
    end
  end
end
