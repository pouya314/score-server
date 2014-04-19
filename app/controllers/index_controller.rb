class IndexController < ApplicationController
  def status
    # Challenge.order(created_at: :asc).select(:id).map {|i| i.id }
  end

  def chart
    @teams = Team.all
  end

  def screen
  end
  
  def ranking
    @ranking_list = Team.order(current_score: :desc)
  end
end
