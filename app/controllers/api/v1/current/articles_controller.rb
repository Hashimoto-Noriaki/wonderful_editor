module Api::V1
  class Api::V1::Current::ArticlesController < BaseApiController
    before_action :authenticate_user!
    def index
      articles = current_user.articles.published.orderf(updated_at: :desc)
      render json: articles, each_serializer: Api::V1::ArticlePreviewSerializer
    end
  end
end
