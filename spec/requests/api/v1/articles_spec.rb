require "rails_helper"

RSpec.describe "Api::V1::Articles", type: :request do
  describe "GET /article" do   # index
    subject { get(api_v1_articles_path) }

    before { create_list(:article, 3) }
    # binding.pry

    it "記事一覧が取得できる" do
      subject
      binding.pry
      res = JSON.parse(response.body)
      expect(res.length).to eq 3
      expect(res[0].keys).to eq ["id", "title", "updated_at", "user"]
      expect(response).to have_http_status(:ok)
    end
  end

  describe "GET /Articles/:id" do # show
    context "指定したidの記事が存在する時" do
      subject { get(api_v1_articles_path(article_id)) }

      let(:article) { create(:article) }
      let(:article_id) { article.id }
      it "見たい記事詳細を取得できる" do
        # binding.pry
        expect(response).to have_http_status(:ok)
      end
    end

    context "指定したidの記事が存在しない時" do
      let(:article_id) { 10_000_000_000_000_000_000 }
      it "記事が見つからない" do
        subject
      end
    end
  end
end
