class ChallengesController < ApplicationController
  before_action :set_challenge, only: [:show, :edit, :update, :destroy, :verify_answer]
  before_action :set_team, only: [:verify_answer]
  before_action :authenticate_team!
  before_action :ensure_team_does_not_submit_same_answer_twice, only: [:verify_answer]
  before_action :ensure_team_cannot_access_show_page_of_a_challenge_that_they_have_already_solved, only: [:show]
  

  # GET /challenges
  # GET /challenges.json
  def index
    @challenges = Challenge.all
    @challenge_categories = @challenges.group_by { |c| c.category }
    
    @challenge_ids_solved_by_team = []
    solutions_by_team = Solution.select(:challenge_id).where(team_id: current_team.id)
    solutions_by_team.each do |solution|
      @challenge_ids_solved_by_team << solution.challenge_id
    end
  end

  # GET /challenges/1
  # GET /challenges/1.json
  def show
  end

  # GET /challenges/new
  def new
    @challenge = Challenge.new
  end

  # GET /challenges/1/edit
  def edit
  end

  # POST /challenges
  # POST /challenges.json
  def create
    @challenge = Challenge.new(challenge_params)

    respond_to do |format|
      if @challenge.save
        format.html { redirect_to challenges_path, notice: 'Challenge was successfully created.' }
        format.json { render :show, status: :created, location: @challenge }
      else
        format.html { render :new }
        format.json { render json: @challenge.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /challenges/1
  # PATCH/PUT /challenges/1.json
  def update
    respond_to do |format|
      if @challenge.update(challenge_params)
        format.html { redirect_to @challenge, notice: 'Challenge was successfully updated.' }
        format.json { render :show, status: :ok, location: @challenge }
      else
        format.html { render :edit }
        format.json { render json: @challenge.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /challenges/1
  # DELETE /challenges/1.json
  def destroy
    @challenge.destroy
    respond_to do |format|
      format.html { redirect_to challenges_url }
      format.json { head :no_content }
    end
  end

  # Ajax call that verifies answer submitted 
  # and returns appropriate response (in JS format)
  def verify_answer
    @challenge_answered_correctly = false
    if params[:answer] == @challenge.solution
      solution_record = Solution.new(team_id: @team.id, challenge_id: @challenge.id)
      solution_record.save
      @team.current_score += @challenge.point
      @team.save
      @challenge_answered_correctly = true
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_challenge
      @challenge = Challenge.find(params[:id])
    end

    def set_team
      @team = Team.find(params[:team_id])
    end
    
    def ensure_team_does_not_submit_same_answer_twice
      if Solution.where({challenge_id: @challenge.id, team_id: @team.id}).exists?
        render "notallowed"
      end
    end
    
    def ensure_team_cannot_access_show_page_of_a_challenge_that_they_have_already_solved
      if Solution.where({challenge_id: @challenge.id, team_id: current_team.id}).exists?
        redirect_to challenges_url, notice: "You cannot access that challenge, because you have already solved it!"
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def challenge_params
      params.require(:challenge).permit(:category, :name, :point, :question, :solution)
    end
end
