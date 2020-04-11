# frozen_string_literal: true

class MatchDetailSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :number, :name, :start_time, :url, :status, :short_name,
             :banner, :description

  def banner
    rails_blob_path(object.banner, only_path: true) if object.banner.attached?
  end
end
