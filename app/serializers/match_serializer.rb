# frozen_string_literal: true

class MatchSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :number, :name, :start_time, :url, :status, :short_name, :banner,
             :description, :summary_message

  def banner
    ENV['HOME_PATH'] + rails_blob_path(object.banner, only_path: true) if object.banner.attached?
  end
end
