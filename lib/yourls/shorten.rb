module Yourls
  module Shorten
    include Requestable
    extend self

    def url(url)
      return url if already_shortened?(url) || no_auth_configured?

      shorturl_from(shorturl_request(url))
    end

    private

    def shorturl_request(url)
      RestClient.get(host, params: shorturl_params(url))
    end

    def shorturl_params(url)
      base_params.merge({
        url:          url,
        action:       'shorturl',
        format:       'json'
      })
    end

    def shorturl_from(results)
      JSON.parse(results).fetch('shorturl')
    end
  end
end
