class AddWordIdToList < ActiveRecord::Migration
  def change
    add_column :lists, :word_id, :integer
    add_index :lists, :word_id
  end
end
