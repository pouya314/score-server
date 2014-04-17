class IndexController < ApplicationController
  def status
  end

  def chart
    @time = Team.last.created_at.utc.to_i*1000
    logger.debug "time passed to template => #{@time}"
  end

  def screen
  end
end
