# frozen_string_literal: true

require 'oura/model/base'

module Oura
  module Model
    # Oura::Mode::UserInformation is UserInformation Model.
    class UserInformation < ::Oura::Model::Base
      attr_reader :gender, :weight, :height, :date, :user_id, :email, :age
    end
  end
end
