class CreateListsWordsJoinTable < ActiveRecord::Migration
  def self.up
    create_table :lists_words, :id => false do |t|
      t.integer :list_id
      t.integer :word_id
    end

    add_index :lists_words, [:list_id, :word_id]
  end

  def self.down
    drop_table :lists_words
  end
end
