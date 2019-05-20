# frozen_string_literal: true

module Oura
  module Utils
    # ::Oura::Utils::Api is utility api module.
    module Api
      private

      # @param [<String>] date
      # @param [<Date>] date
      # @return [String] date string
      def transform_date(date)
        return Date.parse(date).strftime('%Y-%m-%d') if date.is_a?(String)
        return date.strftime('%Y-%m-%d') if date.is_a?(Date)

        raise ArgumentError, 'invalid date'
      end

      # @param [String] path
      # @param [Hash] params
      # @return [OAuth2::Response]
      def get(path, params = {})
        raise StandardError, 'Not found access_token' if @access_token.nil?

        @access_token.get(path, params)
      end
    end
  end
end
