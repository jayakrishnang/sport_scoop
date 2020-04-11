module PointsTable
  module Calculator
    def self.short
      Team.all.map { |team| team.attributes.slice('short_name', 'wins', 'losses', 'points') }
    end

    def self.long
      Team.all.map { |team| team.attributes.slice('short_name', 'name', 'wins', 'losses', 'no_results',
                                                  'points', 'net_run_rate', 'logo') }
    end     
  end
end