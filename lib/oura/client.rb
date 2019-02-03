# frozen_string_literal: true

require 'oauth2'
require 'oura/apis/user_information'
require 'oura/apis/activity'
require 'oura/apis/sleep_period'
require 'oura/apis/readiness'

module Oura
  # Oura::Client is client class.
  class Client
    include Oura::Apis::UserInformation
    include Oura::Apis::SleepPeriod
    include Oura::Apis::Activity
    include Oura::Apis::Readiness

    attr_reader :access_token, :oauth_client

    def initialize(access_token: nil)
      @oauth_client = OAuth2::Client.new(
        ENV['OURA_CLIENT_ID'], ENV['OURA_CLIENT_SECRET'], Oura::Constants::OAUTH_OPTIONS
      )
      @access_token = if ENV['DEVELOPMENT']
                        puts @oauth_client.auth_code.authorize_url(redirect_uri: ::Oura::Constants::CALLBACK_URI)
                        puts 'Please, input your secret'
                        code = gets.chomp
                        token(code)
                      else
                        raise if access_token.nil?

                        OAuth2::AccessToken.new(@oauth_client, access_token)
                      end
    end

    private

    def token(code)
      @oauth_client.auth_code.get_token(
        code,
        redirect_uri: ::Oura::Constants::CALLBACK_URI,
        headers: { 'Authorization' => "Bearer #{ENV['AUTHORIZE_HEADER_CODE']}" }
      )
    end
  end
end
