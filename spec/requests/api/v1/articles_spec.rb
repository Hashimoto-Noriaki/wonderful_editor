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

  # allow_any_instance_of(WeatherBot).to receive(:twitter_client).and_return(twitter_client_mock)



  describe "POST/apio/v1/articles" do  #create
    subject { post(api_v1_articles_path, params: params) }

    context "適切なパラメーターを送信した時" do
      let(:params) { { article: attributes_for(:article) } }
      let(:current_user) { create(:user) }
      before { allow_any_instance_of(Api::V1::BaseApiController).to receive(:current_user).and_return(current_user) }
      fit "記事のレコードが作成される" do
      #  expect{subject}.to change {Article.count}.by(1)
      expect{subject}.to change {Article.where(user_id: current_user.id).count}.by(1)
      #  binding.pry
      res = JSON.parse(response.body)
      # binding.pry
      expect(res["body"]).to eq params[:article][:body]
      expect(res["title"]).to eq params[:article][:title] #ここが通らない データべーすに問題あり　userと紐付けできていない 
      #binding.pryを入れる.ストロングパラメーターに入れる。table plus確認　userと紐付けできていない。
       expect(response).to have_http_status(:ok)
      end
    end

    context "適切なパラメーターを送信した時" do
      let(:params) {  attributes_for(:article)  }
      it "エラーする" do
        # binding.pry
      # expect{subject}.to raise_error(ActionController::ParameterMissing)
      end
    end
  end




  describe "PATCH/api/v1/articles/:id" do  #update
    subject {patch(api_v1_article_path(article_id),params: params)}
    let(:params) { { article: attributes_for(:article) } }
    let(:current_user) {create(:user)}
    # before { allow_any_instance_of(Api::V1::BaseApiController).to receive(:current_user).and_return(current_user) }
    fit "任意のユーザーのレコードを更新できる" do
            # expect{subject}.to change 
    end
  end


  



end
