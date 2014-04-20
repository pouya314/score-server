class IndexController < ApplicationController
  layout 'publictem'

  def status
    challs = Challenge.order(created_at: :asc)

    @ch_names = challs.map {|i| i.name}
    ordered_challenges = challs.map {|i| i.id}

    @tabledata = {}
    Team.all.each do |team|
      solved = team.solutions.select(:challenge_id).map {|i| i.challenge_id}
      team_scores_list = []

      for challenge in ordered_challenges
        if solved.include? challenge
          team_scores_list << 1
        else
          team_scores_list << 0
        end
      end

      @tabledata[team.name] = team_scores_list
    end
  end


  def chart
    @teams = Team.all
  end


  def screen
    @screenshot = Screenshot.last
  end


  def ranking
    @ranking_list = Team.order(current_score: :desc)
  end
end
