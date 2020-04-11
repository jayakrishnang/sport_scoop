# frozen_string_literal: true

class MatchDetailSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :number, :name, :start_time, :url, :status, :short_name,
             :banner, :description, :summary_message, :summary, :scorecard

  def banner
    ENV['HOME_PATH'] + rails_blob_path(object.banner, only_path: true) if object.banner.attached?
  end

  def scorecard
  	return nil if object.vault.blank?

    ActiveModelSerializers::SerializableResource.new(object.vault, serializer: VaultSerializer)
  end
end
