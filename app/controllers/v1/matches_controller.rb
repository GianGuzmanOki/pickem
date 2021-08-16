module V1
  class MatchesController < ApiV1Controller
    skip_before_action :require_login, only: :index
    def index
      @matches = Match.page(params[:page]).per(4)
      render json: @matches, each_serializer: MatchSerializer, meta: meta_attributes(@matches)
    end

    private
    def meta_attributes(collection, extra_meta = {})
      {
        current_page: collection.current_page,
        next_page: collection.next_page,
        prev_page: collection.prev_page,
        total_pages: collection.total_pages,
        total_count: collection.total_count
      }.merge(extra_meta)
    end
  end
end
