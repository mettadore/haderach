class AddSlugs < ActiveRecord::Migration
  def self.up
    add_column :universes, :slug, :string
    add_column :genres, :slug, :string
    add_column :words, :slug, :string
    add_column :managers, :slug, :string
  end

  def self.down
    remove_column :universes, :slug
    remove_column :genres, :slug
    remove_column :words, :slug
    remove_column :managers, :slug
  end
end
