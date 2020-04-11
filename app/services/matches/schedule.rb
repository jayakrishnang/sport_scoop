# frozen_string_literal: true

module Matches
  module Schedule
    def self.next_match
      match = Match.ongoing.first
      match ||= Match.scheduled.order(:start_time).limit(1).first
      match
    end

    def self.last_match
      Match.completed.order(start_time: :desc).limit(1).first
    end

    def self.upcoming(count)
      matches = Match.scheduled.order(:start_time)
      matches = matches.limit(count) if count.present?
      matches
    end

    def self.recent_matches(limit = 10, offset = 10)
      Match.completed.order(start_time: :desc).limit(limit).offset(offset)
    end

    def self.all_matches(limit = 10, offset = 10)
      Match.order(:start_time).limit(limit).offset(offset)
    end
  end
end