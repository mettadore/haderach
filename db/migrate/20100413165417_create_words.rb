class CreateWords < ActiveRecord::Migration
  def self.up
    create_table :words do |t|
      t.string :word, :null => false
      t.string :definition
      t.integer :universe_id, :null => false
      t.string :website
      t.boolean :is_name, :default => false
      t.boolean :is_acronym, :default => false

      t.timestamps
    end
    add_index :words, :word, :unique => true
  end

  def self.down
    drop_table :words
  end
end
