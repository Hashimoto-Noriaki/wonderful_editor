class CreateArticleLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :article_likes do |t|
      t.bignit :id
      t.bignit :user_id
      t.bignit :user_id

      t.timestamps
    end
  end
end
