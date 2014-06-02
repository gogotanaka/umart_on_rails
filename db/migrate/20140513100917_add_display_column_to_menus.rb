class AddDisplayColumnToMenus < ActiveRecord::Migration
  def change
    add_column :menus, :display, :boolean, default: true
  end
end
