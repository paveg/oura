# frozen_string_literal: true

require 'oura/model/base'
module Oura
  module Model
    # Oura::Mode::Readiness is Readiness Model.
    class Readiness < ::Oura::Model::Base
      attr_reader :readiness

      ATTRIBUTES = %i[
        score_activity_balance
        score_resting_hr
        score
        period_id
        score_temperature
        score_sleep_balance
        summary_date
        score_previous_day
        score_previous_night
        score_recovery_index
      ].freeze

      ATTRIBUTES.map { |k| k.to_s.pluralize }.each.with_index do |pluralized_name, index|
        define_method pluralized_name do
          readiness.map { |h| h[ATTRIBUTES[index]] }
        end
      end

      def average_score
        average_by_array(scores)
      end

      def average_resting_hr
        average_by_array(score_resting_hrs)
      end

      private

      def average_by_array(array)
        array.sum.to_f / array.size
      end
    end
  end
end
