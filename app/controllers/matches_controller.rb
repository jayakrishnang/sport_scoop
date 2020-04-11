class MatchesController < ApplicationController
  before_action :fetch_match, only: [:show]

  def index
    case params[:category]
    when 'recent'
      @matches = Matches::Schedule.all_matches(params[:limit], params[:offset])
    else
      @matches = Matches::Schedule.all_matches(params[:limit], params[:offset])
    end
    unless request.format.html?
      render_collection(@matches, name: 'matches')
    end
  end

  def show
    @scorecard = @match.vault if @match.vault_id.present?
    unless request.format.html?
      render_object(@match, name: 'match', serializer: MatchDetailSerializer)
    end
  end

  private

  def fetch_match
    match_id = params[:match_id] || params[:id] 
    @match = Match.find(match_id)
  end
end
