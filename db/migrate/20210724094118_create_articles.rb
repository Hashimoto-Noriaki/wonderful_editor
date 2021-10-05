class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :body
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

# カラム追加コマンド
# $ rails  g migration   add_カラム名_to_テーブル名　カラム名：型
# $ rails  g migration   add_mail_to_users mail:string
