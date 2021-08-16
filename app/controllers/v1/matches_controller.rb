module V1
  class MatchesController < ApiV1Controller
    skip_before_action :require_login, only: :index
    def index
      render json: Match.all
    end
  end
end
