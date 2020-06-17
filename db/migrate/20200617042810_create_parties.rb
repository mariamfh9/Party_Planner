class CreateParties < ActiveRecord::Migration[6.0]
  def change
    create_table :parties do |t|
      t.datetime :starts_at
      t.integer :user_id
      t.integer :category_id
      t.string :title
      t.timestamps null: false 
    end
  end
end
