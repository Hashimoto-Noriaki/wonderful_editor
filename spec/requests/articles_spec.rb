require "rails_helper"

RSpec.describe "Api::V1::Articles", type: :request do
  describe "GET /Article" do
    subject { get(api_v1_articles_path) }

    let(:article) { create_list(:article, 3) }
    it "記事一覧が取得できる" do
      subject
      # res = JSON.parse(response.body)
      expect(response).to have_http_status(:ok)
    end
  end

  describe "GET /Articles/:id" do
    context "指定したidの記事が存在する時" do
      subject { get(api_v1_articles_path(article_id)) }

      let(:article) { create(:article) }
      let(:article_id) { article.id }
      it "見たい記事詳細を取得できる" do
        # expect(response).to have_http_status(200)
      end
    end
  end

  context "指定したidの記事が存在しない時" do
    let(:article_id) { 10_000_000_000_000_000_000 }
    it "記事が見つからない" do
      subject
    end
  end

  describe "POST/articles" do
    subject{post(api_v1_articles_path)}
    context "正しいパラメーターを送信した時" do
      let(:params) do
      {article: attributes_for(:article)}
      end
      # let(:cureent_user){create(:user)}
      before{allow_any_instance_of(Api::V1::BaseApiController).to receive (:current_user)}
    it "記事のレコードを作成できる" do
      #  expect{subject}.to change {Article.count}.by(1)
      #  res = JSON.parse(response.body)
      # expect(["title"]).to eq params[:article][:title]
      # expect(["body"]).to eq params[:article][:body]
      # expect(response).to have_http_status(200)
    end
    end

    context "謝ったパラメーターを送信した時" do       #ここはok!
      let(:params)  { attributes_for(:article)}
      fit "記事のレコードが作成できない" do
        expect{subject}.to raise_error(ActionController::ParameterMissing)
      end
    end
  end


#  end

end
