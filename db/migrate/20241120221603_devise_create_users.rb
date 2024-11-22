class DeviseCreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users, charset: "utf8mb3", force: :cascade do |t|
      t.string :nickname, null: false
      t.string :email, default: "", null: false
      t.string :encrypted_password, default: "", null: false

      t.string :last_name, null: false
      t.string :first_name, null: false
      t.string :last_name_kana, null: false
      t.string :first_name_kana, null: false

      t.date :birth_date, null: false

      t.string :reset_password_token
      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at

      t.timestamps null: false
    end

    add_index :users, :email, unique: true, name: "index_users_on_email"
    add_index :users, :reset_password_token, unique: true, name: "index_users_on_reset_password_token"
  end
end