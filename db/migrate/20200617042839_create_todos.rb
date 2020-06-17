class CreateTodos < ActiveRecord::Migration[6.0]
  def change
    create_table :todos do |t|
      t.string :name
      t.string :description
      t.integer :party_id
      
    end
  end
end
