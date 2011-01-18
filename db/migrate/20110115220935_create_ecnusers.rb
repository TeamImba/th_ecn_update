class CreateEcnusers < ActiveRecord::Migration
  def self.up
    create_table :ecnusers do |t|
      t.integer :pos_id
      t.integer :signature_id
      t.string :first_name, :default => "", :limit => 20
      t.string :last_name, :default => "", :limit => 40
      t.string :username, :default => "", :limit => 50
      t.string :password, :default => "", :limit => 250
      t.string :email, :default => "", :limit => 200

      t.timestamps
    end
  end

  def self.down
    drop_table :ecnusers
  end
end
