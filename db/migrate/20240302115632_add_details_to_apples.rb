class AddDetailsToApples < ActiveRecord::Migration[6.1]
  def change
    add_column :apples, :lat, :float
    add_column :apples, :lng, :float
  end
end
