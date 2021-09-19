require "rails_helper"

RSpec.describe "Api::V1::Articles", type: :request do
  describe "GET /articles" do
    subject { get(api_v1_article_path) }

    let(:articles) { create(:article) }
    it "記事一覧が取得できる" do
      # binding.pry
      # res = JSON.parse(response.body)　　　　　　#なぜbodyが定義されていない？
      #    expect(response).to have_http_status(200)
    end
  end
end
