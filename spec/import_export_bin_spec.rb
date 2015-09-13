require 'spec_helper'

describe "ImportExport bin" do
  it "outputs the help" do
    output, status = test_bin("")
    expect(output).to match(/usage/i)
    expect(status.exitstatus).to eql(1)
  end
end
