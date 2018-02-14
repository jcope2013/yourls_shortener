module Yourls
  module Configuration
    extend self

    # TODO: (dysnomian) Add a method to crunch these into a params hash
    #   intelligently as they are present.

    def to_params
      {}.tap do |fields|
        YOURLS_CONFIG.each do |name, contents|
          fields[translate(name.to_sym)] = contents
        end
      end
    end

    def translate(name)
      dictionary = {
        api_key: :signature
      }
      dictionary.fetch(name, name)
    end

    def api_key
      YOURLS_CONFIG.fetch(:api_key, nil)
    end

    def api_endpoint
      redis = YOURLS_CONFIG.fetch(:redis, nil)
      if redis
        api_endpoint = redis.get("YOURLS_ENDPOINT_OVERRIDE")
        return api_endpoint unless api_endpoint.nil?
      end
      YOURLS_CONFIG.fetch(:api_endpoint, nil)
    end

    def domain
      YOURLS_CONFIG.fetch(:domain, domain_from_endpoint)
    end

    def username
      YOURLS_CONFIG.fetch(:username, nil)
    end

    def password
      YOURLS_CONFIG.fetch(:password, nil)
    end

    def timeout
      YOURLS_CONFIG.fetch(:timeout, 20)
    end

    def open_timeout
      YOURLS_CONFIG.fetch(:open_timeout, 20)
    end

    def format
      'json'
    end

    private

    def domain_from_endpoint
      return nil unless api_endpoint
      URI.parse(api_endpoint).host
    end
  end
end
