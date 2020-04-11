# frozen_string_literal: true

class MatchSerializer < ActiveModel::Serializer
  attributes :id, :number, :name, :start_time, :url, :status, :short_name
end
