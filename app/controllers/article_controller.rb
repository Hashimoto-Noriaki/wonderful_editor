class ArticleController <   BaseApiController  
            #  ApplicationController
    def index
        articles = Article.all
        articles = Article.order(:updated_at,:asc)
        render json: articles, each_serializer: ArticlePreviewSerializer
      end

      def show
        @article = Article.find_by(id: params[:id])
        render json: { 'article': @article }
      end

    end
end



# def  show
    # @article = Article.find_by(id: params[:id])
    # render json: {'articles': @articles}
    # end


# モデル.order(:キー名 [ :並び順])


# format.json { render json: @article, root: false }