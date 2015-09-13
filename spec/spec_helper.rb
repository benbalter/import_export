require "bundler/setup"
require 'webmock/rspec'
require 'open3'
require_relative "../lib/import_export"

WebMock.disable_net_connect!

def with_env(key, value)
  old_env = ENV[key]
  ENV[key] = value
  yield
  ENV[key] = old_env
end

def test_bin(args)
  Open3.capture2e("bundle", "exec", "import_export", *args)
end
