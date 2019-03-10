# frozen_string_literal: true

require 'oura/utils/api'

module Oura
  module Apis
    # SleepPeriod is a nearly continuous, longish period of time spent lying down in bed.
    module SleepPeriod
      include ::Oura::Api

      REQUEST_PATH = '/v1/sleep'

      # @param [Date] start_date
      # @param [Date] end_date
      # @example response body
      # {
      #   "sleep": [{"summary_date": "2016-10-11", ...}, {"summary_date": "2016-10-12", ...}, ...]
      # }
      # @return [Oura::Model::SleepPeriod]
      def sleep_period(start_date:, end_date: Time.current.to_date)
        sdate, edate = [start_date, end_date].map { |date| transform_date(date) }
        response_body = get(REQUEST_PATH, params: { start: sdate, end: edate }).body
        symbolized_json = JSON.parse(response_body).deep_symbolize_keys

        ::Oura::Model::SleepPeriod.new(symbolized_json)
      end
    end
  end
end
