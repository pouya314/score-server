class Solution < ActiveRecord::Base
  belongs_to :challenge
  belongs_to :team
  
  before_save :ensure_team_does_not_submit_same_answer_twice
  
  private
    def ensure_team_does_not_submit_same_answer_twice
      if Solution.where({challenge_id: self.challenge_id, team_id: self.team_id}).exists?
        false
      end
    end
end
