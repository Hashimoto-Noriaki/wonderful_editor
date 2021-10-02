require "rails_helper"

RSpec.describe "Api::V1::Articles", type: :request do
  describe "GET /article" do   # index
    subject { get(api_v1_articles_path) }

    before { create_list(:article, 3) }

    it "記事一覧が取得できる" do
      subject

      res = JSON.parse(response.body)
      expect(res.length).to eq 3
      expect(res[0].keys).to eq ["id", "title", "updated_at", "user"]
      expect(response).to have_http_status(:ok)
    end
  end

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

  describe "POST/articles" do # create
    subject { post(api_v1_articles_path, params: params, headers: headers) }

    context "適切なパラメーターを送信した時" do
      let(:params) { { article: attributes_for(:article) } }
      let(:current_user) { create(:user) }
      let(:headers) { current_user.create_new_auth_token }
      it "記事のレコードが作成される" do
        expect { subject }.to change { Article.count }.by(1)
        res = JSON.parse(response.body)
        expect(res["title"]).to eq params[:article][:title]
        expect(res["body"]).to eq params[:article][:body]
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe "PATCH/api/v1/articles/:id" do # update
    subject { patch(api_v1_article_path(article.id), params: params, headers: headers) }

    let(:params) { { article: attributes_for(:article) } }
    let(:current_user) { create(:user) }
    let(:article_id) { article.id }
    let(:article) { create(:article) }
    let(:headers) { current_user.create_new_auth_token }
    #  before { allow_any_instance_of(Api::V1::BaseApiController).to receive(:current_user).and_return(current_user) }
    it "任意の記事のレコードを更新できる" do
      expect { subject }.to change { article.reload.title }.from(article.title).to(params[:article][:title]) &
                            change { article.reload.body }.from(article.body).to(params[:article][:body])
      expect(response).to have_http_status(:ok)
    end
  end

  describe "DELETE/api/v1/article" do
    subject { delete(api_v1_article_path(article_id), headers: headers) }

    let(:params) { { article: attributes_for(:article) } }
    let(:current_user) { create(:user) }
    let(:article_id) { article.id }
    # let!(:article) { create(:article) }
    let(:headers) { current_user.create_new_auth_token }
    let!(:article) { create(:article, user: current_user) }
    fit "任意の記事のレコードを削除できる" do
      expect { subject }.to change { Article.count }.by(-1)
      expect(response).to have_http_status(:no_content)
    end
  end
end
