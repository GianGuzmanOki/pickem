module Admin
  module V1
    class MatchQuestionsController < ApiV1AdminController
      def mark_winner
        match_question = MatchQuestion.find_by(id: params[:match_question_id])
        if match_question
          if match_question.update(winner_id: params[:winner])
            PicksUpdateWorker.perform_async(match_question.id)
            render json: { message: 'Question updated' }
          else
            render json: { message: 'There was an error' }
          end
        else
          render json: { message: 'Question doesnt exists' }
        end
      end
    end
  end
end
