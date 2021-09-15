require "rails_helper"

RSpec.describe "Api::V1::Articles", type: :request do
  describe "GET /Article" do   # index
    subject { get(api_v1_articles_path) }

    let(:article) { create_list(:article, 3) }
    it "記事一覧が取得できる" do
      subject
      # binding.pry
      JSON.parse(response.body)
      expect(response).to have_http_status(:ok)
    end
  end

  describe "GET /Articles/:id" do # show
    context "指定したidの記事が存在する時" do
      subject { get(api_v1_articles_path(article_id)) }

      let(:article) { create(:article) }
      let(:article_id) { article.id }
      it "見たい記事詳細を取得できる" do
        # expect(response).to have_http_status(:ok)
      end
    end
  end

  context "指定したidの記事が存在しない時" do
    let(:article_id) { 10_000_000_000_000_000_000 }
    it "記事が見つからない" do
      subject
    end
  end
end

# end