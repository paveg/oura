# frozen_string_literal: true

require 'oura/utils/api'

module Oura
  module Apis
    # UserInformation is user information.
    module UserInformation
      include ::Oura::Utils::Api

      REQUEST_PATH = '/v1/userinfo'
      # @example response body
      # {
      #   "age": 27,
      #   "weight": 80,
      #   "gender": "male",
      #   "email": "john.doe@the.domain"
      # }
      # @return [Oura::Model::UserInformation]
      def userinfo
        response_body = get(REQUEST_PATH).body
        symbolized_json = JSON.parse(response_body).symbolize_keys

        ::Oura::Model::UserInformation.new(symbolized_json)
      end
    end
  end
end
