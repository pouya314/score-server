class IndexController < ApplicationController
  def status
  end

  def chart
    # @time = Team.last.created_at.utc.to_i*1000
    # logger.debug "time passed to template => #{@time}"
    
    @teams = Team.all
  end

  def screen
  end
  
  def ranking
    @ranking_list = Team.order(current_score: :desc)
  end
end
