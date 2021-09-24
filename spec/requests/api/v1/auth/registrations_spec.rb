require "rails_helper"

RSpec.describe "Api::V1::Auth::Registrations", type: :request do
  describe "POST api/v1/auth" do
    subject { post(api_v1_user_registration_path, params: params) }

    context "パラメーターを送信する時" do
      let(:params) { attributes_for(:user) }

      it "新規登録できる" do
        expect { subject }.to change { User.count }.by(1)

        expect(response).to have_http_status(:ok)
        JSON.parse(response.body)
      end
    end
  end

  # RSpec.describe "Api::V1::Auth::Sessions", type: :request do
  describe "POST /api/v1/auth/sign_in" do
    subject { post(api_v1_user_session_path, params: params) }

    context "リクエストをする時" do
      let(:user) { create(:user) }
      let(:params) { { name: user.name, email: user.email, password: user.password } }
      it "ログインできる" do
        subject
        JSON.parse(response.body)
        expect(response.headers["access-token"]).to be_present
        expect(response.headers["client"]).to be_present
        expect(response.headers["expiry"]).to be_present
        expect(response).to have_http_status(:ok)
      end
    end

    context "名前が正しくない時" do
      let(:user) { create(:user) }
      let(:params) { { name: "うううううう" } }
      it "ログインできない" do
        subject
        res = JSON.parse(response.body)
        expect(res["success"]).to be_falsey
        expect(response.headers["access-token"]).to be_blank
        expect(response.headers["client"]).to be_blank
        expect(response.headers["expiry"]).to be_blank
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context "emailが正しく入力されていない時" do
      let(:user) { create(:user) }
      let(:params) { { email: "fffffffffff@example.com" } }
      it "ログインできない" do
        subject
        res = JSON.parse(response.body)

        expect(res["errors"]).to include("Invalid login credentials. Please try again.")
        expect(response.headers["access-token"]).to be_blank
        expect(response.headers["client"]).to be_blank
        expect(response.headers["expirly"]).to be_blank
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  describe "DElETE /api/v1/auth/sign_out" do
    subject { delete(destroy_api_v1_user_session_path, headers: headers) }

    context "ログインしている時" do
      let(:user_id) { user.id }
      let(:user) { create(:user) }
      let(:headers) { user.create_new_auth_token }
      it "ログアウトする" do
        subject
        res = JSON.parse(response.body)
        expect(res["success"]).to be_truthy
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
