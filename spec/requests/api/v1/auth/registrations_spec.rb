require "rails_helper"

RSpec.describe "Api::V1::Auth::Registrations", type: :request do
  describe "POST /V1/auth" do
    subject { post(api_v1_user_registration_path, params: params) }
    context "パラメーターを送信する時" do
      binding.pry
  let(:params) {attributes_for(:user,name: "ぽこぽぽぽ")}
      binding.pry
    fit "新規登録できる" do
      expect { subject }.to change { User.count }.by(1)
       expect(response).to have_http_status(200)
       res = JSON.parse(response.body)
     end
    end
  end

end







      #  describe "POST /api/v1/sign_in" do
      #   subject { post(api_v1_user_registration_path, params: params) }
      #    context "" do

      #     it "" do


      #     end
      #     end

      #   end

# end