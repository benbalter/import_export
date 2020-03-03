# frozen_string_literal: true

require 'spec_helper'

describe ImportExport do
  it 'returns the user agent' do
    expect(subject.user_agent).to match(%r{ImportExport/\d\.\d\.\d})
  end
end
