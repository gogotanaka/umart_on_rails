class AddTypeToOption < ActiveRecord::Migration
  def change
    add_column :options, :option_type, :integer
    add_column :options, :remark, :string
  end
end
