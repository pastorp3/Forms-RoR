class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email, default: '', null: false
      t.string :password, default: '', null: false

      t.timestamps
    end
  end
end
