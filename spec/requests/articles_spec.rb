require "rails_helper"

RSpec.describe "Articles", type: :request do
  describe "GET /articles" do
    subject {get(api_v1_articles_path)}

    before { create_list(:article,3)}
    fit "記事一覧が取得できる" do
    
      res = JSON.parse(response.body)
      expect(res[0].length).to eq 3

      expect(response.body).to have_http_status(200)

    
end
end

end
