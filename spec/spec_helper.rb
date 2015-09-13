require "bundler/setup"
require 'webmock/rspec'
require_relative "../lib/import_export"

WebMock.disable_net_connect!

def with_env(key, value)
  old_env = ENV[key]
  ENV[key] = value
  yield
  ENV[key] = old_env
end