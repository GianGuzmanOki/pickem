module V1
  class PicksController < ApiV1Controller
    def create
      existing_pick = Pick.find_by(match_question_id: params[:match_question_id], user_id: session_user.id)
      if existing_pick
        render json: {message: 'You have already made a pick for this question'}, status: 200
      else
        pick = Pick.new(pick_params)
        pick.user = session_user
        if pick.save
          render json: { message: 'Your pick have been saved!', pick: pick }, status: :ok
        else
          render json: {message: 'There was an error on creation'}, status: 400
        end
      end
    end

    private
    def pick_params
      params.require(:pick).permit(:match_question_id, :team_id)
    end
  end
end
