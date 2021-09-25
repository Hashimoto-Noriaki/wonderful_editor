module Api::V1
  class ArticlesController < BaseApiController
    def index
      articles = Article.order(updated_at: :asc)
      render json: articles, each_serializer: Api::V1::ArticlePreviewSerializer
    end

    def show
      article = Article.find(params[:id])
      render json: article, serializer: Api::V1::ArticleSerializer
    end

    # def create
    #   article = current_user.article.create!(article_params)
    #   render json: article, serializer: Api::V1::ArticleSerializer
    # end

    # def updated
    #   article = current_user.articles.find(params[:id])
    #   #   # DBに登録できた場合
    #   article.update!(article_params)
    #   render json: article, serializer: Api::V1::ArticleSerializer
    # end

    # def destroy
    #   article = current_user.article.find(params[:id])
    #   article.destroy!
    # end

    # private

    #   def article_params
    #     params.require(:article).permit(:title, :body)
    #   end
  end
end

# モデル.order(:キー名 [ :並び順])

# format.json { render json: @article, root: false }

describe "GET /articles/:id" do # show
  subject { get(api_v1_article_path(article_id)) }

  context "指定したidの記事が存在する時" do
    let(:article) { create(:article) }
    let(:article_id) { article.id }
    it "見たい記事詳細を取得できる" do
      subject
      res = JSON.parse(response.body)
      expect(res["title"]).to eq article.title
      expect(res["body"]).to eq article.body
      expect(res["user"]["id"]).to eq article.user.id
      expect(response).to have_http_status(:ok)
    end
  end

  context "指定したidの記事が見つからない時" do
    let(:article_id) { 100_000_000_000_000_000 }
    it "記事が見つからない" do
      expect { subject }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
