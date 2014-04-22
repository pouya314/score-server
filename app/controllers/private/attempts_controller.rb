class Private::AttemptsController < ApplicationController
  layout "admin"

  before_action :authenticate_admin!

  def index
    @attempts = Attempt.order(created_at: :desc)
  end
end
