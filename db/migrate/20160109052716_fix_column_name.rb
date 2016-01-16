class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :words, :word, :target_word
  end
end
