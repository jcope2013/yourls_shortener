module Yourls
  module Expand
    include Requestable
    extend self

    def url(url)
      return url unless already_shortened?(url)
      longurl_from(expand_request(url))
    end

    private

    def expand_request(url)
      RestClient.get(host, params: expand_params(url))
    end

    def expand_params(url)
      base_params.merge({
        action:       'expand',
        shorturl:     url
      })
    end

    def longurl_from(results)
      JSON.parse(results).fetch('longurl')
    end
  end
end
