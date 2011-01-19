class AddAliasToEcnposition < ActiveRecord::Migration
  def self.up
    add_column :ecnpositions, :alias, :string
  end

  def self.down
    remove_column :ecnpositions, :alias
  end
end
