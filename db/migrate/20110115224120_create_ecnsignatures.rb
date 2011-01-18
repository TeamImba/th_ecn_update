class CreateEcnsignatures < ActiveRecord::Migration
  def self.up
    create_table :ecnsignatures do |t|
      t.integer :user_id
      t.text :signature
    end
  end

  def self.down
    drop_table :ecnsignatures
  end
end
