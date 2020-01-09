require 'spec_helper'

describe ImportExport::Client do
  it "accepts an api key" do
    client = ImportExport::Client.new :api_key => "123e4567-e89b-12d3-a456-426655440000"
    expect(client.api_key).to eql("123e4567-e89b-12d3-a456-426655440000")
  end

  it "defaults to the env API key" do
    with_env "TRADE_API_KEY", "00112233-4455-6677-8899-aabbccddeeff" do
      expect(subject.api_key).to eql("00112233-4455-6677-8899-aabbccddeeff")
    end
  end

  it "calls the API" do
    stub = stub_request(:get, /https:\/\/api\.trade\.gov\/gateway\/v1\/consolidated_screening_list\/search.*/).
         to_return(:status => 200, :body => '{"results": [{"foo": "bar"}, {"foo2": "bar2"}]}')

    with_env "TRADE_API_KEY", "d77f752c-9769-41ad-b2ac-267b5779353a" do
      search = subject.search :q => "smith"
      expect(stub).to have_been_requested

      expect(search.count).to eql(2)
      expect(search.first.class).to eql(ImportExport::Result)
      expect(search.first.foo).to eql("bar")
    end
  end
end
