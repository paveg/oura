# frozen_string_literal: true

require 'spec_helper'

RSpec.describe ::Oura::Model::UserInformation do
  let(:argument_file) { 'spec/fixtures/user_information.json' }
  let(:arguments) { JSON.parse(File.read(argument_file)).deep_symbolize_keys }

  describe '#initialize' do
    subject { described_class.new(arguments) }

    it do
      expect(subject.instance_variable_get(:@attrs).keys).to eq(arguments.keys)
      expect(subject).to be_a(described_class)
    end
  end
end
