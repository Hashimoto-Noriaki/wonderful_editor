require "rails_helper"

RSpec.describe "Api::V1::Current::Articles", type: :request do
  let(:current_user) { create(:user) }
  let(:headers) { current_user.create_new_auth_token }
  describe "GET/api/v1/articles" do
    subject { get(api_v1_articles_path, headers: headers) }

    let(:article1) { create(:article, :published, user: current_user) }
    let(:article2) { create(:article, :published) }
    # before { create(:article, :draft, user: current_user) }
    # before { create(:article, :published) }
    before do
      create(:article, :draft, user: current_user)
      create(:article, :published)
    end

    it "自分が書いた公開記事の一覧を取得できる" do
      subject
      res = JSON.parse(response.body)
      expect(response).to have_http_status(:ok)
      expect(res.length).to eq 1
    end
  end
end
