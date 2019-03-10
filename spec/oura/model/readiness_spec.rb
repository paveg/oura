require 'spec_helper'

RSpec.describe ::Oura::Model::Readiness do
  let(:argument_file) { 'spec/fixtures/readiness.json' }
  let(:arguments) { JSON.parse(File.read(argument_file)).symbolize_keys }

  describe '#initialize' do
    subject { described_class.new(arguments) }

    it do
      expect(subject.instance_variable_get(:@attrs).keys).to eq(arguments.keys)
      expect(subject).to be_a(described_class)
    end
  end
end
