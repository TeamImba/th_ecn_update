class CreateEcnreviewForms < ActiveRecord::Migration
  def self.up
    create_table :ecnreview_forms do |t|
      t.integer :user_id
      t.integer :ecn_id
      t.timestamp :approval_timestamp
      t.text :review
      t.integer :pos_id
      t.text :rem
    end
  end

  def self.down
    drop_table :ecnreview_forms
  end
end
