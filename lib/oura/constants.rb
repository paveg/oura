# frozen_string_literal: true

module Oura
  module Constants
    API_ENDPOINT = 'https://api.ouraring.com'
    OAUTH_ENDPOINT = 'https://cloud.ouraring.com'

    OAUTH_OPTIONS = {
      authorize_url: "#{OAUTH_ENDPOINT}/oauth/authorize",
      token_url: "#{API_ENDPOINT}/oauth/token",
      site: API_ENDPOINT
    }.freeze
  end
end
