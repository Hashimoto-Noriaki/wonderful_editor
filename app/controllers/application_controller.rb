class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken
  protect_from_forgery with: :null_session
end

# require  "rails_helper"

#  RSpec.describe "Api::V1::Articles", type: :request do

#     describe "GET /articles" do      #index
#         subject { get(api_v1_articles_path)}
#         let(:articles)  { create(:article) }
#         # let(:articles){ create_list(:article, 3)}
#         fit "記事一覧が取得できる" do
#     # res = JSON.parse(response.body)
#     #    expect(response).to have_http_status(200)
#        end
#     end
#    
#

#     describe "GET /articles/:id" do     #show
#           context "指定したidの記事が存在する時" do
#             subject { get(api_v1_articles_path(article_id)) }
#             let(:article) { create(:article) }
#             let(:article_id) { article.id }
#             fit "見たい記事詳細を取得できる" do
#             #  expect(response).to have_http_status(200)
#             end
#           end
#

#           context "指定したidの記事が存在しない時" do
#                 let(:article_id) { 10_000_000_000_000_000_000 }
#                 fit "記事が見つからない" do
#                 end
#             end
#              end

#             # describe "POST /articles" do  #ここからエラー endの文法エラー  #create
#             #         subject { post(api_v1_articles_path params: params) }

#             #          let(:params)  {{article: attributes_for(:article)}}
#             #             let(:article) { create(:user) }
#             #            before { allow_any_instance_of(Api::V1::BaseApiController).to receive(:current_user)

#             #           it "記事のレコードを作成できる" do
#             #              #  expect{subject}.to change {Article.count}.by(1)
#             #              #  res = JSON.parse(response.body)
#             #              # expect(["title"]).to eq params[:article][:title]
#             #              # expect(["body"]).to eq params[:article][:body]
#             #              # expect(response).to have_http_status(200)
#             #           end #it

#             #           let(:params) { attributes_for(:article) }
#             #          it "記事のレコードが作成できない" do
#             #           expect { subject }.to raise_error(ActionController::ParameterMissing)
#             #          end  #it

#             # end #  describe "POST/articles" do

# #             describe "PATCH articles/:id" do # もう一度確認
# #                     subject { patch(articles_path(api_v1_articles_path), params: params) }

# #                     let(:params) do
# #                       { article: { title: Faker::Lorem.words, updated_at: 1.day.ago } }
# #                     end
# #                     let(:articles_id) { article.id }
# #                     let(:article) { create(:article) }
# #                     before { allow_any_instance_of(Api::V1::BaseApiController).to receive(:current_user).and_return(current_user) }

# #                    fit "記事のレコードを更新できる" do
# #                      # binding.pry
#          # expect {subject}.to change {article.reload(article_id).updated_at}.from(article.updated_at).to(params[:article][:updated_at])
# #                       #  expect {subject}.not_to change {article.reload(article_id).body}   #変わらないこと
# #                     end #it
# #                 end
# #                   context "指定したidの記事が存在しない時" do
# #                     let(:article_id) { 10_000_000_000_000_000_000 }
# #                     fit "記事が見つからない" do
# #                       subject
# #                     end   #it
# #                   end   #context
# #             end #describe "PATCHarticles/:id" do

# #     describe "DELETE /articles/:id" do
# #     subject{delete(api_v1_article_path(article_id))}
# #     let(:current_user){create(:article)}
# #     let(:article_id){article.id}
# #     fit "記事のレコードを削除できる" do
# #       expect{subject}.to change {Article.count}.by(-1)

# #     end#it
# #   end#describe

#  end
