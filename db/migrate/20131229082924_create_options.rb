class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.integer :order_id
      t.integer :option

      t.timestamps
    end
  end
end
