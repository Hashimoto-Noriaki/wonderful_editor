require "rails_helper"

RSpec.describe "Api::V1::Auth::Registrations", type: :request do
  describe "POST /api/v1/auth" do
    subject { post(api_v1_user_registration_path, params: params) }

    context "パラメーターを送信する時" do
      let(:params) { attributes_for(:user) }
      it "新規登録できる" do
        # expect { subject }.to change { User.count }.by(0)
        # expect(response).to have_http_status(:unprocessable_entity)
        JSON.parse(response.body)
      end
    end
  end
end
