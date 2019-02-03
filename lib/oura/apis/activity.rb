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
      # @example
      # {
      #   "activity": [{"summary_date": "2016-10-11", ...}, {"summary_date": "2016-10-12", ...}, ...]
      # }
      # @return [OAuth2::Response]
      def activity(start_date:, end_date:)
        sdate, edate = [start_date, end_date].map { |date| transform_date(date) }
        get(REQUEST_PATH, params: { start: sdate, end: edate })
      end
    end
  end
end
