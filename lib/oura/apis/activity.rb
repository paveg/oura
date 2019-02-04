# frozen_string_literal: true

require 'oura/utils/api'

module Oura
  module Apis
    # Activity summary contains daily activity summary values and detailed activity levels.
    module Activity
      include ::Oura::Api

      REQUEST_PATH = '/v1/activity'

      # @param [Date] start_date
      # @param [Date] end_date
      # @example response body
      # {
      #   "activity": [{"summary_date": "2016-10-11", ...}, {"summary_date": "2016-10-12", ...}, ...]
      # }
      # @return [Oura::Model::Activity]
      def activity(start_date:, end_date:)
        sdate, edate = [start_date, end_date].map { |date| transform_date(date) }
        response_body = get(REQUEST_PATH, params: { start: sdate, end: edate }).body
        symbolized_json = JSON.parse(response_body).deep_symbolize_keys

        ::Oura::Model::Activity.new(symbolized_json)
      end
    end
  end
end
