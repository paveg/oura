# frozen_string_literal: true

require 'oauth2'
module Oura
  # Oura::Client is client class.
  class Client
    attr_reader :access_token, :oauth_client

    def initialize(access_token: nil)
      @oauth_client = OAuth2::Client.new(
        ENV['OURA_CLIENT_ID'],
        ENV['OURA_CLIENT_SECRET'],
        Oura::Constants::OAUTH_OPTIONS
      )

      @access_token = if ENV['DEVELOPMENT']
                        puts @oauth_client.auth_code.authorize_url(redirect_uri: ::Oura::Constants::CALLBACK_URL)
                        puts 'Please, input your secret'
                        code = gets.chomp
                        token(code)
                      else
                        raise if access_token.nil?

                        OAuth2::AccessToken.new(@oauth_client, access_token)
                      end
    end

    def token(code)
      @oauth_client.auth_code.get_token(
        code,
        redirect_uri: ::Oura::Constants::CALLBACK_URL,
        headers: { 'Authorization' => "Bearer #{ENV['AUTHORIZE_HEADER_CODE']}" }
      )
    end

    def user_info
      @access_token.get('/v1/userinfo')
    end

    def sleep_period(start_date:, end_date:)
      @access_token.get('/v1/sleep', params: { start: start_date.to_s, end: end_date.to_s })
    end

    def activity(start_date:, end_date:)
      @access_token.get('/v1/activity', params: { start: start_date.to_s, end: end_date.to_s })
    end

    def readiness(start_date:, end_date:)
      @access_token.get('/v1/readiness', params: { start: start_date.to_s, end: end_date.to_s })
    end
  end
end
