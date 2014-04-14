class Team < ActiveRecord::Base
  before_create :set_current_score_to_zero
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :solutions

  private
    def set_current_score_to_zero
      self.current_score = 0
    end
end
