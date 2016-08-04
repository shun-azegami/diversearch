class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.text   :email

      t.timestamps null: false
    end
  end
end
