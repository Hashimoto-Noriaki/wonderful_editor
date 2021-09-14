module Api::V1
  class ArticlesController < BaseApiController
    def index
      articles = Article.order(updated_at: :desc)
      render json: articles, each_serializer: Api::V1::ArticlePreviewSerializer
    end

    def show
      article = Article.find_by(params[:id])
      render json: article, serializer: Api::V1::ArticleSerializer
    end

    def create
      article = Article.new(article_params)
      article.save!
      render json: article, serializer: Api::V1::ArticleSerializer
    end

    def updated
      article = current_user.articles.find(params[:id])
      #   # DBに登録できた場合
      article.update!(article_params)
      render json: article, serializer: Api::V1::ArticleSerializer
    end

    def destroy
      article = current_user.article.find(params[:id])
      article.destroy!
    end

    private

      def article_params
        params.require(:article).permit(:title, :body)
      end
  end
end

# モデル.order(:キー名 [ :並び順])

# format.json { render json: @article, root: false }
