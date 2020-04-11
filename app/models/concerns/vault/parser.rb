require 'vault_parser'

module Vault::Parser
  extend ActiveSupport::Concern

  def parse
    VaultParser.new(self).parse
  end
end