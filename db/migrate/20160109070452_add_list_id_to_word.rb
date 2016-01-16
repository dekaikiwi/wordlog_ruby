class AddListIdToWord < ActiveRecord::Migration
  def change
    add_column :words, :list_id, :integer
    add_index :words, :list_id
  end
end
