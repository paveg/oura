# frozen_string_literal: true

require 'oura/utils/api'

module Oura
  module Apis
    # UserInformation is user information.
    module UserInformation
      include ::Oura::Api

      REQUEST_PATH = '/v1/userinfo'
      # @example
      # {
      #   "age": 27,
      #   "weight": 80,
      #   "gender": "male",
      #   "email": "john.doe@the.domain"
      # }
      # @return [OAuth2::Response]
      def userinfo
        get(REQUEST_PATH)
      end
    end
  end
end
