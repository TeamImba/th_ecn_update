class CreateDocCategoriesEcnpositions < ActiveRecord::Migration
  def self.up
    create_table :doc_categories_ecnpositions do |t|
      t.integer :doc_category_id
      t.integer :ecnposition_id
    end
    add_index(:doc_categories_ecnpositions, :doc_category_id)
    add_index(:doc_categories_ecnpositions, :ecnposition_id)
    remove_column(:doc_categories_ecnpositions, :id)
  end

  def self.down
    drop_table :doc_categories_ecnpositions
  end
end
