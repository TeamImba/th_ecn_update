class CreateEcnpositions < ActiveRecord::Migration
  def self.up
    create_table :ecnpositions do |t|
      t.string :position_name, :default => "", :limit => 30
    end
  end

  def self.down
    drop_table :ecnpositions
  end
end
