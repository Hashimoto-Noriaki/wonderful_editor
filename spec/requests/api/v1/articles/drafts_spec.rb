require "rails_helper"

RSpec.describe "Api::V1::Articles::Drafts", type: :request do
  let(:current_user) { create(:user) }
  let(:headers) { current_user.create_new_auth_token }
  describe "GET /api/v1/articles/drafts" do
    subject { get(api_v1_articles_drafts_path, headers: headers) }
    #  let(:current_user) { create(:user) } #自分が書いたテスト
    #  let(:article) {create_list(:user,:draft,3)} #自分が書いたテスト

    let!(:article1) { create(:article, :draft, user: current_user) }
    # let!(:article2) {create(:article,:draft,user:current_user)}
    let!(:article2) { create(:article, :draft) }
    it "記事一覧が取得できる" do
      subject
      res = JSON.parse(response.body)
      expect(res.length).to eq 1
    end
  end

  describe "GET /api/v1/articles/drafts/:id" do
    subject { get(api_v1_articles_draft_path(article_id), headers: headers) }

    # context "指定した id の記事が存在して" do
    let(:article_id) { article.id }
    # context "対象の記事が自分が書いた下書きのとき" do
    let(:article) { create(:article, :draft, user: current_user) }
    it "任意の記事が取得できる" do
      subject
      JSON.parse(response.body)
      expect(response).to have_http_status(:ok)
    end
    # end

    context "下書きをした人が違う時" do
      let(:article) { create(:article, :draft) }
      it "書いた記事がない" do
        expect { subject }.to raise_error(ActiveRecord::RecordNotFound)
        # end
      end
    end
  end
end
