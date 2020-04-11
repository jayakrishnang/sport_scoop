class HomeController < ApplicationController
  def index
    @current_match = Matches::Schedule.next_match
    @last_match = Matches::Schedule.last_match
    @upcoming_matches = Matches::Schedule.upcoming(4)
    @points = PointsTable::Calculator.short
    @news = News.last_match_update
    unless request.format.html?
      render status: :ok, json: {
        message: 'success',
        data: {
          current_match: Application::Serialize.serialize(@current_match),
          last_match: Application::Serialize.serialize_list(@last_match),
          upcoming_matches: Application::Serialize.serialize_list(@upcoming_matches),
          point_table: @points,
          news: @news
        }
      }
    end
  end

  def points_table
    @points_table = PointsTable::Calculator.long
    if request.format.html?
      render 'home/points_table'
    else
      render status: :ok, json: {
        message: 'success',
        data: {
          points_table: @points_table
        }
      }
    end
  end
end
