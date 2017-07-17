require 'pry'
require 'rspec'
require 'vcr'

ROOT = Pathname(File.expand_path(File.join(File.dirname(__FILE__), '..')))

$LOAD_PATH << File.join(ROOT, 'lib')
$LOAD_PATH << File.join(ROOT, 'lib', 'yourls')

require File.join(ROOT, 'lib', 'yourls_shortener.rb')

VCR.configure do |config|
  config.cassette_library_dir = "spec/cassettes"
end

YOURLS_CONFIG = { domain: 'http://example.com', api_endpoint: 'http://example.com/yourls-api.php', api_key: '313378483' }
