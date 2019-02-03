# frozen_string_literal: true

module Oura
  # Oura::Api is utility api module.
  module Api
    private

    def transform_date(date)
      return Date.parse(date).strftime('%Y-%m-%d') if date.is_a?(String)
      return date.strftime('%Y-%m-%d') if date.is_a?(Date)

      raise ArgumentError, 'invalid date'
    end
  end
end
