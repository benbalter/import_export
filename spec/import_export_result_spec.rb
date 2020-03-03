# frozen_string_literal: true

require 'spec_helper'

describe ImportExport::Query do
  subject { ImportExport::Result.new 'foo' => 'bar' }

  it 'stores the data' do
    expect(subject.data['foo']).to eql('bar')
  end

  it 'exposes properties as methods' do
    expect(subject.foo).to eql('bar')
  end
end
