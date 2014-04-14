class Solution < ActiveRecord::Base
  belongs_to :challenge
  belongs_to :team
end
