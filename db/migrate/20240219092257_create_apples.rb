class CreateApples < ActiveRecord::Migration[6.1]
  def change
    create_table :apples do |t|
      t.string :name
      t.string :date
      t.string :adress
      t.text :about
      t.integer :user_id
      

      t.timestamps
    end
  end
end
