require 'spec_helper'

describe ImportExport::Source do

  subject { ImportExport::Source.all.first }

  it "returns all sources" do
    expect(ImportExport::Source.all.count).to eql(12)
  end

  it "returns a source by key" do
    source = ImportExport::Source.find_by_key(subject.key)
    expect(source.key).to eql(subject.key)
  end

  it "returns a source by name" do
    source = ImportExport::Source.find_by_name(subject.name)
    expect(source.name).to eql(subject.name)
  end

  it "returns the keys" do
    expect(ImportExport::Source.keys.count).to eql(12)
    expect(ImportExport::Source.keys.first).to eql(subject.key)
  end

  it "returns the key" do
    expect(subject.key).to eql("CAP")
  end

  it "returns the name" do
    expect(subject.name).to eql("Correspondent Account or Payable-Through Account Sanctions (CAPTA)")
  end
end
