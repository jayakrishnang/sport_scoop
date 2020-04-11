module News
  def self.last_match_update
    match = Match.completed.order(end_time: :desc).limit(1).first
    match.present? ? match.summary_message : 'Welcome to IPL 2020 presented by SportScoop!'
  end
end
