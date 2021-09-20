require "rails_helper"

RSpec.describe "Api::V1::Auth::Registrations", type: :request do
  describe "POST api/v1/auth" do
    subject { post(api_v1_user_registration_path, params: params) }

    context "パラメーターを送信する時" do
      let(:params) { attributes_for(:user) }
      # binding.pry
      it "新規登録できる" do
        expect { subject }.to change { User.count }.by(1)
        # binding.pry
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
  end
end
