module Api::V1
class ArticlesController < BaseApiController
    def index
        articles = Article.order(updated_at: :desc)
        render json: articles, each_serializer: Api::V1::ArticlePreviewSerializer
      end

      # def show
      #   article = Article.find_by(id: params[:id])
      #   render json: { 'article': @article }
      # end


      # def create 
      #   article = Article.new(article_params)
      #   article.save
      #   redirect_to article
      #   end

    # def updated
    #   article = Article.find(params[:id])
 
    #   # DBに登録できた場合
    #   article.update(article_params)
    #       # 記事ページに遷移する
    #       redirect_to article
    #   end 

      # def destroy
      #     article = Article.find(params[:id])
      #      if article.user_id == current_user.id
      #       article.destroy 
      #    end
      #   end

      #   private
      #   def article_params
      #       params.require(:article).permit(:title, :text)
      #   end

  end
end









# モデル.order(:キー名 [ :並び順])


# format.json { render json: @article, root: false }
