class CreateDocCategories < ActiveRecord::Migration
  def self.up
    create_table :doc_categories do |t|
      t.string :name
      t.string :alias
    end
  end

  def self.down
    drop_table :doc_categories
  end
end
