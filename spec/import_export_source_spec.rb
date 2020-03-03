# frozen_string_literal: true

require 'spec_helper'

describe ImportExport::Source do
  subject { described_class.all.first }

  it 'returns all sources' do
    expect(described_class.all.count).to be(12)
  end

  it 'returns a source by key' do
    source = described_class.find_by_key(subject.key)
    expect(source.key).to eql(subject.key)
  end

  it 'returns a source by name' do
    source = described_class.find_by_name(subject.name)
    expect(source.name).to eql(subject.name)
  end

  it 'returns the keys' do
    expect(described_class.keys.count).to be(12)
    expect(described_class.keys.first).to eql(subject.key)
  end

  it 'returns the key' do
    expect(subject.key).to eql('CAP')
  end

  it 'returns the name' do
    expect(subject.name).to eql('Correspondent Account or Payable-Through Account Sanctions (CAPTA)')
  end
end
