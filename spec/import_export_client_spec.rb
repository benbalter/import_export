require 'spec_helper'

describe ImportExport::Client do
  it "accepts an api key" do
    client = ImportExport::Client.new :api_key => "foo"
    expect(client.api_key).to eql("foo")
  end

  it "defaults to the env API key" do
    with_env "TRADE_API_KEY", "foo2" do
      expect(subject.api_key).to eql("foo2")
    end
  end

  it "calls the API" do
    stub = stub_request(:get, /https:\/\/api\.trade\.gov\/consolidated_screening_list\/search.*/).
         to_return(:status => 200, :body => '{"results": [{"foo": "bar"}, {"foo2": "bar2"}]}')

    search = subject.search :q => "smith"
    expect(stub).to have_been_requested

    expect(search.count).to eql(2)
    expect(search.first.class).to eql(ImportExport::Result)
    expect(search.first.foo).to eql("bar")
  end
end
