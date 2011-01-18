class CreateEcndocuments < ActiveRecord::Migration
  def self.up
    create_table :ecndocuments do |t|
      t.string :title, :default => "", :limit => 150
      t.string :customer_name, :default => "", :limit => 200
      t.string :th_part_no, :default => "", :limit => 30
      t.string :ref_spec, :default => "", :limit => 30
      t.integer :extension
      t.text :description_to
      t.text :description_from
      t.text :reason
      t.string :revision1, :default => "", :limit => 15
      t.string :action, :default => "", :limit => 30
      t.date :effectivity_from
      t.date :effectivity_to
      t.integer :user_id
      t.string :ecn_doc, :default => "", :limit => 20
      t.string :revision2, :default => "", :limit => 15
      t.integer :user_designation
      t.timestamp :closed_timestamps
      t.integer :obsoletion
    end
  end

  def self.down
    drop_table :ecndocuments
  end
end
