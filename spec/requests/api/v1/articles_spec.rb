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
end
