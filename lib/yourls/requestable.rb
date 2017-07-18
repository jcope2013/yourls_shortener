module Yourls
  module Requestable
    require 'rest_client'

    def already_shortened?(url)
      regex = Regexp.new(domain)
      url =~ regex
    end

    def base_params
      { format: 'json' }.merge(authentication)
    end

    def authentication
      if config.api_key.present?
        { signature: config.api_key }
      else
        {
          username: config.username,
          password: config.password
        }
      end
    end

    def no_auth_configured?
      config.api_key.blank? && config.username.blank? && config.password.blank?
    end

    def format
      { format: 'json' }
    end

    def api_key
      config.api_key
    end

    def host
      config.api_endpoint
    end

    def domain
      config.domain
    end

    def config
      Yourls::Configuration
    end
  end
end
