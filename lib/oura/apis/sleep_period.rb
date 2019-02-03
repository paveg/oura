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
      # example response
      # {
      #   "sleep": [{"summary_date": "2016-10-11", ...}, {"summary_date": "2016-10-12", ...}, ...]
      # }
      # @return [OAuth2::Response]
      def sleep_period(start_date:, end_date:)
        sdate, edate = [start_date, end_date].map { |date| transform_date(date) }
        @access_token.get(REQUEST_PATH, params: { start: sdate, end: edate })
      end
    end
  end
end
