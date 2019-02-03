# frozen_string_literal: true

require 'oura/utils/api'

module Oura
  module Apis
    # Readiness tells how ready you are for the day.
    # example data
    # {
    #     "readiness": {
    #         "summary_date": "2016-09-03",
    #         "period_id": 0,
    #         "score": 62,
    #         "score_previous_night": 5,
    #         "score_sleep_balance": 75,
    #         "score_previous_day": 61,
    #         "score_activity_balance": 77,
    #         "score_resting_hr": 98,
    #         "score_recovery_index": 45,
    #         "score_temperature": 86
    #     }
    # }
    module Readiness
      include ::Oura::Api

      REQUEST_PATH = '/v1/readiness'

      # @param [Date] start_date
      # @param [Date] end_date
      # @example
      # {
      #   "readiness": [{"summary_date": "2016-10-11", ...}, {"summary_date": "2016-10-12", ...}, ...]
      # }
      # @return [OAuth2::Response]
      def readiness(start_date:, end_date:)
        sdate, edate = [start_date, end_date].map { |date| transform_date(date) }
        get(REQUEST_PATH, params: { start: sdate, end: edate })
      end
    end
  end
end
