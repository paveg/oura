# frozen_string_literal: true

require 'oauth2'
module Oura
  # Oura::Client is client class.
  class Client
    attr_reader :access_token, :oauth_client

    def initialize(redirect_uri: 'http://localhost:8080/oauth2/callback')
      @oauth_client = OAuth2::Client.new(
        ENV['OURA_CLIENT_ID'],
        ENV['OURA_CLIENT_SECRET'],
        Oura::Constants::OAUTH_OPTIONS
      )
      puts @oauth_client.auth_code.authorize_url(redirect_uri: redirect_uri)
      puts 'Please, input your secret'
      code = gets.chomp
      @access_token = token(code, redirect_uri)
    end

    def token(code, redirect_uri)
      @oauth_client.auth_code.get_token(
        code,
        redirect_uri: redirect_uri,
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
