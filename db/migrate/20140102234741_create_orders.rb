class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :menu_id
      t.integer :amount
      t.integer :priority

      t.timestamps
    end
  end
end
