# frozen_string_literal: true

require 'oura/version'
require 'oura/constants'
require 'oura/client'
require 'active_support'
require 'active_support/core_ext'
require 'oura/model/base'
require 'oura/model/user_information'
require 'oura/model/activity'
require 'oura/model/sleep_period'
require 'oura/model/readiness'

module Oura
  class Error < StandardError; end
  # Your code goes here...
end
