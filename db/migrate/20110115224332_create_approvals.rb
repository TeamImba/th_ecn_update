class CreateApprovals < ActiveRecord::Migration
  def self.up
    create_table :approvals do |t|
      t.integer :user_id
      t.integer :ecn_id
      t.timestamp :approval_timestamp
      t.integer :status
      t.integer :pos_id

      t.timestamps
    end
  end

  def self.down
    drop_table :approvals
  end
end
