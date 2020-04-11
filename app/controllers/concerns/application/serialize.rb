# frozen_string_literal: true

module Application::Serialize
  extend ActiveSupport::Concern

  def self.serialize_list(collection)
  	return [] if collection.blank?

    ActiveModelSerializers::SerializableResource.new(collection)
  end

  def self.serialize(object)
  	return nil if object.blank?

    ActiveModelSerializers::SerializableResource.new(object)
  end
end
