# == Schema Information
#
# Table name: articles
#
#  id         :bigint           not null, primary key
#  body       :text
#  status     :string           default("draft")
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_articles_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

RSpec.describe Article, type: :model do
  context "タイトルと内容が入力されている" do   # 自分のテスト
    let!(:article) do
      Article.new({ title: "これは10文字以上のタイトルです。", body: "あああ" })
    end
    it "記事を保存できる" do
      expect(article["title"]).to be_present
      expect(article["body"]).to be_present
    end
  end

  context "タイトルと本文が入力されているとき" do
    let(:article) { build(:article) }

    it "下書き状態の記事が作成できる" do
      expect(article).to be_valid

      expect(article.status).to eq "draft"
    end
  end
end
