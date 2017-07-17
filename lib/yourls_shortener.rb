module Yourls
  require_relative 'yourls/configuration'
  require_relative 'yourls/errors'

  require_relative 'yourls/requestable'

  # API Actions
  require_relative 'yourls/clicks'
  require_relative 'yourls/expand'
  require_relative 'yourls/shorten'

  require 'active_support/core_ext/object/blank'
end
