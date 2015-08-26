class AddNameToBrand < ActiveRecord::Migration
  def change
    add_column :brands, :name, :string
  end
end
