class AddDocCategoryIdToEcndocument < ActiveRecord::Migration
  def self.up
    add_column :ecndocuments, :doc_category_id, :integer
  end

  def self.down
    remove_column :ecndocuments, :doc_category_id
  end
end
